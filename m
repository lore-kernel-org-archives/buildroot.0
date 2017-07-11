From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Jul 2017 21:34:56 +0200
Subject: [Buildroot] [git commit] libssh2: add mbedtls backend
Message-ID: <20170711193642.972BB80767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=714df4cfed026cee2949131062e499b6c0fadd5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libssh2 support mbedtls as crypto back-end library since version 1.8.0.

Default to mbedtls since it's smaller than either libgcrypt or openssl.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh2/Config.in  |  2 +-
 package/libssh2/libssh2.mk | 14 +++++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
index 2944624..9b60823 100644
--- a/package/libssh2/Config.in
+++ b/package/libssh2/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBSSH2
 	bool "libssh2"
-	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_MBEDTLS || BR2_PACKAGE_LIBGCRYPT)
 	help
 	  libssh2 is a client-side C library implementing the SSH2
 	  protocol as defined by Internet Drafts: SECSH-TRANS(22),
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index c658282..338f5b4 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -11,12 +11,16 @@ LIBSSH2_LICENSE_FILES = COPYING
 LIBSSH2_INSTALL_STAGING = YES
 LIBSSH2_CONF_OPTS = --disable-examples-build
 
-# Dependency is either on libgcrypt or openssl, guaranteed in Config.in.
-# Favour libgcrypt.
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+# Dependency is one of mbedtls, libgcrypt or openssl, guaranteed in
+# Config.in. Favour mbedtls.
+ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+LIBSSH2_DEPENDENCIES += mbedtls
+LIBSSH2_CONF_OPTS += --with-mbedtls=$(STAGING_DIR)/usr \
+	--without-openssl --without-libgcrypt
+else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBSSH2_DEPENDENCIES += libgcrypt
 LIBSSH2_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr \
-	--without-openssl
+	--without-openssl --without-mbedtls
 # configure.ac forgets to link to dependent libraries of gcrypt breaking static
 # linking
 LIBSSH2_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`"
@@ -24,7 +28,7 @@ else
 LIBSSH2_DEPENDENCIES += openssl
 LIBSSH2_CONF_OPTS += --with-openssl \
 	--with-libssl-prefix=$(STAGING_DIR)/usr \
-	--without-libgcrypt
+	--without-libgcrypt --without-mbedtls
 endif
 
 # Add zlib support if enabled
