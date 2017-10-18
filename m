From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 22:32:40 -0400
Subject: [Buildroot] [PATCH 13/13] openssl: add libressl to virtual package
In-Reply-To: <20171018023240.22724-1-Adamduskett@outlook.com>
References: <20171018023240.22724-1-Adamduskett@outlook.com>
Message-ID: <20171018023240.22724-14-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At this point, libressl can be added to the openssl virtual package.
- Remove the entry package/libressl/Config.in from package/Config.in
- Remove the file: package/libressl/Config.in
- Add libressl entry to package/openssl/Config.in

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/Config.in          |  2 --
 package/libressl/Config.in | 20 --------------------
 package/openssl/Config.in  | 23 ++++++++++++++++++++++-
 3 files changed, 22 insertions(+), 23 deletions(-)
 delete mode 100644 package/libressl/Config.in

diff --git a/package/Config.in b/package/Config.in
index d4cf62708a..94004098d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1029,8 +1029,6 @@ menu "Crypto"
 	source "package/libuecc/Config.in"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
-	# libressl is a openssl replacement
-	source "package/libressl/Config.in"
 	source "package/openssl/Config.in"
 	source "package/rhash/Config.in"
 	source "package/tinydtls/Config.in"
diff --git a/package/libressl/Config.in b/package/libressl/Config.in
deleted file mode 100644
index 0a1c9e273e..0000000000
--- a/package/libressl/Config.in
+++ /dev/null
@@ -1,20 +0,0 @@
-config BR2_PACKAGE_LIBRESSL
-	bool "libressl"
-	depends on !BR2_PACKAGE_OPENSSL
-	help
-	  LibreSSL is a version of the TLS/crypto stack forked from
-	  OpenSSL in 2014, with goals of modernizing the codebase,
-	  improving security, and applying best practice development
-	  processes.
-
-	  http://www.libressl.org/
-
-if BR2_PACKAGE_LIBRESSL
-
-config BR2_PACKAGE_LIBRESSL_BIN
-	bool "openssl binary"
-	help
-	  Install the openssl binary to the target file system. This is
-	  a command line tool for doing various cryptographic stuff.
-
-endif
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 1b3e852fdb..5cb2c5b758 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -9,7 +9,7 @@ choice
 	prompt "ssl library"
 	default BR2_PACKAGE_LIBOPENSSL
 	help
-	  Select OpenSSL.
+	  Select OpenSSL or LibreSSL.
 
 config BR2_PACKAGE_LIBOPENSSL
 	bool "openssl"
@@ -41,6 +41,26 @@ config BR2_PACKAGE_LIBOPENSSL_ENGINES
 
 endif
 
+config BR2_PACKAGE_LIBRESSL
+	bool "libressl"
+	help
+	  LibreSSL is a version of the TLS/crypto stack forked from
+	  OpenSSL in 2014, with goals of modernizing the codebase,
+	  improving security, and applying best practice development
+	  processes.
+
+	  http://www.libressl.org/
+
+if BR2_PACKAGE_LIBRESSL
+
+config BR2_PACKAGE_LIBRESSL_BIN
+	bool "openssl binary"
+	help
+	  Install the openssl binary to the target file system. This is
+	  a command line tool for doing various cryptographic stuff.
+
+endif
+
 endchoice
 
 config BR2_PACKAGE_HAS_OPENSSL
@@ -49,4 +69,5 @@ config BR2_PACKAGE_HAS_OPENSSL
 config BR2_PACKAGE_PROVIDES_OPENSSL
 	string
 	default "libopenssl"  if BR2_PACKAGE_LIBOPENSSL
+	default "libressl"  if BR2_PACKAGE_LIBRESSL
 endif
-- 
2.13.6
