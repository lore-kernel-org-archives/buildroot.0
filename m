From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 30 Nov 2015 12:30:58 -0300
Subject: [Buildroot] [PATCH] openbox: new package
Message-ID: <1448897458-28332-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for the Openbox Windows Manager.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
Openbox was submitted long ago to Buildroot but it never got accepted:

http://lists.busybox.net/pipermail/buildroot/2009-December/030717.html

The current patch was written independently and completely unaware
of the above submission.

Tested on a Beaglebone Black.

 package/Config.in            |  1 +
 package/openbox/Config.in    | 20 ++++++++++++++
 package/openbox/openbox.hash |  3 +++
 package/openbox/openbox.mk   | 62 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 86 insertions(+)
 create mode 100644 package/openbox/Config.in
 create mode 100644 package/openbox/openbox.hash
 create mode 100644 package/openbox/openbox.mk

diff --git a/package/Config.in b/package/Config.in
index bdc3063abd1a..042cc6723682 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -303,6 +303,7 @@ comment "X window managers"
 	source "package/fluxbox/Config.in"
 	source "package/matchbox/Config.in"
 	source "package/metacity/Config.in"
+	source "package/openbox/Config.in"
 endmenu
 
 menu "Hardware handling"
diff --git a/package/openbox/Config.in b/package/openbox/Config.in
new file mode 100644
index 000000000000..796047142c3e
--- /dev/null
+++ b/package/openbox/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_OPENBOX
+	bool "openbox"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  Openbox is a highly configurable, next generation window
+	  manager with extensive standards support.
+
+	  http://openbox.org
+
+comment "openbox needs a MMU and a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_XORG7
diff --git a/package/openbox/openbox.hash b/package/openbox/openbox.hash
new file mode 100644
index 000000000000..b8839cae2dec
--- /dev/null
+++ b/package/openbox/openbox.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  abe75855cc5616554ffd47134ad15291fe37ebbebf1a80b69cbde9d670f0e26d  openbox-3.6.1.tar.xz
+
diff --git a/package/openbox/openbox.mk b/package/openbox/openbox.mk
new file mode 100644
index 000000000000..da88f17b54d9
--- /dev/null
+++ b/package/openbox/openbox.mk
@@ -0,0 +1,62 @@
+################################################################################
+#
+# openbox
+#
+################################################################################
+
+OPENBOX_VERSION = 3.6.1
+OPENBOX_SOURCE = openbox-$(OPENBOX_VERSION).tar.xz
+
+OPENBOX_SITE = http://openbox.org/dist/openbox
+OPENBOX_LICENSE = GPLv2+
+OPENBOX_LICENSE_FILES = COPYING
+
+OPENBOX_CONF_OPTS = \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+
+OPENBOX_DEPENDENCIES = xlib_libX11 libxml2 libglib2 pango
+
+ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
+OPENBOX_CONF_OPTS += --enable-imlib2
+OPENBOX_DEPENDENCIES += imlib2
+else
+OPENBOX_CONF_OPTS += --disable-imlib2
+endif
+
+ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
+OPENBOX_CONF_OPTS += --enable-startup-notification
+OPENBOX_DEPENDENCIES += startup-notification
+else
+OPENBOX_CONF_OPTS += --disable-startup-notification
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
+OPENBOX_CONF_OPTS += --enable-session-management
+OPENBOX_DEPENDENCIES += xlib_libSM
+else
+OPENBOX_CONF_OPTS += --disable-session-management
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+OPENBOX_CONF_OPTS += --enable-xinerama
+OPENBOX_DEPENDENCIES += xlib_libXinerama
+else
+OPENBOX_CONF_OPTS += --disable-xinerama
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+OPENBOX_CONF_OPTS += --enable-xrandr
+OPENBOX_DEPENDENCIES += xlib_libXrandr
+else
+OPENBOX_CONF_OPTS += --disable-xrandr
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+OPENBOX_DEPENDENCIES += xlib_libXcursor
+OPENBOX_CONF_OPTS += --enable-xcursor
+else
+OPENBOX_CONF_OPTS += --disable-xcursor
+endif
+
+$(eval $(autotools-package))
-- 
2.6.2
