From: Yair Ben-Avraham <yairba@protonmail.com>
Date: Thu, 15 Oct 2020 09:00:13 +0000
Subject: [Buildroot] [PATCH v4 1/1] tpm2-tss: bump version to 3.0.1
Message-ID: <yb7k-xY0l_p3TTfxxlrtmwPBuBcgKRJ4AbluBXMvh1W73w6ul6tSw_Bwltz1CQlJKUIGcM_Y0T9GUpU92ttmWI1gHlw2C8VUGa-FfIaGioQ=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- 0001-Temporary-fix-for-build-without-C.patch, AC_PROG_CXX line
  number changed.
- Makefile-fuzz-generated.am now in size zero.
- json-c, libcurl: new (FAPI) dependencies since tpm2-tss version 2.4.0

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
---
 ...01-Temporary-fix-for-build-without-C.patch | 14 +++++++-----
 package/tpm2-tss/Config.in                    | 22 +++++++++++++++++++
 package/tpm2-tss/tpm2-tss.hash                |  4 ++--
 package/tpm2-tss/tpm2-tss.mk                  | 16 ++++++--------
 4 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch b/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
index b2a9cb4f78..463053aaad 100644
--- a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
+++ b/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
@@ -1,4 +1,4 @@
-From 158d0bc3a2a7a93090cc12c5b0dd3c27e6f44d61 Mon Sep 17 00:00:00 2001
+From c648387ff073cd8da6553b82a879d29a14ae1782 Mon Sep 17 00:00:00 2001
 From: Carlos Santos <unixmania@gmail.com>
 Date: Mon, 23 Dec 2019 08:02:19 -0300
 Subject: [PATCH] Temporary fix for build without C++
@@ -23,22 +23,24 @@ Fixes:
 1. https://github.com/tpm2-software/tpm2-tss/commit/60c26e4c4faba6ba12469485653e17092b510840

 Signed-off-by: Carlos Santos <unixmania@gmail.com>
+[yairba: rebase on version 3.0.1]
+Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
 ---
  configure.ac | 1 -
  1 file changed, 1 deletion(-)

 diff --git a/configure.ac b/configure.ac
-index cd50451d..a3bd7144 100644
+index a4365886..d87058cf 100755
 --- a/configure.ac
 +++ b/configure.ac
-@@ -25,7 +25,6 @@ AC_CANONICAL_HOST
- AX_IS_RELEASE(dash-version)
+@@ -26,7 +26,6 @@ AX_IS_RELEASE(dash-version)
  AX_CHECK_ENABLE_DEBUG([info])

--AC_PROG_CXX
  AC_PROG_CC
+-AC_PROG_CXX
  AC_PROG_LN_S
  AC_USE_SYSTEM_EXTENSIONS
+ LT_INIT()
 --
-2.18.1
+2.20.1

diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 2d619750f8..344dabd504 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -33,5 +33,27 @@ config BR2_PACKAGE_TPM2_TSS

 	  https://github.com/tpm2-software/tpm2-tss

+if BR2_PACKAGE_TPM2_TSS
+
+config TPM2_TSS_FAPI
+	bool "tpm2-tss with fapi"
+	default n
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBCURL
+	help
+	  This option allows to enable Feature API (FAPI).
+	  Feature API (FAPI) as described in the "TSS 2.0 Feature API
+	  Specification" [1] along with "TSS 2.0 JSON Data Types and Policy
+	  Language Specification" [2] This API is designed to be very
+	  high-level API, intended to make programming with the TPM as
+	  simple as possible. The API functions are exposed through a
+	  single library: libtss2-fapi.
+
+	  [1] https://trustedcomputinggroup.org/wp-content/uploads/TSS_FAPI_v0.94_r04_pubrev.pdf
+	  [2] https://trustedcomputinggroup.org/wp-content/uploads/TSS_JSON_Policy_v0.7_r04_pubrev.pdf
+
+endif
+
 comment "tpm2-tss needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
index 3b778d4f1e..49432314d0 100644
--- a/package/tpm2-tss/tpm2-tss.hash
+++ b/package/tpm2-tss/tpm2-tss.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 9d8c8866829e3ff5e1649ecd82498cb1329e0691139458e53b69e6061febe3d3  tpm2-tss-2.3.3.tar.gz
-sha256 18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
+sha256  2432533a1cac0f0d15d0337d2f0a23591a50b36aad68ab72412ce694818b7e76  tpm2-tss-3.0.1.tar.gz
+sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 470020857a..80e1c9048b 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-TPM2_TSS_VERSION = 2.3.3
+TPM2_TSS_VERSION = 3.0.1
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
@@ -17,13 +17,11 @@ TPM2_TSS_AUTORECONF = YES
 # uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
 TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"

-# The 2.3.3 tarball accidently contains a Makefile-fuzz-generated.am
-# with content from a fuzz testing run rather than an empty file,
-# confusing autoreconf with
-# 0001-configure-Only-use-CXX-when-fuzzing.patch
-define TPM2_TSS_TRUNCATE_MAKEFILE_FUZZ_GENERATED_AM
-	truncate -s 0 $(@D)/Makefile-fuzz-generated.am
-endef
-TPM2_TSS_POST_PATCH_HOOKS += TPM2_TSS_TRUNCATE_MAKEFILE_FUZZ_GENERATED_AM
+ifeq ($(TPM2_TSS_FAPI),y)
+TPM2_TSS_DEPENDENCIES += json-c libcurl
+TPM2_TSS_CONF_OPTS += --enable-fapi
+else
+TPM2_TSS_CONF_OPTS += --disable-fapi
+endif

 $(eval $(autotools-package))
--
2.20.1
