From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Tue, 31 Oct 2017 10:53:38 -0500
Subject: [Buildroot] [PATCH v3 2/2] package/libssh2: Add selectable crypto
	libraries
In-Reply-To: <1509465218-55386-1-git-send-email-sam.voss@rockwellcollins.com>
References: <1509465218-55386-1-git-send-email-sam.voss@rockwellcollins.com>
Message-ID: <1509465218-55386-2-git-send-email-sam.voss@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add functionality to allow crypto libraries for libssh2 to be selectable
by a choice instead of a fallback that may not work in all cases.
Previous fallback is maintained from within the "defaults" of the choice
menu, but can be overridden by making a choice.

This fixes issues where two crypto libraries are present on the system,
but the fallback order picks the wrong one.

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>

--

[v1->v2]
 - Do not have comments when crypo is not selected, select it instead.
 - Do not select OpenSSL by default when libssh2 is selected if no
   others are chosen
---
 package/libssh2/Config.in  | 24 +++++++++++++++++++++++-
 package/libssh2/libssh2.mk |  6 +++---
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
index 9b60823..fcdbbf3 100644
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
+	select BR2_PACKAGE_MBEDTLS
+	bool "mbedtls"
+
+config BR2_PACKAGE_LIBSSH2_LIBGCRYPT
+	select BR2_PACKAGE_LIBGCRYPT
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt -> libgpg-error
+	bool "gcrypt"
+
+config BR2_PACKAGE_LIBSSH2_OPENSSL
+	select BR2_PACKAGE_OPENSSL
+	bool "openssl"
+
+endchoice
+endif
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 84f2113..befac92 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -16,18 +16,18 @@ LIBSSH2_AUTORECONF = YES
 
 # Dependency is one of mbedtls, libgcrypt or openssl, guaranteed in
 # Config.in.
-ifeq ($(BR2_PACKAGE_MBEDTLS),y)
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
