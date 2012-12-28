From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 21:56:11 +0100
Subject: [Buildroot] [git commit] glib-networking: fix build failure with
	gnutls3
Message-ID: <20121228213151.46FEE9A4DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=484652cbd8d4a647f7833b2e032d0d37147e8424
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/glib-networking/glib-networking.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index b1eec4d..e8d71e5 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -25,4 +25,11 @@ else
 GLIB_NETWORKING_CONF_OPT += --without-gnutls
 endif
 
+# gnutls 3.x+ doesn't use libgcrypt, it uses nettle/hogweed
+define GLIB_NETWORKING_NO_LIBGCRYPT
+	$(SED) 's:#include <gcrypt.h>::' $(@D)/tls/gnutls/gtlsbackend-gnutls.c
+endef
+
+GLIB_NETWORKING_POST_EXTRACT_HOOKS += GLIB_NETWORKING_NO_LIBGCRYPT
+
 $(eval $(autotools-package))
