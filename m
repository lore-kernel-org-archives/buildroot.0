From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Nov 2020 16:06:18 +0100
Subject: [Buildroot] [PATCH 1/2] package/util-linux: select
 BR2_PACKAGE_UTIL_LINUX_LIBS
Message-ID: <20201101150619.1709959-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When util-linux is enabled, select BR2_PACKAGE_UTIL_LINUX_LIBS as
suggested by Yann E. Morin in
https://patchwork.ozlabs.org/project/buildroot/patch/20201101121536.1089498-1-fontaine.fabrice at gmail.com/

As a result, drop BR2_PACKAGE_UTIL_LINUX_LIBS workaround from libglib2
and drop select of BR2_PACKAGE_UTIL_LINUX_LIBS from eudev and systemd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/eudev/Config.in      | 1 -
 package/libglib2/libglib2.mk | 4 ----
 package/systemd/Config.in    | 1 -
 package/util-linux/Config.in | 1 +
 4 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 0e5bd0cee9..b0ce76171a 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_EUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_UDEV_GENTOO_SCRIPTS if BR2_INIT_OPENRC
 	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
 	help
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 6e9dbd7b26..43fcb27fae 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -86,12 +86,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
 LIBGLIB2_CONF_OPTS += -Dlibmount=enabled
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS),y)
 LIBGLIB2_DEPENDENCIES += util-linux-libs
 else
-LIBGLIB2_DEPENDENCIES += util-linux
-endif
-else
 LIBGLIB2_CONF_OPTS += -Dlibmount=disabled
 endif
 
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index ec34478e3d..9188876d49 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -29,7 +29,6 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_DBUS # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_AGETTY
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 1f33eb5514..cee4649f67 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -1,5 +1,6 @@
 menuconfig BR2_PACKAGE_UTIL_LINUX
 	bool "util-linux"
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	help
 	  Various useful/essential linux libraries and utilities.
 
-- 
2.28.0
