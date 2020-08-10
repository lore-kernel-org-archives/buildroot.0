From: Michael Nosthoff <buildroot@heine.tech>
Date: Mon, 10 Aug 2020 12:39:22 +0200
Subject: [Buildroot] [PATCH] package/networkd-dispatcher: new package
Message-ID: <20200810103921.828138-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Networkd-dispatcher is a dispatcher daemon for systemd-networkd
connection status changes. This daemon is similar to
NetworkManager-dispatcher, but is much more limited in the types of
events it supports due to the limited nature of systemd-networkd.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 DEVELOPERS                                    |  3 +++
 package/Config.in                             |  1 +
 package/networkd-dispatcher/Config.in         | 21 ++++++++++++++++
 .../networkd-dispatcher.mk                    | 25 +++++++++++++++++++
 4 files changed, 50 insertions(+)
 create mode 100644 package/networkd-dispatcher/Config.in
 create mode 100644 package/networkd-dispatcher/networkd-dispatcher.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ee840dbb8b..afe0d507be 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1824,6 +1824,9 @@ N:	Michael Fischer <mf@go-sys.de>
 F:	package/gnuplot/
 F:	package/sdl2/
 
+N:  Michael Nosthoff <buildroot@heine.tech>
+F:  package/networkd-dispatcher/
+
 N:	Michael Rommel <rommel@layer-7.net>
 F:	package/knock/
 F:	package/python-crc16/
diff --git a/package/Config.in b/package/Config.in
index d7e79f4795..c637b5427f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2130,6 +2130,7 @@ menu "Networking applications"
 	source "package/netstat-nat/Config.in"
 	source "package/network-manager/Config.in"
 	source "package/network-manager-openvpn/Config.in"
+	source "package/networkd-dispatcher/Config.in"
 	source "package/nfacct/Config.in"
 	source "package/nftables/Config.in"
 	source "package/nginx/Config.in"
diff --git a/package/networkd-dispatcher/Config.in b/package/networkd-dispatcher/Config.in
new file mode 100644
index 0000000000..3a5b80d534
--- /dev/null
+++ b/package/networkd-dispatcher/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_NETWORKD_DISPATCHER
+	bool "networkd-dispatcher"
+	depends on BR2_USE_MMU # python-gobject
+	depends on BR2_USE_WCHAR # dbus-python
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python
+	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject
+	depends on BR2_PACKAGE_DBUS # dbus-python
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS # python-gobject
+	depends on BR2_PACKAGE_PYTHON3 # runtime
+	depends on BR2_PACKAGE_SYSTEMD_NETWORKD # runtime
+	select BR2_PACKAGE_DBUS_PYTHON
+	select BR2_PACKAGE_PYTHON_GOBJECT
+	help
+	  Networkd-dispatcher is a dispatcher daemon for
+	  systemd-networkd connection status changes.
+	  This daemon is similar to NetworkManager-dispatcher,
+	  but is much more limited in the types of events it
+	  supports due to the limited nature of systemd-networkd.
+
+	  https://gitlab.com/craftyguy/networkd-dispatcher
diff --git a/package/networkd-dispatcher/networkd-dispatcher.mk b/package/networkd-dispatcher/networkd-dispatcher.mk
new file mode 100644
index 0000000000..b3ca91b099
--- /dev/null
+++ b/package/networkd-dispatcher/networkd-dispatcher.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# networkd-dispatcher
+#
+################################################################################
+
+NETWORKD_DISPATCHER_VERSION = 2.0.1
+NETWORKD_DISPATCHER_SOURCE = networkd-dispatcher-$(NETWORKD_DISPATCHER_VERSION).tar.bz2
+NETWORKD_DISPATCHER_SITE = https://gitlab.com/craftyguy/networkd-dispatcher/-/archive/$(NETWORKD_DISPATCHER_VERSION)
+NETWORKD_DISPATCHER_LICENSE = GPL-3.0
+NETWORKD_DISPATCHER_LICENSE_FILES = LICENSE
+
+define NETWORKD_DISPATCHER_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/networkd-dispatcher $(TARGET_DIR)/usr/bin/networkd-dispatcher
+	mkdir -p $(TARGET_DIR)/etc/networkd-dispatcher/{routable,dormant,no-carrier,off,carrier,degraded,configuring,configured}.d
+endef
+
+define NETWORKD_DISPATCHER_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/networkd-dispatcher.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/networkd-dispatcher.service
+	$(INSTALL) -D -m 0644 $(@D)/networkd-dispatcher.conf \
+		$(TARGET_DIR)/etc/conf.d/networkd-dispatcher.conf
+endef
+
+$(eval $(generic-package))
-- 
2.25.1
