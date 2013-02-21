From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 21 Feb 2013 21:22:14 +0200
Subject: [Buildroot] [PATCH] new package: network-manager-applet
Message-ID: <1361474534-6070-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GTK+ applet for NetworkManager

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---

 package/Config.in                                  |    1 +
 package/network-manager-applet/Config.in           |   13 +++++++++
 .../network-manager-applet.mk                      |   28 ++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 package/network-manager-applet/Config.in
 create mode 100644 package/network-manager-applet/network-manager-applet.mk

diff --git a/package/Config.in b/package/Config.in
index 55c99bb..266f487 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -678,6 +678,7 @@ source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
 source "package/network-manager/Config.in"
+source "package/network-manager-applet/Config.in"
 source "package/nfacct/Config.in"
 source "package/noip/Config.in"
 source "package/ngircd/Config.in"
diff --git a/package/network-manager-applet/Config.in b/package/network-manager-applet/Config.in
new file mode 100644
index 0000000..03cf0e7
--- /dev/null
+++ b/package/network-manager-applet/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_NETWORK_MANAGER_APPLET
+	bool "network-manager-applet"
+	depends on BR2_PACKAGE_NETWORK_MANAGER
+	depends on BR2_PACKAGE_ISO_CODES
+	select BR2_PACKAGE_LIBTASN1
+	select BR2_PACKAGE_GNOME_KEYRING
+	select BR2_PACKAGE_NOTIFICATION_DAEMON
+	select BR2_PACKAGE_CONSOLEKIT
+	help
+	  GTK+ applet for NetworkManager
+
+	  http://projects.gnome.org/NetworkManager/
+
diff --git a/package/network-manager-applet/network-manager-applet.mk b/package/network-manager-applet/network-manager-applet.mk
new file mode 100644
index 0000000..51834b5
--- /dev/null
+++ b/package/network-manager-applet/network-manager-applet.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# network-manager-applet
+#
+#############################################################
+
+NETWORK_MANAGER_APPLET_VERSION = 0.9.2.0
+NETWORK_MANAGER_APPLET_SOURCE = network-manager-applet-$(NETWORK_MANAGER_APPLET_VERSION).tar.xz
+NETWORK_MANAGER_APPLET_SITE = http://ftp.gnome.org/pub/GNOME/sources/network-manager-applet/0.9/
+NETWORK_MANAGER_APPLET_INSTALL_STAGING = YES
+NETWORK_MANAGER_APPLET_DEPENDENCIES = network-manager iso-codes libtasn1 \
+				     gnome-keyring notification-daemon \
+				     consolekit
+NETWORK_MANAGER_APPLET_CONF_OPT += --disable-more-warnings \
+				   --localstatedir=/var --enable-migration \
+				   --with-gtkver=2
+NETWORK_MANAGER_APPLET_AUTORECONF = YES
+
+define	NETWORK_MANAGER_APPLET_FIXUP
+	# This file adds that annoying -Werror even if told *no*. Kick it out
+	rm -f $(@D)/m4/compiler_warnings.m4
+endef
+
+NETWORK_MANAGER_APPLET_PRE_CONFIGURE_HOOKS += NETWORK_MANAGER_APPLET_FIXUP
+
+$(eval $(autotools-package))
+
+
-- 
1.7.7.6
