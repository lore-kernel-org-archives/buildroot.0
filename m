From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri,  2 Feb 2018 00:45:15 +0100
Subject: [Buildroot] [PATCH v2 1/2] network-manager: Bump to version 1.10.2
Message-ID: <20180201234516.5031-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

handle new dependency to Jansson (since 1.10.0).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* Split patch into two (requested by Thomas).
---
 package/network-manager/network-manager.hash |  4 ++--
 package/network-manager/network-manager.mk   | 11 +++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

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
index caf462e26e..96e5a0b707 100644
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
@@ -75,6 +75,13 @@ ifeq ($(BR2_PACKAGE_DHCPCD),y)
 NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/sbin/dhcpcd
 endif
 
+ifeq ($(BR2_PACKAGE_JANSSON),y)
+NETWORK_MANAGER_CONF_OPTS += --enable-ovs
+NETWORK_MANAGER_DEPENDENCIES += jansson
+else
+NETWORK_MANAGER_CONF_OPTS += --disable-ovs
+endif
+
 # uClibc by default doesn't have backtrace support, so don't use it
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 NETWORK_MANAGER_CONF_OPTS += --disable-crashtrace
-- 
2.16.1
