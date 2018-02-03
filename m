From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Feb 2018 23:23:51 +0100
Subject: [Buildroot] [git commit] network-manager: Add option for
 OpenVSwitch support
Message-ID: <20180203222531.7AA3C88306@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94e830779fb02c0a137d9e04145a6a882b2fe14d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/Config.in          |  6 ++++++
 package/network-manager/network-manager.mk | 10 ++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 37e9b2fd8c..72658c1278 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -56,6 +56,12 @@ config BR2_PACKAGE_NETWORK_MANAGER_PPPD
 comment "pppd support needs a glibc or uClibc toolchain"
 	depends on BR2_TOOLCHAIN_USES_MUSL
 
+config BR2_PACKAGE_NETWORK_MANAGER_OVS
+	bool "OpenVSwitch support"
+	select BR2_PACKAGE_JANSSON
+	help
+	  This option enables support for OpenVSwitch
+
 endif
 
 comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.7, dynamic library"
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index ccf376d0d8..a520aad9c0 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -30,8 +30,7 @@ NETWORK_MANAGER_CONF_OPTS = \
 	--with-crypto=gnutls \
 	--with-iptables=/usr/sbin/iptables \
 	--disable-ifupdown \
-	--disable-ifnet \
-	--disable-ovs
+	--disable-ifnet
 
 ifeq ($(BR2_PACKAGE_OFONO),y)
 NETWORK_MANAGER_DEPENDENCIES += ofono
@@ -76,6 +75,13 @@ ifeq ($(BR2_PACKAGE_DHCPCD),y)
 NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
 endif
 
+ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
+NETWORK_MANAGER_CONF_OPTS += --enable-ovs
+NETWORK_MANAGER_DEPENDENCIES += jansson
+else
+NETWORK_MANAGER_CONF_OPTS += --disable-ovs
+endif
+
 # uClibc by default doesn't have backtrace support, so don't use it
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 NETWORK_MANAGER_CONF_OPTS += --disable-crashtrace
