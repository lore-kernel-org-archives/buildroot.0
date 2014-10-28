From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 23:19:18 +0100
Subject: [Buildroot] [PATCH 3/3] binutils: now depends on wchar
In-Reply-To: <1414534758-7545-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1414534758-7545-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1414534758-7545-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>

binutils starting at least from 2.23 when build for target require
uClibc configured with UCLIBC_HAS_WCHAR otherwise:

libtool: link: [...] -o as-new [...]
read.o: In function `read_symbol_name':
read.c:(.text+0x3634): undefined reference to `mbstowcs'
collect2: error: ld returned 1 exit status

because "mbstowcs" is not available in the C library.

Even though we're not yet using 2.23.2 as the default version, we will
probably do it in the near future, so this commit doesn't bother with
making the wchar dependency version-specific, and applies it to the
binutils package as a whole.

Fixes bug #6218

[Thomas:
 - more details in the commit log.
 - add comment about the wchar dependency
 - propagate the dependency to dropwatch (and fix a mistake in the
   architecture dependencies of the comment)
 - propagate the dependency to oprofile.]

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in  | 5 +++++
 package/dropwatch/Config.in | 7 ++++---
 package/oprofile/Config.in  | 5 +++--
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 44e7ae0..50c38b6 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BINUTILS
 	bool "binutils"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	depends on !BR2_aarch64 && !BR2_nios2
+	depends on BR2_USE_WCHAR
 	help
 	  Install binutils on the target
 
@@ -19,3 +20,7 @@ config BR2_PACKAGE_BINUTILS_TARGET
 	  http://www.gnu.org/software/binutils/
 
 endif
+
+comment "binutils needs a toolchain w/ wchar"
+	depends on !BR2_aarch64 && !BR2_nios2
+	depends on BR2_USE_WCHAR
diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
index 0c9aca6..d331e5e 100644
--- a/package/dropwatch/Config.in
+++ b/package/dropwatch/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DROPWATCH
 	bool "dropwatch"
 	select BR2_PACKAGE_BINUTILS
 	depends on !BR2_aarch64 && !BR2_nios2 # binutils
+	depends on BR2_USE_WCHAR # binutils
 	select BR2_PACKAGE_READLINE
 	select BR2_PACKAGE_LIBNL
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
@@ -11,6 +12,6 @@ config BR2_PACKAGE_DROPWATCH
 
 	  https://fedorahosted.org/dropwatch/
 
-comment "dropwatch needs a toolchain w/ threads"
-	depends on !BR2_aarch64
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "dropwatch needs a toolchain w/ threads, wchar"
+	depends on !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 075e9ea..3ea07d9 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_OPROFILE
 	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_aarch64 && !BR2_nios2 # binutils
+	depends on BR2_USE_WCHAR # binutils
 	depends on !BR2_xtensa
 	# libpfm4 is needed on PowerPC, and requires thread support
 	depends on BR2_TOOLCHAIN_HAS_THREADS || !BR2_powerpc
@@ -25,10 +26,10 @@ config BR2_PACKAGE_OPROFILE
 	  interrupt handlers, kernel modules, the kernel, shared
 	  libraries, and applications.
 
-comment "oprofile needs a toolchain w/ C++"
+comment "oprofile needs a toolchain w/ C++, wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_aarch64 && !BR2_nios2 && !BR2_xtensa
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
 comment "oprofile needs a toolchain w/ threads on PPC"
 	depends on BR2_USE_MMU && BR2_powerpc
-- 
2.0.0
