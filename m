From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 16 Jul 2017 12:12:59 -0400
Subject: [Buildroot] [PATCH 1/1] flip libressl and openssl dependency logic
Message-ID: <20170716161300.4338-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As it currently sits, if you have libressl selected and run make,
you will get this error message:

package/openssl/Config.in:1:error: recursive dependency detected!
symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_LIBRESSL
symbol BR2_PACKAGE_LIBRESSL depends on BR2_PACKAGE_OPENSSL

If you instead add "depends on !BR2_PACKAGE_LIBRESSL" to Openssl and remove
"depends on !BR2_PACKAGE_OPENSSL" from libressl, the error goes away.

This also has the added benefit of putting Libressl below OpenSSL in the
menuconfig, as Peter originally wanted.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/Config.in          | 2 +-
 package/libressl/Config.in | 1 -
 package/openssl/Config.in  | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b48ab5e0d..463ed3e75 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -989,9 +989,9 @@ menu "Crypto"
 	source "package/libuecc/Config.in"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
+	source "package/openssl/Config.in"
 	# libressl is a openssl replacement
 	source "package/libressl/Config.in"
-	source "package/openssl/Config.in"
 	source "package/rhash/Config.in"
 	source "package/tinydtls/Config.in"
 	source "package/trousers/Config.in"
diff --git a/package/libressl/Config.in b/package/libressl/Config.in
index 0a1c9e273..f827e24db 100644
--- a/package/libressl/Config.in
+++ b/package/libressl/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
-	depends on !BR2_PACKAGE_OPENSSL
 	help
 	  LibreSSL is a version of the TLS/crypto stack forked from
 	  OpenSSL in 2014, with goals of modernizing the codebase,
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index e08b648ba..cf331b9d6 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPENSSL
 	bool "openssl"
+	depends on !BR2_PACKAGE_LIBRESSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  A collaborative effort to develop a robust, commercial-grade, fully
-- 
2.13.3
