From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Sep 2013 16:54:52 +0200
Subject: [Buildroot] [git commit] libssh2: fix library search path issues
Message-ID: <20130926151558.F11469B852@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=471629063069e2f6ef9b9a2abb9bd323cc26c3ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix issues with some toolchains not finding libssl or libgcrypt.

Fixes http://autobuild.buildroot.net/results/eeaaf41c0c5f88357af8445750dce776774c2b5d
Fixes http://autobuild.buildroot.net/results/7a2590a7c3a1f52590f3e886b7cf9d04ad966a10

[Peter: indentation fixup]
Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libssh2/libssh2.mk |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index 10eb5ed..19df9af 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -15,10 +15,14 @@ LIBSSH2_CONF_OPT = --disable-examples-build
 # Only select openssl if libgcrypt is not selected
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBSSH2_DEPENDENCIES += libgcrypt
-LIBSSH2_CONF_OPT += --with-libgcrypt --without-openssl
+LIBSSH2_CONF_OPT += --with-libgcrypt \
+	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
+	--without-openssl
 else
 LIBSSH2_DEPENDENCIES += openssl
-LIBSSH2_CONF_OPT += --with-openssl --without-libgcrypt
+LIBSSH2_CONF_OPT += --with-openssl \
+	--with-libssl-prefix=$(STAGING_DIR)/usr \
+	--without-libgcrypt
 endif
 
 # Add zlib support if enabled
