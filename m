From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Jul 2017 23:10:22 +0200
Subject: [Buildroot] [git commit] libssh2: fix link with libgcrypt
Message-ID: <20170709210725.574138211C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=816ba1cee50e9808702304f137de688ce2908d62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libssh2 uses the implicit 'yes' argument of the --with-libgcrypt parameter as
a library path prefix, which breaks the build. Pass the library path as
--with-libgcrypt argument to fix that. Drop the unneeded
--with-libgcrypt-prefix.

Fixes:
http://autobuild.buildroot.net/results/ac3/ac3a3f5871a6c20f5407a468809682ce491b9cb3/
http://autobuild.buildroot.net/results/ba3/ba31fa11b2ce2875649414dd9093e039dfc129e8/
http://autobuild.buildroot.net/results/b07/b07bbbf7fe164ba6dc435de6d8b41fadff7a3b08/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh2/libssh2.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index ab721ac..c658282 100644
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
