From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 25 Jun 2020 09:58:41 +0200
Subject: [Buildroot] [PATCH] package/dropbear: restore full
 BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO behaviour
Message-ID: <20200625075841.317226-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

now, BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO works like with version 2019.78
and as described in Config.in

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dropbear/dropbear.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index b32f39d64..b7342cef5 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -56,7 +56,14 @@ endef
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_SVR_PASSWORD_AUTH
 endif
 
-ifneq ($(BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO),y)
+ifeq ($(BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO),y)
+define DROPBEAR_ENABLE_LEGACY_CRYPTO
+	echo '#define DROPBEAR_3DES 1'                  >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_ENABLE_CBC_MODE 1'       >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_SHA1_96_HMAC 1'          >> $(@D)/localoptions.h
+endef
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_LEGACY_CRYPTO
+else
 define DROPBEAR_DISABLE_LEGACY_CRYPTO
 	echo '#define DROPBEAR_DSS 0'                   >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_DH_GROUP1 0'             >> $(@D)/localoptions.h
-- 
2.25.1
