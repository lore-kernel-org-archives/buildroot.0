From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 14 Oct 2019 22:11:28 +0200
Subject: [Buildroot] [PATCH] package/libubootenv: bump to version 3286c57
Message-ID: <1571083888-12690-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also
 - add hash for license file
 - remove patches (already in version):
	- 0001-fw_printenv-remove-declaration-in-for-loop.patch
	- 0003-uboot_env-fix-build-with-musl-libc.patch
	- 0004-uboot_env-fix-compilation-for-glibc-version-2.28.patch
	- 0005-uboot_env-remove-pthread.h-header-file.patch

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 ...w_printenv-remove-declaration-in-for-loop.patch | 53 ----------------------
 ...ts.txt-do-not-force-the-build-of-a-share.patch} |  0
 .../0003-uboot_env-fix-build-with-musl-libc.patch  | 31 -------------
 ...nv-fix-compilation-for-glibc-version-2.28.patch | 40 ----------------
 ...05-uboot_env-remove-pthread.h-header-file.patch | 29 ------------
 package/libubootenv/libubootenv.hash               |  3 +-
 package/libubootenv/libubootenv.mk                 |  3 +-
 7 files changed, 4 insertions(+), 155 deletions(-)
 delete mode 100644 package/libubootenv/0001-fw_printenv-remove-declaration-in-for-loop.patch
 rename package/libubootenv/{0002-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch => 0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch} (100%)
 delete mode 100644 package/libubootenv/0003-uboot_env-fix-build-with-musl-libc.patch
 delete mode 100644 package/libubootenv/0004-uboot_env-fix-compilation-for-glibc-version-2.28.patch
 delete mode 100644 package/libubootenv/0005-uboot_env-remove-pthread.h-header-file.patch

diff --git a/package/libubootenv/0001-fw_printenv-remove-declaration-in-for-loop.patch b/package/libubootenv/0001-fw_printenv-remove-declaration-in-for-loop.patch
deleted file mode 100644
index 318050d..0000000
--- a/package/libubootenv/0001-fw_printenv-remove-declaration-in-for-loop.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From ffca94e6f84956838a2d88824b37fcd3b0d0694b Mon Sep 17 00:00:00 2001
-From: Pierre-Jean Texier <pjtexier@koncepto.io>
-Date: Sun, 5 May 2019 21:42:48 +0200
-Subject: [PATCH] fw_printenv: remove declaration in for loop
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This commit fixes :
-
-src/fw_printenv.c:142:4: error: ?for? loop initial declarations are only allowed in C99 or C11 mode
-    for (int i = 0; i < argc; i++) {
-
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
-[Upstream status: https://github.com/sbabic/libubootenv/commit/d63007652f1d9f9256a5eedbce6273b9848b653c]
----
- src/fw_printenv.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/fw_printenv.c b/src/fw_printenv.c
-index 361d150..4236eaa 100644
---- a/src/fw_printenv.c
-+++ b/src/fw_printenv.c
-@@ -59,7 +59,7 @@ int main (int argc, char **argv) {
- 	char *cfgfname = NULL;
- 	char *defenvfile = NULL;
- 	char *scriptfile = NULL;
--	int c;
-+	int c, i;
- 	int ret = 0;
- 	void *tmp;
- 	const char *name, *value;
-@@ -139,7 +139,7 @@ int main (int argc, char **argv) {
- 				fprintf(stdout, "%s=%s\n", name, value);
- 			}
- 		} else {
--			for (int i = 0; i < argc; i++) {
-+			for (i = 0; i < argc; i++) {
- 				value = libuboot_get_env(ctx, argv[i]);
- 				if (noheader)
- 					fprintf(stdout, "%s\n", value ? value : "");
-@@ -151,7 +151,7 @@ int main (int argc, char **argv) {
- 		if (scriptfile)
- 			libuboot_load_file(ctx, scriptfile);
- 		else {
--			for (int i = 0; i < argc; i += 2) {
-+			for (i = 0; i < argc; i += 2) {
- 				if (i + 1 == argc)
- 					libuboot_set_env(ctx, argv[i], NULL);
- 				else
--- 
-2.7.4
-
diff --git a/package/libubootenv/0002-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch b/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
similarity index 100%
rename from package/libubootenv/0002-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
rename to package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
diff --git a/package/libubootenv/0003-uboot_env-fix-build-with-musl-libc.patch b/package/libubootenv/0003-uboot_env-fix-build-with-musl-libc.patch
deleted file mode 100644
index 3abd81c..0000000
--- a/package/libubootenv/0003-uboot_env-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 113a4ea9ec48b9428b3abac21ecca7d8f11502fe Mon Sep 17 00:00:00 2001
-From: Pierre-Jean Texier <pjtexier@koncepto.io>
-Date: Tue, 21 May 2019 21:32:27 +0200
-Subject: [libubootenv][PATCH] uboot_env: fix build with musl libc
-
-Fixes the following compile failure when building with musl:
-
- - http://autobuild.buildroot.net/results/206/206f1eba0dec39de1c02d760fa8f961d5a3879d0/
-
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
-[Upstream status: http://patchwork.ozlabs.org/patch/1103009/]
----
- src/uboot_env.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/uboot_env.c b/src/uboot_env.c
-index 4c298d1..a0f977c 100644
---- a/src/uboot_env.c
-+++ b/src/uboot_env.c
-@@ -11,6 +11,8 @@
-  * @brief This is the implementation of libubootenv library
-  *
-  */
-+ 
-+#define _GNU_SOURCE
- 
- #include <stdio.h>
- #include <stdlib.h>
--- 
-2.7.4
-
diff --git a/package/libubootenv/0004-uboot_env-fix-compilation-for-glibc-version-2.28.patch b/package/libubootenv/0004-uboot_env-fix-compilation-for-glibc-version-2.28.patch
deleted file mode 100644
index d9a9fc0..0000000
--- a/package/libubootenv/0004-uboot_env-fix-compilation-for-glibc-version-2.28.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From fa991d153a73e312683b751e9f65d8df6ac61732 Mon Sep 17 00:00:00 2001
-From: Pierre-Jean Texier <pjtexier@koncepto.io>
-Date: Tue, 21 May 2019 21:40:23 +0200
-Subject: [libubootenv][PATCH] uboot_env: fix compilation for glibc version
- >= 2.28
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Starting with glibc 2.28, include file sys/stat.h will have a
-definition for struct statx, in which case include file linux/stat.h should be
-avoided, in order to prevent a duplicate definition.
-
-This commit fixes (if _GNU_SOURCE is defined):
-
-/usr/include/linux/stat.h:56:8: error: redefinition of ?struct statx_timestamp?
- struct statx_timestamp {
-        ^~~~~~~~~~~~~~~
-
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
-[Upstream status: http://patchwork.ozlabs.org/patch/1103010/]
----
- src/uboot_env.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/uboot_env.c b/src/uboot_env.c
-index a0f977c..e8483bf 100644
---- a/src/uboot_env.c
-+++ b/src/uboot_env.c
-@@ -32,7 +32,6 @@
- #include <sys/wait.h>
- #include <sys/ioctl.h>
- #include <zlib.h>
--#include <linux/stat.h>
- #include <mtd/mtd-user.h>
- #include <mtd/ubi-user.h>
- 
--- 
-2.7.4
-
diff --git a/package/libubootenv/0005-uboot_env-remove-pthread.h-header-file.patch b/package/libubootenv/0005-uboot_env-remove-pthread.h-header-file.patch
deleted file mode 100644
index 7a7e2a0..0000000
--- a/package/libubootenv/0005-uboot_env-remove-pthread.h-header-file.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From ac4f795f2c0a81d5b55ce825f3d4c933fbc9e44c Mon Sep 17 00:00:00 2001
-From: Pierre-Jean Texier <pjtexier@koncepto.io>
-Date: Tue, 4 Jun 2019 11:43:47 +0200
-Subject: [libubootenv][PATCH] uboot_env: remove <pthread.h> header file
-
-<pthread.h> include doesn't seem to be necessary inside the library.
-So, drop the header completely.
-
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
-[Upstream status: http://patchwork.ozlabs.org/patch/1109822/]
----
- src/uboot_env.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/uboot_env.c b/src/uboot_env.c
-index e8483bf..3f1bb3b 100644
---- a/src/uboot_env.c
-+++ b/src/uboot_env.c
-@@ -24,7 +24,6 @@
- #include <fcntl.h>
- #include <errno.h>
- #include <ctype.h>
--#include <pthread.h>
- #include <signal.h>
- #include <sys/file.h>
- #include <sys/types.h>
--- 
-2.7.4
-
diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index 79aaac7..81f72ad 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 82c6966af5feae8726bd78a2cde4c4c2f69e81f8fdc548098063f8a35eaad090 libubootenv-8a7d4030bcb106de11632e85b6a0e7b7d4cb47af.tar.gz
+sha256 9c8b0e6d596b43127ccdf6b2d181dce597fb1f90211aa36c4d88b5c6a31ef026 libubootenv-3286c571c7e15be4b341e46986f1c0dc74730207.tar.gz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 Licenses/lgpl-2.1.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index 5348794..b24008c 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 8a7d4030bcb106de11632e85b6a0e7b7d4cb47af
+LIBUBOOTENV_VERSION = 3286c571c7e15be4b341e46986f1c0dc74730207
 LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1
+LIBUBOOTENV_LICENSE_FILES = Licenses/lgpl-2.1.txt
 LIBUBOOTENV_INSTALL_STAGING = YES
 LIBUBOOTENV_DEPENDENCIES = zlib
 
-- 
2.7.4
