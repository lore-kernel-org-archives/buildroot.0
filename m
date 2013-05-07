From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 May 2013 09:39:59 -0300
Subject: [Buildroot] [PATCH] dropbear: disable standalone mode for nommu
Message-ID: <1367930399-28232-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dropbear for nommu targets must disable the standalone (non-inetd) mode
since the platform lacks fork(), fixes:
http://autobuild.buildroot.net/results/ecbdfab10f54bec75c112bbf005bba9ae2b18dc8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dropbear/dropbear.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index d5dfe6d..50f6100 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -39,6 +39,14 @@ define DROPBEAR_BUILD_FEATURED
 	$(SED) 's:.*\(#define DROPBEAR_SHA2_512_HMAC\).*:\1:' $(@D)/options.h
 endef
 
+define DROPBEAR_DISABLE_STANDALONE
+	$(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
+endef
+
+ifeq ($(BR2_USE_MMU),)
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_STANDALONE
+endif
+
 ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),y)
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_REVERSE_DNS
 endif
-- 
1.8.1.5
