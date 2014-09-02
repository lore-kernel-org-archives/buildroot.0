From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  2 Sep 2014 22:38:19 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/xbmc: make D-Bus configurable
Message-ID: <1409690299-21173-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Follow-up for http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/92503
    Now XBMC can be compiled without D-Bus support even if the D-Bus package
    itself is selected (Yann, Peter)

 package/xbmc/xbmc-0003-dbus.patch |   45 +++++++++++++++++++++++++++++++++++++
 package/xbmc/xbmc.mk              |    5 ++++-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 package/xbmc/xbmc-0003-dbus.patch

diff --git a/package/xbmc/xbmc-0003-dbus.patch b/package/xbmc/xbmc-0003-dbus.patch
new file mode 100644
index 0000000..48a9fc3
--- /dev/null
+++ b/package/xbmc/xbmc-0003-dbus.patch
@@ -0,0 +1,45 @@
+build: make D-Bus configurable
+
+Patch sent upstream: https://github.com/xbmc/xbmc/pull/5315
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr xbmc-13.2-Gotham.org/configure.in xbmc-13.2-Gotham/configure.in
+--- xbmc-13.2-Gotham.org/configure.in	2014-08-17 15:19:05.000000000 +0200
++++ xbmc-13.2-Gotham/configure.in	2014-09-02 20:55:06.932442467 +0200
+@@ -129,6 +129,7 @@
+ goom_enabled="== GOOM enabled. =="
+ goom_disabled="== GOOM disabled. =="
+ alsa_disabled="== ALSA support disabled. =="
++dbus_disabled="== DBUS support disabled. =="
+ rsxs_enabled="== RSXS enabled. =="
+ rsxs_disabled="== RSXS disabled. =="
+ fishbmc_enabled="== FishBMC enabled. =="
+@@ -369,6 +370,12 @@
+   [use_alsa=$enableval],
+   [use_alsa=yes])
+ 
++AC_ARG_ENABLE([dbus],
++  [AS_HELP_STRING([--disable-dbus],
++  [disable DBUS support])],
++  [use_dbus=$enableval],
++  [use_dbus=yes])
++
+ AC_ARG_ENABLE([pulse],
+   [AS_HELP_STRING([--enable-pulse],
+   [enable PulseAudio support (default is auto)])],
+@@ -1253,10 +1260,14 @@
+     [INCLUDES="$INCLUDES $ALSA_CFLAGS"; LIBS="$LIBS $ALSA_LIBS"; use_alsa=yes],
+     AC_MSG_NOTICE($alsa_not_found); use_alsa=no)
+ fi
++if test "x$use_dbus" != "xno"; then
+   PKG_CHECK_MODULES([DBUS],    [dbus-1],
+     [INCLUDES="$INCLUDES $DBUS_CFLAGS"; LIBS="$LIBS $DBUS_LIBS"; use_dbus=yes]; \
+     AC_DEFINE([HAVE_DBUS],[1],["Define to 1 if dbus is installed"]),
+     AC_MSG_NOTICE($missing_library); use_dbus=no)
++else
++  AC_MSG_NOTICE($dbus_disabled)
++fi
+   if test "x$use_sdl" != "xno"; then
+     PKG_CHECK_MODULES([SDL],   [sdl],
+       [INCLUDES="$INCLUDES $SDL_CFLAGS"; LIBS="$LIBS $SDL_LIBS"],
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index bdd634e..2d54f0e 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -64,8 +64,11 @@ XBMC_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
 	LIBS="-lvcos -lvchostif"
 endif
 
-ifeq ($(BR2_PACKAGE_DBUS),y)
+ifeq ($(BR2_PACKAGE_XBMC_DBUS),y)
 XBMC_DEPENDENCIES += dbus
+XBMC_CONF_OPT += --enable-dbus
+else
+XBMC_CONF_OPT += --disable-dbus
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-- 
1.7.10.4
