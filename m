From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 09:48:17 +0200
Subject: [Buildroot] [git commit] package/php-ssh2: fix kconfig circular
	deps after libssh2 fix
Message-ID: <20160912074824.0AD3981DAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6ab3e1e99aa0e8ff5fd4dcc7d12958c7aa25c2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After we simplified the libssh2 dependencies, the new dependencies were
not propagated to the php-ssh2 package, causing circular dependencies:

    package/openssl/Config.in:1:error: recursive dependency detected!
    package/openssl/Config.in:1:    symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_LIBSSH2
    package/libssh2/Config.in:1:    symbol BR2_PACKAGE_LIBSSH2 is selected by BR2_PACKAGE_PHP_SSH2
    package/php-ssh2/Config.in:1:   symbol BR2_PACKAGE_PHP_SSH2 depends on BR2_PACKAGE_OPENSSL

Just drop the now-useless dependency inherited from libssh2: libssh2 now
has no dependency.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php-ssh2/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/php-ssh2/Config.in b/package/php-ssh2/Config.in
index c795dd5..b457900 100644
--- a/package/php-ssh2/Config.in
+++ b/package/php-ssh2/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_PHP_SSH2
 	bool "php-ssh2"
 	depends on BR2_PACKAGE_PHP
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS \
-		&& !BR2_PACKAGE_OPENSSL # libssh2, libgcrypt
 	select BR2_PACKAGE_LIBSSH2
 	help
 	  PHP bindings for the libssh2 library.
