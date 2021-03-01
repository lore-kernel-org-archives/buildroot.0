From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Mar 2021 22:34:22 +0100
Subject: [Buildroot] [git commit] package/tpm2-pkcs11: needs threads
Message-ID: <20210301211158.712C88141C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9598b7a00bc7a97070cc38c5f241262c27a7f056
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tpm2-pkcs11 fails to build without threads since its addition with
commit 42db2c7236c2249ec02608ed714fa6f95e36161b

Fixes:
 - http://autobuild.buildroot.org/results/8218776da34cc4a20663ae6737ad7727b12d8cd2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
