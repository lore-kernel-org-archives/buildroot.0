From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 15:41:38 -0300
Subject: [Buildroot] [PATCH 2/2] gnutls: remove manual tools disabling kludge
In-Reply-To: <1450118498-30750-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450118498-30750-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450118498-30750-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's no longer required, tools are guarded by ENABLE_TOOLS in
Makefile.am and excluded accordingly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.mk | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index b8c5461..d63df99 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -22,7 +22,8 @@ GNUTLS_CONF_OPTS = \
 	--enable-openssl-compatibility \
 	--with-libnettle-prefix=$(STAGING_DIR)/usr \
 	--with-librt-prefix=$(STAGING_DIR) \
-	--without-tpm
+	--without-tpm \
+	$(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools)
 GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	ac_cv_header_wchar_h=$(if $(BR2_USE_WCHAR),yes,no) \
 	gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no) \
@@ -82,11 +83,4 @@ else
 GNUTLS_CONF_OPTS += --without-zlib
 endif
 
-define GNUTLS_DISABLE_TOOLS
-	$(SED) 's/\$$(PROGRAMS)//' $(@D)/src/Makefile.in
-	$(SED) 's/) install-exec-am/)/' $(@D)/src/Makefile.in
-endef
-
-GNUTLS_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_GNUTLS_TOOLS),,GNUTLS_DISABLE_TOOLS)
-
 $(eval $(autotools-package))
-- 
2.4.10
