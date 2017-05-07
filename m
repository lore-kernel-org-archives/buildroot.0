From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 May 2017 13:49:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: Add support for more archs
Message-ID: <20170507114910.8144-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the autoconf-based build system it was necessary to allow each
supported architecture separatly:
https://github.com/xbmc/xbmc/blob/Krypton/m4/xbmc_arch.m4

For the CMake build system this is not necessary anymore so we only
blacklist archs in Config.in known to be broken.

Tested with testpkg using this defconfig:

BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_ALSA_LIB=y
BR2_PACKAGE_KODI_EVENTCLIENTS=y
BR2_PACKAGE_KODI_LIBBLURAY=y
BR2_PACKAGE_KODI_LIBCEC=y
BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE=y
BR2_PACKAGE_KODI_INPUTSTREAM_RTMP=y
BR2_PACKAGE_KODI_PVR_HTS=y
BR2_PACKAGE_KODI_SCREENSAVER_RSXS=y
BR2_PACKAGE_KODI_VISUALISATION_GOOM=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_ONLY=y

with this result:

                armv5-ctng-linux-gnueabi [ 1/49]: OK
              armv7-ctng-linux-gnueabihf [ 2/49]: OK
                        br-aarch64-glibc [ 3/49]: OK
                           br-arcle-hs38 [ 4/49]: OK
                            br-arm-basic [ 5/49]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/49]: OK
                   br-arm-cortex-a9-musl [ 7/49]: SKIPPED
                   br-arm-cortex-m4-full [ 8/49]: SKIPPED
                             br-arm-full [ 9/49]: OK
                    br-arm-full-nothread [10/49]: SKIPPED
                      br-arm-full-static [11/49]: SKIPPED
                            br-bfin-full [12/49]: SKIPPED
                   br-i386-pentium4-full [13/49]: OK
                br-i386-pentium-mmx-musl [14/49]: SKIPPED
                       br-m68k-5208-full [15/49]: SKIPPED
                      br-m68k-68040-full [16/49]: SKIPPED
                    br-microblazeel-full [17/49]: SKIPPED
                 br-mips32r6-el-hf-glibc [18/49]: OK
                      br-mips64-n64-full [19/49]: OK
                 br-mips64r6-el-hf-glibc [20/49]: OK
                      br-mipsel-o32-full [21/49]: OK
                          br-nios2-glibc [22/49]: SKIPPED
                      br-openrisc-uclibc [23/49]: SKIPPED
               br-powerpc-603e-basic-cpp [24/49]: SKIPPED
             br-powerpc64le-power8-glibc [25/49]: OK
               br-powerpc64-power7-glibc [26/49]: OK
                  br-powerpc-e500mc-full [27/49]: OK
                             br-sh4-full [28/49]: OK
                        br-sparc64-glibc [29/49]: OK
                         br-sparc-uclibc [30/49]: SKIPPED
                    br-x86-64-core2-full [31/49]: OK
                          br-x86-64-musl [32/49]: SKIPPED
                          br-xtensa-full [33/49]: OK
                     i686-ctng-linux-gnu [34/49]: SKIPPED
                          linaro-aarch64 [35/49]: OK
                              linaro-arm [36/49]: OK
             mips64el-ctng_n32-linux-gnu [37/49]: OK
             mips64el-ctng_n64-linux-gnu [38/49]: OK
        powerpc-ctng_e500v2-linux-gnuspe [39/49]: SKIPPED
                     sourcery-arm-armv4t [40/49]: OK
                            sourcery-arm [41/49]: OK
                     sourcery-arm-thumb2 [42/49]: OK
                         sourcery-mips64 [43/49]: OK
                           sourcery-mips [44/49]: OK
                          sourcery-nios2 [45/49]: SKIPPED
                             sourcery-sh [46/49]: SKIPPED
                         sourcery-x86-64 [47/49]: OK
                            sourcery-x86 [48/49]: SKIPPED
           x86_64-ctng_locales-linux-gnu [49/49]: OK
49 builds, 20 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v1: - rebased v7 of the previous iteration
    - added comment about upstream commit to Kodi master branch (Thomas)
    - added comment about rbpi-specific CPU options (Thomas)

 package/kodi-pvr-mediaportal-tvserver/Config.in |   2 +
 package/kodi/0003-Add-support-for-sh4.patch     | 110 ++++++++++++++++++++++++
 package/kodi/0004-Add-support-for-sparc.patch   |  93 ++++++++++++++++++++
 package/kodi/0005-Add-support-for-arc.patch     |  93 ++++++++++++++++++++
 package/kodi/0006-Add-support-for-xtensa.patch  |  93 ++++++++++++++++++++
 package/kodi/Config.in                          |   6 +-
 package/kodi/kodi.mk                            |  40 +++++++--
 7 files changed, 427 insertions(+), 10 deletions(-)
 create mode 100644 package/kodi/0003-Add-support-for-sh4.patch
 create mode 100644 package/kodi/0004-Add-support-for-sparc.patch
 create mode 100644 package/kodi/0005-Add-support-for-arc.patch
 create mode 100644 package/kodi/0006-Add-support-for-xtensa.patch

diff --git a/package/kodi-pvr-mediaportal-tvserver/Config.in b/package/kodi-pvr-mediaportal-tvserver/Config.in
index 733ca8859e..ff93c249b1 100644
--- a/package/kodi-pvr-mediaportal-tvserver/Config.in
+++ b/package/kodi-pvr-mediaportal-tvserver/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_KODI_PVR_MEDIAPORTAL_TVSERVER
 	bool "kodi-pvr-mediaportal-tvserver"
+	# ARC toolchain lacks xlocale.h
+	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  MediaPortal TVServer PVR client addon for Kodi
diff --git a/package/kodi/0003-Add-support-for-sh4.patch b/package/kodi/0003-Add-support-for-sh4.patch
new file mode 100644
index 0000000000..50c7a15b7a
--- /dev/null
+++ b/package/kodi/0003-Add-support-for-sh4.patch
@@ -0,0 +1,110 @@
+From 61c13c85d4dad978f793d0e3b75e99d95bc226c3 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Wed, 26 Apr 2017 22:34:40 +0200
+Subject: [PATCH] Add support for sh4
+
+This commit fixes Kodi build with a buildroot toolchain for sh4, also
+rewrap code to prepare for more platforms.
+
+Patch sent upstream as PR 12015 to backport for Krypton branch of the
+upstream commit to master branch:
+https://github.com/xbmc/xbmc/commit/2594c4920b8ba19e373bbc5b1b82e0ca1b37a717
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/cores/DllLoader/DllLoader.h                        | 7 ++++++-
+ xbmc/cores/DllLoader/ldt_keeper.c                       | 7 ++++++-
+ xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h | 8 +++++++-
+ xbmc/threads/Atomics.cpp                                | 6 +++++-
+ xbmc/utils/MathUtils.h                                  | 3 ++-
+ 5 files changed, 26 insertions(+), 5 deletions(-)
+
+diff --git a/xbmc/cores/DllLoader/DllLoader.h b/xbmc/cores/DllLoader/DllLoader.h
+index eb3c54c96b..f05c195b89 100644
+--- a/xbmc/cores/DllLoader/DllLoader.h
++++ b/xbmc/cores/DllLoader/DllLoader.h
+@@ -23,7 +23,12 @@
+ #include "coffldr.h"
+ #include "LibraryLoader.h"
+ 
+-#if defined(__linux__) && !defined(__powerpc__) && !defined(__arm__) && !defined(__aarch64__) && !defined(__mips__)
++#if defined(__linux__) && \
++    !defined(__powerpc__) && \
++    !defined(__arm__) && \
++    !defined(__aarch64__) && \
++    !defined(__mips__) && \
++    !defined(__SH4__)
+ #define USE_LDT_KEEPER
+ #include "ldt_keeper.h"
+ #endif
+diff --git a/xbmc/cores/DllLoader/ldt_keeper.c b/xbmc/cores/DllLoader/ldt_keeper.c
+index 3fe68541e6..ff230d8469 100644
+--- a/xbmc/cores/DllLoader/ldt_keeper.c
++++ b/xbmc/cores/DllLoader/ldt_keeper.c
+@@ -19,7 +19,12 @@
+  */
+ 
+ //#ifndef __powerpc__
+-#if !defined(__powerpc__) && !defined(__ppc__) && !defined(__arm__) && !defined(__aarch64__) && !defined(__mips__)
++#if !defined(__powerpc__) && \
++    !defined(__ppc__) && \
++    !defined(__arm__) && \
++    !defined(__aarch64__) && \
++    !defined(__mips__) && \
++    !defined(__SH4__)
+ 
+ #include "ldt_keeper.h"
+ 
+diff --git a/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h b/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h
+index ce3afe985b..731341ef3d 100644
+--- a/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h
++++ b/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h
+@@ -293,7 +293,13 @@ protected:
+ 
+ 
+ inline int NP2( unsigned x ) {
+-#if defined(TARGET_POSIX) && !defined(__POWERPC__) && !defined(__PPC__) && !defined(__arm__) && !defined(__aarch64__) && !defined(__mips__)
++#if defined(TARGET_POSIX) && \
++    !defined(__POWERPC__) && \
++    !defined(__PPC__) && \
++    !defined(__arm__) && \
++    !defined(__aarch64__) && \
++    !defined(__mips__) && \
++    !defined(__SH4__)
+   // If there are any issues compiling this, just append a ' && 0'
+   // to the above to make it '#if defined(TARGET_POSIX) && 0'
+ 
+diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
+index ecba3f1081..7aaea1f2ba 100644
+--- a/xbmc/threads/Atomics.cpp
++++ b/xbmc/threads/Atomics.cpp
+@@ -106,7 +106,11 @@ long cas(volatile long *pAddr, long expectedVal, long swapVal)
+ ///////////////////////////////////////////////////////////////////////////
+ long long cas2(volatile long long* pAddr, long long expectedVal, long long swapVal)
+ {
+-#if defined(__ppc__) || defined(__powerpc__) || defined(__arm__) || defined(__aarch64__)// PowerPC and ARM
++#if defined(__ppc__) || \
++    defined(__powerpc__) || \
++    defined(__arm__) || \
++    defined(__aarch64__) || \
++    defined(__SH4__)
+ // Not available/required
+ // Hack to allow compilation
+   throw "cas2 is not implemented";
+diff --git a/xbmc/utils/MathUtils.h b/xbmc/utils/MathUtils.h
+index 9ec1edba87..0be12d9abf 100644
+--- a/xbmc/utils/MathUtils.h
++++ b/xbmc/utils/MathUtils.h
+@@ -36,7 +36,8 @@
+     defined(__powerpc__) || \
+     defined(__mips__) || \
+     defined(__arm__) || \
+-    defined(__aarch64__)
++    defined(__aarch64__) || \
++    defined(__SH4__)
+   #define DISABLE_MATHUTILS_ASM_ROUND_INT
+ #endif
+ 
+-- 
+2.11.0
+
diff --git a/package/kodi/0004-Add-support-for-sparc.patch b/package/kodi/0004-Add-support-for-sparc.patch
new file mode 100644
index 0000000000..672dd5a580
--- /dev/null
+++ b/package/kodi/0004-Add-support-for-sparc.patch
@@ -0,0 +1,93 @@
+From 72ccf12d7760da4e77e70ae4cfed5caab986e8a9 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Thu, 27 Apr 2017 09:02:11 +0200
+Subject: [PATCH] Add support for sparc
+
+This commit fixes Kodi build with a buildroot toolchain for sparc.
+
+Patch sent upstream as PR 12015 to backport for Krypton branch of the
+upstream commit to master branch:
+https://github.com/xbmc/xbmc/commit/f1650a6add54ee2dc84756b57635b42693e7929e
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/cores/DllLoader/DllLoader.h                        | 3 ++-
+ xbmc/cores/DllLoader/ldt_keeper.c                       | 3 ++-
+ xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h | 3 ++-
+ xbmc/threads/Atomics.cpp                                | 3 ++-
+ xbmc/utils/MathUtils.h                                  | 3 ++-
+ 5 files changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/xbmc/cores/DllLoader/DllLoader.h b/xbmc/cores/DllLoader/DllLoader.h
+index f05c195b89..1e51014f1a 100644
+--- a/xbmc/cores/DllLoader/DllLoader.h
++++ b/xbmc/cores/DllLoader/DllLoader.h
+@@ -28,7 +28,8 @@
+     !defined(__arm__) && \
+     !defined(__aarch64__) && \
+     !defined(__mips__) && \
+-    !defined(__SH4__)
++    !defined(__SH4__) && \
++    !defined(__sparc__)
+ #define USE_LDT_KEEPER
+ #include "ldt_keeper.h"
+ #endif
+diff --git a/xbmc/cores/DllLoader/ldt_keeper.c b/xbmc/cores/DllLoader/ldt_keeper.c
+index ff230d8469..6aec5f8e67 100644
+--- a/xbmc/cores/DllLoader/ldt_keeper.c
++++ b/xbmc/cores/DllLoader/ldt_keeper.c
+@@ -24,7 +24,8 @@
+     !defined(__arm__) && \
+     !defined(__aarch64__) && \
+     !defined(__mips__) && \
+-    !defined(__SH4__)
++    !defined(__SH4__) && \
++    !defined(__sparc__)
+ 
+ #include "ldt_keeper.h"
+ 
+diff --git a/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h b/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h
+index 731341ef3d..67da6068b6 100644
+--- a/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h
++++ b/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h
+@@ -299,7 +299,8 @@ inline int NP2( unsigned x ) {
+     !defined(__arm__) && \
+     !defined(__aarch64__) && \
+     !defined(__mips__) && \
+-    !defined(__SH4__)
++    !defined(__SH4__) && \
++    !defined(__sparc__)
+   // If there are any issues compiling this, just append a ' && 0'
+   // to the above to make it '#if defined(TARGET_POSIX) && 0'
+ 
+diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
+index 7aaea1f2ba..90aabf947b 100644
+--- a/xbmc/threads/Atomics.cpp
++++ b/xbmc/threads/Atomics.cpp
+@@ -110,7 +110,8 @@ long long cas2(volatile long long* pAddr, long long expectedVal, long long swapV
+     defined(__powerpc__) || \
+     defined(__arm__) || \
+     defined(__aarch64__) || \
+-    defined(__SH4__)
++    defined(__SH4__) || \
++    defined(__sparc__)
+ // Not available/required
+ // Hack to allow compilation
+   throw "cas2 is not implemented";
+diff --git a/xbmc/utils/MathUtils.h b/xbmc/utils/MathUtils.h
+index 0be12d9abf..873fbb8b0f 100644
+--- a/xbmc/utils/MathUtils.h
++++ b/xbmc/utils/MathUtils.h
+@@ -37,7 +37,8 @@
+     defined(__mips__) || \
+     defined(__arm__) || \
+     defined(__aarch64__) || \
+-    defined(__SH4__)
++    defined(__SH4__) || \
++    defined(__sparc__)
+   #define DISABLE_MATHUTILS_ASM_ROUND_INT
+ #endif
+ 
+-- 
+2.11.0
+
diff --git a/package/kodi/0005-Add-support-for-arc.patch b/package/kodi/0005-Add-support-for-arc.patch
new file mode 100644
index 0000000000..647648e250
--- /dev/null
+++ b/package/kodi/0005-Add-support-for-arc.patch
@@ -0,0 +1,93 @@
+From 4e2d40e592b11380db10ff72970f2ed89206766a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Thu, 27 Apr 2017 13:01:25 +0200
+Subject: [PATCH] Add support for arc
+
+This commit fixes Kodi build with a buildroot toolchain for arc.
+
+Patch sent upstream as PR 12015 to backport for Krypton branch of the
+upstream commit to master branch:
+https://github.com/xbmc/xbmc/commit/375078fb7296817a93ec0a17562c28c7bc35f6cd
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/cores/DllLoader/DllLoader.h                        | 3 ++-
+ xbmc/cores/DllLoader/ldt_keeper.c                       | 3 ++-
+ xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h | 3 ++-
+ xbmc/threads/Atomics.cpp                                | 3 ++-
+ xbmc/utils/MathUtils.h                                  | 3 ++-
+ 5 files changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/xbmc/cores/DllLoader/DllLoader.h b/xbmc/cores/DllLoader/DllLoader.h
+index 1e51014f1a..5618445d51 100644
+--- a/xbmc/cores/DllLoader/DllLoader.h
++++ b/xbmc/cores/DllLoader/DllLoader.h
+@@ -29,7 +29,8 @@
+     !defined(__aarch64__) && \
+     !defined(__mips__) && \
+     !defined(__SH4__) && \
+-    !defined(__sparc__)
++    !defined(__sparc__) && \
++    !defined(__arc__)
+ #define USE_LDT_KEEPER
+ #include "ldt_keeper.h"
+ #endif
+diff --git a/xbmc/cores/DllLoader/ldt_keeper.c b/xbmc/cores/DllLoader/ldt_keeper.c
+index 6aec5f8e67..a10acdb967 100644
+--- a/xbmc/cores/DllLoader/ldt_keeper.c
++++ b/xbmc/cores/DllLoader/ldt_keeper.c
+@@ -25,7 +25,8 @@
+     !defined(__aarch64__) && \
+     !defined(__mips__) && \
+     !defined(__SH4__) && \
+-    !defined(__sparc__)
++    !defined(__sparc__) && \
++    !defined(__arc__)
+ 
+ #include "ldt_keeper.h"
+ 
+diff --git a/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h b/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h
+index 67da6068b6..b0cd76da45 100644
+--- a/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h
++++ b/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h
+@@ -300,7 +300,8 @@ inline int NP2( unsigned x ) {
+     !defined(__aarch64__) && \
+     !defined(__mips__) && \
+     !defined(__SH4__) && \
+-    !defined(__sparc__)
++    !defined(__sparc__) && \
++    !defined(__arc__)
+   // If there are any issues compiling this, just append a ' && 0'
+   // to the above to make it '#if defined(TARGET_POSIX) && 0'
+ 
+diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
+index 90aabf947b..0c5b13ae73 100644
+--- a/xbmc/threads/Atomics.cpp
++++ b/xbmc/threads/Atomics.cpp
+@@ -111,7 +111,8 @@ long long cas2(volatile long long* pAddr, long long expectedVal, long long swapV
+     defined(__arm__) || \
+     defined(__aarch64__) || \
+     defined(__SH4__) || \
+-    defined(__sparc__)
++    defined(__sparc__) || \
++    defined(__arc__)
+ // Not available/required
+ // Hack to allow compilation
+   throw "cas2 is not implemented";
+diff --git a/xbmc/utils/MathUtils.h b/xbmc/utils/MathUtils.h
+index 873fbb8b0f..b79be9e3d6 100644
+--- a/xbmc/utils/MathUtils.h
++++ b/xbmc/utils/MathUtils.h
+@@ -38,7 +38,8 @@
+     defined(__arm__) || \
+     defined(__aarch64__) || \
+     defined(__SH4__) || \
+-    defined(__sparc__)
++    defined(__sparc__) || \
++    defined(__arc__)
+   #define DISABLE_MATHUTILS_ASM_ROUND_INT
+ #endif
+ 
+-- 
+2.11.0
+
diff --git a/package/kodi/0006-Add-support-for-xtensa.patch b/package/kodi/0006-Add-support-for-xtensa.patch
new file mode 100644
index 0000000000..6141be4f96
--- /dev/null
+++ b/package/kodi/0006-Add-support-for-xtensa.patch
@@ -0,0 +1,93 @@
+From 1de2a0afc083888686be6f169d1477e25ab80848 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Thu, 27 Apr 2017 16:51:36 +0200
+Subject: [PATCH] Add support for xtensa
+
+This commit fixes Kodi build with a buildroot toolchain for xtensa.
+
+Patch sent upstream as PR 12015 to backport for Krypton branch of the
+upstream commit to master branch:
+https://github.com/xbmc/xbmc/commit/353d3f626063cd22633efb03b1f662d0336d5ec3
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ xbmc/cores/DllLoader/DllLoader.h                        | 3 ++-
+ xbmc/cores/DllLoader/ldt_keeper.c                       | 3 ++-
+ xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h | 3 ++-
+ xbmc/threads/Atomics.cpp                                | 3 ++-
+ xbmc/utils/MathUtils.h                                  | 3 ++-
+ 5 files changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/xbmc/cores/DllLoader/DllLoader.h b/xbmc/cores/DllLoader/DllLoader.h
+index 5618445d51..26b41e258b 100644
+--- a/xbmc/cores/DllLoader/DllLoader.h
++++ b/xbmc/cores/DllLoader/DllLoader.h
+@@ -30,7 +30,8 @@
+     !defined(__mips__) && \
+     !defined(__SH4__) && \
+     !defined(__sparc__) && \
+-    !defined(__arc__)
++    !defined(__arc__) && \
++    !defined(__xtensa__)
+ #define USE_LDT_KEEPER
+ #include "ldt_keeper.h"
+ #endif
+diff --git a/xbmc/cores/DllLoader/ldt_keeper.c b/xbmc/cores/DllLoader/ldt_keeper.c
+index a10acdb967..83fd023196 100644
+--- a/xbmc/cores/DllLoader/ldt_keeper.c
++++ b/xbmc/cores/DllLoader/ldt_keeper.c
+@@ -26,7 +26,8 @@
+     !defined(__mips__) && \
+     !defined(__SH4__) && \
+     !defined(__sparc__) && \
+-    !defined(__arc__)
++    !defined(__arc__) && \
++    !defined(__xtensa__)
+ 
+ #include "ldt_keeper.h"
+ 
+diff --git a/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h b/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h
+index b0cd76da45..32f8bc45c9 100644
+--- a/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h
++++ b/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h
+@@ -301,7 +301,8 @@ inline int NP2( unsigned x ) {
+     !defined(__mips__) && \
+     !defined(__SH4__) && \
+     !defined(__sparc__) && \
+-    !defined(__arc__)
++    !defined(__arc__) && \
++    !defined(__xtensa__)
+   // If there are any issues compiling this, just append a ' && 0'
+   // to the above to make it '#if defined(TARGET_POSIX) && 0'
+ 
+diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
+index 0c5b13ae73..7085a13882 100644
+--- a/xbmc/threads/Atomics.cpp
++++ b/xbmc/threads/Atomics.cpp
+@@ -112,7 +112,8 @@ long long cas2(volatile long long* pAddr, long long expectedVal, long long swapV
+     defined(__aarch64__) || \
+     defined(__SH4__) || \
+     defined(__sparc__) || \
+-    defined(__arc__)
++    defined(__arc__) || \
++    defined(__xtensa__)
+ // Not available/required
+ // Hack to allow compilation
+   throw "cas2 is not implemented";
+diff --git a/xbmc/utils/MathUtils.h b/xbmc/utils/MathUtils.h
+index b79be9e3d6..556787ef82 100644
+--- a/xbmc/utils/MathUtils.h
++++ b/xbmc/utils/MathUtils.h
+@@ -39,7 +39,8 @@
+     defined(__aarch64__) || \
+     defined(__SH4__) || \
+     defined(__sparc__) || \
+-    defined(__arc__)
++    defined(__arc__) || \
++    defined(__xtensa__)
+   #define DISABLE_MATHUTILS_ASM_ROUND_INT
+ #endif
+ 
+-- 
+2.11.0
+
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index b6a16202e7..ad870e00ef 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
-	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
-		&& BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
-		&& BR2_TOOLCHAIN_HAS_SYNC_8
 	depends on BR2_USE_MMU # libcdio, and others
+# i386: needs sse (see upstream PR 10351)
+	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
+		&& !(BR2_i386 && !BR2_X86_CPU_HAS_SSE)
 
 comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++, locale, threads, wchar, dynamic library, gcc >= 4.8, host gcc >= 4.6"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 0b89bdd86a..640e4c7e4a 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -69,16 +69,37 @@ KODI_CONF_OPTS += \
 	-DLIBDVDCSS_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	-DLIBDVDNAV_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
 	-DLIBDVDREAD_URL=$(BR2_DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(KODI_CXX_FLAGS)"
 
-ifeq ($(BR2_arm),y)
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi
+KODI_DEPENDENCIES += rpi-userland
+# These CPU-specific options are only used on rbpi:
+# https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake#L13
+ifeq ($(BR2_arm1176jzf_s)$(BR2_cortex_a7)$(BR2_cortex_a53),y)
+KODI_CONF_OPTS += -DWITH_CPU=$(BR2_GCC_TARGET_CPU)
+endif
+else  # BR2_PACKAGE_RPI_USERLAND
+ifeq ($(BR2_arceb)$(BR2_arcle),y)
+KODI_CONF_OPTS += -DWITH_ARCH=arc -DWITH_CPU=arc
+else ifeq ($(BR2_armeb),y)
 KODI_CONF_OPTS += -DWITH_ARCH=arm -DWITH_CPU=arm
-else ifeq ($(BR2_mips),y)
-KODI_CONF_OPTS += -DWITH_ARCH=mips -DWITH_CPU=mips
-else ifeq ($(BR2_i386),y)
-KODI_CONF_OPTS += -DWITH_ARCH=i486-linux -DWITH_CPU=$(BR2_GCC_TARGET_ARCH)
-else ifeq ($(BR2_x86_64),y)
-KODI_CONF_OPTS += -DWITH_ARCH=x86_64-linux -DWITH_CPU=x86_64
+else ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
+KODI_CONF_OPTS += \
+	-DWITH_ARCH=mips$(if $(BR2_ARCH_IS_64),64) \
+	-DWITH_CPU=mips$(if $(BR2_ARCH_IS_64),64)
+else ifeq ($(BR2_powerpc)$(BR2_powerpc64le),y)
+KODI_CONF_OPTS += \
+	-DWITH_ARCH=powerpc$(if $(BR2_ARCH_IS_64),64) \
+	-DWITH_CPU=powerpc$(if $(BR2_ARCH_IS_64),64)
+else ifeq ($(BR2_powerpc64)$(BR2_sparc64)$(BR2_sh4)$(BR2_xtensa),y)
+KODI_CONF_OPTS += -DWITH_ARCH=$(BR2_ARCH) -DWITH_CPU=$(BR2_ARCH)
+else
+# Kodi auto-detects ARCH, tested: arm, aarch64, i386, x86_64
+# see project/cmake/scripts/linux/ArchSetup.cmake
+KODI_CONF_OPTS += -DWITH_CPU=$(BR2_ARCH)
 endif
+endif # !BR2_PACKAGE_RPI_USERLAND
 
 ifeq ($(BR2_X86_CPU_HAS_SSE),y)
 KODI_CONF_OPTS += -D_SSE_OK=ON -D_SSE_TRUE=ON
@@ -128,6 +149,11 @@ else
 KODI_CONF_OPTS += -D_AVX2_OK=OFF -D_AVX2_TRUE=OFF
 endif
 
+# mips: uses __atomic_load_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+KODI_CXX_FLAGS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_MYSQL),y)
 KODI_CONF_OPTS += -DENABLE_MYSQLCLIENT=ON
 KODI_DEPENDENCIES += mysql
-- 
2.11.0
