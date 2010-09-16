From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] libiconv: convert old-style
	hook to new-style hook
Message-ID: <20100916113825.E62D58AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=375b14fbeb876aaa550f0bfee013a15ca4191202
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In addition to that, remove useless stripping since it is done
globally.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiconv/libiconv.mk |   20 +++++++++++---------
 1 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index a3f762a..c56a986 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -12,17 +12,19 @@ LIBICONV_INSTALL_TARGET = YES
 
 LIBICONV_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-$(eval $(call AUTOTARGETS,package,libiconv))
+# Remove not used preloadable libiconv.so
+define LIBICONV_TARGET_REMOVE_PRELOADABLE_LIBS
+	rm -f $(TARGET_DIR)/usr/lib/preloadable_libiconv.so
+endef
 
-$(LIBICONV_HOOK_POST_INSTALL):
-	# Remove not used preloadable libiconv.so
+define LIBICONV_STAGING_REMOVE_PRELOADABLE_LIBS
 	rm -f $(STAGING_DIR)/usr/lib/preloadable_libiconv.so
-	rm -f $(TARGET_DIR)/usr/lib/preloadable_libiconv.so
-ifneq ($(BR2_ENABLE_DEBUG),y)
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libiconv.so.*
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libcharset.so.*
-endif
-	touch $@
+endef
+
+LIBICONV_POST_INSTALL_TARGET_HOOKS += LIBICONV_TARGET_REMOVE_PRELOADABLE_LIBS
+LIBICONV_POST_INSTALL_STAGING_HOOKS += LIBICONV_STAGING_REMOVE_PRELOADABLE_LIBS
+
+$(eval $(call AUTOTARGETS,package,libiconv))
 
 # Configurations where the toolchain supports locales and the libiconv
 # package is enabled are incorrect, because the toolchain already
-- 
1.7.1
