From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Dec 2012 23:21:00 -0800
Subject: [Buildroot] [git commit] package/cURL: fix static link whith openSSL
Message-ID: <20121203145717.BBDAB81E08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61d322c3d258072460fddbab0b39c8bf4cc3e0bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
