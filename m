From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:54 +0200
Subject: [Buildroot] [PATCH 68/74] pcre: convert to new style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8112567cb30a0e7101b59059fdbbc41972c90550.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pcre/pcre.mk |   18 ++++++++++++------
 1 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 290e534..d2a1331 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -13,14 +13,20 @@ ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 PCRE_CONF_OPT = --disable-cpp
 endif
 
-$(eval $(call AUTOTARGETS,package,pcre))
-
-$(PCRE_HOOK_POST_INSTALL): $(PCRE_TARGET_INSTALL_TARGET)
+define PCRE_STAGING_PCRE_CONFIG_FIXUP
 	$(SED) 's,^prefix=.*,prefix=$(STAGING_DIR)/usr,' \
 		-e 's,^exec_prefix=.*,exec_prefix=$(STAGING_DIR)/usr,' \
 		$(STAGING_DIR)/usr/bin/pcre-config
-	rm -rf $(TARGET_DIR)/usr/share/doc/pcre
-ifneq ($(BR2_HAVE_DEVFILES),y)
+endef
+
+PCRE_POST_INSTALL_STAGING_HOOKS += PCRE_STAGING_PCRE_CONFIG_FIXUP
+
+define PCRE_TARGET_REMOVE_PCRE_CONFIG
 	rm -f $(TARGET_DIR)/usr/bin/pcre-config
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+PCRE_POST_INSTALL_TARGET_HOOKS += PCRE_TARGET_REMOVE_PCRE_CONFIG
 endif
-	touch $@
+
+$(eval $(call AUTOTARGETS,package,pcre))
-- 
1.7.0.4
