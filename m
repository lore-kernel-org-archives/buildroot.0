From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Dec 2017 15:38:26 +0100
Subject: [Buildroot] [git commit] cryptsetup: bump to version 2.0.0
Message-ID: <20171222144124.32A1C82E77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de7bd25bfad5434079b9aa91eb52b65eca0c37e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the now mandatory json-c depencecy. Propagate to reverse
dependencies.

Drop the no longer needed patch.

Add license files hashes.

[Peter: propagate _HAS_SYNC_4 dependency to comments as pointed out by
	Thomas]
Cc: Martin Hicks <mort@bork.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/0001-mkdir.patch | 18 ------------------
 package/cryptsetup/Config.in        |  3 +++
 package/cryptsetup/cryptsetup.hash  |  6 ++++--
 package/cryptsetup/cryptsetup.mk    |  6 +++---
 package/luksmeta/Config.in          |  2 ++
 5 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/package/cryptsetup/0001-mkdir.patch b/package/cryptsetup/0001-mkdir.patch
deleted file mode 100644
index d4d7052..0000000
--- a/package/cryptsetup/0001-mkdir.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-$(mkdir_p) is obsolete for newer automake, use $(MKDIR_P) instead.
-Upstream should really gettextize with a newer version before packing up.
-
-[base on a similar patch from Gustavo Zacarias for Linux-PAM-1.1.7]
-Signed-off-by: Axel Lin <axel.lin@ingics.com>
-
-diff -Nura cryptsetup-1.6.3.ori/po/Makefile.in.in cryptsetup-1.6.3/po/Makefile.in.in
---- cryptsetup-1.6.3.ori/po/Makefile.in.in	2013-12-30 11:53:22.731942516 +0800
-+++ cryptsetup-1.6.3/po/Makefile.in.in	2014-01-09 09:46:13.594071188 +0800
-@@ -31,7 +31,7 @@
- INSTALL = @INSTALL@
- INSTALL_DATA = @INSTALL_DATA@
- mkinstalldirs = $(SHELL) @install_sh@ -d
--mkdir_p = @mkdir_p@
-+mkdir_p = @MKDIR_P@
- 
- GMSGFMT_ = @GMSGFMT@
- GMSGFMT_no = @GMSGFMT@
diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index d24f7b0..7322a4b 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -3,10 +3,12 @@ config BR2_PACKAGE_CRYPTSETUP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_JSON_C
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
 	  on-disk encryption.
@@ -15,4 +17,5 @@ config BR2_PACKAGE_CRYPTSETUP
 
 comment "cryptsetup needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 6d0fb58..c54b0dc 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,2 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/sha256sums.asc
-sha256 2b30cd1d0dd606a53ac77b406e1d37798d4b0762fa89de6ea546201906a251bd  cryptsetup-1.7.5.tar.xz
+# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.0/sha256sums.asc
+sha256 adc623b9e3e3ab5c14145b8baf21b741e513ee5bf90d2b4d85a745c2f05da199  cryptsetup-2.0.0.tar.xz
+sha256 45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
+sha256 8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 6b0fa31..1abee0b 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-CRYPTSETUP_VERSION_MAJOR = 1.7
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).5
+CRYPTSETUP_VERSION_MAJOR = 2.0
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).0
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
-CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf \
+CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf json-c \
 	$(TARGET_NLS_DEPENDENCIES)
 CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
diff --git a/package/luksmeta/Config.in b/package/luksmeta/Config.in
index 62e1f3e..f2f6feb 100644
--- a/package/luksmeta/Config.in
+++ b/package/luksmeta/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LUKSMETA
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
 	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
 	depends on !BR2_TOOLCHAIN_USES_MUSL # cryptsetup -> lvm2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
 	select BR2_PACKAGE_CRYPTSETUP
 	help
 	  LUKSMeta is a simple library and utility for storing
@@ -13,5 +14,6 @@ config BR2_PACKAGE_LUKSMETA
 
 comment "luksmeta needs a glibc or uClibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| BR2_TOOLCHAIN_USES_MUSL
