From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Aug 2013 13:03:04 +0200
Subject: [Buildroot] [PATCH 5/5] kmod: does not support static builds
In-Reply-To: <1376996584-4462-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1376996584-4462-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1376996584-4462-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since kmod 14, the support for building a static library has been
removed completely from kmod. Therefore, we mark kmod as
!BR2_PREFER_STATIC_LIB, as well as all its reverse dependencies, which
includes the option to use the "udev" /dev management method.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmod/Config.in | 1 +
 package/udev/Config.in | 1 +
 system/Config.in       | 1 +
 3 files changed, 3 insertions(+)

diff --git a/package/kmod/Config.in b/package/kmod/Config.in
index 4965237..bd44316 100644
--- a/package/kmod/Config.in
+++ b/package/kmod/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KMOD
 	bool "kmod"
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  handle kernel modules
 
diff --git a/package/udev/Config.in b/package/udev/Config.in
index dd5ad7b..d4d97c1 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_UDEV
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
+	depends on !BR2_PREFER_STATIC_LIB # kmod
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
diff --git a/system/Config.in b/system/Config.in
index d41f184..55195e0 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -84,6 +84,7 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	bool "Dynamic using udev"
 	depends on BR2_LARGEFILE # udev
 	depends on BR2_USE_WCHAR # udev
+	depends on !BR2_PREFER_STATIC_LIB # udev -> kmod
 	select BR2_PACKAGE_UDEV
 
 comment "udev requires a toolchain with LARGEFILE + WCHAR support"
-- 
1.8.1.2
