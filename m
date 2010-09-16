From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] php: convert old-style hooks to
	new-style hooks
Message-ID: <20100916113823.5C0E08AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c692a3e44348b70153210733bd7d0c82028f8973
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.mk |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 9396311..68b0b5f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -166,23 +166,26 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
 endif
 endif
 
-$(eval $(call AUTOTARGETS,package,php))
-
-$(PHP_HOOK_POST_INSTALL):
+define PHP_INSTALL_FIXUP
 	rm -rf $(TARGET_DIR)/usr/lib/php
 	rm -f $(TARGET_DIR)/usr/bin/phpize
 	rm -f $(TARGET_DIR)/usr/bin/php-config
 	if [ ! -f $(TARGET_DIR)/etc/php.ini ]; then \
 		$(INSTALL) -m 0755 $(BR2_PACKAGE_PHP_CONFIG) $(TARGET_DIR)/etc/php.ini; fi
-	touch $@
+endef
+
+PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
 
-$(PHP_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define PHP_UNINSTALL_STAGING_CMDS
 	rm -rf $(STAGING_DIR)/usr/include/php
 	rm -rf $(STAGING_DIR)/usr/lib/php
 	rm -f $(STAGING_DIR)/usr/bin/php*
 	rm -f $(STAGING_DIR)/usr/share/man/man1/php*.1
+endef
+
+define PHP_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/php.ini
 	rm -f $(TARGET_DIR)/usr/bin/php*
-	rm -f $(PHP_TARGET_INSTALL_TARGET) $(PHP_HOOK_POST_INSTALL)
+endef
 
+$(eval $(call AUTOTARGETS,package,php))
-- 
1.7.1
