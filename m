From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 27 Dec 2014 22:58:23 +0100
Subject: [Buildroot] [PATCH 05/10] package/lockdev: handle static/shared
	only build
In-Reply-To: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1419717508-11627-6-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/lockdev/lockdev.mk | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
index 59561ba..e789a79 100644
--- a/package/lockdev/lockdev.mk
+++ b/package/lockdev/lockdev.mk
@@ -13,30 +13,39 @@ LOCKDEV_LICENSE_FILES = LICENSE
 LOCKDEV_INSTALL_STAGING = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
-define LOCKDEV_BUILD_CMDS
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) static
+LOCKDEV_BUILD_ARGS = static
+LOCKDEV_INSTALL_ARGS = install_dev
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LOCKDEV_BUILD_ARGS = static shared
+LOCKDEV_INSTALL_ARGS = install_dev install_run
+else # BR2_SHARED_LIBS
+LOCKDEV_BUILD_ARGS = shared
+LOCKDEV_INSTALL_ARGS = install_run
+endif
+
+ifeq ($(BR2_SHARED_STATIC_LIBS)$(BR2_SHARED_LIBS),y)
+define LOCKDEV_CREATE_LINKS_STAGING
+	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
+	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.1
 endef
 
-define LOCKDEV_INSTALL_STAGING_CMDS
-	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) install_dev
+define LOCKDEV_CREATE_LINKS_TARGET
+	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.1
 endef
-
-else # BR2_STATIC_LIBS
+endif
 
 define LOCKDEV_BUILD_CMDS
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) static shared
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(LOCKDEV_BUILD_ARGS)
 endef
 
 define LOCKDEV_INSTALL_STAGING_CMDS
-	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) install_dev install_run
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.1
+	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) $(LOCKDEV_INSTALL_ARGS)
+	$(LOCKDEV_CREATE_LINKS_STAGING)
 endef
 
 define LOCKDEV_INSTALL_TARGET_CMDS
-	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) install_run
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.1
+	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) $(LOCKDEV_INSTALL_ARGS)
+	$(LOCKDEV_CREATE_LINKS_TARGET)
 endef
-endif # BR2_STATIC_LIBS
 
 $(eval $(generic-package))
-- 
1.9.3
