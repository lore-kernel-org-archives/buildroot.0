From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed, 25 Jul 2018 14:37:02 +0200
Subject: [Buildroot] [PATCH 1/2] package/lvm2: bump version to 2.02.180
Message-ID: <20180725123703.12826-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lvm2 starting from version 2.02.178 depends on libaio library.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/lvm2/Config.in | 3 +++
 package/lvm2/lvm2.hash | 4 ++--
 package/lvm2/lvm2.mk   | 6 +++---
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 0dd6d53b4a..5f706982cd 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_LVM2
 	bool "lvm2 & device mapper"
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # needs fork()
 	depends on !BR2_STATIC_LIBS # It fails to build statically
+	select BR2_PACKAGE_LIBAIO
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and
@@ -50,4 +52,5 @@ endif
 
 comment "lvm2 needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index b0dfcfcef3..697a413995 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,5 +1,5 @@
-# From ftp://sources.redhat.com/pub/lvm2/releases/sha512.sum
-sha512 c2ea8beafe006abf9282f51ec98600fd0ebff816d53c10ecbb19bbf336ada4825135cf9c92ccd364afb18f8b1d7e163eff5bdec8dfdd70dfb9ba45db2f6bdd5e  LVM2.2.02.173.tgz
+# From ftp://sources.redhat.com/pub/lvm2/sha512.sum
+sha512 6e0a10ab48be4f0c751447c6ab88b8f9fa1dcd1d703de77966e8507b173df70b1987fa0be252c31dfce9e0ee70e5f439db58c8f534e24144a70f254c091554ee  LVM2.2.02.180.tgz
 # Locally computed sha256 checksums
 sha256 e76fbcd2fb97cf202da330301327754d2db5c58b5b4bebd3a8a749393e7603d1  COPYING
 sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LIB
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 20e0dd0d5c..fd823da846 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.02.173
+LVM2_VERSION = 2.02.180
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
-LVM2_SITE = ftp://sources.redhat.com/pub/lvm2/releases
+LVM2_SITE = ftp://sources.redhat.com/pub/lvm2
 LVM2_INSTALL_STAGING = YES
 LVM2_LICENSE = GPL-2.0, LGPL-2.1
 LVM2_LICENSE_FILES = COPYING COPYING.LIB
@@ -21,7 +21,7 @@ LVM2_CONF_OPTS += \
 	--enable-dmeventd \
 	--disable-nls
 
-LVM2_DEPENDENCIES += host-pkgconf
+LVM2_DEPENDENCIES += host-pkgconf libaio
 
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the toolchain passed at configure time.
-- 
2.18.0
