From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 22:48:56 +0200
Subject: [Buildroot] [git commit] package/libssh: fix dependency on libgcrypt
Message-ID: <20160911204935.4B7AD819DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ede9ca16e1726dfca333feba8b92cae3d5acf95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 2f89476 (package/libgpg-error: bump to version 1.23), libssh has
inherited the dependency from libgcrypt (propagated from libgpg-error).

However, since libssh can use either openssl or libgcrypt as a backend,
the dependency should be relaxed when openssl is available.

But the test is broken and inverted: it will make libssh unavailable as
soon as openssl is enabled.

This in itself is already incorrect, but that can cause further issues,
as some packages (e.g. Kodi) will select (indirectly) openssl, and has
an option to select libssh; enabling that option causes unmet direct
dependencies of libssh:

    warning: (BR2_PACKAGE_KODI_LIBSSH) selects BR2_PACKAGE_LIBSSH which
    has unmet direct dependencies (BR2_USE_MMU && !BR2_STATIC_LIBS &&
    BR2_TOOLCHAIN_HAS_THREADS && BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
    && !BR2_PACKAGE_OPENSSL)

Fix this dependency by doing what other similar packages do: select
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
 package/libssh/Config.in | 3 +--
 package/libssh/libssh.mk | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index 6029f45..3dbfa7d 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -4,8 +4,7 @@ config BR2_PACKAGE_LIBSSH
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Either OpenSSL or libgcrypt are mandatory
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && !BR2_PACKAGE_OPENSSL # libgcrypt
-	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
 	help
 	  libssh is a multiplatform C library implementing the SSHv2
 	  and SSHv1 protocol on client and server side. With libssh,
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 29bbf4e..429e3c1 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -23,14 +23,14 @@ else
 LIBSSH_CONF_OPTS += -DWITH_ZLIB=OFF
 endif
 
+# Dependency is either on libgcrypt or openssl, guaranteed in Config.in.
+# Favour libgcrypt.
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBSSH_CONF_OPTS += -DWITH_GCRYPT=ON
 LIBSSH_DEPENDENCIES += libgcrypt
 else
 LIBSSH_CONF_OPTS += -DWITH_GCRYPT=OFF
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBSSH_DEPENDENCIES += openssl
 endif
-endif
 
 $(eval $(cmake-package))
