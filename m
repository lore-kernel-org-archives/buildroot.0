From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 4 Nov 2017 22:50:12 +0100
Subject: [Buildroot] [git commit] package/libssh2: Add selectable crypto
 libraries
Message-ID: <20171104215135.3D2F6810AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04a1031d3429ff8e5a2ae4d820702c50519243a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the selection of the backend is based on a priority order,
which is not always desirable: not all features are available for all
backends, as reported upstream:
    https://github.com/libssh2/libssh2/issues/213
In that particular case, the problem is that libgcrypt is unable to
read encrypted certificates created with openssl, but it is likely
that other incompatibilities exist as well.

As such, allow a user to select the backend most appropriate to their
use-case.

Note that this changes the defaults: previously, if openssl was already
selected and we additionally select libssh2, openssl would be used as
a backend. Now, mbedtls is the default so if the user doesn't change
it, mbedtls will be used.

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
[Arnout: remove now-unneeded comment in .mk file]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libssh2/Config.in  | 24 +++++++++++++++++++++++-
 package/libssh2/libssh2.mk |  8 +++-----
 2 files changed, 26 insertions(+), 6 deletions(-)

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
index 1c8f47f..18e772c 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -14,20 +14,18 @@ LIBSSH2_CONF_OPTS = --disable-examples-build
 # building from a git clone
 LIBSSH2_AUTORECONF = YES
 
-# Dependency is one of mbedtls, libgcrypt or openssl, guaranteed in
-# Config.in. Favour mbedtls.
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
