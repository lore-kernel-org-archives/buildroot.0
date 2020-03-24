From: Lubomir Rintel <lkundrak@v3.sk>
Date: Tue, 24 Mar 2020 15:29:49 +0100
Subject: [Buildroot] [PATCH] package/network-manager: bump to version 1.22.10
Message-ID: <20200324142949.287911-1-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add separated license files, disable the "cloud configuration" tool. It
requires libcurl and it is too unlikely to be useful.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
Cc-ing Antonio, he's a NetworkManager developer with prior Buildroot
experience.

 package/network-manager/network-manager.hash |  8 +++++---
 package/network-manager/network-manager.mk   | 14 ++++++--------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index ca8b0a2f43..01f06c52b7 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,7 @@
-# From https://download.gnome.org/sources/NetworkManager/1.20/NetworkManager-1.20.4.sha256sum
-sha256 a3d738b7e702d9548b522a5781a5fb75ba69363f468c400ddd885ca65035914c  NetworkManager-1.20.4.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.20/NetworkManager-1.22.10.sha256sum
+sha256 2b29ccc1531ba7ebba95a97f40c22b963838e8b6833745efe8e6fb71fd8fca77  NetworkManager-1.22.10.tar.xz
 # Locally computed
-sha256 49d9659a4f9a09747c320d51d3cf9dfde210de67b70862acf849890f6477b00d  COPYING
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256 d054d9104adacf508dcfec7cd139cd58070e845215b09c1801c3dbb0e1f0c375  COPYING.GFDL
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256 64a6d38d1b551a1bfd8509e732cdc9202d2681b61f5b39298f488674d3466fc9  CONTRIBUTING
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 56b768cdef..f9f3a69a23 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,18 +4,15 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.20
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
+NETWORK_MANAGER_VERSION_MAJOR = 1.22
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).10
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
 	libgcrypt wireless_tools util-linux host-intltool readline libndp
-# Even though the COPYING file only contains the GPL-2.0 text, many
-# parts of network-manager are under LGPL-2.0. See the "Legal" section
-# of the CONTRIBUTING file for details.
-NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.0+ (libnm)
-NETWORK_MANAGER_LICENSE_FILES = COPYING CONTRIBUTING
+NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.0+ (libnm), GFDL-1.3 (docs)
+NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.GFDL COPYING.LGPL CONTRIBUTING
 
 NETWORK_MANAGER_CONF_ENV = \
 	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
@@ -31,7 +28,8 @@ NETWORK_MANAGER_CONF_OPTS = \
 	--disable-more-warnings \
 	--with-crypto=gnutls \
 	--with-iptables=/usr/sbin/iptables \
-	--disable-ifupdown
+	--disable-ifupdown \
+	--without-nm-cloud-setup
 
 ifeq ($(BR2_PACKAGE_OFONO),y)
 NETWORK_MANAGER_DEPENDENCIES += ofono
-- 
2.26.0.rc2
