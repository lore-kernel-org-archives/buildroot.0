From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Feb 2015 10:29:46 +0100
Subject: [Buildroot] [git commit] libmicrohttpd: fix static linking with
	gnutls
Message-ID: <20150203093000.57FF080E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d3d6d258bb9c03b51b14c810c60be85ca46338b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/f5a/f5a135647867ca98ce6189bb343a631ce6a47e23/

gnutls links to a number of libraries depending on configuration (pthread,
iconv, ..), so we need to link against those as well when statically
linking.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmicrohttpd/libmicrohttpd.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 80dcfa0..0575b74 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -12,7 +12,8 @@ LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-spdy
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 LIBMICROHTTPD_LICENSE = LGPLv2.1+
-LIBMICROHTTPD_DEPENDENCIES += gnutls libgcrypt
+LIBMICROHTTPD_DEPENDENCIES += host-pkgconf gnutls libgcrypt
+LIBMICROHTTPD_CONF_ENV += LIBS="$(shell $(PKG_CONFIG_HOST_BINARY) --libs gnutls)"
 LIBMICROHTTPD_CONF_OPTS += --enable-https --with-gnutls=$(STAGING_DIR)/usr \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
