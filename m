From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jan 2014 18:53:28 +0100
Subject: [Buildroot] [PATCH 14/14] xbmc: new package
In-Reply-To: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1389549208-19078-15-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

XBMC is an award-winning free and open source (GPL) software media player and
entertainment hub for digital media.
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in                                  |   1 +
 package/xbmc/Config.in                             | 202 +++++++++++++++++++++
 package/xbmc/S99xbmc.default                       |  24 +++
 package/xbmc/S99xbmc.raspberrypi                   |  31 ++++
 package/xbmc/xbmc-0001-Fixup-include-path.patch    |  79 ++++++++
 .../xbmc-0002-RaspberryPi-Default-Settings.patch   | 167 +++++++++++++++++
 package/xbmc/xbmc.mk                               | 167 +++++++++++++++++
 7 files changed, 671 insertions(+)
 create mode 100644 package/xbmc/Config.in
 create mode 100755 package/xbmc/S99xbmc.default
 create mode 100755 package/xbmc/S99xbmc.raspberrypi
 create mode 100644 package/xbmc/xbmc-0001-Fixup-include-path.patch
 create mode 100644 package/xbmc/xbmc-0002-RaspberryPi-Default-Settings.patch
 create mode 100644 package/xbmc/xbmc.mk

diff --git a/package/Config.in b/package/Config.in
index 3e888b2..f7c563e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -25,6 +25,7 @@ source "package/tidsp-binaries/Config.in"
 source "package/tstools/Config.in"
 source "package/vorbis-tools/Config.in"
 source "package/wavpack/Config.in"
+source "package/xbmc/Config.in"
 source "package/yavta/Config.in"
 endmenu
 
diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
new file mode 100644
index 0000000..69c4a1f
--- /dev/null
+++ b/package/xbmc/Config.in
@@ -0,0 +1,202 @@
+comment "xbmc requires an OpenGL-capable backend"
+	depends on !(BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES)
+
+# External toolchain are required because of a missing bitdefs.h
+comment "xbmc requires an external glibc or eglibc toolchain with C++ and WCHAR support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR) || BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_BUILDROOT
+
+menuconfig BR2_PACKAGE_XBMC
+	bool "xbmc"
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_JASPER
+	select BR2_PACKAGE_LIBCDIO
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBFRIBIDI
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBMODPLUG
+	select BR2_PACKAGE_LIBMPEG2
+	select BR2_PACKAGE_LIBUNGIF
+	select BR2_PACKAGE_LZO
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_BSDDB
+	select BR2_PACKAGE_PYTHON_BZIP2
+	select BR2_PACKAGE_PYTHON_CURSES
+	select BR2_PACKAGE_PYTHON_PYEXPAT
+	select BR2_PACKAGE_PYTHON_READLINE
+	select BR2_PACKAGE_PYTHON_SQLITE
+	select BR2_PACKAGE_PYTHON_SSL
+	select BR2_PACKAGE_PYTHON_UNICODEDATA
+	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_TAGLIB
+	select BR2_PACKAGE_TIFF
+	select BR2_PACKAGE_TINYXML
+	select BR2_PACKAGE_YAJL
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	help
+	  XBMC is an award-winning free and open source (GPL) software
+	  media player and entertainment hub for digital media.
+
+          http://xbmc.org
+
+if BR2_PACKAGE_XBMC
+
+config BR2_PACKAGE_XBMC_AVAHI
+        bool "avahi"
+        select BR2_PACKAGE_AVAHI
+        select BR2_PACKAGE_AVAHI_DAEMON
+        help
+          Enable Avahi support.
+          Select this if you want XBMC to support Bonjour protocol.
+
+config BR2_PACKAGE_XBMC_DBUS
+	bool "dbus"
+	select BR2_PACKAGE_DBUS
+	help
+          Enable DBUS support
+
+config BR2_PACKAGE_XBMC_FLAC
+	bool "flac"
+	select BR2_PACKAGE_FLAC
+	help
+	  Enable flac input/streaming support.
+	  Select this if you want to play back FLAC files.
+
+config BR2_PACKAGE_XBMC_LIBASS
+	bool "libass"
+	select BR2_PACKAGE_LIBASS
+	help
+          Enable ASS sublititles support
+
+config BR2_PACKAGE_XBMC_LIBBLURAY
+        bool "libbluray"
+        select BR2_PACKAGE_LIBBLURAY
+        help
+          Enable bluray input support.
+          Select this if you want to play back bluray content.
+
+config BR2_PACKAGE_XBMC_LIBCEC
+        bool "libcec"
+        select BR2_PACKAGE_LIBCEC
+        depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+        help
+          Enable CEC support.
+          Select this if you want XBMC to support HDMI CEC.
+
+if BR2_PACKAGE_XBMC_LIBCEC && BR2_arm
+
+config BR2_PACKAGE_XBMC_LIBCEC_RBP
+        bool "rpi support"
+        depends on BR2_INSTALL_LIBSTDCPP
+        depends on BR2_LARGEFILE
+        select BR2_PACKAGE_RPI_USERLAND
+	select BR2_PACKAGE_LIBCEC_RBP
+        help
+          Enable RasberryPi support
+
+comment "rpi support requires a toolchain with C++ and LARGEFILE support"
+        depends on !(BR2_INSTALL_LIBSTDCPP && BR2_LARGEFILE)
+
+endif
+
+comment "libcec requires a toolchain with C++ and WCHAR support"
+        depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
+
+config BR2_PACKAGE_XBMC_LIBMICROHTTPD
+	bool "libmicrohttpd"
+	select BR2_PACKAGE_LIBMICROHTTPD
+	help
+          Enable webserver feature
+
+config BR2_PACKAGE_XBMC_LIBNFS
+        bool "libnfs"
+        select BR2_PACKAGE_LIBNFS
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+        help
+          Enable NFS server support.
+
+comment "libnfs support requires a toolchain with LARGEFILE and RPC support"
+	depends on !(BR2_LARGEFILE && BR2_TOOLCHAIN_HAS_NATIVE_RPC)
+
+config BR2_PACKAGE_XBMC_LIBRTMP
+        bool "librtmp"
+        select BR2_PACKAGE_LIBRTMP
+        help
+          Enable rtmp input support.
+          Select this if you want to play back rtmp stream.
+
+config BR2_PACKAGE_XBMC_LIBSAMPLERATE
+	bool "libsamplerate"
+	select BR2_PACKAGE_LIBSAMPLERATE
+	help
+	  Enable libsamplerate input support.
+	  Select this for software sample rate conversion.
+
+config BR2_PACKAGE_XBMC_LIBSHAIRPLAY
+        bool "libshairport"
+        select BR2_PACKAGE_LIBSHAIRPLAY
+	depends on BR2_INET_IPV6
+        help
+          Enable shairport support.
+          Select this if you want to stream content from Apple device.
+
+comment "libshairport support requires a toolchain with IPV6 support"
+	depends on !(BR2_INET_IPV6)
+
+config BR2_PACKAGE_XBMC_LIBSMBCLIENT
+	bool "libsmbclient"
+	select BR2_PACKAGE_SAMBA
+	select BR2_PACKAGE_SAMBA_LIBSMBCLIENT
+	help
+          Enable Samba support
+
+config BR2_PACKAGE_XBMC_LIBTHEORA
+	bool "libtheora"
+	select BR2_PACKAGE_LIBTHEORA
+	help
+	  Enable theora input support.
+	  Select this if you want to play back OGG/OGV files (Video).
+
+config BR2_PACKAGE_XBMC_LIBUSB
+	bool "libusb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  Enable libusb support.
+
+config BR2_PACKAGE_XBMC_MAD
+	bool "mad"
+	select BR2_PACKAGE_LIBID3TAG
+	select BR2_PACKAGE_LIBMAD
+	help
+	  Enable mad input support.
+	  Select this if you want to play back MP3 files.
+
+config BR2_PACKAGE_XBMC_VORBIS
+	bool "vorbis"
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBVORBIS
+	help
+	  Enable vorbis input/streaming support.
+	  Select this if you want to play back OGG files on hardfloat
+	  targets.
+
+config BR2_PACKAGE_XBMC_WAVPACK
+	bool "wavpack"
+	select BR2_PACKAGE_WAVPACK
+	help
+	  Enable wavpack input support.
+	  Select this if you want to play back WV files.
+
+endif
diff --git a/package/xbmc/S99xbmc.default b/package/xbmc/S99xbmc.default
new file mode 100755
index 0000000..a15d3f9
--- /dev/null
+++ b/package/xbmc/S99xbmc.default
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+NAME=xbmc.bin
+DAEMON=/usr/lib/xbmc/$NAME
+DAEMON_ARGS="--standalone -fs -n"
+PIDFILE=/var/run/xbmc.pid
+
+export HOME=/root
+
+case "$1" in
+	start)
+		echo $(start-stop-daemon -u root -m --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS; RETURN=$?; case $RETURN in 0 ) echo do normal exit.....; exit 0; ;; 64 ) echo do power off.....; halt ;; 66 ) echo do reboot.....; reboot; ;; esac || return 2) &exit
+		;;
+	stop)
+		start-stop-daemon --stop --signal 9 --retry 5 --quiet --pidfile $PIDFILE
+		;;
+	restart)
+		$0 stop
+		$0 start
+		;;
+	*)
+		echo "usage: $0 {start|stop|restart}"
+esac
+exit 0
diff --git a/package/xbmc/S99xbmc.raspberrypi b/package/xbmc/S99xbmc.raspberrypi
new file mode 100755
index 0000000..833aea5
--- /dev/null
+++ b/package/xbmc/S99xbmc.raspberrypi
@@ -0,0 +1,31 @@
+#!/bin/sh
+
+NAME=xbmc.bin
+DAEMON=/usr/lib/xbmc/$NAME
+DAEMON_ARGS="--standalone -fs -n"
+PIDFILE=/var/run/xbmc.pid
+
+XRES=1280
+YRES=720
+
+export LD_LIBRARY_PATH=$XBMC_BASE/lib:/opt/vc/lib:/usr/lib/mysql:$LD_LIBRARY_PATH
+export LD_PRELOAD=/usr/lib/libcofi_rpi.so
+export HOME=/root
+
+case "$1" in
+	start)
+		echo 0 >  /sys/class/vtconsole/vtcon1/bind
+		fbset -xres 1 -yres 1 -vxres 1 -vyres 1
+		echo $(start-stop-daemon -u root -m --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS; RETURN=$?; case $RETURN in 0 ) echo do normal exit.....; exit 0; ;; 64 ) echo do power off.....; halt ;; 66 ) echo do reboot.....; reboot; ;; esac || return 2) &exit
+		;;
+	stop)
+		start-stop-daemon --stop --signal 9 --retry 5 --quiet --pidfile $PIDFILE
+		;;
+	restart)
+		$0 stop
+		$0 start
+		;;
+	*)
+		echo "usage: $0 {start|stop|restart}"
+esac
+exit 0
diff --git a/package/xbmc/xbmc-0001-Fixup-include-path.patch b/package/xbmc/xbmc-0001-Fixup-include-path.patch
new file mode 100644
index 0000000..e4d6632
--- /dev/null
+++ b/package/xbmc/xbmc-0001-Fixup-include-path.patch
@@ -0,0 +1,79 @@
+From 63c255f1f5d68363f49193aceed343e602dc8bdf Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Thu, 26 Dec 2013 21:17:10 +0100
+Subject: [PATCH] Fixup include path
+
+Patch originally taken from :
+http://repository.timesys.com/buildsources/x/xbmc/xbmc-11.0/xbmc-11.0-fixups.patch
+---
+ lib/enca/configure                           | 3 ---
+ lib/enca/configure.ac                        | 3 ---
+ lib/libdvd/libdvdread/misc/dvdread-config.sh | 6 +++---
+ lib/timidity/configure.in                    | 6 +++---
+ 4 files changed, 6 insertions(+), 12 deletions(-)
+
+diff --git a/lib/enca/configure b/lib/enca/configure
+index c839a51..7af5a09 100644
+--- a/lib/enca/configure
++++ b/lib/enca/configure
+@@ -12011,9 +12011,6 @@ fi
+ if test "$prefix" = "NONE"; then
+   LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
+   CPPFLAGS="$CPPFLAGS -I$ac_default_prefix/include"
+-else
+-  LDFLAGS="$LDFLAGS -L$prefix/lib"
+-  CPPFLAGS="$CPPFLAGS -I$prefix/include"
+ fi
+ 
+ 
+diff --git a/lib/enca/configure.ac b/lib/enca/configure.ac
+index 41434df..47d5367 100644
+--- a/lib/enca/configure.ac
++++ b/lib/enca/configure.ac
+@@ -100,9 +100,6 @@ dnl Dirty path hack.  Helps some people with badly set up search paths.
+ if test "$prefix" = "NONE"; then
+   LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
+   CPPFLAGS="$CPPFLAGS -I$ac_default_prefix/include"
+-else
+-  LDFLAGS="$LDFLAGS -L$prefix/lib"
+-  CPPFLAGS="$CPPFLAGS -I$prefix/include"
+ fi
+ 
+ dnl Checks for libraries.
+diff --git a/lib/libdvd/libdvdread/misc/dvdread-config.sh b/lib/libdvd/libdvdread/misc/dvdread-config.sh
+index e170c7e..25ee893 100644
+--- a/lib/libdvd/libdvdread/misc/dvdread-config.sh
++++ b/lib/libdvd/libdvdread/misc/dvdread-config.sh
+@@ -48,9 +48,9 @@ if test "$echo_prefix" = "yes"; then
+ fi
+ 
+ if test "$echo_cflags" = "yes"; then
+-      echo -I$prefix/include $extracflags
++      echo $extracflags
+ fi
+ 
+ if test "$echo_libs" = "yes"; then
+-      echo -L$libdir $dvdreadlib
+-fi      
++      echo $dvdreadlib
++fi
+diff --git a/lib/timidity/configure.in b/lib/timidity/configure.in
+index 9f2835b..733470a 100644
+--- a/lib/timidity/configure.in
++++ b/lib/timidity/configure.in
+@@ -100,9 +100,9 @@ done
+ 
+ # add $prefix if specified.
+ if test "x$prefix" != xNONE -a "x$prefix" != "x$ac_default_prefix" -a "x$prefix" != "x/usr"; then
+-  LDFLAGS="-L$prefix/lib $LDFLAGS"
+-  SHLDFLAGS="-L$prefix/lib $SHLDFLAGS"
+-  CPPFLAGS="-I$prefix/include $CPPFLAGS"
++  LDFLAGS="$LDFLAGS"
++  SHLDFLAGS="$SHLDFLAGS"
++  CPPFLAGS="$CPPFLAGS"
+ fi
+ 
+ dnl add --with-includes, --with-libraries
+-- 
+1.8.5.2
+
diff --git a/package/xbmc/xbmc-0002-RaspberryPi-Default-Settings.patch b/package/xbmc/xbmc-0002-RaspberryPi-Default-Settings.patch
new file mode 100644
index 0000000..076da5a
--- /dev/null
+++ b/package/xbmc/xbmc-0002-RaspberryPi-Default-Settings.patch
@@ -0,0 +1,167 @@
+From 2541772a3ed71402a620466feb6a337b40f08880 Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maximeh.hadjinlian@gmail.com>
+Date: Sat, 15 Dec 2012 23:41:06 +0100
+Subject: [PATCH] RaspberryPi Default Settings
+
+Add some default settings if the target platform is the RaspberryPi.
+Avoid the fact that the user _MUST_ have an advandcedsettings.xml to be able
+to use XBMC properly.
+
+---
+ xbmc/settings/AdvancedSettings.cpp          |   31 +++++++++++++++++++++++++++
+ xbmc/settings/GUISettings.cpp               |    8 +++----
+ xbmc/settings/GUIWindowSettingsCategory.cpp |    4 ++--
+ 3 files changed, 37 insertions(+), 6 deletions(-)
+
+diff --git a/xbmc/settings/AdvancedSettings.cpp b/xbmc/settings/AdvancedSettings.cpp
+index 2cbbf98..42ccabd 100644
+--- a/xbmc/settings/AdvancedSettings.cpp
++++ b/xbmc/settings/AdvancedSettings.cpp
+@@ -72,7 +72,11 @@ void CAdvancedSettings::Initialize()
+   m_karaokeAlwaysEmptyOnCdgs = 1;
+   m_karaokeUseSongSpecificBackground = 0;
+
++  #if defined(TARGET_RASPBERRY_PI)
++  m_audioDefaultPlayer = "omxplayer";
++  #else
+   m_audioDefaultPlayer = "paplayer";
++  #endif
+   m_audioPlayCountMinimumPercent = 90.0f;
+   m_audioHost = "default";
+
+@@ -93,8 +97,14 @@ void CAdvancedSettings::Initialize()
+   m_videoBlackBarColour = 0;
+   m_videoPPFFmpegDeint = "linblenddeint";
+   m_videoPPFFmpegPostProc = "ha:128:7,va,dr";
++
++  #if defined(TARGET_RASPBERRY_PI)
++  m_videoDefaultPlayer = "omxplayer";
++  m_videoDefaultDVDPlayer = "omxplayer";
++  #else
+   m_videoDefaultPlayer = "dvdplayer";
+   m_videoDefaultDVDPlayer = "dvdplayer";
++  #endif
+   m_videoIgnoreSecondsAtStart = 3*60;
+   m_videoIgnorePercentAtEnd   = 8.0f;
+   m_videoPlayCountMinimumPercent = 90.0f;
+@@ -287,7 +297,11 @@ void CAdvancedSettings::Initialize()
+   m_alwaysOnTop = false;
+ #endif
+
++  #if defined(TARGET_RASPBERRY_PI)
++  m_bgInfoLoaderMaxThreads = 2;
++  #else
+   m_bgInfoLoaderMaxThreads = 5;
++  #endif
+
+   m_iPVRTimeCorrection             = 0;
+   m_iPVRInfoToggleInterval         = 3000;
+@@ -299,7 +313,12 @@ void CAdvancedSettings::Initialize()
+
+   m_measureRefreshrate = false;
+
++  #if defined(TARGET_RASPBERRY_PI)
++  m_cacheMemBufferSize = 1024 * 1024 * 10;
++  #else
+   m_cacheMemBufferSize = 1024 * 1024 * 20;
++  #endif
++
+   m_addonPackageFolderSize = 200;
+
+   m_jsonOutputCompact = true;
+@@ -509,11 +528,17 @@ void CAdvancedSettings::ParseSettingsFile(const CStdString &file)
+         RefreshOverride override = {0};
+
+         float fps;
++        #if defined(TARGET_RASPBERRY_PI)
++          fps = 23.976;
++          override.fpsmin = fps - 0.01f;
++          override.fpsmax = fps + 0.01f;
++        #else
+         if (XMLUtils::GetFloat(pRefreshOverride, "fps", fps))
+         {
+           override.fpsmin = fps - 0.01f;
+           override.fpsmax = fps + 0.01f;
+         }
++        #endif
+
+         float fpsmin, fpsmax;
+         if (XMLUtils::GetFloat(pRefreshOverride, "fpsmin", fpsmin) &&
+@@ -524,11 +549,17 @@ void CAdvancedSettings::ParseSettingsFile(const CStdString &file)
+         }
+
+         float refresh;
++        #if defined(TARGET_RASPBERRY_PI)
++          refresh = 24.0;
++          override.refreshmin = refresh - 0.01f;
++          override.refreshmax = refresh + 0.01f;
++        #else
+         if (XMLUtils::GetFloat(pRefreshOverride, "refresh", refresh))
+         {
+           override.refreshmin = refresh - 0.01f;
+           override.refreshmax = refresh + 0.01f;
+         }
++        #endif
+
+         float refreshmin, refreshmax;
+         if (XMLUtils::GetFloat(pRefreshOverride, "refreshmin", refreshmin) &&
+diff --git a/xbmc/settings/GUISettings.cpp b/xbmc/settings/GUISettings.cpp
+index c1820a7..c00fb18 100644
+--- a/xbmc/settings/GUISettings.cpp
++++ b/xbmc/settings/GUISettings.cpp
+@@ -537,11 +537,11 @@ void CGUISettings::Initialize()
+   AddInt(NULL, "input.appleremotesequencetime", 13603, 500, 50, 50, 1000, SPIN_CONTROL_INT_PLUS, MASK_MS, TEXT_OFF);
+   AddSeparator(in, "input.sep1");
+ #endif
+-  AddBool(in, "input.remoteaskeyboard", 21449, false);
++  AddBool(in, "input.remoteaskeyboard", 21449, true);
+ #if defined(TARGET_DARWIN_IOS)
+   AddBool(NULL, "input.enablemouse", 21369, true);
+ #else
+-  AddBool(in, "input.enablemouse", 21369, true);
++  AddBool(in, "input.enablemouse", 21369, false);
+ #endif
+ #if defined(HAS_SDL_JOYSTICK)
+   AddBool(in, "input.enablejoystick", 35100, true);
+@@ -831,7 +831,7 @@ void CGUISettings::Initialize()
+
+ #ifdef HAS_WEB_SERVER
+   CSettingsCategory* srvWeb = AddCategory(SETTINGS_SERVICE, "webserver", 33101);
+-  AddBool(srvWeb,  "services.webserver",        263, false);
++  AddBool(srvWeb,  "services.webserver",        263, true);
+   AddString(srvWeb,"services.webserverport",    730, CUtil::CanBindPrivileged()?"80":"8080", EDIT_CONTROL_NUMBER_INPUT, false, 730);
+   AddString(srvWeb,"services.webserverusername",1048, "xbmc", EDIT_CONTROL_INPUT);
+   AddString(srvWeb,"services.webserverpassword",733, "", EDIT_CONTROL_HIDDEN_INPUT, true, 733);
+@@ -881,7 +881,7 @@ void CGUISettings::Initialize()
+   AddInt(laf, "lookandfeel.startupwindow",512,1, WINDOW_HOME, 1, WINDOW_PYTHON_END, SPIN_CONTROL_TEXT);
+   AddString(laf, "lookandfeel.soundskin",15108,"SKINDEFAULT", SPIN_CONTROL_TEXT);
+   AddSeparator(laf, "lookandfeel.sep2");
+-  AddBool(laf, "lookandfeel.enablerssfeeds",13305,  true);
++  AddBool(laf, "lookandfeel.enablerssfeeds",13305,  false);
+   AddString(laf, "lookandfeel.rssedit", 21450, "", BUTTON_CONTROL_STANDARD);
+
+   CSettingsCategory* loc = AddCategory(SETTINGS_APPEARANCE, "locale", 14090);
+diff --git a/xbmc/settings/GUIWindowSettingsCategory.cpp b/xbmc/settings/GUIWindowSettingsCategory.cpp
+index b4cee69..a9bcb7a 100644
+--- a/xbmc/settings/GUIWindowSettingsCategory.cpp
++++ b/xbmc/settings/GUIWindowSettingsCategory.cpp
+@@ -1271,7 +1271,7 @@ void CGUIWindowSettingsCategory::OnSettingChanged(CBaseSettingControl *pSettingC
+       if (!g_application.StartWebServer())
+       {
+         CGUIDialogOK::ShowAndGetInput(g_localizeStrings.Get(33101), "", g_localizeStrings.Get(33100), "");
+-        g_guiSettings.SetBool("services.webserver", false);
++        g_guiSettings.SetBool("services.webserver", true);
+       }
+   }
+   else if (strSetting.Equals("services.webserverusername") || strSetting.Equals("services.webserverpassword"))
+@@ -1292,7 +1292,7 @@ void CGUIWindowSettingsCategory::OnSettingChanged(CBaseSettingControl *pSettingC
+     else
+     {
+       g_application.StopAirplayServer(true);
+-      g_guiSettings.SetBool("services.airplay", false);
++      g_guiSettings.SetBool("services.airplay", true);
+       CZeroconf::GetInstance()->Stop();
+     }
+ #endif
+--
+1.7.10.4
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
new file mode 100644
index 0000000..c39a13f
--- /dev/null
+++ b/package/xbmc/xbmc.mk
@@ -0,0 +1,167 @@
+################################################################################
+#
+# xbmc
+#
+#################################################################################
+
+XBMC_VERSION = 12.3-Frodo
+XBMC_SITE = $(call github,xbmc,xbmc,$(XBMC_VERSION))
+XBMC_LICENSE = GPLv2
+XBMC_LICENSE_FILES = LICENSE.GPL
+XBMC_DEPENDENCIES = host-lzo host-sdl_image host-swig
+XBMC_DEPENDENCIES += libmpeg2 bzip2 libcdio python lzo zlib libgcrypt openssl \
+		sqlite fontconfig freetype jasper jpeg libmodplug libpng libungif tiff \
+		libcurl boost libfribidi ncurses pcre libplist readline expat libxml2 yajl \
+		tinyxml taglib
+
+XBMC_CONF_ENV += PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)"
+XBMC_CONF_ENV += PYTHON_LDFLAGS="-L$(STAGING_DIR)/usr/lib/ -lpython$(PYTHON_VERSION_MAJOR) -lpthread -ldl -lutil -lm"
+XBMC_CONF_ENV += PYTHON_CPPFLAGS="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)"
+XBMC_CONF_ENV += PYTHON_SITE_PKG="$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
+XBMC_CONF_ENV += PYTHON_NOVERSIONCHECK="no-check"
+XBMC_CONF_ENV += TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
+
+XBMC_PLATFORM = default
+
+XBMC_MAKE=$(MAKE1)
+XBMC_CONF_OPT += --disable-sdl --disable-x11 --disable-xrandr --disable-openmax \
+		--disable-optical-drive --disable-dvdcss --disable-joystick \
+		--disable-debug --disable-crystalhd --disable-vtbdecoder --disable-vaapi \
+		--disable-vdpau --disable-pulse --disable-projectm --enable-optimizations \
+		--disable-alsa --disable-ssh --disable-hal --disable-mysql
+
+ifeq ($(BR2_arm),y)
+XBMC_CONF_OPT += --enable-gles --disable-gl
+endif
+
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+XBMC_DEPENDENCIES += rpi-userland
+XBMC_CONF_OPT += --with-platform=raspberry-pi --enable-player=omxplayer
+XBMC_PLATFORM = raspberrypi
+XBMC_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
+		 -I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+XBMC_DEPENDENCIES += dbus
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
+XBMC_DEPENDENCIES += libusb-compat
+XBMC_CONF_OPT += --enable-libusb
+else
+XBMC_CONF_OPT += --disable-libusb
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBMICROHTTPD),y)
+XBMC_DEPENDENCIES += libmicrohttpd
+XBMC_CONF_OPT += --enable-webserver
+else
+XBMC_CONF_OPT += --disable-webserver
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBSMBCLIENT),y)
+XBMC_DEPENDENCIES += samba
+XBMC_CONF_OPT += --enable-samba
+else
+XBMC_CONF_OPT += --disable-samba
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_VORBIS),y)
+XBMC_DEPENDENCIES += libogg libvorbis
+XBMC_CONF_OPT += --enable-libvorbisenc
+else
+XBMC_CONF_OPT += --disable-libvorbisenc
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBNFS),y)
+XBMC_DEPENDENCIES += libnfs
+XBMC_CONF_OPT += --enable-nfs
+else
+XBMC_CONF_OPT += --disable-nfs
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBRTMP),y)
+XBMC_DEPENDENCIES += librtmp
+XBMC_CONF_OPT += --enable-rtmp
+else
+XBMC_CONF_OPT += --disable-rtmp
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBBLURAY),y)
+XBMC_DEPENDENCIES += libbluray
+XBMC_CONF_OPT += --enable-libbluray
+else
+XBMC_CONF_OPT += --disable-libbluray
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBSHAIRPLAY),y)
+XBMC_DEPENDENCIES += libshairplay
+XBMC_CONF_OPT += --enable-airplay
+else
+XBMC_CONF_OPT += --disable-airplay
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_AVAHI),y)
+XBMC_DEPENDENCIES += avahi
+XBMC_CONF_OPT += --enable-avahi
+else
+XBMC_CONF_OPT += --disable-avahi
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBCEC),y)
+XBMC_DEPENDENCIES += libcec
+XBMC_CONF_OPT += --enable-libcec
+else
+XBMC_CONF_OPT += --disable-libcec
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_FLAC),y)
+XBMC_DEPENDENCIES += flac
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBASS),y)
+XBMC_DEPENDENCIES += libass
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_MAD),y)
+XBMC_DEPENDENCIES += libmad
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_LIBSAMPLERATE),y)
+XBMC_DEPENDENCIES += libsamplerate
+endif
+
+ifeq ($(BR2_PACKAGE_XBMC_WAVPACK),y)
+XBMC_DEPENDENCIES += wavpack
+endif
+
+# Add HOST_DIR to PATH for codegenerator.mk to find swig
+# TODO: java binary from user's machine is currently used...
+define XBMC_BOOTSTRAP
+	cd $(@D) && PATH="$(HOST_DIR)/usr/bin/:$(PATH)" ./bootstrap
+endef
+
+define XBMC_INSTALL_ETC
+	$(INSTALL) -D -d -m 755 $(TARGET_DIR)/etc/init.d/
+	$(INSTALL) -D -m 755 package/xbmc/S99xbmc.$(XBMC_PLATFORM) $(TARGET_DIR)/etc/init.d/S99xbmc
+endef
+
+define XBMC_CLEAN_UNUSED_ADDONS
+	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/screensaver.rsxs.plasma
+	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.milkdrop
+	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.projectm
+	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.itunes
+endef
+
+define XBMC_CLEAN_CONFLUENCE_SKIN
+	find $(TARGET_DIR)/usr/share/xbmc/addons/skin.confluence/media -name *.png -delete
+	find $(TARGET_DIR)/usr/share/xbmc/addons/skin.confluence/media -name *.jpg -delete
+endef
+
+XBMC_PRE_CONFIGURE_HOOKS += XBMC_BOOTSTRAP
+XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_INSTALL_ETC
+XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_CLEAN_UNUSED_ADDONS
+XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_CLEAN_CONFLUENCE_SKIN
+
+$(eval $(autotools-package))
-- 
1.8.5.2
