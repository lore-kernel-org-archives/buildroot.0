From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Jan 2013 14:00:01 +0100
Subject: [Buildroot] [git commit] libeet: fix build with gcrypt
Message-ID: <20130101130012.16B069A585@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3628791f6f978d23fc07ae0d94a09a1153d2de85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libeet needs both gnutls and libgcrypt for ssl handling.

Fixes http://autobuild.buildroot.net/results/tmp/f45782cf73338930644c69dccf2f18167083d121/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libeet/libeet.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index a5a1ce1..7034198 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -14,5 +14,13 @@ LIBEET_INSTALL_STAGING = YES
 
 LIBEET_DEPENDENCIES = host-pkgconf zlib jpeg libeina
 
+ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
+LIBEET_DEPENDENCIES += gnutls libgcrypt
+LIBEET_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+LIBEET_CONF_OPT += --enable-gnutls
+else
+LIBEET_CONF_OPT += --disable-gnutls
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
