From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Apr 2012 23:38:19 +0200
Subject: [Buildroot] [git commit] libedbus: add options for
	bluez/connman/notify support
Message-ID: <20120418213909.64CAC96B10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b02a282089e37bfe134856da5c2e9fd21360ba8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libedbus/Config.in   |   23 ++++++++++++++++++++++-
 package/efl/libedbus/libedbus.mk |   20 ++++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletions(-)

diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
index 3844b52..0914b37 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -2,10 +2,31 @@ config BR2_PACKAGE_LIBEDBUS
 	bool "libedbus"
 	select BR2_PACKAGE_LIBEINA
 	select BR2_PACKAGE_LIBECORE
-	depends on BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS
 	help
 	  E_Dbus is a set of wrappers around D-Bus APIs so they can be
 	  easily used by EFL applications, automatically providing
 	  Ecore/main loop integration, as well as Eina data types.
 
 	  http://trac.enlightenment.org/e/wiki/E_Dbus
+
+if BR2_PACKAGE_LIBEDBUS
+
+config BR2_PACKAGE_LIBEDBUS_BLUEZ
+	bool "bluez support"
+	select BR2_PACKAGE_BLUEZ_UTILS
+	help
+	  Bluetooth support.
+
+config BR2_PACKAGE_LIBEDBUS_CONNMAN
+	bool "connman support"
+	depends on BR2_PACKAGE_CONNMAN
+	help
+	  Connection manager support.
+
+config BR2_PACKAGE_LIBEDBUS_NOTIFY
+	bool "notify support"
+	help
+	  Notify support.
+
+endif
diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
index 34f34a7..c03474d 100644
--- a/package/efl/libedbus/libedbus.mk
+++ b/package/efl/libedbus/libedbus.mk
@@ -11,4 +11,24 @@ LIBEDBUS_INSTALL_STAGING = YES
 
 LIBEDBUS_DEPENDENCIES = host-pkg-config dbus libeina libecore
 
+ifeq ($(BR2_PACKAGE_LIBEDBUS_BLUEZ),y)
+LIBEDBUS_CONF_OPT += --enable-ebluez
+LIBEDBUS_DEPENDENCIES += bluez_utils
+else
+LIBEDBUS_CONF_OPT += --disable-ebluez
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDBUS_CONNMAN),y)
+LIBEDBUS_CONF_OPT += --enable-econnman0_7x
+LIBEDBUS_DEPENDENCIES += connman
+else
+LIBEDBUS_CONF_OPT += --disable-econnman0_7x
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDBUS_NOTIFY),y)
+LIBEDBUS_CONF_OPT += --enable-enotify --disable-edbus-notify-test
+else
+LIBEDBUS_CONF_OPT += --disable-enotify
+endif
+
 $(eval $(call AUTOTARGETS))
