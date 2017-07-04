From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  4 Jul 2017 20:31:25 +0200
Subject: [Buildroot] [PATCH 3/3] package/kodi: Add support for more archs
In-Reply-To: <20170704183125.15212-1-bernd.kuhls@t-online.de>
References: <20170704183125.15212-1-bernd.kuhls@t-online.de>
Message-ID: <20170704183125.15212-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the autoconf-based build system it was necessary to allow each
supported architecture separately:
https://github.com/xbmc/xbmc/blob/Krypton/m4/xbmc_arch.m4

For the CMake build system this is not necessary anymore so we only
blacklist archs in Config.in known to be unsupported.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Tested with test-pkg using this defconfig

BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_EVENTCLIENTS=y
BR2_PACKAGE_KODI_LIBBLURAY=y
BR2_PACKAGE_KODI_LIBCEC=y
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

                armv5-ctng-linux-gnueabi [ 1/47]: OK
              armv7-ctng-linux-gnueabihf [ 2/47]: OK
                        br-aarch64-glibc [ 3/47]: OK
                           br-arcle-hs38 [ 4/47]: FAILED
                            br-arm-basic [ 5/47]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/47]: OK
                   br-arm-cortex-a9-musl [ 7/47]: SKIPPED
                   br-arm-cortex-m4-full [ 8/47]: SKIPPED
                             br-arm-full [ 9/47]: OK
                    br-arm-full-nothread [10/47]: SKIPPED
                      br-arm-full-static [11/47]: SKIPPED
                            br-bfin-full [12/47]: SKIPPED
                   br-i386-pentium4-full [13/47]: OK
                br-i386-pentium-mmx-musl [14/47]: SKIPPED
                       br-m68k-5208-full [15/47]: SKIPPED
                      br-m68k-68040-full [16/47]: SKIPPED
                    br-microblazeel-full [17/47]: SKIPPED
                 br-mips32r6-el-hf-glibc [18/47]: OK
                      br-mips64-n64-full [19/47]: OK
                 br-mips64r6-el-hf-glibc [20/47]: OK
                      br-mipsel-o32-full [21/47]: OK
                          br-nios2-glibc [22/47]: SKIPPED
                      br-openrisc-uclibc [23/47]: SKIPPED
               br-powerpc-603e-basic-cpp [24/47]: SKIPPED
             br-powerpc64le-power8-glibc [25/47]: OK
               br-powerpc64-power7-glibc [26/47]: OK
                  br-powerpc-e500mc-full [27/47]: OK
                             br-sh4-full [28/47]: OK
                        br-sparc64-glibc [29/47]: OK
                         br-sparc-uclibc [30/47]: SKIPPED
                    br-x86-64-core2-full [31/47]: OK
                          br-x86-64-musl [32/47]: SKIPPED
                          br-xtensa-full [33/47]: OK
                     i686-ctng-linux-gnu [34/47]: SKIPPED
                          linaro-aarch64 [35/47]: OK
                              linaro-arm [36/47]: OK
             mips64el-ctng_n32-linux-gnu [37/47]: OK
             mips64el-ctng_n64-linux-gnu [38/47]: OK
        powerpc-ctng_e500v2-linux-gnuspe [39/47]: SKIPPED
                     sourcery-arm-armv4t [40/47]: OK
                            sourcery-arm [41/47]: OK
                     sourcery-arm-thumb2 [42/47]: OK
                         sourcery-mips64 [43/47]: OK
                           sourcery-mips [44/47]: OK
                          sourcery-nios2 [45/47]: SKIPPED
                         sourcery-x86-64 [46/47]: OK
           x86_64-ctng_locales-linux-gnu [47/47]: OK
47 builds, 18 skipped, 1 build failed, 0 legal-info failed

The build error on arc is toolchain-related, similar to
http://autobuild.buildroot.net/results/3bf/3bfee548f69d2650f7523507e615316f6da669e3/build-end.log

Building kodi on arc with reduced dependencies works fine.

 package/kodi/Config.in |  6 +++---
 package/kodi/kodi.mk   | 45 +++++++++++++++++++++++++++++++++++----------
 2 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 00e4fbaef..e0c16fac3 100644
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
index f3e654ba2..e01107c39 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -57,6 +57,7 @@ KODI_EXTRA_DOWNLOADS = \
 	https://github.com/xbmc/libdvdread/archive/$(KODI_LIBDVDREAD_VERSION).tar.gz
 
 KODI_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(KODI_CXX_FLAGS)" \
 	-DENABLE_CCACHE=OFF \
 	-DENABLE_DVDCSS=ON \
 	-DENABLE_INTERNAL_CROSSGUID=OFF \
@@ -70,14 +71,34 @@ KODI_CONF_OPTS += \
 	-DLIBDVDNAV_URL=$(DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
 	-DLIBDVDREAD_URL=$(DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz
 
-ifeq ($(BR2_arm),y)
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+KODI_CONF_OPTS += -DCORE_SYSTEM_NAME=rbpi
+KODI_DEPENDENCIES += rpi-userland
+# These CPU-specific options are only used on rbpi:
+# https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake#L13
+ifeq ($(BR2_arm1176jzf_s)$(BR2_cortex_a7)$(BR2_cortex_a53),y)
+KODI_CONF_OPTS += -DWITH_CPU=$(BR2_GCC_TARGET_CPU)
+endif
+else
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
+endif
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE),y)
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
@@ -229,9 +255,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_KODI_EGL_GLES),y)
 KODI_DEPENDENCIES += libegl libgles
-KODI_CONF_OPTS += \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags --libs egl`" \
-	-DENABLE_OPENGLES=ON
+KODI_CONF_OPTS += -DENABLE_OPENGLES=ON
+KODI_CXX_FLAGS = `$(PKG_CONFIG_HOST_BINARY) --cflags --libs egl`
 else
 KODI_CONF_OPTS += -DENABLE_OPENGLES=OFF
 endif
-- 
2.11.0
