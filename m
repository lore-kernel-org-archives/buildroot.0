From: cmchao <cmchao@gmail.com>
Date: Wed, 16 Jun 2010 19:47:08 +0800
Subject: [Buildroot] [PATCH 06/19] berkeleydb : convert to autotools
	infrastructure & bump to 4.4.20
In-Reply-To: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
References: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
Message-ID: <1276688841-5252-7-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/berkeleydb/berkeleydb.mk |   71 +++++++++++++-------------------------
 1 files changed, 24 insertions(+), 47 deletions(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index f15df6a..4227f7f 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -3,25 +3,18 @@
 # berkeley db
 #
 #############################################################
-DB_VERSION:=4.3.29
-DB_SO_VERSION:=4.3
-DB_SITE:=ftp://ftp.sleepycat.com/releases
-DB_SOURCE:=db-$(DB_VERSION).NC.tar.gz
-DB_DIR:=$(BUILD_DIR)/db-$(DB_VERSION).NC
-DB_SHARLIB:=libdb-$(DB_SO_VERSION).so
+BERKELEYDB_VERSION:=4.4.20
+BERKELEYDB_SO_VERSION:=4.4
+BERKELEYDB_SITE:=ftp://ftp.sleepycat.com/releases
+BERKELEYDB_SOURCE:=db-$(BERKELEYDB_VERSION).NC.tar.gz
+BERKELEYDB_SHARLIB:=libdb-$(BERKELEYDB_SO_VERSION).so
 
-$(DL_DIR)/$(DB_SOURCE):
-	$(call DOWNLOAD,$(DB_SITE),$(DB_SOURCE))
+BERKELEYDB_INSTALL_STAGING = YES
+BERKELEYDB_INSTALL_TARGET = YES
 
-berkeleydb-source: $(DL_DIR)/$(DB_SOURCE)
-
-$(DB_DIR)/.dist: $(DL_DIR)/$(DB_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(DB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(DB_DIR)/.configured: $(DB_DIR)/.dist
-	$(CONFIG_UPDATE) $(DB_DIR)/dist
-	(cd $(DB_DIR)/build_unix; rm -rf config.cache; \
+#build directory can't be the directory where configure are there, so..
+define BERKELEYDB_CONFIGURE_CMDS
+	(cd $(@D)/build_unix; rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		../dist/configure $(QUIET) \
@@ -48,48 +41,32 @@ $(DB_DIR)/.configured: $(DB_DIR)/.dist
 		--disable-tcl \
 		--disable-compat185 \
 		--with-pic \
-		$(DISABLE_LARGEFILE) \
 	)
-	$(SED) 's/\.lo/.o/g' $(DB_DIR)/build_unix/Makefile
-	touch $@
+	$(SED) 's/\.lo/.o/g' $(@D)/build_unix/Makefile
+endef
 
-$(DB_DIR)/build_unix/.libs/$(DB_SHARLIB): $(DB_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(DB_DIR)/build_unix
+define BERKELEYDB_BUILD_CMDS
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D)/build_unix
+endef
 
-$(STAGING_DIR)/lib/$(DB_SHARLIB): $(DB_DIR)/build_unix/.libs/$(DB_SHARLIB)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DB_DIR)/build_unix install
+define BERKELEYDB_INSTALL_STAGING_CMDS
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D)/build_unix install
 	chmod a-x $(STAGING_DIR)/lib/libdb*so*
 	rm -f $(STAGING_DIR)/bin/db_*
 	rm -rf $(STAGING_DIR)/share/locale
+endef
 
-$(TARGET_DIR)/lib/$(DB_SHARLIB): $(STAGING_DIR)/lib/$(DB_SHARLIB)
+define BERKELEYDB_INSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/lib/libdb*
 	cp -a $(STAGING_DIR)/lib/libdb*so* $(TARGET_DIR)/lib/
 	rm -f $(addprefix $(TARGET_DIR)/lib/,libdb.so libdb.la libdb.a)
-	(cd $(TARGET_DIR)/usr/lib; ln -fs /lib/$(DB_SHARLIB) libdb.so)
+	(cd $(TARGET_DIR)/usr/lib; ln -fs /lib/$(BERKELEYDB_SHARLIB) libdb.so)
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libdb*so*
-
-$(TARGET_DIR)/usr/lib/libdb.a: $(STAGING_DIR)/lib/libdb-$(DB_SO_VERSION).a
+	mkdir -p $(TARGET_DIR)/usr/include
 	cp -dpf $(STAGING_DIR)/usr/include/db.h $(TARGET_DIR)/usr/include/
+	mkdir -p $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/lib/libdb*.a $(TARGET_DIR)/usr/lib/
 	cp -dpf $(STAGING_DIR)/lib/libdb*.la $(TARGET_DIR)/usr/lib/
-	touch -c $@
-
-berkeleydb-headers: $(TARGET_DIR)/usr/lib/libdb.a
-
-berkeleydb-clean:
-	-$(MAKE) -C $(DB_DIR)/build_unix clean
-
-berkeleydb-dirclean:
-	rm -rf $(DB_DIR)
+endef
 
-berkeleydb: $(TARGET_DIR)/lib/$(DB_SHARLIB)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
-TARGETS+=berkeleydb
-endif
+$(eval $(call AUTOTARGETS,package,berkeleydb))
-- 
1.7.0.4
