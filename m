From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 19 Jul 2014 12:16:11 -0300
Subject: [Buildroot] [PATCH] openssl: drop libdl from pc file
Message-ID: <1405782971-8345-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/2a2/2a274e2dbffd268a391b0e8a15dae5a759b870a1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 743ca52..30e1748 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -115,6 +115,14 @@ define OPENSSL_INSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
 
+# libdl has no business in a static build
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+define OPENSSL_FIXUP_STATIC_PKGCONFIG
+	$(SED) 's/-ldl//' $(STAGING_DIR)/usr/lib/pkgconfig/openssl.pc
+endef
+endif
+OPENSSL_POST_INSTALL_STAGING_HOOKS += OPENSSL_FIXUP_STATIC_PKGCONFIG
+
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
 # libraries gets installed read only, so strip fails
 define OPENSSL_INSTALL_FIXUPS_SHARED
-- 
1.8.5.5
