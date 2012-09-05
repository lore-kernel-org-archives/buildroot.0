From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  6 Sep 2012 00:01:36 +0200
Subject: [Buildroot] [PATCH] package/cURL: fix static link whith openSSL
Message-ID: <1346882496-8114-1-git-send-email-yann.morin.1998@free.fr>
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

Fix that by appending a 'Requires: openssl' line to the installed
libcurl.pc, if openSSL is enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libcurl/libcurl.mk |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 090bb4c..6441a80 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -29,14 +29,20 @@ define LIBCURL_TARGET_CLEANUP
 	rm -rf $(TARGET_DIR)/usr/bin/curl-config \
 	       $(if $(BR2_PACKAGE_CURL),,$(TARGET_DIR)/usr/bin/curl)
 endef
-
+define LIBCURL_FIX_TARGET_PC
+	printf 'Requires: openssl\n' >>$(TARGET_DIR)/usr/lib/pkgconfig/libcurl.pc
+endef
 LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
+LIBCURL_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_OPENSSL),LIBCURL_FIX_TARGET_PC)
 
 define LIBCURL_STAGING_FIXUP_CURL_CONFIG
 	$(SED) "s,prefix=/usr,prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/curl-config
 endef
-
+define LIBCURL_FIX_STAGING_PC
+	printf 'Requires: openssl\n' >>$(STAGING_DIR)/usr/lib/pkgconfig/libcurl.pc
+endef
 LIBCURL_POST_INSTALL_STAGING_HOOKS += LIBCURL_STAGING_FIXUP_CURL_CONFIG
+LIBCURL_POST_INSTALL_STAGING_HOOKS += $(if $(BR2_PACKAGE_OPENSSL),LIBCURL_FIX_STAGING_PC)
 
 $(eval $(autotools-package))
 
-- 
1.7.2.5
