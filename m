From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 20 Dec 2019 16:34:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/dropbear: group post-extract hooks
 with their call site
Message-ID: <20191220153405.19108-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The organization of dropbear.mk was no longer very clear: for some
post-extract blocks, the block was separated from the place where it was
enabled, but for others they were grouped.

Regroup all blocks with their call site.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/dropbear/dropbear.mk | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 7cbc16bc3d..8e09786bf0 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -70,21 +70,26 @@ endif
 define DROPBEAR_ENABLE_REVERSE_DNS
 	echo '#define DO_HOST_LOOKUP 1'                 >> $(@D)/localoptions.h
 endef
+ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),)
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
+endif
 
 define DROPBEAR_BUILD_FEATURED
 	echo '#define DROPBEAR_SMALL_CODE 0'            >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_TWOFISH128 1'            >> $(@D)/localoptions.h
 	echo '#define DROPBEAR_TWOFISH256 1'            >> $(@D)/localoptions.h
 endef
-
-define DROPBEAR_DISABLE_STANDALONE
-	echo '#define NON_INETD_MODE 0'                 >> $(@D)/localoptions.h
-endef
+ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
+DROPBEAR_CONF_OPTS += --disable-zlib --enable-bundled-libtom
+else
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
+DROPBEAR_DEPENDENCIES += zlib libtomcrypt
+DROPBEAR_CONF_OPTS += --disable-bundled-libtom
+endif
 
 define DROPBEAR_CUSTOM_PATH
 	echo '#define DEFAULT_PATH $(BR2_SYSTEM_DEFAULT_PATH)' >>$(@D)/localoptions.h
 endef
-
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_CUSTOM_PATH
 
 define DROPBEAR_INSTALL_INIT_SYSTEMD
@@ -95,6 +100,10 @@ define DROPBEAR_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dropbear.service
 endef
 
+define DROPBEAR_DISABLE_STANDALONE
+	echo '#define NON_INETD_MODE 0'                 >> $(@D)/localoptions.h
+endef
+
 ifeq ($(BR2_USE_MMU),y)
 define DROPBEAR_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/dropbear/S50dropbear \
@@ -104,18 +113,6 @@ else
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_STANDALONE
 endif
 
-ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),)
-DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
-endif
-
-ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
-DROPBEAR_CONF_OPTS += --disable-zlib --enable-bundled-libtom
-else
-DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
-DROPBEAR_DEPENDENCIES += zlib libtomcrypt
-DROPBEAR_CONF_OPTS += --disable-bundled-libtom
-endif
-
 ifneq ($(BR2_PACKAGE_DROPBEAR_WTMP),y)
 DROPBEAR_CONF_OPTS += --disable-wtmp
 endif
-- 
2.23.0
