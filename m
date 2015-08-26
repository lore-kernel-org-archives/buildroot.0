From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Aug 2015 09:24:03 +0200
Subject: [Buildroot] [git commit] tinyalsa: fix build with gcc 5.x
Message-ID: <20150826072500.89BEC81E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67fcc2c58007a7c1052fc122da8683f65cbf4d0e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to tinyalsa to fix the build with gcc 5.x. It
fixes autobuilder issues like:

  http://autobuild.buildroot.net/results/d19/d19d1779da473d7adee2a18fea990fa19c7a7697/

The fix has been submitted upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-make-function-pcm_get_format_name-static.patch |   45 ++++++++++++++++++++
 1 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/tinyalsa/0001-tinypcminfo-make-function-pcm_get_format_name-static.patch b/package/tinyalsa/0001-tinypcminfo-make-function-pcm_get_format_name-static.patch
new file mode 100644
index 0000000..4c8d48f
--- /dev/null
+++ b/package/tinyalsa/0001-tinypcminfo-make-function-pcm_get_format_name-static.patch
@@ -0,0 +1,45 @@
+From 10d82df8d920ceec4be9028a4939f96d6f407e81 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 26 Aug 2015 09:20:13 +0200
+Subject: [PATCH] tinypcminfo: make function pcm_get_format_name() static
+
+When building tinyalsa with gcc 5.x, the following warnings appear:
+
+tinypcminfo.c:97:52: warning: 'format_lookup' is static but used in inline function 'pcm_get_format_name' which is not static
+     return bit_index < ARRAY_SIZE(format_lookup) ? format_lookup[bit_index] : NULL;
+                                                    ^
+tinypcminfo.c:97:35: warning: 'format_lookup' is static but used in inline function 'pcm_get_format_name' which is not static
+     return bit_index < ARRAY_SIZE(format_lookup) ? format_lookup[bit_index] : NULL;
+
+And the build fails with:
+
+tinypcminfo.o: In function `main':
+tinypcminfo.c:(.text+0x2f0): undefined reference to `pcm_get_format_name'
+collect2: error: ld returned 1 exit status
+
+To fix this, this patch marks the pcm_get_format_name() as static,
+since it's anyway only used in tinypcminfo.c.
+
+Submitted upstream: https://github.com/tinyalsa/tinyalsa/pull/61
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ tinypcminfo.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tinypcminfo.c b/tinypcminfo.c
+index b2d11bc..99eec34 100644
+--- a/tinypcminfo.c
++++ b/tinypcminfo.c
+@@ -92,7 +92,7 @@ static const char *format_lookup[] = {
+ /* Returns a human readable name for the format associated with bit_index,
+  * NULL if bit_index is not known.
+  */
+-inline const char *pcm_get_format_name(unsigned bit_index)
++static inline const char *pcm_get_format_name(unsigned bit_index)
+ {
+     return bit_index < ARRAY_SIZE(format_lookup) ? format_lookup[bit_index] : NULL;
+ }
+-- 
+2.5.0
+
