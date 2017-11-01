From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Wed,  1 Nov 2017 11:22:56 -0500
Subject: [Buildroot] [PATCH v4 1/1] package/libssh2: Add selectable crypto
 libraries
Message-ID: <1509553376-43168-1-git-send-email-sam.voss@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the selection of the backend is based on a priority order,
which is not always desirable: not all features are available for all
backends, as reported upstream:
    https://github.com/libssh2/libssh2/issues/213

As such, allow a user to select the backend most appropriate to their
use-case.

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>

--

[v3->v4]
 - Update configuration for "type->depends->select" ordering
 - Update patch message to be more descriptive

[v2->v3]
 - Fix comment about favoring mbedtls

[v1->v2]
 - Do not have comments when crypo is not selected, select it instead.
 - Do not select OpenSSL by default when libssh2 is selected if no
   others are chosen
---
 package/libssh2/Config.in  | 24 +++++++++++++++++++++++-
 package/libssh2/libssh2.mk |  8 ++++----
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
index 9b60823..f2d32a9 100644
--- a/package/libssh2/Config.in
+++ b/package/libssh2/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBSSH2
 	bool "libssh2"
-	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_MBEDTLS || BR2_PACKAGE_LIBGCRYPT)
 	help
 	  libssh2 is a client-side C library implementing the SSH2
 	  protocol as defined by Internet Drafts: SECSH-TRANS(22),
@@ -8,3 +7,26 @@ config BR2_PACKAGE_LIBSSH2
 	  SECSH-FILEXFER(06)*, SECSH-DHGEX(04), and SECSH-NUMBERS(10)
 
 	  http://www.libssh2.org/
+
+if BR2_PACKAGE_LIBSSH2
+
+choice
+	prompt "Crypto Backend"
+	help
+	  Select crypto library to be used in libssh2.
+
+config BR2_PACKAGE_LIBSSH2_MBEDTLS
+	bool "mbedtls"
+	select BR2_PACKAGE_MBEDTLS
+
+config BR2_PACKAGE_LIBSSH2_LIBGCRYPT
+	bool "gcrypt"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt -> libgpg-error
+	select BR2_PACKAGE_LIBGCRYPT
+
+config BR2_PACKAGE_LIBSSH2_OPENSSL
+	bool "openssl"
+	select BR2_PACKAGE_OPENSSL
+
+endchoice
+endif
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index d40e844..befac92 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -15,19 +15,19 @@ LIBSSH2_CONF_OPTS = --disable-examples-build
 LIBSSH2_AUTORECONF = YES
 
 # Dependency is one of mbedtls, libgcrypt or openssl, guaranteed in
-# Config.in. Favour mbedtls.
-ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+# Config.in.
+ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \
 	--with-crypto=mbedtls
-else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+else ifeq ($(BR2_PACKAGE_LIBSSH2_LIBGCRYPT),y)
 LIBSSH2_DEPENDENCIES += libgcrypt
 LIBSSH2_CONF_OPTS += --with-libgcrypt-prefix=$(STAGING_DIR)/usr \
 	--with-crypto=libgcrypt
 # configure.ac forgets to link to dependent libraries of gcrypt breaking static
 # linking
 LIBSSH2_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`"
-else
+else ifeq ($(BR2_PACKAGE_LIBSSH2_OPENSSL),y)
 LIBSSH2_DEPENDENCIES += openssl
 LIBSSH2_CONF_OPTS += --with-libssl-prefix=$(STAGING_DIR)/usr \
 	--with-crypto=openssl
-- 
1.9.1
