From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] freetype: convert old-style
	hooks to new-style hooks
Message-ID: <20100916113824.2F3608AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=da07989b17cbdd4f12576e8ac982c4f7d8540d7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The strip of the library is also removed, since this is done globally.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freetype/freetype.mk |   20 +++++++++++++-------
 1 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index f19b854..5a88cca 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -15,17 +15,23 @@ FREETYPE_DEPENDENCIES = host-pkg-config $(if $(BR2_PACKAGE_ZLIB),zlib)
 
 HOST_FREETYPE_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS,package,freetype))
-$(eval $(call AUTOTARGETS,package,freetype,host))
-
-$(FREETYPE_HOOK_POST_INSTALL):
+define FREETYPE_FREETYPE_CONFIG_STAGING_FIXUP
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
 		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
 		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/freetype2\',g" \
 		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
 		$(STAGING_DIR)/usr/bin/freetype-config
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfreetype.so
-ifneq ($(BR2_HAVE_DEVFILES),y)
+endef
+
+FREETYPE_POST_INSTALL_STAGING_HOOKS += FREETYPE_FREETYPE_CONFIG_STAGING_FIXUP
+
+define FREETYPE_FREETYPE_CONFIG_TARGET_REMOVE
 	rm -f $(TARGET_DIR)/usr/bin/freetype-config
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+FREETYPE_POST_INSTALL_TARGET_HOOKS += FREETYPE_FREETYPE_CONFIG_TARGET_REMOVE
 endif
-	touch $@
+
+$(eval $(call AUTOTARGETS,package,freetype))
+$(eval $(call AUTOTARGETS,package,freetype,host))
-- 
1.7.1
