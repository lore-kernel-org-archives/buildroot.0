From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 13:26:45 +0100
Subject: [Buildroot] [git commit] package/network-manager-openvpn: new
 package
Message-ID: <20200204122122.A75698125F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cad258e85bedd40fe60954377b70e87383233c3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides an OpenVPN plugin for network manager.

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
[Peter: add Config.in, DEVELOPERS entry]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 package/network-manager-openvpn/Config.in          |  8 ++++++++
 .../network-manager-openvpn.hash                   |  4 ++++
 .../network-manager-openvpn.mk                     | 22 ++++++++++++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 23116d2341..af03992cc3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -107,6 +107,9 @@ F:	package/libmbim/
 F:	package/libqmi/
 F:	package/modem-manager/
 
+N:	Alex Michel <alex.michel@wiedemann-group.com>
+F:	package/network-manager-openvpn/
+
 N:	Alex Suykov <alex.suykov@gmail.com>
 F:	board/chromebook/snow/
 F:	configs/chromebook_snow_defconfig
diff --git a/package/Config.in b/package/Config.in
index 4bdb84daa9..6f2c278af9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2075,6 +2075,7 @@ menu "Networking applications"
 	source "package/netsnmp/Config.in"
 	source "package/netstat-nat/Config.in"
 	source "package/network-manager/Config.in"
+	source "package/network-manager-openvpn/Config.in"
 	source "package/nfacct/Config.in"
 	source "package/nftables/Config.in"
 	source "package/nginx/Config.in"
diff --git a/package/network-manager-openvpn/Config.in b/package/network-manager-openvpn/Config.in
new file mode 100644
index 0000000000..557145e943
--- /dev/null
+++ b/package/network-manager-openvpn/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_NETWORK_MANAGER_OPENVPN
+	bool "network-manager-openvpn"
+	depends on BR2_PACKAGE_NETWORK_MANAGER
+	depends on BR2_PACKAGE_OPENVPN
+	help
+	  OpenVPN support for NetworkManager
+
+	  https://gitlab.gnome.org/GNOME/NetworkManager-openvpn
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
index 0000000000..1a872dc127
--- /dev/null
+++ b/package/network-manager-openvpn/network-manager-openvpn.mk
@@ -0,0 +1,22 @@
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
+NETWORK_MANAGER_OPENVPN_DEPENDENCIES = network-manager openvpn
+NETWORK_MANAGER_OPENVPN_LICENSE = GPL-2.0+
+NETWORK_MANAGER_OPENVPN_LICENSE_FILES = COPYING
+
+NETWORK_MANAGER_OPENVPN_CONF_OPTS = \
+	--without-gnome
+
+define NETWORK_MANAGER_OPENVPN_USERS
+	nm-openvpn -1 nm-openvpn -1 * - - - Openvpn user
+endef
+
+$(eval $(autotools-package))
