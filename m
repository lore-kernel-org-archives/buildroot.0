From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 21 Feb 2013 20:39:05 +0200
Subject: [Buildroot] [PATCH] new package: gconf
Message-ID: <1361471945-23337-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GConf

GConf is a system for storing application preferences. It is intended for user
preferences; *not* configuration of something like Apache, or arbitrary data
storage.

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in       |    1 +
 package/gconf/Config.in |   12 ++++++++++++
 package/gconf/gconf.mk  |   25 +++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 package/gconf/Config.in
 create mode 100644 package/gconf/gconf.mk

diff --git a/package/Config.in b/package/Config.in
index 28bb55c..0a3d2c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -780,6 +780,7 @@ source "package/bootutils/Config.in"
 endif
 source "package/bwm-ng/Config.in"
 source "package/cpuload/Config.in"
+source "package/gconf/Config.in"
 source "package/htop/Config.in"
 source "package/keyutils/Config.in"
 source "package/kmod/Config.in"
diff --git a/package/gconf/Config.in b/package/gconf/Config.in
new file mode 100644
index 0000000..4da199a
--- /dev/null
+++ b/package/gconf/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_GCONF
+	bool "gconf"
+	select BR2_PACKAGE_INTLTOOL
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_LIBXML2
+	help
+	  GConf is a system for storing application preferences. It is intended
+	  for user preferences; *not* configuration of something like Apache,
+	  or arbitrary data storage.
+
+	  http://projects.gnome.org/gconf
+
diff --git a/package/gconf/gconf.mk b/package/gconf/gconf.mk
new file mode 100644
index 0000000..73b112f
--- /dev/null
+++ b/package/gconf/gconf.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# GConf
+#
+#############################################################
+
+GCONF_MAJOR_VERSION = 3.2
+GCONF_MINOR_VERSION = 0
+GCONF_VERSION = $(GCONF_MAJOR_VERSION).$(GCONF_MINOR_VERSION)
+GCONF_SOURCE = GConf-$(GCONF_VERSION).tar.xz
+GCONF_SITE = http://ftp.gnome.org/pub/gnome/sources/GConf/$(GCONF_MAJOR_VERSION)
+GCONF_DEPENDENCIES = dbus-glib intltool libxml2
+GCONF_INSTALL_STAGING = YES
+GCONF_CONF_OPT += --libexecdir=/usr/lib/GConf --disable-orbit
+
+define GCONF_POST_INSTALL
+	# Gconf needs this empty directory to store it's stuff
+	$(INSTALL) -v -m755 -d $(TARGET_DIR)/etc/gconf/gconf.xml.system
+endef
+
+GCONF_POST_INSTALL_TARGET_HOOKS += GCONF_POST_INSTALL
+
+$(eval $(autotools-package))
+
+
-- 
1.7.7.6
