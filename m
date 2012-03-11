From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Mar 2012 23:13:19 +0100
Subject: [Buildroot] [git commit] ntfsprogs: remove deprecated
Message-ID: <20120311222557.159A390D46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1a70b76ab77745b08d54c7aaaa64b6e9cd519b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 -
 package/ntfsprogs/Config.in                        |   12 ------
 ...tfsprogs-2.0.0-no-pkgconfig-path-override.patch |   42 --------------------
 package/ntfsprogs/ntfsprogs.mk                     |   26 ------------
 4 files changed, 0 insertions(+), 81 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c582f8a..4838edc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -200,7 +200,6 @@ source "package/memtester/Config.in"
 source "package/minicom/Config.in"
 source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
-source "package/ntfsprogs/Config.in"
 source "package/open2300/Config.in"
 source "package/openocd/Config.in"
 source "package/pciutils/Config.in"
diff --git a/package/ntfsprogs/Config.in b/package/ntfsprogs/Config.in
deleted file mode 100644
index 561c1d4..0000000
--- a/package/ntfsprogs/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_NTFSPROGS
-	bool "ntfsprogs"
-	depends on BR2_USE_WCHAR
-	depends on BR2_LARGEFILE
-	depends on BR2_DEPRECATED
-	help
-	  wide collection of NTFS utilities
-
-	  http://www.linux-ntfs.org/
-
-comment "ntfsprogs requires a toolchain with WCHAR and LARGEFILE support"
-	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE
diff --git a/package/ntfsprogs/ntfsprogs-2.0.0-no-pkgconfig-path-override.patch b/package/ntfsprogs/ntfsprogs-2.0.0-no-pkgconfig-path-override.patch
deleted file mode 100644
index bf7824d..0000000
--- a/package/ntfsprogs/ntfsprogs-2.0.0-no-pkgconfig-path-override.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-[PATCH] ntfsprogs: don't override PKG_CONFIG_PATH
-
-Adding hardcoded directories to the pkg-config search path breaks
-cross compilation (E.G. if the host has a .pc for a package the
-target doesn't have).
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- configure    |    4 ----
- configure.ac |    4 ----
- 2 files changed, 8 deletions(-)
-
-Index: ntfsprogs-2.0.0/configure.ac
-===================================================================
---- ntfsprogs-2.0.0.orig/configure.ac
-+++ ntfsprogs-2.0.0/configure.ac
-@@ -168,10 +168,6 @@ AC_PROG_MAKE_SET
- AC_PROG_LIBTOOL
- PKG_PROG_PKG_CONFIG
- 
--# Libraries often install their metadata .pc files in directories not searched
--# by pkg-config. Let's workaround this. 
--export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/lib/pkgconfig:/opt/gnome/lib/pkgconfig:/usr/share/pkgconfig:/usr/local/lib/pkgconfig:$prefix/lib/pkgconfig:/opt/gnome/share/pkgconfig:/usr/local/share/pkgconfig
--
- # Enable large file support.
- AC_SYS_LARGEFILE
- 
-Index: ntfsprogs-2.0.0/configure
-===================================================================
---- ntfsprogs-2.0.0.orig/configure
-+++ ntfsprogs-2.0.0/configure
-@@ -20210,10 +20210,6 @@ echo "${ECHO_T}no" >&6; }
- 
- fi
- 
--# Libraries often install their metadata .pc files in directories not searched
--# by pkg-config. Let's workaround this.
--export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/lib/pkgconfig:/opt/gnome/lib/pkgconfig:/usr/share/pkgconfig:/usr/local/lib/pkgconfig:$prefix/lib/pkgconfig:/opt/gnome/share/pkgconfig:/usr/local/share/pkgconfig
--
- # Enable large file support.
- # Check whether --enable-largefile was given.
- if test "${enable_largefile+set}" = set; then
diff --git a/package/ntfsprogs/ntfsprogs.mk b/package/ntfsprogs/ntfsprogs.mk
deleted file mode 100644
index 32b9cb2..0000000
--- a/package/ntfsprogs/ntfsprogs.mk
+++ /dev/null
@@ -1,26 +0,0 @@
-#############################################################
-#
-# ntfsprogs
-#
-#############################################################
-NTFSPROGS_VERSION:=2.0.0
-NTFSPROGS_SOURCE:=ntfsprogs-$(NTFSPROGS_VERSION).tar.gz
-NTFSPROGS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/linux-ntfs/
-NTFSPROGS_CONF_OPT:=--disable-gnome-vfs --disable-crypto
-NTFSPROGS_INSTALL_STAGING:=yes
-
-NTFSPROGS_BIN:=ntfscat ntfscluster ntfscmp ntfsfix ntfsinfo ntfsls
-NTFSPROGS_SBIN:=ntfsclone ntfscp ntfslabel ntfsresize ntfsundelete mkntfs
-
-ifeq ($(BR2_PACKAGE_LIBFUSE),y)
-NTFSPROGS_DEPENDENCIES += libfuse
-endif
-
-define NTFSPROGS_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/libntfs.so*
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(NTFSPROGS_BIN))
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(NTFSPROGS_SBIN))
-	-unlink $(TARGET_DIR)/sbin/mkfs.ntfs
-endef
-
-$(eval $(call AUTOTARGETS))
