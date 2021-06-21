From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 21 Jun 2021 22:22:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/tpm2-tools: security bump to
 version 4.3.2
Message-ID: <20210621202218.706458-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2021-3565: A flaw was found in tpm2-tools in versions before
  5.1.1 and before 4.3.2. tpm2_import used a fixed AES key for the inner
  wrapper, potentially allowing a MITM attacker to unwrap the inner
  portion and reveal the key being imported. The highest threat from
  this vulnerability is to data confidentiality.
- LICENSE moved in doc directory since
  https://github.com/tpm2-software/tpm2-tools/commit/23aa5dca660f596b2ad89542d5100bd4ef0c871a
  and hash updated due to the following line added with
  https://github.com/tpm2-software/tpm2-tools/commit/305011b2a7d091740fa01dbfbd27a48a76f670f7
  Copyright 2019      Fraunhofer SIT sponsored by Infineon Technologies AG
- libuuid and wchar (for mbstate_t) are mandatory since version 4.2 and
  https://github.com/tpm2-software/tpm2-tools/commit/eca77c1419617a8e2d6d8008bac716878b0c27ca

https://github.com/tpm2-software/tpm2-tools/blob/4.3.2/doc/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tpm2-tools/Config.in       | 7 +++++--
 package/tpm2-tools/tpm2-tools.hash | 4 ++--
 package/tpm2-tools/tpm2-tools.mk   | 6 +++---
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index 35ca63bf64..cbdfeb6801 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -1,9 +1,12 @@
 config BR2_PACKAGE_TPM2_TOOLS
 	bool "tpm2-tools"
 	depends on !BR2_STATIC_LIBS # tpm2-tss
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_TPM2_TSS
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  TPM (Trusted Platform Module) 2.0 CLI tools based on system
 	  API of TPM2-TSS. These tools can be used to manage keys,
@@ -18,5 +21,5 @@ config BR2_PACKAGE_TPM2_TOOLS
 
 	  https://github.com/tpm2-software/tpm2-tools
 
-comment "tpm2-tools needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "tpm2-tools needs a toolchain w/ dynamic library, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
index dd55834825..bfb7e9b220 100644
--- a/package/tpm2-tools/tpm2-tools.hash
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  175472b63d1e047c2ad38314d06c36bd734ae37e0c6abfa2a804c0d6eb3f2936  tpm2-tools-4.1.2.tar.gz
-sha256  e10dce74279166bf7bc463eb6e462c2025bceb3e50cadfe865d92c1c3dc0bb21  LICENSE
+sha256  e2802d4093a24b2c65b1f913d0f4c68eadde9b8fd8a9b7a3b17a6e50765e8350  tpm2-tools-4.3.2.tar.gz
+sha256  f6995d52c8b8e4d2c3bace7fc9c330a77a90d808166fbad4d7ead7e8ba2fc66c  doc/LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 83be53d54b..e83db416aa 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-TPM2_TOOLS_VERSION = 4.1.2
+TPM2_TOOLS_VERSION = 4.3.2
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
-TPM2_TOOLS_LICENSE_FILES = LICENSE
-TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf
+TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
+TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf util-linux
 
 # -fstack-protector-all and FORTIFY_SOURCE=2 is used by
 # default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
-- 
2.30.2
