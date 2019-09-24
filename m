From: Mircea Gliga <gliga.mircea@gmail.com>
Date: Tue, 24 Sep 2019 16:26:02 +0300
Subject: [Buildroot] [PATCH v2] package/libssh: add support for mbedtls
 crypto backend
In-Reply-To: <20190918110609.7172-1-gliga.mircea@gmail.com>
References: <20190918110609.7172-1-gliga.mircea@gmail.com>
Message-ID: <20190924132602.25186-1-gliga.mircea@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At this point Buildroot doesn't allow to use mbedTLS crypto
backend even though libssh supports it. In case of fully statically
linked ELF executables the size difference between OpenSSL and mbedTLS
is significant: it matters for embedded targets with very limited
storage.

This patch adds support for compiling libssh with mbedTLS as a
crypto backend. It also allows the selection of the crypto backend
libssh will use through a choice in the package config.

Currently, the selection of the backend is based on a priority order,
which is not always desirable, as in some cases multiple backends
can exists at the same time for various reasons.

Switch to OpenSSL as the default crypto backend, instead of libgcrypt,
since OpenSSL is more commonly used.

Signed-off-by: Mircea Gliga <gliga.mircea@gmail.com>

---
Changes V1->V2:
* choice now selects the crypto provider package
* more detailed description in commit message
* switch default crypto backend to OpenSSL
---
 package/libssh/Config.in | 26 ++++++++++++++++++++++++--
 package/libssh/libssh.mk | 10 +++++-----
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index 3dbfa7d561..f31b35f9ab 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_LIBSSH
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# Either OpenSSL or libgcrypt are mandatory
-	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
 	help
 	  libssh is a multiplatform C library implementing the SSHv2
 	  and SSHv1 protocol on client and server side. With libssh,
@@ -13,6 +11,30 @@ config BR2_PACKAGE_LIBSSH
 
 	  http://www.libssh.org/
 
+if BR2_PACKAGE_LIBSSH
+
+choice
+	prompt "Crypto Backend"
+	default BR2_PACKAGE_LIBSSH_OPENSSL
+	help
+	  Select crypto library to be used in libssh.
+
+config BR2_PACKAGE_LIBSSH_MBEDTLS
+	bool "mbedtls"
+	select BR2_PACKAGE_MBEDTLS
+
+config BR2_PACKAGE_LIBSSH_LIBGCRYPT
+	bool "gcrypt"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
+	select BR2_PACKAGE_LIBGCRYPT
+
+config BR2_PACKAGE_LIBSSH_OPENSSL
+	bool "openssl"
+	select BR2_PACKAGE_OPENSSL
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
