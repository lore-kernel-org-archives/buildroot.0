From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Jul 2018 13:42:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: Fix build on openrisc
Message-ID: <20180728114215.12530-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch for kodi.mk is needed to fix configure error:

CMake Error at scripts/linux/ArchSetup.cmake:24 (message):
  Unknown CPU: or1k

Tested using this defconfig:

BR2_or1k=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2018.02-925-gd4158df.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_16=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_ONLY=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/0004-or1k.patch | 62 ++++++++++++++++++++++++++++++++++++
 package/kodi/kodi.mk         |  2 ++
 2 files changed, 64 insertions(+)
 create mode 100644 package/kodi/0004-or1k.patch

diff --git a/package/kodi/0004-or1k.patch b/package/kodi/0004-or1k.patch
new file mode 100644
index 0000000000..2bfce1a57e
--- /dev/null
+++ b/package/kodi/0004-or1k.patch
@@ -0,0 +1,62 @@
+Fix build on openrisc
+
+Patch for master branch sent upstream as PR 14236.
+This patch is a backport to Krypton branch.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr xbmc-17.6-Krypton.org/xbmc/cores/DllLoader/DllLoader.h xbmc-17.6-Krypton/xbmc/cores/DllLoader/DllLoader.h
+--- xbmc-17.6-Krypton.org/xbmc/cores/DllLoader/DllLoader.h	2017-11-14 17:55:01.000000000 +0100
++++ xbmc-17.6-Krypton/xbmc/cores/DllLoader/DllLoader.h	2018-07-28 12:24:36.686332911 +0200
+@@ -31,6 +31,7 @@
+     !defined(__SH4__) && \
+     !defined(__sparc__) && \
+     !defined(__arc__) && \
++    !defined(__or1k__) && \
+     !defined(__xtensa__)
+ #define USE_LDT_KEEPER
+ #include "ldt_keeper.h"
+diff -uNr xbmc-17.6-Krypton.org/xbmc/cores/DllLoader/ldt_keeper.c xbmc-17.6-Krypton/xbmc/cores/DllLoader/ldt_keeper.c
+--- xbmc-17.6-Krypton.org/xbmc/cores/DllLoader/ldt_keeper.c	2017-11-14 17:55:01.000000000 +0100
++++ xbmc-17.6-Krypton/xbmc/cores/DllLoader/ldt_keeper.c	2018-07-28 12:17:18.052505833 +0200
+@@ -27,6 +27,7 @@
+     !defined(__SH4__) && \
+     !defined(__sparc__) && \
+     !defined(__arc__) && \
++    !defined(__or1k__) && \
+     !defined(__xtensa__)
+ 
+ #include "ldt_keeper.h"
+diff -uNr xbmc-17.6-Krypton.org/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h xbmc-17.6-Krypton/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h
+--- xbmc-17.6-Krypton.org/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h	2017-11-14 17:55:01.000000000 +0100
++++ xbmc-17.6-Krypton/xbmc/cores/VideoPlayer/VideoRenderers/LinuxRendererGL.h	2018-07-28 12:24:13.573134108 +0200
+@@ -302,6 +302,7 @@
+     !defined(__SH4__) && \
+     !defined(__sparc__) && \
+     !defined(__arc__) && \
++    !defined(__or1k__) && \
+     !defined(__xtensa__)
+   // If there are any issues compiling this, just append a ' && 0'
+   // to the above to make it '#if defined(TARGET_POSIX) && 0'
+diff -uNr xbmc-17.6-Krypton.org/xbmc/threads/Atomics.cpp xbmc-17.6-Krypton/xbmc/threads/Atomics.cpp
+--- xbmc-17.6-Krypton.org/xbmc/threads/Atomics.cpp	2017-11-14 17:55:01.000000000 +0100
++++ xbmc-17.6-Krypton/xbmc/threads/Atomics.cpp	2018-07-28 12:25:57.176022980 +0200
+@@ -113,6 +113,7 @@
+     defined(__SH4__) || \
+     defined(__sparc__) || \
+     defined(__arc__) || \
++    defined(__or1k__) || \
+     defined(__xtensa__)
+ // Not available/required
+ // Hack to allow compilation
+diff -uNr xbmc-17.6-Krypton.org/xbmc/utils/MathUtils.h xbmc-17.6-Krypton/xbmc/utils/MathUtils.h
+--- xbmc-17.6-Krypton.org/xbmc/utils/MathUtils.h	2017-11-14 17:55:01.000000000 +0100
++++ xbmc-17.6-Krypton/xbmc/utils/MathUtils.h	2018-07-28 12:10:22.595053280 +0200
+@@ -40,6 +40,7 @@
+     defined(__SH4__) || \
+     defined(__sparc__) || \
+     defined(__arc__) || \
++    defined(__or1k__) || \
+     defined(__xtensa__)
+   #define DISABLE_MATHUTILS_ASM_ROUND_INT
+ #endif
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index f3fa0b55b0..1ccc6bb8d6 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -95,6 +95,8 @@ else ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
 KODI_CONF_OPTS += \
 	-DWITH_ARCH=mips$(if $(BR2_ARCH_IS_64),64) \
 	-DWITH_CPU=mips$(if $(BR2_ARCH_IS_64),64)
+else ifeq ($(BR2_or1k),y)
+KODI_CONF_OPTS += -DWITH_ARCH=or1k -DWITH_CPU=or1k
 else ifeq ($(BR2_powerpc)$(BR2_powerpc64le),y)
 KODI_CONF_OPTS += \
 	-DWITH_ARCH=powerpc$(if $(BR2_ARCH_IS_64),64) \
-- 
2.18.0
