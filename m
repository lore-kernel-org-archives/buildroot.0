From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 21:16:42 +0200
Subject: [Buildroot] [git commit] package/e*/Config.in: fix ordering of
	statements
Message-ID: <20170429191659.CB9BD82289@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3a1aa680bb1effdf0e2b71f966105fc84b5d1b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter e in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2tools/Config.in        |  2 +-
 package/easydbus/Config.in       |  2 +-
 package/ecryptfs-utils/Config.in | 14 +++++++-------
 package/efivar/Config.in         |  2 +-
 package/elfutils/Config.in       |  6 +++---
 package/execline/Config.in       |  2 +-
 package/exiv2/Config.in          |  2 +-
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/package/e2tools/Config.in b/package/e2tools/Config.in
index 75029f7..e4a35e2 100644
--- a/package/e2tools/Config.in
+++ b/package/e2tools/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_E2TOOLS
 	bool "e2tools"
-	select BR2_PACKAGE_E2FSPROGS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR # uses wchar_t
 	depends on BR2_USE_MMU # e2fsprogs
+	select BR2_PACKAGE_E2FSPROGS
 	help
 	  E2tools is a simple set of GPL'ed utilities to read, write,
 	  and manipulate files in an ext2/ext3 filesystem. These
diff --git a/package/easydbus/Config.in b/package/easydbus/Config.in
index 51519d6..1fe8689 100644
--- a/package/easydbus/Config.in
+++ b/package/easydbus/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_EASYDBUS
 	bool "easydbus"
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Easy to use DBus library for Lua.
 
diff --git a/package/ecryptfs-utils/Config.in b/package/ecryptfs-utils/Config.in
index cb70e00..078ca36 100644
--- a/package/ecryptfs-utils/Config.in
+++ b/package/ecryptfs-utils/Config.in
@@ -1,12 +1,5 @@
 config BR2_PACKAGE_ECRYPTFS_UTILS
 	bool "ecryptfs-utils"
-	select BR2_PACKAGE_KEYUTILS
-	select BR2_PACKAGE_LIBNSS
-	# runtime dependency only, some scripts are using the
-	# 'gettext' program to get translations
-	select BR2_PACKAGE_GETTEXT
-	# runtime dependency only
-	select BR2_PACKAGE_GETENT
 	depends on BR2_USE_WCHAR # gettext
 	depends on BR2_USE_MMU # keyutils
 	depends on !BR2_microblaze # keyutils
@@ -14,6 +7,13 @@ config BR2_PACKAGE_ECRYPTFS_UTILS
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnspr
 	depends on !BR2_MIPS_NABI32 # libnss
 	depends on !BR2_STATIC_LIBS # libnss, keyutils
+	select BR2_PACKAGE_KEYUTILS
+	select BR2_PACKAGE_LIBNSS
+	# runtime dependency only, some scripts are using the
+	# 'gettext' program to get translations
+	select BR2_PACKAGE_GETTEXT
+	# runtime dependency only
+	select BR2_PACKAGE_GETENT
 	help
 	  eCryptfs is a POSIX-compliant enterprise cryptographic
 	  filesystem for Linux. It is stacked on top of any other
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index 0ec8360..0fa9adf 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	bool
+	default y
 	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 \
 		|| BR2_powerpc64le || BR2_mipsel || BR2_mips64el
-	default y
 
 config BR2_PACKAGE_EFIVAR
 	bool "efivar"
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 7db8472..3228319 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -5,9 +5,6 @@ comment "elfutils needs a uClibc or glibc toolchain w/ wchar, dynamic library"
 
 config BR2_PACKAGE_ELFUTILS
 	bool "elfutils"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	# Only glibc and uClibc implement the myriad of required GNUisms
@@ -15,6 +12,9 @@ config BR2_PACKAGE_ELFUTILS
 	# build issue caused by the _ prefix used on blackfin for
 	# assembly symbols
 	depends on !BR2_bfin
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Libraries/utilities to handle ELF objects (drop in
 	  replacement for libelf).
diff --git a/package/execline/Config.in b/package/execline/Config.in
index 556f9a5..7a2278f 100644
--- a/package/execline/Config.in
+++ b/package/execline/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_EXECLINE
 	bool "execline"
-	select BR2_PACKAGE_SKALIBS
 	depends on BR2_USE_MMU # skalibs
+	select BR2_PACKAGE_SKALIBS
 	help
 	  execline is a (non-interactive) scripting language, like sh;
 	  but its syntax is quite different from a traditional shell
diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index 8ca95eb..a94e5cd 100644
--- a/package/exiv2/Config.in
+++ b/package/exiv2/Config.in
@@ -39,8 +39,8 @@ config BR2_PACKAGE_EXIV2_PNG
 
 config BR2_PACKAGE_EXIV2_XMP
 	bool "XMP support"
-	select BR2_PACKAGE_EXPAT
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_EXPAT
 	help
 	  Build with XMP support
 
