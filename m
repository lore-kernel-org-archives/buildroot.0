From: Mircea Gliga <gliga.mircea@gmail.com>
Date: Wed, 18 Sep 2019 14:06:09 +0300
Subject: [Buildroot] [PATCH 1/1] package/libssh: add support for mbedtls
 crypto backend
Message-ID: <20190918110609.7172-1-gliga.mircea@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libssh supports mbedtls as a crypto backend. Allow selection of crypto
backend libssh will use through a choice in the package config. The
default will be to select the first enabled crypto backend provider in
the same preference order as is used now, i.e. no change from current
behavior.

Signed-off-by: Mircea Gliga <gliga.mircea@gmail.com>
---
 package/libssh/Config.in | 28 ++++++++++++++++++++++++++--
 package/libssh/libssh.mk | 10 +++++-----
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index 3dbfa7d561..d74c821d06 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_LIBSSH
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# Either OpenSSL or libgcrypt are mandatory
-	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_MBEDTLS || BR2_PACKAGE_LIBGCRYPT)
 	help
 	  libssh is a multiplatform C library implementing the SSHv2
 	  and SSHv1 protocol on client and server side. With libssh,
@@ -13,6 +12,31 @@ config BR2_PACKAGE_LIBSSH
 
 	  http://www.libssh.org/
 
+if BR2_PACKAGE_LIBSSH
+
+choice
+	prompt "Crypto Backend"
+	default BR2_PACKAGE_LIBSSH_LIBGCRYPT if BR2_PACKAGE_LIBGCRYPT
+	default BR2_PACKAGE_LIBSSH_OPENSSL if BR2_PACKAGE_OPENSSL
+	default BR2_PACKAGE_LIBSSH_MBEDTLS if BR2_PACKAGE_MBEDTLS
+	help
+	  Select crypto library to be used in libssh.
+
+config BR2_PACKAGE_LIBSSH_MBEDTLS
+	bool "mbedtls"
+	depends on BR2_PACKAGE_MBEDTLS
+
+config BR2_PACKAGE_LIBSSH_LIBGCRYPT
+	bool "gcrypt"
+	depends on BR2_PACKAGE_LIBGCRYPT
+
+config BR2_PACKAGE_LIBSSH_OPENSSL
+	bool "openssl"
+	depends on BR2_PACKAGE_OPENSSL
+
+endchoice
+endif
+
 comment "libssh needs a toolchain w/ dynamic library, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index d5f22c29a0..7ee23ca6ba 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -27,13 +27,13 @@ else
 LIBSSH_CONF_OPTS += -DWITH_ZLIB=OFF
 endif
 
-# Dependency is either on libgcrypt or openssl, guaranteed in Config.in.
-# Favour libgcrypt.
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+ifeq ($(BR2_PACKAGE_LIBSSH_MBEDTLS),y)
+LIBSSH_CONF_OPTS += -DWITH_MBEDTLS=ON
+LIBSSH_DEPENDENCIES += mbedtls
+else ifeq ($(BR2_PACKAGE_LIBSSH_LIBGCRYPT),y)
 LIBSSH_CONF_OPTS += -DWITH_GCRYPT=ON
 LIBSSH_DEPENDENCIES += libgcrypt
-else
-LIBSSH_CONF_OPTS += -DWITH_GCRYPT=OFF
+else ifeq ($(BR2_PACKAGE_LIBSSH_OPENSSL),y)
 LIBSSH_DEPENDENCIES += openssl
 endif
 
-- 
2.23.0
