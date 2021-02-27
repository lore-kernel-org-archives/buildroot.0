From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 27 Feb 2021 20:26:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/tpm2-pkcs11: needs threads
Message-ID: <20210227192639.6703-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tpm2-pkcs11 fails to build without threads since its addition with
commit 42db2c7236c2249ec02608ed714fa6f95e36161b

Fixes:
 - http://autobuild.buildroot.org/results/8218776da34cc4a20663ae6737ad7727b12d8cd2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tpm2-pkcs11/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-pkcs11/Config.in b/package/tpm2-pkcs11/Config.in
index 46d5cab07e..5d45703223 100644
--- a/package/tpm2-pkcs11/Config.in
+++ b/package/tpm2-pkcs11/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TPM2_PKCS11
 	bool "tpm2-pkcs11"
 	depends on !BR2_STATIC_LIBS # tpm2-tss
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBYAML
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_SQLITE
@@ -10,5 +11,5 @@ config BR2_PACKAGE_TPM2_PKCS11
 
 	  https://github.com/tpm2-software/tpm2-pkcs11
 
-comment "tpm2-pkcs11 needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "tpm2-pkcs11 needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.30.0
