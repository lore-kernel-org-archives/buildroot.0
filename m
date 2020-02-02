From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2020 20:37:01 +0100
Subject: [Buildroot] [git commit] package/libssh: add support for mbedtls
 crypto backend
Message-ID: <20200202192658.9F2B288385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c93ddf0eaf0b8ff68dcdbbbbfef045e219d69cd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At this point Buildroot doesn't allow to use mbedTLS crypto
backend even though libssh supports it. In case of fully statically
linked ELF executables the size difference between OpenSSL and mbedTLS
is significant: it matters for embedded targets with very limited
storage.

This patch adds support for compiling libssh with mbedTLS as a crypto
backend.  It also allows the selection of the crypto backend libssh will use
through a choice in the package config, similar to libssh2.

Currently, the selection of the backend is based on a priority order,
which is not always desirable, as in some cases multiple backends
can exists at the same time for various reasons.

Signed-off-by: Mircea Gliga <gliga.mircea@gmail.com>
[Peter: use depends on rather can select for consistency with libssh2]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh/Config.in | 22 ++++++++++++++++++++--
 package/libssh/libssh.mk | 10 +++++-----
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index a6cf1f8960..cde73a0d87 100644
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
@@ -20,6 +19,25 @@ config BR2_PACKAGE_LIBSSH_SERVER
 	help
 	  Enable libssh server support
 
+choice
+	prompt "Crypto Backend"
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
+
 endif
 
 comment "libssh needs a toolchain w/ dynamic library, threads"
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 161040b346..52517a5dd0 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -32,13 +32,13 @@ else
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
 
