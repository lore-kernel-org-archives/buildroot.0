From: Michel Alex <Alex.Michel@wiedemann-group.com>
Date: Tue, 4 Feb 2020 08:33:07 +0000
Subject: [Buildroot] [PATCH 1/1] package/network-manager-openvpn: new
 package
In-Reply-To: <87h8073fdt.fsf@dell.be.48ers.dk>
References: <8b51f7b227fd3cef7bc968a0c4f0eebd018d6655.camel@wiedemann-group.com>
 <87h8073fdt.fsf@dell.be.48ers.dk>
Message-ID: <4106e322c7a21137383f4aa10f70f7aa0c8abc65.camel@wiedemann-group.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides OpenVPN plugin for network manager

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>

---
Changes v1 -> v2:
  - add openvpn dependency (suggested by Peter Korsgaard)
  - removed INSTALL_STAGING from network-manager-openvpn.mk (suggested
by Peter Korsgaard)
  - provide component in the main package instead of including it from
the Config.in of the main package (suggested by Peter Korsgaard)
---
 .../network-manager-openvpn.hash              |  4 ++++
 .../network-manager-openvpn.mk                | 22 +++++++++++++++++++
 package/network-manager/Config.in             |  8 +++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/network-manager-openvpn/network-manager-
openvpn.hash
 create mode 100644 package/network-manager-openvpn/network-manager-
openvpn.mk

diff --git a/package/network-manager-openvpn/network-manager-
openvpn.hash b/package/network-manager-openvpn/network-manager-
openvpn.hash
new file mode 100644
index 0000000000..0c52fb8d13
--- /dev/null
+++ b/package/network-manager-openvpn/network-manager-openvpn.hash
@@ -0,0 +1,4 @@
+# From 
https://download.gnome.org/sources/NetworkManager-openvpn/1.8/NetworkManager-openvpn-1.8.10.sha256sum
+sha256
af3cc86ba848d21b4ac807a09d575de11335ba4df8ce6fdb089212e77c2231ef  Netwo
rkManager-openvpn-1.8.10.tar.xz
+# Locally computed
+sha256
c39e345d992dfba62db265f8c6d6ff1d90c61d92876635ae05adbfa2f45fff46  COPYI
NG
diff --git a/package/network-manager-openvpn/network-manager-openvpn.mk 
b/package/network-manager-openvpn/network-manager-openvpn.mk
new file mode 100644
index 0000000000..522cd2413e
--- /dev/null
+++ b/package/network-manager-openvpn/network-manager-openvpn.mk
@@ -0,0 +1,22 @@
+######################################################################
##########
+#
+# network-manager-openvpn
+#
+######################################################################
##########
+
+NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 1.8
+NETWORK_MANAGER_OPENVPN_VERSION =
$(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR).10
+NETWORK_MANAGER_OPENVPN_SOURCE = NetworkManager-openvpn-
$(NETWORK_MANAGER_OPENVPN_VERSION).tar.xz
+NETWORK_MANAGER_OPENVPN_SITE = 
https://download.gnome.org/sources/NetworkManager-openvpn/$(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR
)
+NETWORK_MANAGER_OPENVPN_DEPENDENCIES = network-manager openvpn
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
diff --git a/package/network-manager/Config.in b/package/network-
manager/Config.in
index e6a3f5f04f..a1df4e0431 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -61,6 +61,14 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 	help
 	  This option enables support for OpenVSwitch
 
+config BR2_PACKAGE_NETWORK_MANAGER_OPENVPN
+	bool "OpenVPN support"
+	depends on BR2_PACKAGE_OPENVPN
+	help
+	  This option enables support for OpenVPN
+
+	  https://gitlab.gnome.org/GNOME/NetworkManager-openvpn
+
 endif
 
 comment "NetworkManager needs udev /dev management and a glibc
toolchain w/ headers >= 3.2, dynamic library, wchar, threads"
-- 
2.17.1
