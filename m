From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 16:47:21 -0300
Subject: [Buildroot] [PATCH 5/7] glib-networking: fix build failure with
	gnutls3
In-Reply-To: <1356724043-8879-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356724043-8879-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356724043-8879-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.8.6
