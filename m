From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Wed, 18 Apr 2018 16:24:32 +0200
Subject: [Buildroot] [PATCH 1/3] dropbear: Use macro to set options
Message-ID: <20180418142434.7268-1-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce a macro for editing options.h according to the Buildroot
configuration, replacing individual sed scripts.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/dropbear/dropbear.mk | 37 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 01a1a07b76..dc1fee207f 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -32,24 +32,25 @@ endef
 
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_FIX_XAUTH
 
-define DROPBEAR_ENABLE_REVERSE_DNS
-	$(SED) 's:.*\(#define DO_HOST_LOOKUP\).*:\1:' $(@D)/options.h
+define DROPBEAR_SET_OPT # (define, option)
+	if [ 'x$(2)' = 'xy' -o 'x$(2)' = 'x!' ]; then \
+		$(SED) 's:.*\(#define $(1)\)\([^A-Z0-9_]\|$$\).*:\1 1:' $(@D)/options.h; \
+	else \
+		$(SED) 's:.*\(#define $(1)\)\([^A-Z0-9_]\|$$\).*:/*\1*/:' $(@D)/options.h; \
+	fi
 endef
 
-define DROPBEAR_BUILD_SMALL
-	$(SED) 's:.*\(#define NO_FAST_EXPTMOD\).*:\1:' $(@D)/options.h
+define DROPBEAR_SET_OPTIONS
+	$(call DROPBEAR_SET_OPT,DROPBEAR_SMALL_CODE,$(BR2_PACKAGE_DROPBEAR_SMALL))
+	$(call DROPBEAR_SET_OPT,NO_FAST_EXPTMOD,$(BR2_PACKAGE_DROPBEAR_SMALL))
+	$(call DROPBEAR_SET_OPT,DO_HOST_LOOKUP,$(BR2_PACKAGE_DROPBEAR_ENABLE_REVERSE_DNS))
+	$(call DROPBEAR_SET_OPT,NON_INETD_MODE,$(BR2_USE_MMU))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_BLOWFISH,!$(BR2_PACKAGE_DROPBEAR_SMALL))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_TWOFISH128,!$(BR2_PACKAGE_DROPBEAR_SMALL))
+	$(call DROPBEAR_SET_OPT,DROPBEAR_TWOFISH256,!$(BR2_PACKAGE_DROPBEAR_SMALL))
 endef
 
-define DROPBEAR_BUILD_FEATURED
-	$(SED) 's:^#define DROPBEAR_SMALL_CODE::' $(@D)/options.h
-	$(SED) 's:.*\(#define DROPBEAR_BLOWFISH\).*:\1:' $(@D)/options.h
-	$(SED) 's:.*\(#define DROPBEAR_TWOFISH128\).*:\1:' $(@D)/options.h
-	$(SED) 's:.*\(#define DROPBEAR_TWOFISH256\).*:\1:' $(@D)/options.h
-endef
-
-define DROPBEAR_DISABLE_STANDALONE
-	$(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
-endef
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_SET_OPTIONS
 
 define DROPBEAR_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
@@ -64,19 +65,11 @@ define DROPBEAR_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/dropbear/S50dropbear \
 		$(TARGET_DIR)/etc/init.d/S50dropbear
 endef
-else
-DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_STANDALONE
-endif
-
-ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),)
-DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
 endif
 
 ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
-DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_SMALL
 DROPBEAR_CONF_OPTS += --disable-zlib
 else
-DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
 DROPBEAR_DEPENDENCIES += zlib
 endif
 
-- 
2.17.0
