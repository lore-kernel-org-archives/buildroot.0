From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  8 Sep 2016 11:35:06 +0200
Subject: [Buildroot] [PATCH 1/2] package/libssh: fix dependency on libgcrypt
In-Reply-To: <cover.1473326919.git.yann.morin.1998@free.fr>
References: <cover.1473326919.git.yann.morin.1998@free.fr>
Message-ID: <201c0948734eafacde0c6d0aa47f0399745f1259.1473326919.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Fix this dependency.

Note: we need not propagate the libsh dependency to Kodi's sh option,
because kodi selects openssl, so we know that libssh will be available.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: J?rg Krause <joerg.krause@embedded.rocks>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Romain Naour <romain.naour@openwide.fr>
---
 package/libssh/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index 6029f45..9e71e57 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBSSH
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Either OpenSSL or libgcrypt are mandatory
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && !BR2_PACKAGE_OPENSSL # libgcrypt
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS || BR2_PACKAGE_OPENSSL # libgcrypt
 	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
 	help
 	  libssh is a multiplatform C library implementing the SSHv2
-- 
2.7.4
