From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Oct 2014 13:46:13 -0700
Subject: [Buildroot] [PATCH 05/15 v6] package/eudev: bump to 1.10
In-Reply-To: <cover.1414442699.git.yann.morin.1998@free.fr>
References: <cover.1414442699.git.yann.morin.1998@free.fr>
Message-ID: <a60b93d041af1e32c5c8f49b0c4e4f69f6736e98.1414442699.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now requires Linux kernel headers >= 3.9.
Also point to a better homepage.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/eudev/Config.in | 14 ++++++++------
 package/eudev/eudev.mk  |  2 +-
 system/Config.in        |  6 ++++--
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index fa28a9f..a2d804b 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_EUDEV
 	bool "eudev"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
 	depends on !BR2_avr32 # no epoll_create1
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 	depends on BR2_USE_MMU # uses fork()
@@ -15,10 +16,10 @@ config BR2_PACKAGE_EUDEV
 	  Userspace device daemon. This is a standalone version,
 	  independent of systemd. It is a fork maintained by Gentoo.
 
-	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
+	  eudev requires a Linux kernel >= 3.9: it relies on devtmpfs
 	  and inotify.
 
-	  http://dev.gentoo.org/~blueness/eudev
+	  http://www.gentoo.org/proj/en/eudev/
 
 if BR2_PACKAGE_EUDEV
 
@@ -33,14 +34,15 @@ config BR2_PACKAGE_EUDEV_RULES_GEN
 	help
 	  Enable persistent rules generator
 
-endif
-
 comment "eudev needs eudev /dev management"
 	depends on !BR2_avr32
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
index 3a0d0e4..1c39faf 100644
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
index 2465f79..b39ec88 100644
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
