From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue,  7 Nov 2017 22:59:31 +0100
Subject: [Buildroot] [PATCH v2] util-linux: fix link failures due to name
 clash
Message-ID: <1510091971-15916-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Several packages have a similar md5.c file, and each has a function
named byteReverse(). This generates link errors ("multiple definition
of `byteReverse'").

Fix by declaring byteReverse as static, since it is just an internal
function.

Fixes:
  http://autobuild.buildroot.net/results/419ab2c0e034cc68991281c51caa8271b0fadbab/

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Adam Duskett <aduskett@gmail.com>

---

Changed v1 -> v2:
 - add Submitted-upstream tag now that it's on the util-linux ml
---
 .../0001-md5-declare-byteReverse-as-static.patch   | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/util-linux/0001-md5-declare-byteReverse-as-static.patch

diff --git a/package/util-linux/0001-md5-declare-byteReverse-as-static.patch b/package/util-linux/0001-md5-declare-byteReverse-as-static.patch
new file mode 100644
index 000000000000..e11d3ae7f2a7
--- /dev/null
+++ b/package/util-linux/0001-md5-declare-byteReverse-as-static.patch
@@ -0,0 +1,43 @@
+From a02ec53951ea8ac10fef1115f323c0c288596163 Mon Sep 17 00:00:00 2001
+From: Luca Ceresoli <luca@lucaceresoli.net>
+Date: Mon, 6 Nov 2017 22:58:09 +0100
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
+Submitted-upstream: https://marc.info/?l=util-linux-ng&m=151006195915652&w=2
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
-- 
2.7.4
