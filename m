From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Mar 2018 10:57:41 +0100
Subject: [Buildroot] [PATCHv2 2/2] efivar: bump version
In-Reply-To: <20180323095741.16512-1-peter@korsgaard.com>
References: <20180323095741.16512-1-peter@korsgaard.com>
Message-ID: <20180323095741.16512-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop 0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch and
0003-Remove-some-extra-const-that-gcc-complains-about.patch as they are now
upstream.

The upstream repo moved to the 'rhboot' github project, so adjust upstream
URL in .mk and help text to match.

Drop dependency on !musl as it is now support since e04281e60cf0d
(makeguids: Ensure compatibility with other libcs).

Drop BINTARGETS workaround as this is fixed since 6c674283697 (Don't build
static by default).

Drop popt dependency as it is no longer needed since 1aec5e7891 (Replace
popt usage with getopt_long in efivar.c).

While we are at it, also add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
Changes since v1:
- Drop popt dependency

 package/efibootmgr/Config.in                       |  2 -
 ...bc.patch => 0001-Allow-build-with-uClibc.patch} |  2 +-
 ...fs-to-avoid-the-multiple-definitions-bug-.patch | 29 -------------
 ...some-extra-const-that-gcc-complains-about.patch | 47 ----------------------
 package/efivar/Config.in                           |  8 +---
 package/efivar/efivar.hash                         |  3 +-
 package/efivar/efivar.mk                           |  9 +----
 7 files changed, 7 insertions(+), 93 deletions(-)
 rename package/efivar/{0002-Allow-build-with-uClibc.patch => 0001-Allow-build-with-uClibc.patch} (96%)
 delete mode 100644 package/efivar/0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch
 delete mode 100644 package/efivar/0003-Remove-some-extra-const-that-gcc-complains-about.patch

diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index b87fb53225..d31f9b13ee 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_EFIBOOTMGR
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS # efivar
 	depends on !BR2_STATIC_LIBS # efivar
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
-	depends on !BR2_TOOLCHAIN_USES_MUSL # efivar
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	select BR2_PACKAGE_EFIVAR
@@ -20,6 +19,5 @@ comment "efibootmgr needs a glibc or uClibc toolchain w/ dynamic library, header
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
-		BR2_TOOLCHAIN_USES_MUSL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
diff --git a/package/efivar/0002-Allow-build-with-uClibc.patch b/package/efivar/0001-Allow-build-with-uClibc.patch
similarity index 96%
rename from package/efivar/0002-Allow-build-with-uClibc.patch
rename to package/efivar/0001-Allow-build-with-uClibc.patch
index 7c195872b0..01fa9dee70 100644
--- a/package/efivar/0002-Allow-build-with-uClibc.patch
+++ b/package/efivar/0001-Allow-build-with-uClibc.patch
@@ -20,7 +20,7 @@ index 7f2d4dd..72c02d1 100644
  #include <stdlib.h>
 -#include <uchar.h>
  
- #include <efivar.h>
+ #include <efivar/efivar.h>
  #include "lib.h"
  
 +#ifdef __UCLIBC__
diff --git a/package/efivar/0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch b/package/efivar/0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch
deleted file mode 100644
index 2bc3ff243f..0000000000
--- a/package/efivar/0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 314eb67b239e60c2ed3700e2baf9cd0e590465f3 Mon Sep 17 00:00:00 2001
-From: Peter Jones <pjones@redhat.com>
-Date: Thu, 27 Oct 2016 09:19:18 -0400
-Subject: [PATCH] Use -z muldefs to avoid the multiple definitions bug
- without -flto
-
-This fixes github issue #64
-
-Signed-off-by: Peter Jones <pjones@redhat.com>
-Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
----
- Make.defaults | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Make.defaults b/Make.defaults
-index aa974d9..c9d599f 100644
---- a/Make.defaults
-+++ b/Make.defaults
-@@ -32,6 +32,7 @@ cflags	= $(CFLAGS) -I${TOPDIR}/src/include/efivar/ \
- clang_ccldflags =
- gcc_ccldflags =
- ccldflags = $(cflags) -L. $(CCLDFLAGS) $(LDFLAGS) \
-+	-Wl,-z,muldefs \
- 	$(if $(findstring clang,$(CCLD)),$(clang_ccldflags),) \
- 	$(if $(findstring gcc,$(CCLD)),$(gcc_ccldflags),) \
- 	$(call pkg-config-ccldflags)
--- 
-2.10.2
-
diff --git a/package/efivar/0003-Remove-some-extra-const-that-gcc-complains-about.patch b/package/efivar/0003-Remove-some-extra-const-that-gcc-complains-about.patch
deleted file mode 100644
index 6b9f77eb8b..0000000000
--- a/package/efivar/0003-Remove-some-extra-const-that-gcc-complains-about.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 1c7c0f71c9d22efda4156881eb187b8c69d1cca7 Mon Sep 17 00:00:00 2001
-From: Peter Jones <pjones@redhat.com>
-Date: Mon, 6 Feb 2017 14:28:19 -0500
-Subject: [PATCH] Remove some extra "const" that gcc complains about.
-
-One of these days I'll get these right.
-
-Signed-off-by: Peter Jones <pjones@redhat.com>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream commit 1c7c0f71c9d22e.
-
- src/include/efivar/efiboot-loadopt.h | 4 ++--
- src/loadopt.c                        | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/include/efivar/efiboot-loadopt.h b/src/include/efivar/efiboot-loadopt.h
-index 07db5c4c53e3..efc29c69d47e 100644
---- a/src/include/efivar/efiboot-loadopt.h
-+++ b/src/include/efivar/efiboot-loadopt.h
-@@ -32,8 +32,8 @@ extern ssize_t efi_loadopt_create(uint8_t *buf, ssize_t size,
- 
- extern efidp efi_loadopt_path(efi_load_option *opt, ssize_t limit)
- 	__attribute__((__nonnull__ (1)));
--extern const unsigned char const * efi_loadopt_desc(efi_load_option *opt,
--						    ssize_t limit)
-+extern const unsigned char * efi_loadopt_desc(efi_load_option *opt,
-+					      ssize_t limit)
- 	__attribute__((__visibility__ ("default")))
- 	__attribute__((__nonnull__ (1)));
- extern uint32_t efi_loadopt_attrs(efi_load_option *opt)
-diff --git a/src/loadopt.c b/src/loadopt.c
-index a63ca792d2dc..ce889867fd29 100644
---- a/src/loadopt.c
-+++ b/src/loadopt.c
-@@ -357,7 +357,7 @@ teardown(void)
- 
- __attribute__((__nonnull__ (1)))
- __attribute__((__visibility__ ("default")))
--const unsigned char const *
-+const unsigned char *
- efi_loadopt_desc(efi_load_option *opt, ssize_t limit)
- {
- 	if (last_desc) {
--- 
-2.13.2
-
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index 0fa9adf387..74f2bb5abb 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -16,19 +16,15 @@ config BR2_PACKAGE_EFIVAR
 	# failures. So, prevent this package to be built using those
 	# toolchains.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
-	# doesn't build with musl due to lack of __bswap_constant_16
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	select BR2_PACKAGE_POPT
 	help
 	  Tools and libraries to manipulate EFI variables
 
-	  https://github.com/rhinstaller/efivar
+	  https://github.com/rhboot/efivar
 
-comment "efivar needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
+comment "efivar needs a toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
 	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
-		BR2_TOOLCHAIN_USES_MUSL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
diff --git a/package/efivar/efivar.hash b/package/efivar/efivar.hash
index e337b96450..e8a65adc4b 100644
--- a/package/efivar/efivar.hash
+++ b/package/efivar/efivar.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256 20709c76311f8eb8be92977b7ac008ce62501fa9f7fe885a784321540fc352f9 efivar-30.tar.gz
+sha256 9691399a424b8e3776b7ed2df1893c4162285a93697d781f387d0f0d258a7f4b  efivar-34.tar.gz
+sha256 91df770634adc2755e78cae33a0d01e702ce2f69046408ae93d0d934ff29691b  COPYING
diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index d06192ed22..492a4468bf 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -4,21 +4,16 @@
 #
 ################################################################################
 
-EFIVAR_VERSION = 30
-EFIVAR_SITE = $(call github,rhinstaller,efivar,$(EFIVAR_VERSION))
+EFIVAR_VERSION = 34
+EFIVAR_SITE = $(call github,rhboot,efivar,$(EFIVAR_VERSION))
 EFIVAR_LICENSE = LGPL-2.1
 EFIVAR_LICENSE_FILES = COPYING
-EFIVAR_DEPENDENCIES = popt
 EFIVAR_INSTALL_STAGING = YES
 
-# BINTARGETS is set to skip efivar-static which requires static popt,
-# and since we depend on dynamic libraries, efivar will never be built
-# in a static-only environment.
 # -fPIC is needed at least on MIPS, otherwise fails to build shared
 # -library.
 EFIVAR_MAKE_OPTS = \
 	libdir=/usr/lib \
-	BINTARGETS=efivar \
 	LDFLAGS="$(TARGET_LDFLAGS) -fPIC"
 
 define EFIVAR_BUILD_CMDS
-- 
2.11.0
