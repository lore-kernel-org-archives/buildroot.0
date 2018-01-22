From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 22 Jan 2018 16:29:38 +0100
Subject: [Buildroot] [PATCH] package/network-manager: Bump to version 1.10.2
Message-ID: <20180122152938.23956-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+ added new option support for OVS (adds new dependency to Jansson)

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/network-manager/Config.in            |  6 ++++++
 package/network-manager/network-manager.hash |  4 ++--
 package/network-manager/network-manager.mk   | 11 +++++++++--
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 37e9b2fd8c..9a69476571 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -56,6 +56,12 @@ config BR2_PACKAGE_NETWORK_MANAGER_PPPD
 comment "pppd support needs a glibc or uClibc toolchain"
 	depends on BR2_TOOLCHAIN_USES_MUSL
 
+config BR2_PACKAGE_NETWORK_MANAGER_OVS
+	bool "ovs support"
+	select BR2_PACKAGE_JANSSON
+	help
+	  This option enables support for OVS
+
 endif
 
 comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.7, dynamic library"
diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 3262ad3b00..8fedc64729 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.8/NetworkManager-1.8.4.sha256sum
-sha256 625e2eb36386dcae599075226200140d010f213b47f7202d83b3b1a202029212  NetworkManager-1.8.4.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.10/NetworkManager-1.10.2.sha256sum
+sha256 169c34f50770e3c96b431f7d2cff654455246f2e6ccd46eccfb4454d4595625b  NetworkManager-1.10.2.tar.xz
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index caf462e26e..885db3277b 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.8
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
+NETWORK_MANAGER_VERSION_MAJOR = 1.10
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
@@ -80,6 +80,13 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 NETWORK_MANAGER_CONF_OPTS += --disable-crashtrace
 endif
 
+ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
+NETWORK_MANAGER_DEPENDENCIES += jansson
+NETWORK_MANAGER_CONF_OPTS += --enable-ovs
+else
+NETWORK_MANAGER_CONF_OPTS += --disable-ovs
+endif
+
 define NETWORK_MANAGER_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/network-manager/S45network-manager $(TARGET_DIR)/etc/init.d/S45network-manager
 endef
-- 
2.15.1
