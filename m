From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Jun 2020 23:06:31 +0200
Subject: [Buildroot] [git commit] package/dropbear: restore full
 BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO behaviour
Message-ID: <20200625210433.A143E86089@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98967b5193c3d5fed510cf85f781b59739cf88f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

now, BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO works like with version 2019.78
and as described in Config.in

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Acked-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dropbear/dropbear.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index b32f39d647..b7342cef51 100644
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
