From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 26 Jun 2017 12:25:36 -0400
Subject: [Buildroot] [PATCH v3 1/3] libssl: new virtual package
Message-ID: <20170626162538.27101-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libressl is API compatible with OpenSSL 1.0.1 and is almost API
compatible with OpenSSL 1.0.2.  As such, a new virtual package is needed
to handle having both libressl and openssl.

To start, add OpenSSL as the only provider. In the following patches
libressl will also be added as a provider.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
Changes v2 -> v3:
  - Moved this patch to the start of the series. (Thomas)
  - Made the virtual package closer to that of jpeg. (Thomas)
  - Added OpenSSL as the default provider.
  - Removed openssl/Config.in.
  - Removed source "package/openssl/Config.in" in package/Config.in

Changes v1 -> v2:
  - None.
    
 package/Config.in          |  2 +-
 package/libssl/Config.in   | 53 ++++++++++++++++++++++++++++++++++++++++++++++
 package/libssl/libssl.mk   |  8 +++++++
 package/openssl/Config.in  | 28 ------------------------
 package/openssl/openssl.mk |  1 +
 5 files changed, 63 insertions(+), 29 deletions(-)
 create mode 100644 package/libssl/Config.in
 create mode 100644 package/libssl/libssl.mk
 delete mode 100644 package/openssl/Config.in

diff --git a/package/Config.in b/package/Config.in
index f69f67f..3e42f56 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -978,6 +978,7 @@ menu "Crypto"
 	source "package/libscrypt/Config.in"
 	source "package/libsecret/Config.in"
 	source "package/libsha1/Config.in"
+	source "package/libssl/Config.in"
 	source "package/libsodium/Config.in"
 	source "package/libssh/Config.in"
 	source "package/libssh2/Config.in"
@@ -985,7 +986,6 @@ menu "Crypto"
 	source "package/libuecc/Config.in"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
-	source "package/openssl/Config.in"
 	source "package/rhash/Config.in"
 	source "package/tinydtls/Config.in"
 	source "package/trousers/Config.in"
diff --git a/package/libssl/Config.in b/package/libssl/Config.in
new file mode 100644
index 0000000..5b912e6
--- /dev/null
+++ b/package/libssl/Config.in
@@ -0,0 +1,53 @@
+config BR2_PACKAGE_LIBSSL
+	bool "libssl support"
+	help
+	  Select the desired ssl library provider.
+
+if BR2_PACKAGE_LIBSSL
+
+choice
+	prompt "libssl variant"
+	default BR2_PACKAGE_OPENSSL
+	help
+	  Select OpenSSL
+
+config BR2_PACKAGE_OPENSSL
+	bool "openssl"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_HAS_LIBSSL
+	help
+	  A collaborative effort to develop a robust, commercial-grade,
+	  fully featured, and Open Source toolkit implementing the
+	  Secure Sockets Layer (SSL v2/v3) and Transport Security
+	  (TLS v1) as well as a full-strength general-purpose
+	  cryptography library.
+
+	  http://www.openssl.org/
+	  Note: Some helper scripts need perl.
+
+endchoice
+
+if BR2_PACKAGE_OPENSSL
+
+config BR2_PACKAGE_OPENSSL_BIN
+	bool "openssl binary"
+	help
+	  Install the openssl binary and the associated helper scripts
+	  to the target file system. This is a command line tool for
+	  doing various cryptographic stuff.
+
+config BR2_PACKAGE_OPENSSL_ENGINES
+	bool "openssl additional engines"
+	help
+	  Install additional encryption engine libraries.
+
+endif
+
+config BR2_PACKAGE_HAS_LIBSSL
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBSSL
+	string
+	default "openssl"    if BR2_PACKAGE_OPENSSL
+
+endif
diff --git a/package/libssl/libssl.mk b/package/libssl/libssl.mk
new file mode 100644
index 0000000..3bd775d
--- /dev/null
+++ b/package/libssl/libssl.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# libssl
+#
+################################################################################
+
+$(eval $(virtual-package))
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
deleted file mode 100644
index e08b648..0000000
--- a/package/openssl/Config.in
+++ /dev/null
@@ -1,28 +0,0 @@
-config BR2_PACKAGE_OPENSSL
-	bool "openssl"
-	select BR2_PACKAGE_ZLIB
-	help
-	  A collaborative effort to develop a robust, commercial-grade, fully
-	  featured, and Open Source toolkit implementing the Secure Sockets
-	  Layer (SSL v2/v3) and Transport Security (TLS v1) as well as a
-	  full-strength general-purpose cryptography library.
-
-	  http://www.openssl.org/
-
-	  Note: Some helper scripts need perl.
-
-if BR2_PACKAGE_OPENSSL
-
-config BR2_PACKAGE_OPENSSL_BIN
-	bool "openssl binary"
-	help
-	  Install the openssl binary and the associated helper scripts to the
-	  target file system. This is a command line tool for doing various
-	  cryptographic stuff.
-
-config BR2_PACKAGE_OPENSSL_ENGINES
-	bool "openssl additional engines"
-	help
-	  Install additional encryption engine libraries.
-
-endif
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 5f56b44..c028290 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -10,6 +10,7 @@ OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
+OPENSSL_PROVIDES = libssl
 HOST_OPENSSL_DEPENDENCIES = host-zlib
 OPENSSL_TARGET_ARCH = generic32
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
-- 
2.9.4
