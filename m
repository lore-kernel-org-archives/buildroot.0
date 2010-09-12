From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:51 +0200
Subject: [Buildroot] [PATCH 65/74] speex: convert to new style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bfa1a7fc13f9e1ed4cd4c04700779d246ac31787.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/speex/speex.mk |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/multimedia/speex/speex.mk b/package/multimedia/speex/speex.mk
index e246b24..7de3b38 100644
--- a/package/multimedia/speex/speex.mk
+++ b/package/multimedia/speex/speex.mk
@@ -12,7 +12,7 @@ SPEEX_INSTALL_TARGET = YES
 SPEEX_DEPENDENCIES = libogg
 SPEEX_CONF_OPT = --with-ogg-libraries=$(STAGING_DIR)/usr/lib \
 		 --with-ogg-includes=$(STAGING_DIR)/usr/include \
-		 --enable-fixed-point 
+		 --enable-fixed-point
 
 ifeq ($(BR2_PACKAGE_SPEEX_ARM4),y)
 	SPEEX_CONF_OPT += --enable-arm4-asm
@@ -22,15 +22,15 @@ ifeq ($(BR2_PACKAGE_SPEEX_ARM5E),y)
 	SPEEX_CONF_OPT += --enable-arm5e-asm
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,speex))
+define SPEEX_LIBTOOL_FIXUP
+	$(SED) 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' $(@D)/libtool
+	$(SED) 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' $(@D)/libtool
+endef
+
+SPEEX_POST_CONFIGURE_HOOKS += SPEEX_LIBTOOL_FIXUP
 
-$(SPEEX_TARGET_BUILD): $(SPEEX_TARGET_CONFIGURE)
-	$(call MESSAGE,"Building")
-	$(SED) 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' $(SPEEX_DIR)/libtool
-	$(SED) 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' $(SPEEX_DIR)/libtool
+define SPEEX_BUILD_CMDS
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPT) -C $(@D)/$($(PKG)_SUBDIR)
-	$(Q)touch $@
+endef
 
-$(SPEEX_HOOK_POST_INSTALL): $(SPEEX_TARGET_INSTALL_TARGET)
-	rm -rf $(TARGET_DIR)/usr/share/doc/speex
-	touch $@
+$(eval $(call AUTOTARGETS,package/multimedia,speex))
-- 
1.7.0.4
