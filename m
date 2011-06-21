From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Jun 2011 13:48:16 +0200
Subject: [Buildroot] [git commit] berkeleydb: target install cleanup
Message-ID: <20110621114918.1998588D78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=353ebfd0b10caf48a9e7d446860f98507936a426
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install into /usr/lib and use the normal make install target instead of
manually messing around with symlinks and .so versions.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/berkeleydb/berkeleydb.mk |   24 ++++++++----------------
 1 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index e80f66f..eb20ba9 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -4,10 +4,8 @@
 #
 #############################################################
 BERKELEYDB_VERSION:=4.4.20
-BERKELEYDB_SO_VERSION:=4.4
 BERKELEYDB_SITE:=http://download.oracle.com/berkeley-db
 BERKELEYDB_SOURCE:=db-$(BERKELEYDB_VERSION).NC.tar.gz
-BERKELEYDB_SHARLIB:=libdb-$(BERKELEYDB_SO_VERSION).so
 BERKELEYDB_SUBDIR=build_unix
 BERKELEYDB_INSTALL_STAGING = YES
 
@@ -24,7 +22,7 @@ define BERKELEYDB_CONFIGURE_CMDS
 		--exec-prefix=/usr \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
-		--libdir=/lib \
+		--libdir=/usr/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
@@ -44,20 +42,14 @@ define BERKELEYDB_CONFIGURE_CMDS
 	$(SED) 's/\.lo/.o/g' $(@D)/build_unix/Makefile
 endef
 
-ifeq ($(BR2_HAVE_DEVFILES),y)
-define BERKELEYDB_INSTALL_TARGET_DEVFILES_CMDS
-	cp -dpf $(STAGING_DIR)/usr/include/db.h $(TARGET_DIR)/usr/include/
-	cp -dpf $(STAGING_DIR)/lib/libdb*.a $(TARGET_DIR)/usr/lib/
-	cp -dpf $(STAGING_DIR)/lib/libdb*.la $(TARGET_DIR)/usr/lib/
-endef
-endif
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 
-define BERKELEYDB_INSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/lib/libdb*
-	cp -a $(STAGING_DIR)/lib/libdb*so* $(TARGET_DIR)/lib/
-	rm -f $(addprefix $(TARGET_DIR)/lib/,libdb.so libdb.la libdb.a)
-	(cd $(TARGET_DIR)/usr/lib; ln -fs /lib/$(BERKELEYDB_SHARLIB) libdb.so)
-	$(BERKELEYDB_INSTALL_TARGET_DEVFILES_CMDS)
+define BERKELEYDB_REMOVE_DOCS
+	rm -rf $(TARGET_DIR)/usr/docs
 endef
 
+BERKELEYDB_POST_INSTALL_TARGET_HOOKS += BERKELEYDB_REMOVE_DOCS
+
+endif
+
 $(eval $(call AUTOTARGETS,package,berkeleydb))
-- 
1.7.3.4
