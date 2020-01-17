From: Michel Alex <Alex.Michel@wiedemann-group.com>
Date: Fri, 17 Jan 2020 07:46:25 +0000
Subject: [Buildroot] [PATCH 1/1] package/network-manager-openvpn: new package
Message-ID: <8b51f7b227fd3cef7bc968a0c4f0eebd018d6655.camel@wiedemann-group.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alex Michel <alex.michel@wiedemann-group.com>

This package provides OpenVPN plugin for network manager

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/network-manager-openvpn/Config.in     |  5 ++++
 .../network-manager-openvpn.hash              |  4 ++++
 .../network-manager-openvpn.mk                | 23 +++++++++++++++++++
 package/network-manager/Config.in             |  3 +++
 4 files changed, 35 insertions(+)
 create mode 100644 package/network-manager-openvpn/Config.in
 create mode 100644 package/network-manager-openvpn/network-manager-openvpn.hash
 create mode 100644 package/network-manager-openvpn/network-manager-openvpn.mk

diff --git a/package/network-manager-openvpn/Config.in b/package/network-manager-openvpn/Config.in
new file mode 100644
index 0000000000..8f13d78d48
--- /dev/null
+++ b/package/network-manager-openvpn/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_NETWORK_MANAGER_OPENVPN
+	bool "OpenVPN support"
+	depends on BR2_PACKAGE_NETWORK_MANAGER
+	help
+	  This option enables OpenVPN plugin
diff --git a/package/network-manager-openvpn/network-manager-openvpn.hash b/package/network-manager-openvpn/network-manager-openvpn.hash
new file mode 100644
index 0000000000..0c52fb8d13
--- /dev/null
+++ b/package/network-manager-openvpn/network-manager-openvpn.hash
@@ -0,0 +1,4 @@
+# From https://download.gnome.org/sources/NetworkManager-openvpn/1.8/NetworkManager-openvpn-1.8.10.sha256sum
+sha256 af3cc86ba848d21b4ac807a09d575de11335ba4df8ce6fdb089212e77c2231ef  NetworkManager-openvpn-1.8.10.tar.xz
+# Locally computed
+sha256 c39e345d992dfba62db265f8c6d6ff1d90c61d92876635ae05adbfa2f45fff46  COPYING
diff --git a/package/network-manager-openvpn/network-manager-openvpn.mk b/package/network-manager-openvpn/network-manager-openvpn.mk
new file mode 100644
index 0000000000..d5dd9be409
--- /dev/null
+++ b/package/network-manager-openvpn/network-manager-openvpn.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# network-manager-openvpn
+#
+################################################################################
+
+NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 1.8
+NETWORK_MANAGER_OPENVPN_VERSION = $(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR).10
+NETWORK_MANAGER_OPENVPN_SOURCE = NetworkManager-openvpn-$(NETWORK_MANAGER_OPENVPN_VERSION).tar.xz
+NETWORK_MANAGER_OPENVPN_SITE = https://download.gnome.org/sources/NetworkManager-openvpn/$(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR)
+NETWORK_MANAGER_OPENVPN_INSTALL_STAGING = YES
+NETWORK_MANAGER_OPENVPN_DEPENDENCIES = network-manager
+NETWORK_MANAGER_OPENVPN_LICENSE = GPL-2.0+
+NETWORK_MANAGER_OPENVPN_LICENSE_FILES = COPYING
+
+NETWORK_MANAGER_OPENVPN_CONF_OPTS = \
+	--without-gnome
+
+define NETWORK_MANAGER_OPENVPN_USERS
+      nm-openvpn -1 nm-openvpn -1 * - - - Openvpn user
+endef
+
+$(eval $(autotools-package))
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index e6a3f5f04f..932463faa3 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -61,6 +61,9 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 	help
 	  This option enables support for OpenVSwitch
 
+# source the OpenVPN plugin
+	source "package/network-manager-openvpn/Config.in"
+
 endif
 
 comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library, wchar, threads"
-- 
2.17.1
