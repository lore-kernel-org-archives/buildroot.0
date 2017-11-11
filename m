From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:35:48 +0100
Subject: [Buildroot] [git commit] util-linux: fix link failures due to name
 clash
Message-ID: <20171111222828.3614D810D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a4b5bb4b21f05dd42ddd6158d74d431ac003c92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Several packages have a similar md5.c file, and each has a function
named byteReverse(). This generates link errors when building
statically ("multiple definition of `byteReverse'").

Fix by applying a patch from upstream.

Fixes:
  http://autobuild.buildroot.net/results/419ab2c0e034cc68991281c51caa8271b0fadbab/

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Adam Duskett <aduskett@gmail.com>
Tested-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-md5-declare-byteReverse-as-static.patch   | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/util-linux/0001-md5-declare-byteReverse-as-static.patch b/package/util-linux/0001-md5-declare-byteReverse-as-static.patch
new file mode 100644
index 0000000..a5b290c
--- /dev/null
+++ b/package/util-linux/0001-md5-declare-byteReverse-as-static.patch
@@ -0,0 +1,44 @@
+From 424cee0f06ece9473786c189ab4741e1dea7061d Mon Sep 17 00:00:00 2001
+From: Luca Ceresoli <luca@lucaceresoli.net>
+Date: Tue, 7 Nov 2017 14:39:09 +0100
+Subject: [PATCH] md5: declare byteReverse as static
+
+byteReverse() is an internal function in md5.c, and is not exposed via
+any header file, but it is not declared as static. This is a problem
+with the md5.c file since it is copied more or less verbatim in other
+programs (fontconfig and pjsip among others), causing a link error
+when linking two of them together.
+
+Fixes link failures such as:
+  http://autobuild.buildroot.net/results/419ab2c0e034cc68991281c51caa8271b0fadbab/build-end.log
+
+[Upstream patch: https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=424cee0f06ece9473786c189ab4741e1dea7061d]
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+---
+ lib/md5.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/md5.c b/lib/md5.c
+index 488d16ef69b4..282e2d22af25 100644
+--- a/lib/md5.c
++++ b/lib/md5.c
+@@ -21,13 +21,13 @@
+ #if !defined(WORDS_BIGENDIAN)
+ #define byteReverse(buf, len)	/* Nothing */
+ #else
+-void byteReverse(unsigned char *buf, unsigned longs);
++static void byteReverse(unsigned char *buf, unsigned longs);
+ 
+ #ifndef ASM_MD5
+ /*
+  * Note: this code is harmless on little-endian machines.
+  */
+-void byteReverse(unsigned char *buf, unsigned longs)
++static void byteReverse(unsigned char *buf, unsigned longs)
+ {
+     uint32_t t;
+     do {
+-- 
+2.7.4
+
