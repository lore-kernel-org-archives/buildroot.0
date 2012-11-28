From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:54:00 +0100
Subject: [Buildroot] [PATCH 01/51] package/cURL: fix static link whith
	openSSL
In-Reply-To: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1354146890-27380-2-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When openSSL is selected, cURL is configured to use it.

But in this case, the libcurl.pc file /forgets/ to require link
against -ldl.

This can happen, for example, when BR2_PREFER_STATIC_LIB is not set,
but an executable wants to be linked statically (for various reasons
which are irrelevant here).

Fix that by appending a 'Requires: openssl' line to libcurl.pc.in,
but only if openSSL is enabled.

As suggested by Arnout, do it in a post-patch hook, rather as a
post-install hook.

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libcurl/libcurl.mk |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 8d8fdb4..888f6d0 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -25,17 +25,20 @@ else
 LIBCURL_CONF_OPT += --without-ssl
 endif
 
+define LIBCURL_FIX_DOT_PC
+	printf 'Requires: openssl\n' >>$(@D)/libcurl.pc.in
+endef
+LIBCURL_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_OPENSSL),LIBCURL_FIX_DOT_PC)
+
 define LIBCURL_TARGET_CLEANUP
 	rm -rf $(TARGET_DIR)/usr/bin/curl-config \
 	       $(if $(BR2_PACKAGE_CURL),,$(TARGET_DIR)/usr/bin/curl)
 endef
-
 LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
 
 define LIBCURL_STAGING_FIXUP_CURL_CONFIG
 	$(SED) "s,prefix=/usr,prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/curl-config
 endef
-
 LIBCURL_POST_INSTALL_STAGING_HOOKS += LIBCURL_STAGING_FIXUP_CURL_CONFIG
 
 $(eval $(autotools-package))
-- 
1.7.2.5
