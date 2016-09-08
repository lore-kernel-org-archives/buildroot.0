From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  8 Sep 2016 11:35:07 +0200
Subject: [Buildroot] [PATCH 2/2] package/libssh2: fix dependency on libgcrypt
In-Reply-To: <cover.1473326919.git.yann.morin.1998@free.fr>
References: <cover.1473326919.git.yann.morin.1998@free.fr>
Message-ID: <51fb04216a181a16f3bf41bc4c984234a4b256e5.1473326919.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 2f89476 (package/libgpg-error: bump to version 1.23), libssh2 has
inherited the dependency from libgcrypt (propagated from libgpg-error).

However, since libssh2 can use either openssl or libgcrypt as a backend,
the dependency should be relaxed when openssl is available.

But the test is broken and inverted: it will make libssh unavailable as
soon as openssl is enabled.

Fix the dependency.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: J?rg Krause <joerg.krause@embedded.rocks>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Romain Naour <romain.naour@openwide.fr>
---
 package/libssh2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libssh2/Config.in b/package/libssh2/Config.in
index 0deb3bb..e2e75d8 100644
--- a/package/libssh2/Config.in
+++ b/package/libssh2/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBSSH2
 	bool "libssh2"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && !BR2_PACKAGE_OPENSSL # libgcrypt
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS || BR2_PACKAGE_OPENSSL # libgcrypt
 	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
 	help
 	  libssh2 is a client-side C library implementing the SSH2
-- 
2.7.4
