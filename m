From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed, 22 May 2019 18:32:36 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/libubootenv: fix build with
 musl and static lib
Message-ID: <1558542756-8919-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

 - http://autobuild.buildroot.net/results/e18/e1837ccbe774071876642655b1fcffbd69dd7947/
 - http://autobuild.buildroot.net/results/206/206f1eba0dec39de1c02d760fa8f961d5a3879d0/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
Changes v1 -> v2:
  - Do not force shared build (sendt upstream) (suggested by Thomas Petazzoni)
  - Add missing define _GNU_SOURCE (sendt upstream) (suggested by Thomas Petazzoni)
  - Remove BR2_STATIC_LIBS and BR2_TOOLCHAIN_USES_MUSL dependencies (suggested by Thomas Petazzoni)
  - fix compilation for glibc version >= 2.28 (sent upstream)
  - Build is now OK:
  ./utils/test-pkg -c libuboot.config -p libubootenv
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: OK
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
  
 ...sts.txt-do-not-force-the-build-of-a-share.patch | 46 ++++++++++++++++++++++
 .../0001-uboot_env-fix-build-with-musl-libc.patch  | 31 +++++++++++++++
 ...nv-fix-compilation-for-glibc-version-2.28.patch | 40 +++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
 create mode 100644 package/libubootenv/0001-uboot_env-fix-build-with-musl-libc.patch
 create mode 100644 package/libubootenv/0002-uboot_env-fix-compilation-for-glibc-version-2.28.patch

diff --git a/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch b/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
new file mode 100644
index 0000000..c1196d6
--- /dev/null
+++ b/package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch
@@ -0,0 +1,46 @@
+From 5448ca9d92f7fa197060323a82a5f060ce7c31e7 Mon Sep 17 00:00:00 2001
+From: Pierre-Jean Texier <pjtexier@koncepto.io>
+Date: Wed, 22 May 2019 10:26:27 +0200
+Subject: [PATCH] src/CMakeLists.txt: do not force the build of a shared
+ library
+
+By definition, projects using CMake which can build either static or shared
+libraries use a BUILD_SHARED_LIBS flag to allow selecting between both.
+So, let CMake rely on the standard BUILD_SHARED_LIBS variable to decide
+whether a static or shared library should be built.
+
+however, we can control the behaviour as follows:
+
+   $. cmake -DBUILD_SHARED_LIBS=OFF ...
+
+   $. cmake -DBUILS_SHARED_LIBS=ON ...
+
+With Yocto/OE, just add the following option into the libubootenv recipe :
+
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON"
+
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
+[Upstream status: http://patchwork.ozlabs.org/patch/1103437/]
+---
+ src/CMakeLists.txt | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 051732b..c5f6dcb 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -10,10 +10,9 @@ SET(include_HEADERS
+   libuboot.h
+ )
+ 
+-add_library(ubootenv SHARED ${libubootenv_SOURCES} ${include_HEADERS})
++add_library(ubootenv ${libubootenv_SOURCES} ${include_HEADERS})
+ SET_TARGET_PROPERTIES(ubootenv PROPERTIES SOVERSION ${SOVERSION})
+ 
+-ADD_LIBRARY(ubootenv_static STATIC ${libubootenv_SOURCES} ${include_HEADERS})
+ add_executable(fw_printenv fw_printenv.c)
+ add_executable(fw_setenv fw_setenv.c)
+ target_link_libraries(fw_printenv ubootenv z)
+-- 
+2.7.4
+
diff --git a/package/libubootenv/0001-uboot_env-fix-build-with-musl-libc.patch b/package/libubootenv/0001-uboot_env-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000..605b40a
--- /dev/null
+++ b/package/libubootenv/0001-uboot_env-fix-build-with-musl-libc.patch
@@ -0,0 +1,31 @@
+From 113a4ea9ec48b9428b3abac21ecca7d8f11502fe Mon Sep 17 00:00:00 2001
+From: Pierre-Jean Texier <pjtexier@koncepto.io>
+Date: Tue, 21 May 2019 21:32:27 +0200
+Subject: [libubootenv][PATCH 1/2] uboot_env: fix build with musl libc
+
+Fixes the following compile failure when building with musl:
+
+ - http://autobuild.buildroot.net/results/206/206f1eba0dec39de1c02d760fa8f961d5a3879d0/
+
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
+[Upstream status: http://patchwork.ozlabs.org/patch/1103009/]
+---
+ src/uboot_env.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/uboot_env.c b/src/uboot_env.c
+index 4c298d1..a0f977c 100644
+--- a/src/uboot_env.c
++++ b/src/uboot_env.c
+@@ -11,6 +11,8 @@
+  * @brief This is the implementation of libubootenv library
+  *
+  */
++ 
++#define _GNU_SOURCE
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
+-- 
+2.7.4
+
diff --git a/package/libubootenv/0002-uboot_env-fix-compilation-for-glibc-version-2.28.patch b/package/libubootenv/0002-uboot_env-fix-compilation-for-glibc-version-2.28.patch
new file mode 100644
index 0000000..7801e43
--- /dev/null
+++ b/package/libubootenv/0002-uboot_env-fix-compilation-for-glibc-version-2.28.patch
@@ -0,0 +1,40 @@
+From fa991d153a73e312683b751e9f65d8df6ac61732 Mon Sep 17 00:00:00 2001
+From: Pierre-Jean Texier <pjtexier@koncepto.io>
+Date: Tue, 21 May 2019 21:40:23 +0200
+Subject: [libubootenv][PATCH 2/2] uboot_env: fix compilation for glibc version
+ >= 2.28
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Starting with glibc 2.28, include file sys/stat.h will have a
+definition for struct statx, in which case include file linux/stat.h should be
+avoided, in order to prevent a duplicate definition.
+
+This commit fixes (if _GNU_SOURCE is defined):
+
+/usr/include/linux/stat.h:56:8: error: redefinition of ?struct statx_timestamp?
+ struct statx_timestamp {
+        ^~~~~~~~~~~~~~~
+
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
+[Upstream status: http://patchwork.ozlabs.org/patch/1103010/]
+---
+ src/uboot_env.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/uboot_env.c b/src/uboot_env.c
+index a0f977c..e8483bf 100644
+--- a/src/uboot_env.c
++++ b/src/uboot_env.c
+@@ -32,7 +32,6 @@
+ #include <sys/wait.h>
+ #include <sys/ioctl.h>
+ #include <zlib.h>
+-#include <linux/stat.h>
+ #include <mtd/mtd-user.h>
+ #include <mtd/ubi-user.h>
+ 
+-- 
+2.7.4
+
-- 
2.7.4
