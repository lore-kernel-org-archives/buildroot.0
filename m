From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 00:16:31 +0200
Subject: [Buildroot] [PATCH 08/12 v8] package/eudev: provides libudev
In-Reply-To: <cover.1468274498.git.yann.morin.1998@free.fr>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <32369f6d41cbf57c3f72bbe428fb422f0358e2b7.1468274498.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/eudev/Config.in | 4 ++++
 package/eudev/eudev.mk  | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index b24ee02..3695143 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_EUDEV
 	depends on BR2_USE_MMU # uses fork() (for daemon) and dlfcn.h (for libudev)
 	depends on BR2_USE_WCHAR # C99
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	select BR2_PACKAGE_HAS_LIBUDEV
 	help
 	  eudev is a fork of systemd-udev with the goal of obtaining better
 	  compatibility with existing software such as OpenRC and Upstart,
@@ -30,6 +31,9 @@ config BR2_PACKAGE_EUDEV
 
 if BR2_PACKAGE_EUDEV
 
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "eudev"
+
 comment "udev daemon needs eudev /dev management"
 	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
 
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index a4c8ebf..27d88f8 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -11,6 +11,8 @@ EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
 
+EUDEV_PROVIDES = libudev
+
 ifeq ($(BR2_PACKAGE_EUDEV_DAEMON),y)
 
 # mq_getattr is in librt
@@ -26,7 +28,7 @@ EUDEV_CONF_OPTS = \
 	--enable-blkid
 
 EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
-EUDEV_PROVIDES = udev
+EUDEV_PROVIDES += udev
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),)
 EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
-- 
2.7.4
