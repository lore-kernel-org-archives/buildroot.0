From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 29 Jul 2009 19:21:22 +0200
Subject: [Buildroot] [PATCH 1/2] e2fsprogs: factor out libuuid support
In-Reply-To: <20090729172019.GS19257@buzzloop.caiaq.de>
References: <20090729172019.GS19257@buzzloop.caiaq.de>
Message-ID: <1248888083-11767-1-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new target for libuuid so it can be built without e2fsprogs.

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 package/e2fsprogs/Config.in    |    4 ++++
 package/e2fsprogs/e2fsprogs.mk |   23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index d353fd9..398dc56 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -1,6 +1,10 @@
+config BR2_PACKAGE_LIBUUID
+	bool
+
 config BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
 	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBUUID
 	help
 	  The EXT2 file system utilities and libraries
 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 6400bf5..b4b9279 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -10,6 +10,8 @@ E2FSPROGS_DIR=$(BUILD_DIR)/e2fsprogs-$(E2FSPROGS_VERSION)
 E2FSPROGS_CAT:=$(ZCAT)
 E2FSPROGS_BINARY:=misc/mke2fs
 E2FSPROGS_TARGET_BINARY:=sbin/mke2fs
+LIBUUID_TARGET_DIR:=usr/lib/
+LIBUUID_TARGET_BINARY:=libuuid.so
 
 E2FSPROGS_MISC_STRIP:= \
 	badblocks blkid chattr dumpe2fs filefrag fsck logsave \
@@ -69,9 +71,15 @@ $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY): $(E2FSPROGS_DIR)/.configured
 	#$(STRIPCMD) $(E2FSPROGS_DIR)/lib/lib*.so.*.*
 	touch -c $@
 
+$(E2FSPROGS_DIR)/lib/$(LIBUUID_BINARY): $(E2FSPROGS_DIR)/.configured
+	$(MAKE1) -C $(E2FSPROGS_DIR)/lib/uuid
+	touch -c $@
+
 $(STAGING_DIR)/$(E2FSPROGS_TARGET_BINARY): $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
 		-C $(E2FSPROGS_DIR) install
+
+$(STAGING_DIR)/lib/$(LIBUUID_BINARY): $(E2FSPROGS_DIR)/lib/$(LIBUUID_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
 		-C $(E2FSPROGS_DIR)/lib/uuid install
 
@@ -125,7 +133,18 @@ endif
 	rm -rf $(TARGET_DIR)/usr/share/doc
 	touch -c $@
 
+$(TARGET_DIR)/$(LIBUUID_TARGET_DIR)/$(LIBUUID_BINARY): $(STAGING_DIR)/lib/$(LIBUUID_BINARY)
+	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) LDCONFIG=true \
+		-C $(E2FSPROGS_DIR)/lib/uuid install
+	rm -rf $(TARGET_DIR)/usr/include/uuid
+	rm -rf $(TARGET_DIR)/usr/lib/pkgconfig/uuid.pc
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/share/man
+endif
+	touch -c $@
+
 e2fsprogs: uclibc $(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY)
+libuuid: uclibc $(TARGET_DIR)/$(LIBUUID_TARGET_DIR)/$(LIBUUID_TARGET_BINARY)
 
 e2fsprogs-clean:
 	$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(E2FSPROGS_DIR) uninstall
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
