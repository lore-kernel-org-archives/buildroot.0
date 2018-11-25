From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 21:57:23 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] package/mmc-utils: add
 patch to fix build failure
Message-ID: <20181125205536.D2B6588339@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff7d2b87a280f391f17b551d2672f59b824cc701
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Patch taken from:
 - https://patchwork.kernel.org/patch/10654531/

Fixes:
 - http://autobuild.buildroot.net/results/404bfbd095a7b80273391ea36ea81ba496164b80
 - http://autobuild.buildroot.net/results/233ef5c00951b5be10a59408f4a8781ecc658d74
 - http://autobuild.buildroot.net/results/eba3cf4ac21095bca5af2d5d1d69aca0c9098f9b

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ee6217d52b7226596257ac86652403306912588f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-fix-overlapping-with-strncpy.patch        | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/mmc-utils/0002-fix-overlapping-with-strncpy.patch b/package/mmc-utils/0002-fix-overlapping-with-strncpy.patch
new file mode 100644
index 0000000000..a134dd3c5a
--- /dev/null
+++ b/package/mmc-utils/0002-fix-overlapping-with-strncpy.patch
@@ -0,0 +1,44 @@
+From 1c90a7534658056b884d71ef82dc7ca8bad4271b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
+Date: Wed, 24 Oct 2018 13:00:47 +0200
+Subject: [PATCH 1/1] mmc-utils: fix overlapping with strncpy
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+GCC 8.2 warns about an overlapping using strncpy.
+
+Replace strncpy with a memmove to avoid this issue.
+
+In file included from /usr/include/string.h:494,
+                 from lsmmc.c:46:
+In function ???strncpy???,
+    inlined from ???read_file??? at lsmmc.c:356:3:
+/usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error: ???__builtin_strncpy??? accessing 4096 bytes at offsets 0 and 1 overlaps 4095 bytes at offset 1 [-Werror=restrict]
+   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
+          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+cc1: all warnings being treated as errors
+make: *** [Makefile:36: lsmmc.o] Error 1
+
+Signed-off-by: Cl??ment P??ron <peron.clem@gmail.com>
+Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
+---
+ lsmmc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lsmmc.c b/lsmmc.c
+index c4faa00..bcb854d 100644
+--- a/lsmmc.c
++++ b/lsmmc.c
+@@ -353,7 +353,7 @@ char *read_file(char *name)
+ 		line[strlen(line) - 1] = '\0';
+ 
+ 	while (isspace(line[0]))
+-		strncpy(&line[0], &line[1], sizeof(line));
++		memmove(&line[0], &line[1], sizeof(line)-1);
+ 
+ 	return strdup(line);
+ }
+-- 
+2.16.4
+
