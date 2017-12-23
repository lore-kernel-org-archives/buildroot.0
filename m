From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Sat, 23 Dec 2017 22:06:17 +0300
Subject: [Buildroot] [PATCH 4/4] hostapd: drop default netlink dependency
In-Reply-To: <20171223190617.3981-1-alexander.i.mukhin@gmail.com>
References: <20171223190617.3981-1-alexander.i.mukhin@gmail.com>
Message-ID: <20171223190617.3981-5-alexander.i.mukhin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Get rid of netlink and threads dependency if the options selected
allow so.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 package/hostapd/Config.in  | 16 ++++++++++------
 package/hostapd/hostapd.mk | 29 +++++++++++++++++++----------
 2 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 57cec469c6..115563f564 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_HOSTAPD
 	bool "hostapd"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LIBNL
 	help
 	  User space daemon for wireless access points.
 
@@ -23,9 +21,14 @@ config BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
 config BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
 	bool "Enable nl80211 driver"
 	default y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_LIBNL
 	help
 	  Enable support for drivers using the nl80211 kernel interface.
 
+comment "nl80211 driver needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_HOSTAPD_DRIVER_RTW
 	bool "Enable rtl871xdrv driver"
 	help
@@ -83,12 +86,13 @@ config BR2_PACKAGE_HOSTAPD_VLAN_NETLINK
 	bool "Use netlink-based API for VLAN operations"
 	default y
 	depends on BR2_PACKAGE_HOSTAPD_VLAN
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_LIBNL
 	help
 	  Use netlink-based kernel API for VLAN operations
 	  instead of ioctl().
 
-endif
-
-comment "hostapd needs a toolchain w/ threads"
+comment "netlink-based VLAN support needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU
+
+endif
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 143efe9627..9b73c596f8 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -11,8 +11,8 @@ HOSTAPD_PATCH = \
 	http://w1.fi/security/2017-1/rebased-v2.6-0005-Fix-PTK-rekeying-to-generate-a-new-ANonce.patch
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
-HOSTAPD_DEPENDENCIES = host-pkgconf libnl
-HOSTAPD_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
+HOSTAPD_DEPENDENCIES = host-pkgconf
+HOSTAPD_CFLAGS = $(TARGET_CFLAGS)
 HOSTAPD_LICENSE = BSD-3-Clause
 HOSTAPD_LICENSE_FILES = README
 HOSTAPD_CONFIG_SET =
@@ -23,17 +23,11 @@ HOSTAPD_CONFIG_ENABLE = \
 	CONFIG_IEEE80211N \
 	CONFIG_IEEE80211R \
 	CONFIG_INTERNAL_LIBTOMMATH \
-	CONFIG_INTERWORKING \
-	CONFIG_LIBNL32
+	CONFIG_INTERWORKING
 
 HOSTAPD_CONFIG_DISABLE =
 
-# libnl-3 needs -lm (for rint) and -lpthread if linking statically
-# And library order matters hence stick -lnl-3 first since it's appended
-# in the hostapd Makefiles as in LIBS+=-lnl-3 ... thus failing
-ifeq ($(BR2_STATIC_LIBS),y)
-HOSTAPD_LIBS += -lnl-3 -lm -lpthread
-endif
+HOSTAPD_USE_NL =
 
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
@@ -51,6 +45,8 @@ endif
 
 ifneq ($(BR2_PACKAGE_HOSTAPD_DRIVER_NL80211),y)
 HOSTAPD_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
+else
+HOSTAPD_USE_NL = y
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_RTW),y)
@@ -89,9 +85,22 @@ HOSTAPD_CONFIG_ENABLE += CONFIG_FULL_DYNAMIC_VLAN
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN_NETLINK),y)
+HOSTAPD_USE_NL = y
 HOSTAPD_CONFIG_ENABLE += CONFIG_VLAN_NETLINK
 endif
 
+ifeq ($(HOSTAPD_USE_NL),y)
+HOSTAPD_DEPENDENCIES += libnl
+HOSTAPD_CFLAGS += -I$(STAGING_DIR)/usr/include/libnl3/
+HOSTAPD_CONFIG_ENABLE += CONFIG_LIBNL32
+# libnl-3 needs -lm (for rint) and -lpthread if linking statically
+# And library order matters hence stick -lnl-3 first since it's appended
+# in the hostapd Makefiles as in LIBS+=-lnl-3 ... thus failing
+ifeq ($(BR2_STATIC_LIBS),y)
+HOSTAPD_LIBS += -lnl-3 -lm -lpthread
+endif
+endif
+
 define HOSTAPD_CONFIGURE_CMDS
 	cp $(@D)/hostapd/defconfig $(HOSTAPD_CONFIG)
 	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(HOSTAPD_CONFIG_ENABLE)) \
-- 
2.11.0
