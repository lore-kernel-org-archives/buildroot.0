From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 22:49:04 +0200
Subject: [Buildroot] [git commit] package/libssh2: fix dependency on
	libgcrypt
Message-ID: <20160911204935.5457D7FBAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8a2955a2b82d75f3684e846b0c2411294233eea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 2f89476 (package/libgpg-error: bump to version 1.23), libssh2 has
inherited the dependency from libgcrypt (propagated from libgpg-error).

However, since libssh2 can use either openssl or libgcrypt as a backend,
the dependency should be relaxed when openssl is available.

But the test is broken and inverted: it will make libssh unavailable as
soon as openssl is enabled.

Fix this dependenc byt doing what other similar packages do: select
openssl if the other crypto backend (here libgcrypt) is not enabled.
This also allows us to drop the propagated dependency on the arch
condition.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: J??rg Krause <joerg.krause@embedded.rocks>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libssh2/Config.in  | 3 +--
 package/libssh2/libssh2.mk | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
index 0deb3bb..2944624 100644
--- a/package/libssh2/Config.in
+++ b/package/libssh2/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBSSH2
 	bool "libssh2"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && !BR2_PACKAGE_OPENSSL # libgcrypt
-	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
 	help
 	  libssh2 is a client-side C library implementing the SSH2
 	  protocol as defined by Internet Drafts: SECSH-TRANS(22),
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 221fac4..847c2f1 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -11,8 +11,8 @@ LIBSSH2_LICENSE_FILES = COPYING
 LIBSSH2_INSTALL_STAGING = YES
 LIBSSH2_CONF_OPTS = --disable-examples-build
 
-# libssh2 must use either libgcrypt or OpenSSL
-# Only select openssl if libgcrypt is not selected
+# Dependency is either on libgcrypt or openssl, guaranteed in Config.in.
+# Favour libgcrypt.
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBSSH2_DEPENDENCIES += libgcrypt
 LIBSSH2_CONF_OPTS += --with-libgcrypt \
