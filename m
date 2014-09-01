From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2014 15:38:17 +0200
Subject: [Buildroot] [PATCH 05/15 v5] package/eudev: bump to 1.10
In-Reply-To: <cover.1409578332.git.yann.morin.1998@free.fr>
References: <cover.1409578332.git.yann.morin.1998@free.fr>
Message-ID: <c609d379d02a9d21286707a654b296687b28cd00.1409578332.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now requires Linux kernel headers >= 3.9.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/eudev/Config.in | 8 ++++++--
 package/eudev/eudev.mk  | 2 +-
 system/Config.in        | 6 ++++--
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index fa28a9f..7aaa540 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_EUDEV
 	bool "eudev"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 	depends on !BR2_avr32 # no epoll_create1
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_USE_MMU # uses fork()
@@ -40,7 +41,10 @@ comment "eudev needs eudev /dev management"
 	depends on BR2_USE_MMU
 	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 
-comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
+endif # BR2_PACKAGE_EUDEV
+
+comment "eudev needs a toolchain w/ largefile, wchar, dynamic library, headers >= 3.9"
 	depends on !BR2_avr32
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 1cb6b26..811d72b 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 1.9
+EUDEV_VERSION = 1.10
 EUDEV_SOURCE = eudev-$(EUDEV_VERSION).tar.gz
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
diff --git a/system/Config.in b/system/Config.in
index e7e146a..d5389d0 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -124,6 +124,7 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
 
 config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	bool "Dynamic using eudev"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9 # eudev
 	depends on !BR2_avr32 # eudev
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
@@ -131,10 +132,11 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_USE_MMU # eudev
 	select BR2_PACKAGE_EUDEV
 
-comment "eudev needs a toolchain w/ largefile, wchar, dynamic library"
+comment "eudev needs a toolchain w/ largefile, wchar, dynamic library, headers >= 3.9"
 	depends on !BR2_avr32 # eudev
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 
 endchoice
 
-- 
1.9.1
