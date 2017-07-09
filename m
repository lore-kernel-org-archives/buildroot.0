From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  9 Jul 2017 22:05:24 +0300
Subject: [Buildroot] [PATCH] libssh2: fix link with libgcrypt
Message-ID: <2fef5081d7176868ea9bd4b9c00b083ac0de57aa.1499627124.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libssh2 uses the implicit 'yes' argument of the --with-libgcrypt parameter as
a library path prefix, which breaks the build. Pass the library path as
--with-libgcrypt argument to fix that. Drop the unneeded
--with-libgcrypt-prefix.

Fixes:
http://autobuild.buildroot.net/results/ac3/ac3a3f5871a6c20f5407a468809682ce491b9cb3/
http://autobuild.buildroot.net/results/ba3/ba31fa11b2ce2875649414dd9093e039dfc129e8/
http://autobuild.buildroot.net/results/b07/b07bbbf7fe164ba6dc435de6d8b41fadff7a3b08/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libssh2/libssh2.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index ab721ac2dc87..c658282349be 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -15,8 +15,7 @@ LIBSSH2_CONF_OPTS = --disable-examples-build
 # Favour libgcrypt.
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBSSH2_DEPENDENCIES += libgcrypt
-LIBSSH2_CONF_OPTS += --with-libgcrypt \
-	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
+LIBSSH2_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr \
 	--without-openssl
 # configure.ac forgets to link to dependent libraries of gcrypt breaking static
 # linking
-- 
2.13.2
