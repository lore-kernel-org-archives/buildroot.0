From: Yair Ben-Avraham <yairba@protonmail.com>
Date: Wed, 14 Oct 2020 03:36:05 +0000
Subject: [Buildroot] [PATCH 1/1] tpm2-tss: bump version to 3.0.1
Message-ID: <COPsCRIZhewi95TaMVvld-zedMAwc-Ff1p20qFw7EDM-BwB13DgMpLclzXA2PX-Rpv7UrNQs-W4LDV0zfIzRy_fhPtDac-9Bvd_6FlRsDpk=@protonmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove 0001-configure-Only-use-CXX-when-fuzzing.patch since
  AC_PROG_CXX added to configure.ac
- Makefile-fuzz-generated.am now in size zero.

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
---
 ...01-Temporary-fix-for-build-without-C.patch | 44 -------------------
 package/tpm2-tss/Config.in                    |  2 +
 package/tpm2-tss/tpm2-tss.hash                |  4 +-
 package/tpm2-tss/tpm2-tss.mk                  | 12 +----
 4 files changed, 5 insertions(+), 57 deletions(-)
 delete mode 100644 package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch

diff --git a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch b/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
deleted file mode 100644
index b2a9cb4f78..0000000000
--- a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 158d0bc3a2a7a93090cc12c5b0dd3c27e6f44d61 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <unixmania@gmail.com>
-Date: Mon, 23 Dec 2019 08:02:19 -0300
-Subject: [PATCH] Temporary fix for build without C++
-
-C++ is required only for the fuzzing tests but AC_PROG_CXX is included
-by configure.ac even when fuzzing is not enabled (which we don't do on
-Buildroot).
-
-The patch applied upstream had issues and was reverted[1]. Use a local
-patch to solve the problem temporaryly.
-
-Fixes:
-    http://autobuild.buildroot.net/results/13f5e37b47b255da4158bec34e5459136f7e60d4
-    http://autobuild.buildroot.net/results/1c26db2509c79e00c0de1165945277eaa57b149f
-    http://autobuild.buildroot.net/results/b7b6b7b7aca79e847b442cbd2305427d91fe5d70
-    http://autobuild.buildroot.net/results/1cd5a82a0e799aa5027e2e2c03b246332cc3a15d
-    http://autobuild.buildroot.net/results/d7ec878907f714377c83e9a496e97cbf9382d787
-    http://autobuild.buildroot.net/results/1c7f0c1b3ce4871cd87bd6059b1f0a6dc4e74a9c
-    http://autobuild.buildroot.net/results/196b81d580325607c8da90beeb79e1f6b8ab8b47
-    http://autobuild.buildroot.net/results/f90f7b4ac710b56686635f8ae27059c11b963e47
-
-1. https://github.com/tpm2-software/tpm2-tss/commit/60c26e4c4faba6ba12469485653e17092b510840
-
-Signed-off-by: Carlos Santos <unixmania@gmail.com>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index cd50451d..a3bd7144 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -25,7 +25,6 @@ AC_CANONICAL_HOST
- AX_IS_RELEASE(dash-version)
- AX_CHECK_ENABLE_DEBUG([info])
-
--AC_PROG_CXX
- AC_PROG_CC
- AC_PROG_LN_S
- AC_USE_SYSTEM_EXTENSIONS
---
-2.18.1
-
diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 2d619750f8..13275af9aa 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_TPM2_TSS
 	bool "tpm2-tss"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	select BR2_PACKAGE_LIBCURL_CURL
+	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBURIPARSER
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
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
index 470020857a..a3e64e7edd 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -4,26 +4,16 @@
 #
 ################################################################################

-TPM2_TSS_VERSION = 2.3.3
+TPM2_TSS_VERSION = 3.0.1
 TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
 TPM2_TSS_LICENSE = BSD-2-Clause
 TPM2_TSS_LICENSE_FILES = LICENSE
 TPM2_TSS_INSTALL_STAGING = YES
 TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
 TPM2_TSS_CONF_OPTS = --with-crypto=ossl --disable-doxygen-doc --disable-defaultflags
-# 0001-configure-Only-use-CXX-when-fuzzing.patch
 TPM2_TSS_AUTORECONF = YES

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
-
 $(eval $(autotools-package))
--
2.20.1
