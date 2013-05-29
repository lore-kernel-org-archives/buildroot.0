From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 May 2013 15:41:31 +0200
Subject: [Buildroot] [git commit] network-manager: bump to 0.9.8.0
Message-ID: <20130602212111.E6E5C9A6A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52c7f43fdefbe7b5fe65682e3a9618cf741a6787
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This upstream version (the latest available at the time of this
writing) contains
http://cgit.freedesktop.org/NetworkManager/NetworkManager/commit/?id=6b64e4db2f3c9cfc0e0e240cf0bc58f3b3e90c1f
which fixes a build issue of network-manager against recent kernel
headers.

We also remove our patch against network-manager, because it has been
merged upstream as commit cbf72aeb34a6f1fd1bcd7f78ae88985154dc85af.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../network-manager/network-manager-execinfo.patch |   31 ------------------
 package/network-manager/network-manager.mk         |   33 ++++++++------------
 2 files changed, 13 insertions(+), 51 deletions(-)

diff --git a/package/network-manager/network-manager-execinfo.patch b/package/network-manager/network-manager-execinfo.patch
deleted file mode 100644
index 8dc83f0..0000000
--- a/package/network-manager/network-manager-execinfo.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ff9471b7d83545614100a270e2d85b7b272abe97 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Mon, 2 Jan 2012 14:45:16 +0100
-Subject: [PATCH] [PATCH] only include execinfo.h if crashtrace support is
- enabled
-
-On systems without backtrace suport (E.G. uClibc depending on config),
-execinfo.h might not be available, breaking the build.
-
-Fix it by only including it if enabled.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/logging/nm-logging.c |    1 -
- 1 files changed, 0 insertions(+), 1 deletions(-)
-
-diff --git a/src/logging/nm-logging.c b/src/logging/nm-logging.c
-index ca6a709..26c8670 100644
---- a/src/logging/nm-logging.c
-+++ b/src/logging/nm-logging.c
-@@ -23,7 +23,6 @@
- 
- #include <dlfcn.h>
- #include <syslog.h>
--#include <execinfo.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <unistd.h>
--- 
-1.7.7.1
-
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 261f2d3..9be624c 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,49 +5,42 @@
 #############################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 0.9
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2.0
-NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.bz2
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).8.0
+NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \
 	libgcrypt wireless_tools util-linux host-intltool
 
 NETWORK_MANAGER_CONF_ENV = \
-	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
+	ac_cv_file__etc_fedora_release=no \
+	ac_cv_file__etc_mandriva_release=no \
+	ac_cv_file__etc_debian_version=no \
+	ac_cv_file__etc_redhat_release=no \
+	ac_cv_file__etc_SuSE_release=no
+
 
 NETWORK_MANAGER_CONF_OPT = \
 		--mandir=$(STAGING_DIR)/usr/man/ \
-		--with-dbus-user=dbus \
 		--disable-tests \
 		--disable-more-warnings \
 		--without-docs \
 		--disable-gtk-doc \
-		--disable-asserts \
-		--enable-abstract-sockets \
-		--disable-selinux \
-		--disable-xml-docs \
-		--disable-doxygen-docs \
-		--disable-static \
-		--enable-dnotify \
 		--localstatedir=/var \
 		--with-crypto=gnutls \
-		--with-distro=arch \
 		--disable-ppp \
-		--with-iptables=/usr/sbin/iptables
+		--with-iptables=/usr/sbin/iptables \
+		--disable-ifupdown \
+		--disable-ifnet
 
 # uClibc by default doesn't have backtrace support, so don't use it
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
 NETWORK_MANAGER_CONF_OPT += --disable-crashtrace
 endif
 
-# The target was built for the archlinux distribution, so we need
-# to move around things after installation
-define NETWORK_MANAGER_INSTALL_INITSCRIPT
+define NETWORK_MANAGER_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/network-manager/S45network-manager $(TARGET_DIR)/etc/init.d/S45network-manager
-	rm -f $(TARGET_DIR)/etc/rc.d/networkmanager
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/etc/rc.d
 endef
 
-NETWORK_MANAGER_POST_INSTALL_TARGET_HOOKS += NETWORK_MANAGER_INSTALL_INITSCRIPT
-
 $(eval $(autotools-package))
