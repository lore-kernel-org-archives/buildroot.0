From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 29 May 2016 00:33:35 -0300
Subject: [Buildroot] [PATCH 1/1] binutils: enable as target package for
	aarch64
Message-ID: <20160529033335.8886-1-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

binutils got disabled as a target package for aarch64 back in Buildroot
2012.11 (commit 660d16f4).
The default version 2.21.1 at the time didn't really support aarch64, as
shown by the autobuilder error reference in that commit.

binutils has now had support for aarch64 since 2.23, but was never
re-enabled for aarch64.

All of the binutils versions currently supported by Buildroot (oldest
being 2.24) support aarch64, so we can now enable it without any
restrictions.

This same patch also touches the dropwatch, lightning and oprofile
packages which all select binutils and had the 'depends on !aarch64' to
keep Kconfig consistent. They are now re-enabled for aarch64 as well.
They are changed in this same patch so that Kconfig is kept consistent
and doesn't end up having them disabled in a commit which only has the
binutils change applied.
lightning has other explicit arch dependencies so it is not actually yet
available in aarch64, but at least the dependency on !aarch64 because of
binutils is not needed anymore.

Everything has been build tested with Buildroot and external toolchains.
binutils and dropwatch work fine in a qemu target. oprofile doesn't seem
to be supported in the qemu aarch64 processor but builds fine and seems
to have some level of aarch64 support in the source, so there doesn't
seem to be a reason to keep it disabled in Kconfig.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/binutils/Config.in  | 4 ++--
 package/dropwatch/Config.in | 4 ++--
 package/lightning/Config.in | 4 ++--
 package/oprofile/Config.in  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 64d0a09..fdfdfe9 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_BINUTILS
 	bool "binutils"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_nios2
 	depends on BR2_USE_WCHAR
 	help
 	  Install binutils on the target
@@ -22,5 +22,5 @@ config BR2_PACKAGE_BINUTILS_TARGET
 endif
 
 comment "binutils needs a toolchain w/ wchar"
-	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_nios2
 	depends on !BR2_USE_WCHAR
diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
index d331e5e..6f04c85 100644
--- a/package/dropwatch/Config.in
+++ b/package/dropwatch/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_DROPWATCH
 	bool "dropwatch"
 	select BR2_PACKAGE_BINUTILS
-	depends on !BR2_aarch64 && !BR2_nios2 # binutils
+	depends on !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_LIBNL
@@ -13,5 +13,5 @@ config BR2_PACKAGE_DROPWATCH
 	  https://fedorahosted.org/dropwatch/
 
 comment "dropwatch needs a toolchain w/ threads, wchar"
-	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_nios2
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/lightning/Config.in b/package/lightning/Config.in
index 6750114..d85c964 100644
--- a/package/lightning/Config.in
+++ b/package/lightning/Config.in
@@ -20,13 +20,13 @@ config BR2_PACKAGE_LIGHTNING_DISASSEMBLER
 	bool "enable disassembler"
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_ZLIB
-	depends on !BR2_aarch64 && !BR2_nios2 # binutils
+	depends on !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils
 	help
 	  Enable the GNU lightning disassembler.
 
 comment "lightning disassembler needs a toolchain w/ wchar"
-	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_nios2
 	depends on !BR2_USE_WCHAR
 
 endif
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 9cf5693..c6fdeaf 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_OPROFILE
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_aarch64 && !BR2_nios2 # binutils
+	depends on !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils
 	depends on !BR2_xtensa
 	# libpfm4 is needed on PowerPC, and requires thread support
@@ -28,7 +28,7 @@ config BR2_PACKAGE_OPROFILE
 
 comment "oprofile needs a toolchain w/ C++, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_aarch64 && !BR2_nios2 && !BR2_xtensa
+	depends on !BR2_nios2 && !BR2_xtensa
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
 comment "oprofile needs a toolchain w/ NPTL on PPC"
-- 
2.8.3
