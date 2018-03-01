From: charles.hardin at storagecraft.com <charles.hardin@storagecraft.com>
Date: Thu, 1 Mar 2018 15:57:56 -0800
Subject: [Buildroot] [PATCH v2 1/1] efivar: update to version 34 to pick up
 gcc7 compile fixes
Message-ID: <20180301235756.95597-1-charles.hardin@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Hardin <charles.hardin@storagecraft.com>

Instead of patching the prior version of efivar, just update to
a current version 34 to fix some gcc7 compile errors like the
following:

dp-media.c: In function '_format_media_dn':
dp.h:121:12: error: argument 1 value '18446744073709551610'
             exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
   uint16_t _ucs2buf[(len)];    \

Removed patches that are upstreamed:
0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch
0003-Remove-some-extra-const-that-gcc-complains-about.patch

Changed the EFIVAR_SITE in efivar.mk:
Pointed to the rhboot/efivar site on github since that appears
to be where this project is hosted now.

Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
---
 ...bc.patch => 0001-Allow-build-with-uClibc.patch} |  2 +-
 ...fs-to-avoid-the-multiple-definitions-bug-.patch | 29 -------------
 ...some-extra-const-that-gcc-complains-about.patch | 47 ----------------------
 package/efivar/efivar.hash                         |  2 +-
 package/efivar/efivar.mk                           |  4 +-
 5 files changed, 4 insertions(+), 80 deletions(-)
 rename package/efivar/{0002-Allow-build-with-uClibc.patch => 0001-Allow-build-with-uClibc.patch} (96%)
 delete mode 100644 package/efivar/0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch
 delete mode 100644 package/efivar/0003-Remove-some-extra-const-that-gcc-complains-about.patch

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
diff --git a/package/efivar/efivar.hash b/package/efivar/efivar.hash
index e337b96450..1eefaf506b 100644
--- a/package/efivar/efivar.hash
+++ b/package/efivar/efivar.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 20709c76311f8eb8be92977b7ac008ce62501fa9f7fe885a784321540fc352f9 efivar-30.tar.gz
+sha256 9691399a424b8e3776b7ed2df1893c4162285a93697d781f387d0f0d258a7f4b efivar-34.tar.gz
diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index d06192ed22..f7974c9d1d 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EFIVAR_VERSION = 30
-EFIVAR_SITE = $(call github,rhinstaller,efivar,$(EFIVAR_VERSION))
+EFIVAR_VERSION = 34
+EFIVAR_SITE = $(call github,rhboot,efivar,$(EFIVAR_VERSION))
 EFIVAR_LICENSE = LGPL-2.1
 EFIVAR_LICENSE_FILES = COPYING
 EFIVAR_DEPENDENCIES = popt
-- 
2.14.3 (Apple Git-98)
