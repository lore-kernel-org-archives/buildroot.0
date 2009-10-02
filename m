From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Oct 2009 10:24:54 +0200
Subject: [Buildroot] [git commit master] libuuid: cleanup
Message-ID: <20091002082527.7324477756@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=076f06e0f57a8ea8973970e4fc4462e54a36f59f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Got rid of LIBUUID_TARGET_DIR, and made sure staging install is only
done once.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/e2fsprogs.mk |   20 +++++++++-----------
 1 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 8ab7da9..ed9bacb 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -11,8 +11,7 @@ E2FSPROGS_CAT:=$(ZCAT)
 E2FSPROGS_BINARY:=misc/mke2fs
 E2FSPROGS_TARGET_BINARY:=sbin/mke2fs
 LIBUUID_DIR=$(E2FSPROGS_DIR)/lib/uuid/
-LIBUUID_TARGET_DIR:=usr/lib/
-LIBUUID_TARGET_BINARY:=libuuid.so
+LIBUUID_TARGET_BINARY:=usr/lib/libuuid.so
 
 E2FSPROGS_MISC_STRIP:= \
 	badblocks blkid chattr dumpe2fs filefrag fsck logsave \
@@ -72,17 +71,19 @@ $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY): $(E2FSPROGS_DIR)/.configured
 	#$(STRIPCMD) $(E2FSPROGS_DIR)/lib/lib*.so.*.*
 	touch -c $@
 
-$(E2FSPROGS_DIR)/lib/$(LIBUUID_TARGET_BINARY): $(E2FSPROGS_DIR)/.configured
+$(E2FSPROGS_DIR)/lib/libuuid.so: $(E2FSPROGS_DIR)/.configured
 	$(MAKE1) -C $(E2FSPROGS_DIR)/lib/uuid
 	touch -c $@
 
 $(STAGING_DIR)/$(E2FSPROGS_TARGET_BINARY): $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
 		-C $(E2FSPROGS_DIR) install
+	touch -c $@
 
-$(STAGING_DIR)/usr/lib/$(LIBUUID_TARGET_BINARY): $(E2FSPROGS_DIR)/lib/$(LIBUUID_TARGET_BINARY)
+$(STAGING_DIR)/$(LIBUUID_TARGET_BINARY): $(E2FSPROGS_DIR)/lib/libuuid.so
 	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
 		-C $(LIBUUID_DIR) install
+	touch -c $@
 
 E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_BADBLOCKS) += ${TARGET_DIR}/sbin/badblocks
 E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_BLKID) += ${TARGET_DIR}/sbin/blkid
@@ -134,14 +135,11 @@ endif
 	rm -rf $(TARGET_DIR)/usr/share/doc
 	touch -c $@
 
-$(TARGET_DIR)/$(LIBUUID_TARGET_DIR)/$(LIBUUID_TARGET_BINARY): $(STAGING_DIR)/usr/lib/$(LIBUUID_TARGET_BINARY)
-	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
-		-C $(LIBUUID_DIR) install
-	cp -a $(STAGING_DIR)/$(LIBUUID_TARGET_DIR)/$(LIBUUID_TARGET_BINARY)* \
-		$(TARGET_DIR)/$(LIBUUID_TARGET_DIR)/
+$(TARGET_DIR)/$(LIBUUID_TARGET_BINARY): $(STAGING_DIR)/$(LIBUUID_TARGET_BINARY)
+	cp -a $(STAGING_DIR)/$(LIBUUID_TARGET_BINARY)* $(@D)
 	touch -c $@
 
-libuuid: $(TARGET_DIR)/$(LIBUUID_TARGET_DIR)/$(LIBUUID_TARGET_BINARY)
+libuuid: $(TARGET_DIR)/$(LIBUUID_TARGET_BINARY)
 e2fsprogs: libuuid $(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY)
 
 e2fsprogs-clean:
@@ -156,7 +154,7 @@ libuuid-clean:
 		-C $(LIBUUID_DIR) uninstall
 	# make uninstall misses the includes
 	rm -rf $(STAGING_DIR)/usr/include/uuid
-	rm -f $(TARGET_DIR)/$(LIBUUID_TARGET_DIR)/$(LIBUUID_TARGET_BINARY)*
+	rm -f $(TARGET_DIR)/$(LIBUUID_TARGET_BINARY)*
 	-$(MAKE1) -C $(LIBUUID_DIR) clean
 
 libuuid-source: e2fsprogs-source
-- 
1.6.3.3
