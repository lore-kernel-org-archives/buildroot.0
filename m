From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Sep 2014 19:10:18 +0200
Subject: [Buildroot] [git commit] package/xbmc: make D-Bus configurable
Message-ID: <20140922171052.6168F9D74D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47e5ba9dfc756633b5304aac9485103dbcd9662b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: edit patch to indicate that it has been accepted by upstream,
as mentionned by Bernd.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/xbmc-0003-dbus.patch |   46 +++++++++++++++++++++++++++++++++++++
 package/xbmc/xbmc.mk              |    5 +++-
 2 files changed, 50 insertions(+), 1 deletions(-)

diff --git a/package/xbmc/xbmc-0003-dbus.patch b/package/xbmc/xbmc-0003-dbus.patch
new file mode 100644
index 0000000..3b63b23
--- /dev/null
+++ b/package/xbmc/xbmc-0003-dbus.patch
@@ -0,0 +1,46 @@
+build: make D-Bus configurable
+
+Patch accepted upstream:
+https://github.com/xbmc/xbmc/commit/630f930d4c9c33230e9ff7df24f93afb3f05881f
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
index b3c5023..a38128f 100644
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
