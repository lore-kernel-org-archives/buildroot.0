From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 26 Jul 2018 19:15:24 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/lvm2: bump version to 2.02.180
In-Reply-To: <20180726171524.479-1-m.niestroj@grinn-global.com>
References: <20180726171524.479-1-m.niestroj@grinn-global.com>
Message-ID: <20180726171524.479-2-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lvm2 starting from version 2.02.178 depends on libaio library.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
Changes v2 -> v3:
 * Add missing libaio dependency in luksmeta (suggested by Baruch)

Changes v1 -> v2:
 * Add libaio dependencies for all packages that select lvm2
   (suggested by Baruch)
 * Adjust lvm2 patch in 'PATCH 1/2' to new lvm2 version

 package/cryptsetup/Config.in                  |  2 +
 package/dmraid/Config.in                      |  2 +
 package/docker-engine/Config.in               |  1 +
 package/luksmeta/Config.in                    |  2 +
 ...gure-Introduce-enable-symvers-option.patch | 55 ++++++++++---------
 package/lvm2/Config.in                        |  3 +
 package/lvm2/lvm2.hash                        |  4 +-
 package/lvm2/lvm2.mk                          |  6 +-
 package/udisks/Config.in                      |  3 +
 9 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index 7322a4baf6..e4500b1cf2 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CRYPTSETUP
 	bool "cryptsetup"
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS # lvm2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
@@ -17,5 +18,6 @@ config BR2_PACKAGE_CRYPTSETUP
 
 comment "cryptsetup needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index aa98c853a1..ffa75a7084 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DMRAID
 	bool "dmraid"
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS # lvm2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
@@ -14,4 +15,5 @@ config BR2_PACKAGE_DMRAID
 
 comment "dmraid needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 8feb11b48c..1f417d1c53 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -44,6 +44,7 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
 
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
 	bool "devicemapper filesystem driver"
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS # lvm2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
diff --git a/package/luksmeta/Config.in b/package/luksmeta/Config.in
index ddc9b6f3bf..373d5f7517 100644
--- a/package/luksmeta/Config.in
+++ b/package/luksmeta/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LUKSMETA
 	bool "luksmeta"
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS # cryptsetup -> lvm2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup -> lvm2
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
 	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
@@ -13,5 +14,6 @@ config BR2_PACKAGE_LUKSMETA
 
 comment "luksmeta needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lvm2/0001-configure-Introduce-enable-symvers-option.patch b/package/lvm2/0001-configure-Introduce-enable-symvers-option.patch
index 8ca39c2cab..7ef153313c 100644
--- a/package/lvm2/0001-configure-Introduce-enable-symvers-option.patch
+++ b/package/lvm2/0001-configure-Introduce-enable-symvers-option.patch
@@ -1,4 +1,4 @@
-From f563334a76e31442f7b8693d2d350e6981c51c46 Mon Sep 17 00:00:00 2001
+From 94d71c49eb1682a73465eb162b0a059561168bb2 Mon Sep 17 00:00:00 2001
 From: Marcin Niestroj <m.niestroj@grinn-global.com>
 Date: Fri, 20 Jul 2018 14:26:44 +0200
 Subject: [PATCH] configure: Introduce --enable-symvers option
@@ -27,7 +27,7 @@ library.
 Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
 ---
  configure                 | 32 ++++++++++++++++++++++++++++++--
- configure.in              | 28 +++++++++++++++++++++++++---
+ configure.ac              | 28 +++++++++++++++++++++++++---
  include/configure.h.in    |  3 +++
  lib/misc/lib.h            | 10 +++++-----
  libdm/datastruct/bitset.c |  5 +----
@@ -37,10 +37,10 @@ Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
  8 files changed, 67 insertions(+), 17 deletions(-)
 
 diff --git a/configure b/configure
-index e1ae0e884..c5d11c1b6 100755
+index 7d945dfa8..94cd6b1ea 100755
 --- a/configure
 +++ b/configure
-@@ -985,6 +985,7 @@ enable_fsadm
+@@ -975,6 +975,7 @@ enable_fsadm
  enable_blkdeactivate
  enable_dmeventd
  enable_selinux
@@ -48,7 +48,7 @@ index e1ae0e884..c5d11c1b6 100755
  enable_nls
  with_localedir
  with_confdir
-@@ -1729,6 +1730,9 @@ Optional Features:
+@@ -1725,6 +1726,9 @@ Optional Features:
    --disable-blkdeactivate disable blkdeactivate
    --enable-dmeventd       enable the device-mapper event daemon
    --disable-selinux       disable selinux support
@@ -58,15 +58,15 @@ index e1ae0e884..c5d11c1b6 100755
    --enable-nls            enable Native Language Support
  
  Optional Packages:
-@@ -3169,7 +3173,6 @@ if test -z "$CFLAGS"; then :
+@@ -3156,7 +3160,6 @@ if test -z "$CFLAGS"; then :
  fi
  case "$host_os" in
  	linux*)
 -		CLDFLAGS="$CLDFLAGS -Wl,--version-script,.export.sym"
+ 		# equivalent to -rdynamic
  		ELDFLAGS="-Wl,--export-dynamic"
  		# FIXME Generate list and use --dynamic-list=.dlopen.sym
- 		CLDWHOLEARCHIVE="-Wl,-whole-archive"
-@@ -3190,7 +3193,6 @@ case "$host_os" in
+@@ -3178,7 +3181,6 @@ case "$host_os" in
  		;;
  	darwin*)
  		CFLAGS="$CFLAGS -no-cpp-precomp -fno-common"
@@ -74,7 +74,7 @@ index e1ae0e884..c5d11c1b6 100755
  		ELDFLAGS=
  		CLDWHOLEARCHIVE="-all_load"
  		CLDNOWHOLEARCHIVE=
-@@ -14609,6 +14611,32 @@ done
+@@ -14401,6 +14403,32 @@ done
  	LIBS=$lvm_saved_libs
  fi
  
@@ -107,15 +107,16 @@ index e1ae0e884..c5d11c1b6 100755
  ################################################################################
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether to enable internationalisation" >&5
  $as_echo_n "checking whether to enable internationalisation... " >&6; }
-diff --git a/configure.in b/configure.in
-index 2e5e015c8..09c390850 100644
---- a/configure.in
-+++ b/configure.in
-@@ -30,12 +30,10 @@ AC_CANONICAL_TARGET([])
+diff --git a/configure.ac b/configure.ac
+index e427708cd..2e8712f92 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -30,13 +30,11 @@ AC_CANONICAL_TARGET([])
  AS_IF([test -z "$CFLAGS"], [COPTIMISE_FLAG="-O2"])
  case "$host_os" in
  	linux*)
 -		CLDFLAGS="$CLDFLAGS -Wl,--version-script,.export.sym"
+ 		# equivalent to -rdynamic
  		ELDFLAGS="-Wl,--export-dynamic"
  		# FIXME Generate list and use --dynamic-list=.dlopen.sym
  		CLDWHOLEARCHIVE="-Wl,-whole-archive"
@@ -124,7 +125,7 @@ index 2e5e015c8..09c390850 100644
  		LIB_SUFFIX=so
  		DEVMAPPER=yes
  		BUILD_LVMETAD=no
-@@ -51,7 +49,6 @@ case "$host_os" in
+@@ -52,7 +50,6 @@ case "$host_os" in
  		;;
  	darwin*)
  		CFLAGS="$CFLAGS -no-cpp-precomp -fno-common"
@@ -132,7 +133,7 @@ index 2e5e015c8..09c390850 100644
  		ELDFLAGS=
  		CLDWHOLEARCHIVE="-all_load"
  		CLDNOWHOLEARCHIVE=
-@@ -1742,6 +1739,31 @@ package as well (which may be called readline-devel or something similar).])
+@@ -1656,6 +1653,31 @@ package as well (which may be called readline-devel or something similar).])
  	LIBS=$lvm_saved_libs
  fi
  
@@ -165,10 +166,10 @@ index 2e5e015c8..09c390850 100644
  dnl -- Internationalisation stuff
  AC_MSG_CHECKING(whether to enable internationalisation)
 diff --git a/include/configure.h.in b/include/configure.h.in
-index 51726506c..3fc181b1e 100644
+index 15fd150ed..7a07a10ef 100644
 --- a/include/configure.h.in
 +++ b/include/configure.h.in
-@@ -151,6 +151,9 @@
+@@ -147,6 +147,9 @@
  /* Path to fsadm binary. */
  #undef FSADM_PATH
  
@@ -179,10 +180,10 @@ index 51726506c..3fc181b1e 100644
  #undef HAVE_ALARM
  
 diff --git a/lib/misc/lib.h b/lib/misc/lib.h
-index 8ed06f81d..9b3ce8a03 100644
+index d7fa5c721..7cf98f932 100644
 --- a/lib/misc/lib.h
 +++ b/lib/misc/lib.h
-@@ -42,16 +42,16 @@
+@@ -41,16 +41,16 @@
   * macro DM_EXPORT_SYMBOL to export the function and bind it to the
   * specified version string.
   *
@@ -203,7 +204,7 @@ index 8ed06f81d..9b3ce8a03 100644
   *   // Backward compatible dm_foo() version 1.02.104
   *   int dm_foo_v1_02_104(void);
   *   int dm_foo_v1_02_104(void)
-@@ -68,7 +68,7 @@
+@@ -67,7 +67,7 @@
   * versions of library symbols prior to the introduction of symbol
   * versioning: it must never be used for new symbols.
   */
@@ -234,10 +235,10 @@ index b0826e1eb..2ec3f8f84 100644
 -
  #endif
 diff --git a/libdm/ioctl/libdm-iface.c b/libdm/ioctl/libdm-iface.c
-index c47e08467..b98afb15d 100644
+index 769b69c1b..28e2eadee 100644
 --- a/libdm/ioctl/libdm-iface.c
 +++ b/libdm/ioctl/libdm-iface.c
-@@ -2137,7 +2137,7 @@ void dm_lib_exit(void)
+@@ -2145,7 +2145,7 @@ void dm_lib_exit(void)
  	_version_checked = 0;
  }
  
@@ -247,10 +248,10 @@ index c47e08467..b98afb15d 100644
   * Maintain binary backward compatibility.
   * Version script mechanism works with 'gcc' compatible compilers only.
 diff --git a/libdm/libdm-deptree.c b/libdm/libdm-deptree.c
-index cf4fd62e7..474871da5 100644
+index ab0545659..00651c0b2 100644
 --- a/libdm/libdm-deptree.c
 +++ b/libdm/libdm-deptree.c
-@@ -4110,7 +4110,7 @@ void dm_tree_node_set_callback(struct dm_tree_node *dnode,
+@@ -3797,7 +3797,7 @@ void dm_tree_node_set_callback(struct dm_tree_node *dnode,
  	dnode->callback_data = data;
  }
  
@@ -260,10 +261,10 @@ index cf4fd62e7..474871da5 100644
   * Backward compatible implementations.
   *
 diff --git a/libdm/libdm-stats.c b/libdm/libdm-stats.c
-index bc498675f..d424928c7 100644
+index 94ad380e0..76efbbe35 100644
 --- a/libdm/libdm-stats.c
 +++ b/libdm/libdm-stats.c
-@@ -5064,7 +5064,7 @@ int dm_stats_start_filemapd(int fd, uint64_t group_id, const char *path,
+@@ -5065,7 +5065,7 @@ int dm_stats_start_filemapd(int fd, uint64_t group_id, const char *path,
   * current dm_stats_create_region() version.
   */
  
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
index ccdc2c38e6..2352f17af0 100644
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
@@ -22,7 +22,7 @@ LVM2_CONF_OPTS += \
 	--disable-nls \
 	--disable-symvers
 
-LVM2_DEPENDENCIES += host-pkgconf
+LVM2_DEPENDENCIES += host-pkgconf libaio
 
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the toolchain passed at configure time.
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 6573cda221..e7782028d1 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_UDISKS
 	bool "udisks"
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS # lvm2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
@@ -38,9 +39,11 @@ endif
 
 comment "udisks needs udev /dev management"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_HAS_UDEV
 
 comment "udisks needs a glibc or uClibc toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
-- 
2.18.0
