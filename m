From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 22:27:39 +0200
Subject: [Buildroot] [git commit] package/network-manager: bump to version
 1.22.10
Message-ID: <20200329201813.9933F890A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=402ad9fe540752b656e2dd564aad0b241833088c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add COPYING.LGPL to license files, disable the "cloud configuration"
tool. It requires libcurl and it is too unlikely to be useful.

The library license is now LGPL-2.1+.

The hash of CONTRIBUTING has changed because it now refers to
LGPL-2.1+ instead of LGPL-2.0+.

The hash of COPYING is changed due to white-space changes, and the
removal of an introduction text:

    Unless a COPYING file in a subdirectory or file-specific license
    headers specify a different license, the following applies to all
    files in this directory and all subdirectories.

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License as
    published by the Free Software Foundation; either version 2 of the
    License, or (at your option) any later version.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
[Thomas:
 - fix hash of CONTRIBUTING
 - expand commit log
 - drop GFDL license information, since documentation is not installed
   on the target]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.hash |  9 +++++----
 package/network-manager/network-manager.mk   | 14 ++++++--------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index ca8b0a2f43..93a9b5017e 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,6 @@
-# From https://download.gnome.org/sources/NetworkManager/1.20/NetworkManager-1.20.4.sha256sum
-sha256 a3d738b7e702d9548b522a5781a5fb75ba69363f468c400ddd885ca65035914c  NetworkManager-1.20.4.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.20/NetworkManager-1.22.10.sha256sum
+sha256 2b29ccc1531ba7ebba95a97f40c22b963838e8b6833745efe8e6fb71fd8fca77  NetworkManager-1.22.10.tar.xz
 # Locally computed
-sha256 49d9659a4f9a09747c320d51d3cf9dfde210de67b70862acf849890f6477b00d  COPYING
-sha256 64a6d38d1b551a1bfd8509e732cdc9202d2681b61f5b39298f488674d3466fc9  CONTRIBUTING
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
+sha256 f0543c137bc0eece552d42642d1bab31707ca3b3663d9c7a81ac3b270a4780e7  CONTRIBUTING
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 56b768cdef..c5749c857c 100644
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
+NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
+NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING
 
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
