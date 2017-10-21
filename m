From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:28:13 +0200
Subject: [Buildroot] [git commit] openssl: add libressl as a provider
Message-ID: <20171021192125.DA3A181112@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=791ceb583b3592621031e4241f12932d09e00a3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At this point, libressl can be added to the openssl virtual package.

- Remove the entry package/libressl/Config.in from package/Config.in
- Remove the file: package/libressl/Config.in
- Add libressl entry to package/openssl/Config.in

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |  2 --
 package/libressl/Config.in | 20 --------------------
 package/openssl/Config.in  | 24 +++++++++++++++++++++++-
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2a2df47..55fe801 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1031,8 +1031,6 @@ menu "Crypto"
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
index 0a1c9e2..0000000
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
index b8d106f..df1d117 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -13,7 +13,7 @@ choice
 	prompt "ssl library"
 	default BR2_PACKAGE_LIBOPENSSL
 	help
-	  Select OpenSSL.
+	  Select OpenSSL or LibreSSL.
 
 config BR2_PACKAGE_LIBOPENSSL
 	bool "openssl"
@@ -45,6 +45,27 @@ config BR2_PACKAGE_LIBOPENSSL_ENGINES
 
 endif
 
+config BR2_PACKAGE_LIBRESSL
+	bool "libressl"
+	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
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
@@ -53,6 +74,7 @@ config BR2_PACKAGE_HAS_OPENSSL
 config BR2_PACKAGE_PROVIDES_OPENSSL
 	string
 	default "libopenssl"  if BR2_PACKAGE_LIBOPENSSL
+	default "libressl"  if BR2_PACKAGE_LIBRESSL
 
 config BR2_PACKAGE_PROVIDES_HOST_OPENSSL
 	string
