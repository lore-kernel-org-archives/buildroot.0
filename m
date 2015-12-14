From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 15:41:37 -0300
Subject: [Buildroot] [PATCH 1/2] gnutls: remove manual doc disabling kludge
Message-ID: <1450118498-30750-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's no longer required, SUBDIRS += doc is guarded by ENABLE_DOC in
Makefile.am and the only place where it's used regardless is in
dist-hook which isn't used by buildroot.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 737e4b1..b8c5461 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -82,17 +82,11 @@ else
 GNUTLS_CONF_OPTS += --without-zlib
 endif
 
-# Some examples in doc/examples use wchar
-define GNUTLS_DISABLE_DOCS
-	$(SED) 's/ doc / /' $(@D)/Makefile.in
-endef
-
 define GNUTLS_DISABLE_TOOLS
 	$(SED) 's/\$$(PROGRAMS)//' $(@D)/src/Makefile.in
 	$(SED) 's/) install-exec-am/)/' $(@D)/src/Makefile.in
 endef
 
-GNUTLS_POST_PATCH_HOOKS += GNUTLS_DISABLE_DOCS
 GNUTLS_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_GNUTLS_TOOLS),,GNUTLS_DISABLE_TOOLS)
 
 $(eval $(autotools-package))
-- 
2.4.10
