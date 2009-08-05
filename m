From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 5 Aug 2009 13:46:05 +0200
Subject: [Buildroot] [git commit] e2fsprogs: factor out libuuid support
Message-ID: <20090805114635.E9F0B7746A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b6718de1ecfbfadf6e96733ad7a22c9302f44e70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new target for libuuid so it can be built without e2fsprogs.

Signed-off-by: Daniel Mack <daniel@caiaq.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/Config.in    |    6 ++++++
 package/e2fsprogs/e2fsprogs.mk |   27 +++++++++++++++++++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index d353fd9..74da6bd 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -1,6 +1,12 @@
+config BR2_PACKAGE_LIBUUID
+	bool "libuuid"
+	help
+	  The uuid library from the e2fsprogs suite
+
 config BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
 	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBUUID
 	help
 	  The EXT2 file system utilities and libraries
 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 6400bf5..fbadfb0 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -10,6 +10,9 @@ E2FSPROGS_DIR=$(BUILD_DIR)/e2fsprogs-$(E2FSPROGS_VERSION)
 E2FSPROGS_CAT:=$(ZCAT)
 E2FSPROGS_BINARY:=misc/mke2fs
 E2FSPROGS_TARGET_BINARY:=sbin/mke2fs
+LIBUUID_DIR=$(E2FSPROGS_DIR)/lib/uuid/
+LIBUUID_TARGET_DIR:=usr/lib/
+LIBUUID_TARGET_BINARY:=libuuid.so
 
 E2FSPROGS_MISC_STRIP:= \
 	badblocks blkid chattr dumpe2fs filefrag fsck logsave \
@@ -69,11 +72,17 @@ $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY): $(E2FSPROGS_DIR)/.configured
 	#$(STRIPCMD) $(E2FSPROGS_DIR)/lib/lib*.so.*.*
 	touch -c $@
 
+$(E2FSPROGS_DIR)/lib/$(LIBUUID_TARGET_BINARY): $(E2FSPROGS_DIR)/.configured
+	$(MAKE1) -C $(E2FSPROGS_DIR)/lib/uuid
+	touch -c $@
+
 $(STAGING_DIR)/$(E2FSPROGS_TARGET_BINARY): $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
 		-C $(E2FSPROGS_DIR) install
+
+$(STAGING_DIR)/lib/$(LIBUUID_TARGET_BINARY): $(E2FSPROGS_DIR)/lib/$(LIBUUID_TARGET_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
-		-C $(E2FSPROGS_DIR)/lib/uuid install
+		-C $(LIBUUID_DIR) install
 
 E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_BADBLOCKS) += ${TARGET_DIR}/sbin/badblocks
 E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_BLKID) += ${TARGET_DIR}/sbin/blkid
@@ -125,7 +134,15 @@ endif
 	rm -rf $(TARGET_DIR)/usr/share/doc
 	touch -c $@
 
-e2fsprogs: uclibc $(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY)
+$(TARGET_DIR)/$(LIBUUID_TARGET_DIR)/$(LIBUUID_TARGET_BINARY): $(STAGING_DIR)/lib/$(LIBUUID_TARGET_BINARY)
+	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
+		-C $(LIBUUID_DIR) install
+	cp -a $(STAGING_DIR)/$(LIBUUID_TARGET_DIR)/$(LIBUUID_TARGET_BINARY)* \
+		$(TARGET_DIR)/$(LIBUUID_TARGET_DIR)/
+	touch -c $@
+
+libuuid: uclibc $(TARGET_DIR)/$(LIBUUID_TARGET_DIR)/$(LIBUUID_TARGET_BINARY)
+e2fsprogs: uclibc libuuid $(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY)
 
 e2fsprogs-clean:
 	$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(E2FSPROGS_DIR) uninstall
@@ -134,6 +151,8 @@ e2fsprogs-clean:
 e2fsprogs-dirclean:
 	rm -rf $(E2FSPROGS_DIR)
 
+libuuid-dirclean:: e2fsprogs-dirclean
+
 #############################################################
 #
 # Toplevel Makefile options
@@ -142,3 +161,7 @@ e2fsprogs-dirclean:
 ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
 TARGETS+=e2fsprogs
 endif
+
+ifeq ($(BR2_PACKAGE_LIBUUID),y)
+TARGETS+=libuuid
+endif
-- 
1.6.3.3
