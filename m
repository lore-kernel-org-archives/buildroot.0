From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Thu, 19 Sep 2019 11:25:53 +0100
Subject: [Buildroot] [PATCH] package/libcamera: bump to version
 448393f77ec9e37cb807e8e8d35c1a4877d253d4
Message-ID: <20190919102553.32451-1-kieran.bingham@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to the latest version of libcamera, including a fix for toolchains
which require libatomic to be linked manually.

The patch which handles this locally is therefore removed.

Since the last version update, the option to disable building of the
unit tests has been renamed from '-Dtests=' to '-Dtest='

This is updated accordingly.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---

This update has been run through a full compiler test, now with the following results:

                             andes-nds32 [ 1/44]: SKIPPED
                             arm-aarch64 [ 2/44]: OK
                        br-aarch64-glibc [ 3/44]: OK
                           br-arcle-hs38 [ 4/44]: OK
                            br-arm-basic [ 5/44]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/44]: OK
                   br-arm-cortex-a9-musl [ 7/44]: OK
                   br-arm-cortex-m4-full [ 8/44]: SKIPPED
                             br-arm-full [ 9/44]: SKIPPED
                    br-arm-full-nothread [10/44]: SKIPPED
                      br-arm-full-static [11/44]: SKIPPED
                   br-i386-pentium4-full [12/44]: OK
                br-i386-pentium-mmx-musl [13/44]: OK
                       br-m68k-5208-full [14/44]: SKIPPED
                      br-m68k-68040-full [15/44]: SKIPPED
                    br-microblazeel-full [16/44]: OK
                 br-mips32r6-el-hf-glibc [17/44]: OK
                      br-mips64-n64-full [18/44]: OK
                 br-mips64r6-el-hf-glibc [19/44]: OK
                      br-mipsel-o32-full [20/44]: OK
                          br-nios2-glibc [21/44]: OK
                      br-openrisc-uclibc [22/44]: OK
               br-powerpc-603e-basic-cpp [23/44]: SKIPPED
             br-powerpc64le-power8-glibc [24/44]: OK
               br-powerpc64-power7-glibc [25/44]: OK
                  br-powerpc-e500mc-full [26/44]: OK
                              br-riscv32 [27/44]: OK
                              br-riscv64 [28/44]: OK
                             br-sh4-full [29/44]: OK
                        br-sparc64-glibc [30/44]: OK
                         br-sparc-uclibc [31/44]: OK
                    br-x86-64-core2-full [32/44]: OK
                          br-x86-64-musl [33/44]: OK
                          br-xtensa-full [34/44]: OK
                       linaro-aarch64-be [35/44]: OK
                          linaro-aarch64 [36/44]: OK
                              linaro-arm [37/44]: OK
                     sourcery-arm-armv4t [38/44]: SKIPPED
                            sourcery-arm [39/44]: SKIPPED
                     sourcery-arm-thumb2 [40/44]: SKIPPED
                         sourcery-mips64 [41/44]: OK
                           sourcery-mips [42/44]: OK
                          sourcery-nios2 [43/44]: OK
                         sourcery-x86-64 [44/44]: OK
44 builds, 12 skipped, 0 build failed, 0 legal-info failed

 ...son.build-link-with-atomic-when-need.patch | 28 -------------------
 package/libcamera/libcamera.hash              |  2 +-
 package/libcamera/libcamera.mk                |  4 +--
 3 files changed, 3 insertions(+), 31 deletions(-)
 delete mode 100644 package/libcamera/0001-src-libcamera-meson.build-link-with-atomic-when-need.patch

diff --git a/package/libcamera/0001-src-libcamera-meson.build-link-with-atomic-when-need.patch b/package/libcamera/0001-src-libcamera-meson.build-link-with-atomic-when-need.patch
deleted file mode 100644
index 8c34497db4f9..000000000000
--- a/package/libcamera/0001-src-libcamera-meson.build-link-with-atomic-when-need.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 85b7aeef3c7765c5ba7e525c63a4c0f807f0bfc8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 5 Sep 2019 10:24:31 +0200
-Subject: [PATCH] src/libcamera/meson.build: link with atomic when needed
-
-Fixes:
- - http://autobuild.buildroot.org/results/1f0b8338f5f39aa86b9d432598dae2f53c5f7c84
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/libcamera/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/libcamera/meson.build b/src/libcamera/meson.build
-index c5d8f11..0706a08 100644
---- a/src/libcamera/meson.build
-+++ b/src/libcamera/meson.build
-@@ -99,6 +99,7 @@ version_cpp = vcs_tag(command : [gen_version, meson.build_root()],
- libcamera_sources += version_cpp
- 
- libcamera_deps = [
-+    cc.find_library('atomic', required: false),
-     cc.find_library('dl'),
-     libudev,
-     dependency('threads'),
--- 
-2.23.0.rc1
-
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index fc0a21670ef9..6f721d87eee4 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,3 +1,3 @@
-sha256 4073ee3429a28b19f65f1df107b87df9ee01e58dc3372fcc0fcafd3350a31c23  libcamera-caf25dc5cfd11b965316f02610d49ae3d886716b.tar.gz
+sha256 cbaa7e06059717f71b57f9c20135c86d5f121d9aab10bfc20513ba5d04478756  libcamera-448393f77ec9e37cb807e8e8d35c1a4877d253d4.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/gnu-gpl-2.0.txt
 sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  licenses/gnu-lgpl-2.1.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 62c48607d4ff..d209a38df3a9 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,10 +5,10 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = caf25dc5cfd11b965316f02610d49ae3d886716b
+LIBCAMERA_VERSION = 448393f77ec9e37cb807e8e8d35c1a4877d253d4
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = udev
-LIBCAMERA_CONF_OPTS = -Dtests=false -Ddocumentation=false
+LIBCAMERA_CONF_OPTS = -Dtest=false -Ddocumentation=false
 LIBCAMERA_INSTALL_STAGING = yes
 LIBCAMERA_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (utils)
 LIBCAMERA_LICENSE_FILES = \
-- 
2.20.1
