From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Wed,  5 Sep 2012 17:29:03 +0300
Subject: [Buildroot] [PATCH 8/9] firefox: GNU gnash flash plugin needs gconf
	dependency
In-Reply-To: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1346855344-15081-9-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in       |    1 +
 package/gconf/Config.in |   11 +++++++++++
 package/gconf/gconf.mk  |   26 ++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 package/gconf/Config.in
 create mode 100644 package/gconf/gconf.mk

diff --git a/package/Config.in b/package/Config.in
index 92c957e..fb4ec28 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -510,6 +510,7 @@ endmenu
 menu "Miscellaneous"
 source "package/collectd/Config.in"
 source "package/empty/Config.in"
+source "package/gconf/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
 source "package/shared-mime-info/Config.in"
 source "package/sound-theme-borealis/Config.in"
diff --git a/package/gconf/Config.in b/package/gconf/Config.in
new file mode 100644
index 0000000..770e707
--- /dev/null
+++ b/package/gconf/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_GCONF
+	bool "gconf"
+	select BR2_PACKAGE_INTLTOOL
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_LIBXML2
+	help
+	  The GConf package contains a configuration database system used by many GNOME
+	  applications.
+
+	  http://ftp.gnome.org/pub/gnome/sources/GConf/3.2
+
diff --git a/package/gconf/gconf.mk b/package/gconf/gconf.mk
new file mode 100644
index 0000000..8eefc05
--- /dev/null
+++ b/package/gconf/gconf.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# GConf
+#
+#############################################################
+
+GCONF_VERSION = 3.2.0
+GCONF_SOURCE = GConf-$(GCONF_VERSION).tar.xz
+GCONF_SITE = http://ftp.gnome.org/pub/gnome/sources/GConf/3.2/
+GCONF_DEPENDENCIES = dbus-glib intltool libxml2
+GCONF_INSTALL_STAGING = YES
+GCONF_CONF_OPT += --sysconfdir=/etc --libexecdir=/usr/lib/GConf --disable-orbit
+GCONF_LICENSE = GPLv2
+GCONG_LICENSE_FILE = COPYING
+
+define GCONF_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+
+	(cd $(@D); \
+	install -v -m755 -d $(TARGET_DIR)/etc/gconf/gconf.xml.system)
+
+endef
+
+$(eval $(autotools-package))
+
+
-- 
1.7.7.6
