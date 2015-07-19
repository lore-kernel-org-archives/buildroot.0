From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jul 2015 21:05:10 +0200
Subject: [Buildroot] [PATCH/RFC v3 05/50] package/kodi: bump version to
	15.0rc3 Isengard
In-Reply-To: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437332755-9764-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- added libsquish as new dependency
  https://github.com/xbmc/xbmc/commit/f73653d62b09db8cab7662ae7c4b2dab596b4ab0#diff-3b3a6ec97232deb43dc14319a73872c1R2207

- updated build procedure for host version of texturepacker

- removed SDL dependencies
  http://kodi.wiki/view/Kodi_v15_%28Isengard%29_changelog#Linux_Specific
  "Removed dependencies of SDL (Simple DirectMedia Layer) for everything
   but hardware abstraction for input devices"

- added mips support:
  https://github.com/xbmc/xbmc/commit/5d1746ad5b2272ba5f906ad9a49a87b650bda14a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/0001-Fixup-include-path.patch         |   48 ------
 package/kodi/0002-texturepacker.patch              |   12 ++
 ...make-device-change-event-support-optional.patch |  179 ++++++++++++++++++++
 package/kodi/Config.in                             |   10 +-
 package/kodi/kodi.mk                               |   39 +++--
 5 files changed, 216 insertions(+), 72 deletions(-)
 create mode 100644 package/kodi/0002-texturepacker.patch
 create mode 100644 package/kodi/0003-ALSA-make-device-change-event-support-optional.patch

diff --git a/package/kodi/0001-Fixup-include-path.patch b/package/kodi/0001-Fixup-include-path.patch
index be99bd6..9298981 100644
--- a/package/kodi/0001-Fixup-include-path.patch
+++ b/package/kodi/0001-Fixup-include-path.patch
@@ -14,34 +14,6 @@ Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
  lib/timidity/configure.in                    | 6 +++---
  4 files changed, 6 insertions(+), 12 deletions(-)
 
-diff --git a/lib/enca/configure b/lib/enca/configure
-index c839a51..7af5a09 100644
---- a/lib/enca/configure
-+++ b/lib/enca/configure
-@@ -12011,9 +12011,6 @@ fi
- if test "$prefix" = "NONE"; then
-   LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
-   CPPFLAGS="$CPPFLAGS -I$ac_default_prefix/include"
--else
--  LDFLAGS="$LDFLAGS -L$prefix/lib"
--  CPPFLAGS="$CPPFLAGS -I$prefix/include"
- fi
- 
- 
-diff --git a/lib/enca/configure.ac b/lib/enca/configure.ac
-index 41434df..47d5367 100644
---- a/lib/enca/configure.ac
-+++ b/lib/enca/configure.ac
-@@ -100,9 +100,6 @@ dnl Dirty path hack.  Helps some people with badly set up search paths.
- if test "$prefix" = "NONE"; then
-   LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
-   CPPFLAGS="$CPPFLAGS -I$ac_default_prefix/include"
--else
--  LDFLAGS="$LDFLAGS -L$prefix/lib"
--  CPPFLAGS="$CPPFLAGS -I$prefix/include"
- fi
- 
- dnl Checks for libraries.
 diff --git a/lib/libdvd/libdvdread/misc/dvdread-config.sh b/lib/libdvd/libdvdread/misc/dvdread-config.sh
 index e170c7e..25ee893 100644
 --- a/lib/libdvd/libdvdread/misc/dvdread-config.sh
@@ -59,23 +31,3 @@ index e170c7e..25ee893 100644
 -fi      
 +      echo $dvdreadlib
 +fi
-diff --git a/lib/timidity/configure.in b/lib/timidity/configure.in
-index 9f2835b..733470a 100644
---- a/lib/timidity/configure.in
-+++ b/lib/timidity/configure.in
-@@ -100,9 +100,9 @@ done
- 
- # add $prefix if specified.
- if test "x$prefix" != xNONE -a "x$prefix" != "x$ac_default_prefix" -a "x$prefix" != "x/usr"; then
--  LDFLAGS="-L$prefix/lib $LDFLAGS"
--  SHLDFLAGS="-L$prefix/lib $SHLDFLAGS"
--  CPPFLAGS="-I$prefix/include $CPPFLAGS"
-+  LDFLAGS="$LDFLAGS"
-+  SHLDFLAGS="$SHLDFLAGS"
-+  CPPFLAGS="$CPPFLAGS"
- fi
- 
- dnl add --with-includes, --with-libraries
--- 
-1.8.5.2
-
diff --git a/package/kodi/0002-texturepacker.patch b/package/kodi/0002-texturepacker.patch
new file mode 100644
index 0000000..c9e28dd
--- /dev/null
+++ b/package/kodi/0002-texturepacker.patch
@@ -0,0 +1,12 @@
+diff -uNr xbmc-656cba5d5c7c5edb166196b48560825b9b1f03fd.org/tools/depends/native/TexturePacker/Makefile xbmc-656cba5d5c7c5edb166196b48560825b9b1f03fd/tools/depends/native/TexturePacker/Makefile
+--- xbmc-656cba5d5c7c5edb166196b48560825b9b1f03fd.org/tools/depends/native/TexturePacker/Makefile	2015-01-25 09:00:48.000000000 +0100
++++ xbmc-656cba5d5c7c5edb166196b48560825b9b1f03fd/tools/depends/native/TexturePacker/Makefile	2015-01-25 13:03:23.606140953 +0100
+@@ -36,7 +36,7 @@
+ 	-rm -rf $(PLATFORM)/*; mkdir -p $(PLATFORM)
+ 	cd $(PLATFORM); cp -a $(SOURCE)/* .
+ 	cd $(PLATFORM); ./autogen.sh
+-	cd $(PLATFORM); ./configure --prefix=$(PREFIX) $(EXTRA_CONFIGURE) EXTRA_DEFINES="$(NATIVE_ARCH_DEFINES)"
++	cd $(PLATFORM); ./configure --prefix=$(PREFIX) EXTRA_DEFINES="$(NATIVE_ARCH_DEFINES)"
+ 
+ 
+ $(APP): $(PLATFORM)
diff --git a/package/kodi/0003-ALSA-make-device-change-event-support-optional.patch b/package/kodi/0003-ALSA-make-device-change-event-support-optional.patch
new file mode 100644
index 0000000..ead3ac3
--- /dev/null
+++ b/package/kodi/0003-ALSA-make-device-change-event-support-optional.patch
@@ -0,0 +1,179 @@
+From 8d413341a758d68169c235820a8f4b085dc7238d Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 19 Jul 2015 14:12:03 +0200
+Subject: [PATCH 5/5] ALSA: make device change event support optional
+
+Current uClibc version 0.9.33.2 does not support eventfd_read/write.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac                                |    8 +++++++-
+ xbmc/cores/AudioEngine/Makefile.in          |    2 ++
+ xbmc/cores/AudioEngine/Sinks/AESinkALSA.cpp |   12 ++++++++++--
+ xbmc/cores/AudioEngine/Sinks/AESinkALSA.h   |    6 ++++++
+ xbmc/linux/Makefile.in                      |    2 ++
+ 5 files changed, 27 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d321f7d..3fc085c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -911,7 +911,7 @@ AC_FUNC_STRFTIME
+ AC_FUNC_STRTOD
+ AC_FUNC_UTIME_NULL
+ AC_FUNC_VPRINTF
+-AC_CHECK_FUNCS([atexit dup2 fdatasync floor fs_stat_dev ftime ftruncate getcwd gethostbyaddr gethostbyname gethostname getpagesize getpass gettimeofday inet_ntoa lchown localeconv memchr memmove memset mkdir modf munmap pow rmdir select setenv setlocale socket sqrt strcasecmp strchr strcspn strdup strerror strncasecmp strpbrk strrchr strspn strstr strtol strtoul sysinfo tzset utime posix_fadvise localtime_r])
++AC_CHECK_FUNCS([atexit dup2 fdatasync floor fs_stat_dev ftime ftruncate getcwd gethostbyaddr gethostbyname gethostname getpagesize getpass gettimeofday inet_ntoa lchown localeconv memchr memmove memset mkdir modf munmap pow rmdir select setenv setlocale socket sqrt strcasecmp strchr strcspn strdup strerror strncasecmp strpbrk strrchr strspn strstr strtol strtoul sysinfo tzset utime posix_fadvise localtime_r eventfd_read eventfd_write])
+ 
+ # Check for various sizes
+ AC_CHECK_SIZEOF([int])
+@@ -2061,9 +2061,14 @@ else
+   fi
+ fi
+ 
++USE_EVENTFD=0
+ if test "$use_alsa" = "yes"; then
+   USE_ALSA=1
+   AC_DEFINE([USE_ALSA],[1],["Define to 1 if alsa is installed"])
++  if test "$ac_cv_func_eventfd_read" = "yes" -a "$ac_cv_func_eventfd_write" = "yes"; then
++      USE_EVENTFD=1
++      AC_DEFINE([HAVE_EVENTFD],[1],["Define to 1 if eventfd is installed"])
++  fi
+   final_message="$final_message\n  ALSA:\t\tYes"
+ else
+   USE_ALSA=0
+@@ -2626,6 +2631,7 @@ AC_SUBST(USE_OPENMAX)
+ AC_SUBST(USE_PULSE)
+ AC_SUBST(HAVE_LIBPULSE)
+ AC_SUBST(USE_ALSA)
++AC_SUBST(USE_EVENTFD)
+ AC_SUBST(USE_TEXTUREPACKER)
+ AC_SUBST(TEXTUREPACKER)
+ AC_SUBST(USE_AIRTUNES)
+diff --git a/xbmc/cores/AudioEngine/Makefile.in b/xbmc/cores/AudioEngine/Makefile.in
+index 024618e..cffba4e 100644
+--- a/xbmc/cores/AudioEngine/Makefile.in
++++ b/xbmc/cores/AudioEngine/Makefile.in
+@@ -49,8 +49,10 @@ SRCS += Sinks/osx/CoreAudioHelpers.cpp
+ SRCS += Sinks/osx/CoreAudioStream.cpp
+ else
+ SRCS += Sinks/AESinkALSA.cpp
++ifeq (@USE_EVENTFD@,1)
+ SRCS += Sinks/alsa/ALSADeviceMonitor.cpp
+ SRCS += Sinks/alsa/ALSAHControlMonitor.cpp
++endif
+ SRCS += Sinks/AESinkOSS.cpp
+ ifeq (@USE_PULSE@,1)
+ SRCS += Sinks/AESinkPULSE.cpp
+diff --git a/xbmc/cores/AudioEngine/Sinks/AESinkALSA.cpp b/xbmc/cores/AudioEngine/Sinks/AESinkALSA.cpp
+index e22db7a..ef67ef6 100644
+--- a/xbmc/cores/AudioEngine/Sinks/AESinkALSA.cpp
++++ b/xbmc/cores/AudioEngine/Sinks/AESinkALSA.cpp
+@@ -1104,7 +1104,7 @@ bool CAESinkALSA::OpenPCMDevice(const std::string &name, const std::string &para
+ 
+ void CAESinkALSA::EnumerateDevicesEx(AEDeviceInfoList &list, bool force)
+ {
+-#if HAVE_LIBUDEV
++#if defined(HAVE_EVENTFD) && defined(HAVE_LIBUDEV)
+   m_deviceMonitor.Start();
+ #endif
+ 
+@@ -1121,7 +1121,9 @@ void CAESinkALSA::EnumerateDevicesEx(AEDeviceInfoList &list, bool force)
+   snd_config_t *config;
+   snd_config_copy(&config, snd_config);
+ 
++#if defined (HAVE_EVENTFD)
+   m_controlMonitor.Clear();
++#endif
+ 
+   /* Always enumerate the default device.
+    * Note: If "default" is a stereo device, EnumerateDevice()
+@@ -1200,7 +1202,9 @@ void CAESinkALSA::EnumerateDevicesEx(AEDeviceInfoList &list, bool force)
+   }
+   snd_device_name_free_hint(hints);
+ 
++#if defined (HAVE_EVENTFD)
+   m_controlMonitor.Start();
++#endif
+ 
+   /* set the displayname for default device */
+   if (!list.empty() && list[0].m_deviceName == "default")
+@@ -1383,8 +1387,10 @@ void CAESinkALSA::EnumerateDevice(AEDeviceInfoList &list, const std::string &dev
+             snd_hctl_load(hctl);
+             bool badHDMI = false;
+ 
++#if defined (HAVE_EVENTFD)
+             /* add ELD to monitoring */
+             m_controlMonitor.Add(strHwName, SND_CTL_ELEM_IFACE_PCM, dev, "ELD");
++#endif
+ 
+             if (!GetELD(hctl, dev, info, badHDMI))
+               CLog::Log(LOGDEBUG, "CAESinkALSA - Unable to obtain ELD information for device \"%s\" (not supported by device, or kernel older than 3.2)",
+@@ -1627,9 +1633,11 @@ void CAESinkALSA::sndLibErrorHandler(const char *file, int line, const char *fun
+   va_end(arg);
+ }
+ 
+-#if HAVE_LIBUDEV
++#if defined(HAVE_EVENTFD) && defined(HAVE_LIBUDEV)
+ CALSADeviceMonitor CAESinkALSA::m_deviceMonitor; // ARGH
+ #endif
++#if defined(HAVE_EVENTFD)
+ CALSAHControlMonitor CAESinkALSA::m_controlMonitor; // ARGH
++#endif
+ 
+ #endif
+diff --git a/xbmc/cores/AudioEngine/Sinks/AESinkALSA.h b/xbmc/cores/AudioEngine/Sinks/AESinkALSA.h
+index 2059eaa..e69836a 100644
+--- a/xbmc/cores/AudioEngine/Sinks/AESinkALSA.h
++++ b/xbmc/cores/AudioEngine/Sinks/AESinkALSA.h
+@@ -24,8 +24,10 @@
+ 
+ #include "cores/AudioEngine/Interfaces/AESink.h"
+ #include "cores/AudioEngine/Utils/AEDeviceInfo.h"
++#if HAVE_EVENTFD
+ #include "cores/AudioEngine/Sinks/alsa/ALSADeviceMonitor.h"
+ #include "cores/AudioEngine/Sinks/alsa/ALSAHControlMonitor.h"
++#endif
+ #include <stdint.h>
+ 
+ #define ALSA_PCM_NEW_HW_PARAMS_API
+@@ -35,7 +37,9 @@
+ 
+ // ARGH... this is apparently needed to avoid FDEventMonitor
+ // being destructed before CALSA*Monitor below.
++#if HAVE_EVENTFD
+ #include "linux/FDEventMonitor.h"
++#endif
+ 
+ class CAESinkALSA : public IAESink
+ {
+@@ -88,10 +92,12 @@ private:
+   bool              m_fragmented;
+   unsigned int      m_originalPeriodSize;
+ 
++#if HAVE_EVENTFD
+ #if HAVE_LIBUDEV
+   static CALSADeviceMonitor m_deviceMonitor;
+ #endif
+   static CALSAHControlMonitor m_controlMonitor;
++#endif
+ 
+   struct ALSAConfig
+   {
+diff --git a/xbmc/linux/Makefile.in b/xbmc/linux/Makefile.in
+index 744fd06..0344d91 100644
+--- a/xbmc/linux/Makefile.in
++++ b/xbmc/linux/Makefile.in
+@@ -4,7 +4,9 @@ SRCS  = ConvUtils.cpp
+ SRCS += DBusUtil.cpp
+ SRCS += DBusMessage.cpp
+ SRCS += DBusReserve.cpp
++ifeq (@USE_EVENTFD@,1)
+ SRCS += FDEventMonitor.cpp
++endif
+ SRCS += LinuxResourceCounter.cpp
+ SRCS += LinuxTimezone.cpp
+ SRCS += PosixMountProvider.cpp
+-- 
+1.7.10.4
+
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index bc845f8..62553d4 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
-	default y if (BR2_arm || BR2_i386 || BR2_x86_64) && BR2_PACKAGE_BOOST_ARCH_SUPPORTS
-
+	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) && BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 
 comment "kodi needs a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
@@ -52,14 +51,12 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_KODI_GL
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_KODI_GL
 	select BR2_PACKAGE_LIBGCRYPT
-	select BR2_PACKAGE_LIBID3TAG
-	select BR2_PACKAGE_LIBMAD
-	select BR2_PACKAGE_LIBMODPLUG
 	select BR2_PACKAGE_LIBMPEG2
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBPLIST
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBSAMPLERATE
+	select BR2_PACKAGE_LIBSQUISH
 	select BR2_PACKAGE_LIBVORBIS
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
@@ -79,9 +76,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_PYTHON_UNICODEDATA
 	select BR2_PACKAGE_PYTHON_ZLIB
 	select BR2_PACKAGE_READLINE
-	select BR2_PACKAGE_SDL if BR2_PACKAGE_KODI_GL
-	select BR2_PACKAGE_SDL_X11 if BR2_PACKAGE_KODI_GL
-	select BR2_PACKAGE_SDL_IMAGE if BR2_PACKAGE_KODI_GL
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_TAGLIB
 	select BR2_PACKAGE_TIFF
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index ad61f0d..c97dafa 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -4,22 +4,20 @@
 #
 ################################################################################
 
-KODI_VERSION = 14.2-Helix
+#KODI_VERSION = 15.0rc3-Isengard
+KODI_VERSION = 94871aef9425751658dc32159ddcb45914f14bae
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPLv2
 KODI_LICENSE_FILES = LICENSE.GPL
-# needed for audioencoder addons
+# needed for binary addons
 KODI_INSTALL_STAGING = YES
-# Kodi needs host-sdl_image (and therefore host-sdl) for a host tools it builds
-# called TexturePacker. It is responsible to take all the images used in the
-# GUI and pack them in a blob.
-# http://wiki.xbmc.org/index.php?title=TexturePacker
-KODI_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo \
-	host-nasm host-sdl_image host-swig
+KODI_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-giflib \
+	host-libjpeg host-lzo host-nasm host-libpng host-swig
 KODI_DEPENDENCIES += boost bzip2 expat ffmpeg fontconfig freetype jasper jpeg \
-	libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
-	libogg libplist libpng libsamplerate libvorbis libxml2 libxslt lzo ncurses \
-	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
+	libass libcdio libcurl libfribidi libgcrypt libmpeg2 \
+	libogg libplist libpng libsamplerate libsquish libvorbis libxml2 \
+	libxslt lzo ncurses openssl pcre python readline sqlite taglib tiff \
+	tinyxml yajl zlib
 
 KODI_CONF_ENV = \
 	PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)" \
@@ -33,8 +31,6 @@ KODI_CONF_ENV = \
 
 KODI_CONF_OPTS +=  \
 	--with-ffmpeg=shared \
-	--disable-crystalhd \
-	--disable-hal \
 	--disable-joystick \
 	--disable-openmax \
 	--disable-projectm \
@@ -91,13 +87,15 @@ endif
 # GL means X11, and under X11, Kodi needs libdrm; libdrm is forcefully selected
 # by a modular Xorg server, which Kodi already depends on.
 ifeq ($(BR2_PACKAGE_KODI_GL),y)
-KODI_DEPENDENCIES += libglew libglu libgl sdl_image xlib_libX11 xlib_libXext \
+KODI_DEPENDENCIES += libglew libglu libgl xlib_libX11 xlib_libXext \
 	xlib_libXmu xlib_libXrandr xlib_libXt libdrm
-KODI_CONF_OPTS += --enable-gl --enable-sdl --enable-x11 --enable-xrandr --disable-gles
+KODI_CONF_OPTS += --enable-gl --enable-x11 --disable-gles
 ifeq ($(BR2_PACKAGE_KODI_RSXS),y)
 # fix rsxs compile
+# gcc5: http://trac.kodi.tv/ticket/16006#comment:6
 # make sure target libpng-config is used, options taken from rsxs-0.9/acinclude.m4
 KODI_CONF_ENV += \
+	ac_cv_type__Bool=yes \
 	jm_cv_func_gettimeofday_clobber=no \
 	mac_cv_pkg_png=$(STAGING_DIR)/usr/bin/libpng-config \
 	mac_cv_pkg_cppflags="`$(STAGING_DIR)/usr/bin/libpng-config --I_opts --cppflags`" \
@@ -109,7 +107,7 @@ else
 KODI_CONF_OPTS += --disable-rsxs
 endif
 else
-KODI_CONF_OPTS += --disable-gl --disable-rsxs --disable-sdl --disable-x11 --disable-xrandr
+KODI_CONF_OPTS += --disable-gl --disable-rsxs --disable-x11
 ifeq ($(BR2_PACKAGE_KODI_EGL_GLES),y)
 KODI_DEPENDENCIES += libegl libgles
 KODI_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags egl`"
@@ -212,10 +210,19 @@ endif
 
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
 define KODI_BOOTSTRAP
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/tools/depends/native/JsonSchemaBuilder
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/tools/depends/native/TexturePacker
 	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
 endef
 KODI_PRE_CONFIGURE_HOOKS += KODI_BOOTSTRAP
 
+# needed to fix binary addons compile
+# https://github.com/OpenELEC/OpenELEC.tv/commit/ecb91611931a4f89bd6551b4a2eaaf0b7cbf19fc
+define KODI_FIX_CONFIG_CMAKE
+	$(SED) "s:INCLUDE_DIR /usr/include/kodi:INCLUDE_DIR $(STAGING_DIR)/usr/include/kodi:g" $(STAGING_DIR)/usr/lib/kodi/kodi-config.cmake
+endef
+KODI_POST_INSTALL_STAGING_HOOKS += KODI_FIX_CONFIG_CMAKE
+
 define KODI_CLEAN_UNUSED_ADDONS
 	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/screensaver.rsxs.plasma
 	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/visualization.milkdrop
-- 
1.7.10.4
