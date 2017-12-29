From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 22:31:46 +0100
Subject: [Buildroot] [git commit] hostapd: select VLAN support
Message-ID: <20171229223019.7836B83854@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5c97568c641b26020cc20385b1fbdeb9049842d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add configuration options for hostapd to select which kind
of VLAN support to build.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hostapd/Config.in  | 23 +++++++++++++++++++++++
 package/hostapd/hostapd.mk | 16 +++++++++++++---
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 40c7015..84156e8 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -43,6 +43,29 @@ config BR2_PACKAGE_HOSTAPD_WPS
 	help
 	  Enable support for Wi-Fi Protected Setup.
 
+config BR2_PACKAGE_HOSTAPD_VLAN
+	bool "Enable VLAN support"
+	default y
+	help
+	  Enable support for VLANs.
+
+config BR2_PACKAGE_HOSTAPD_VLAN_DYNAMIC
+	bool "Enable dynamic VLAN support"
+	default y
+	depends on BR2_PACKAGE_HOSTAPD_VLAN
+	help
+	  Enable support for fully dynamic VLANs.
+	  This enables hostapd to automatically create
+	  bridge and VLAN interfaces if necessary.
+
+config BR2_PACKAGE_HOSTAPD_VLAN_NETLINK
+	bool "Use netlink-based API for VLAN operations"
+	default y
+	depends on BR2_PACKAGE_HOSTAPD_VLAN
+	help
+	  Use netlink-based kernel API for VLAN operations
+	  instead of ioctl().
+
 endif
 
 comment "hostapd needs a toolchain w/ threads"
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 0ed1631..1696670 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -18,15 +18,13 @@ HOSTAPD_LICENSE_FILES = README
 HOSTAPD_CONFIG_SET =
 
 HOSTAPD_CONFIG_ENABLE = \
-	CONFIG_FULL_DYNAMIC_VLAN \
 	CONFIG_HS20 \
 	CONFIG_IEEE80211AC \
 	CONFIG_IEEE80211N \
 	CONFIG_IEEE80211R \
 	CONFIG_INTERNAL_LIBTOMMATH \
 	CONFIG_INTERWORKING \
-	CONFIG_LIBNL32 \
-	CONFIG_VLAN_NETLINK
+	CONFIG_LIBNL32
 
 HOSTAPD_CONFIG_DISABLE =
 
@@ -74,6 +72,18 @@ ifeq ($(BR2_PACKAGE_HOSTAPD_WPS),y)
 HOSTAPD_CONFIG_ENABLE += CONFIG_WPS
 endif
 
+ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN),)
+HOSTAPD_CONFIG_ENABLE += CONFIG_NO_VLAN
+endif
+
+ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN_DYNAMIC),y)
+HOSTAPD_CONFIG_ENABLE += CONFIG_FULL_DYNAMIC_VLAN
+endif
+
+ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN_NETLINK),y)
+HOSTAPD_CONFIG_ENABLE += CONFIG_VLAN_NETLINK
+endif
+
 define HOSTAPD_CONFIGURE_CMDS
 	cp $(@D)/hostapd/defconfig $(HOSTAPD_CONFIG)
 	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(HOSTAPD_CONFIG_ENABLE)) \
