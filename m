From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 09:27:12 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libssh2: fix
 build with openssl and atomic
Message-ID: <20190606073243.33DBD8F059@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75d410af26c1535579185217c912cba866264e58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/e381eefa39307f1c8eb22f872df438b3fe0352dd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 42d89c9b29f0699661488b9109e77e3577f63e62)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh2/libssh2.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index ed0dd40bec..abee1f8c77 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -26,9 +26,12 @@ LIBSSH2_CONF_OPTS += --with-libgcrypt-prefix=$(STAGING_DIR)/usr \
 # linking
 LIBSSH2_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/libgcrypt-config --libs`"
 else ifeq ($(BR2_PACKAGE_LIBSSH2_OPENSSL),y)
-LIBSSH2_DEPENDENCIES += openssl
+LIBSSH2_DEPENDENCIES += host-pkgconf openssl
 LIBSSH2_CONF_OPTS += --with-libssl-prefix=$(STAGING_DIR)/usr \
 	--with-crypto=openssl
+# configure.ac forgets to link to dependent libraries of openssl breaking static
+# linking
+LIBSSH2_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 endif
 
 # Add zlib support if enabled
