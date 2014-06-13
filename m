From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 13 Jun 2014 10:31:29 +0200
Subject: [Buildroot] [PATCH 1/2] network-manager: bump to 0.9.9.95
Message-ID: <1402648290-9967-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

The patch fixes compilation error and is already upstreamed.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/network-manager/Config.in                  |  2 ++
 ...01-nm-dispatcher-explicitly-add-gio-gio.h.patch | 28 ++++++++++++++++++++++
 package/network-manager/network-manager.mk         |  4 ++--
 3 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 package/network-manager/network-manager-0001-nm-dispatcher-explicitly-add-gio-gio.h.patch

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 08ebb72..4503f3a 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -16,6 +16,8 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_WIRELESS_TOOLS
 	select BR2_PACKAGE_WIRELESS_TOOLS_LIB
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_LIBNDP
 	help
 	  NetworkManager is a set of co-operative tools that make networking
 	  simple and straightforward. Whether WiFi, wired, 3G, or Bluetooth,
diff --git a/package/network-manager/network-manager-0001-nm-dispatcher-explicitly-add-gio-gio.h.patch b/package/network-manager/network-manager-0001-nm-dispatcher-explicitly-add-gio-gio.h.patch
new file mode 100644
index 0000000..94ab7c2
--- /dev/null
+++ b/package/network-manager/network-manager-0001-nm-dispatcher-explicitly-add-gio-gio.h.patch
@@ -0,0 +1,28 @@
+From c1bc880ec9708d6de9ae3fc42d77874279ab87b6 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 11 Jun 2014 12:01:53 +0200
+Subject: [PATCH] nm-dispatcher: explicitly add gio/gio.h
+
+Without this header Buildroot's build complains about unknown
+types like GFile etc.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/nm-dispatcher.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/src/nm-dispatcher.c b/src/nm-dispatcher.c
+index 7a0c8de..336b91f 100644
+--- a/src/nm-dispatcher.c
++++ b/src/nm-dispatcher.c
+@@ -20,6 +20,7 @@
+  */
+ 
+ #include <glib.h>
++#include <gio/gio.h>
+ #include <string.h>
+ 
+ #include "nm-dispatcher.h"
+-- 
+1.7.7
+
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 55116e6..47c91d5 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,12 +5,12 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 0.9
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).8.10
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).9.95
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \
-	libgcrypt wireless_tools util-linux host-intltool
+	libgcrypt wireless_tools util-linux host-intltool readline libndp
 
 NETWORK_MANAGER_CONF_ENV = \
 	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
-- 
1.8.1.2
