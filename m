From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Jul 2017 17:59:56 +0200
Subject: [Buildroot] [PATCH 2/3] efivar: bump to version 31
In-Reply-To: <20170711155957.10815-1-thomas.petazzoni@free-electrons.com>
References: <20170711155957.10815-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170711155957.10815-2-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows to drop two patches that have been upstreamed:

 0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch is
 upstream as of commit 18b9b3dd7ebf23a16de07b3fb6ae622be488d712

 0003-Remove-some-extra-const-that-gcc-complains-about.patch is
 upstream as of commit 1c7c0f71c9d22efda4156881eb187b8c69d1cca7.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...bc.patch => 0001-Allow-build-with-uClibc.patch} |  0
 ...fs-to-avoid-the-multiple-definitions-bug-.patch | 29 -------------
 ...some-extra-const-that-gcc-complains-about.patch | 47 ----------------------
 package/efivar/efivar.hash                         |  2 +-
 package/efivar/efivar.mk                           |  2 +-
 5 files changed, 2 insertions(+), 78 deletions(-)
 rename package/efivar/{0002-Allow-build-with-uClibc.patch => 0001-Allow-build-with-uClibc.patch} (100%)
 delete mode 100644 package/efivar/0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch
 delete mode 100644 package/efivar/0003-Remove-some-extra-const-that-gcc-complains-about.patch

diff --git a/package/efivar/0002-Allow-build-with-uClibc.patch b/package/efivar/0001-Allow-build-with-uClibc.patch
similarity index 100%
rename from package/efivar/0002-Allow-build-with-uClibc.patch
rename to package/efivar/0001-Allow-build-with-uClibc.patch
diff --git a/package/efivar/0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch b/package/efivar/0001-Use-z-muldefs-to-avoid-the-multiple-definitions-bug-.patch
deleted file mode 100644
index 2bc3ff2..0000000
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
index 6b9f77e..0000000
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
index e337b96..9a3a6db 100644
--- a/package/efivar/efivar.hash
+++ b/package/efivar/efivar.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 20709c76311f8eb8be92977b7ac008ce62501fa9f7fe885a784321540fc352f9 efivar-30.tar.gz
+sha256 fa9331b762ab9f0749dd8d58a218701f33e4ea515ac57a120657447e046e6568 efivar-31.tar.gz
diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index d06192e..6b26290 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFIVAR_VERSION = 30
+EFIVAR_VERSION = 31
 EFIVAR_SITE = $(call github,rhinstaller,efivar,$(EFIVAR_VERSION))
 EFIVAR_LICENSE = LGPL-2.1
 EFIVAR_LICENSE_FILES = COPYING
-- 
2.9.4
