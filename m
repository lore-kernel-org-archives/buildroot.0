From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:41 +0200
Subject: [Buildroot] [PATCH 55/74] ntfsprogs: use correct step override
	method
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0bc275192ec181afc6826a4347ebafdaedd02cad.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The target installation step is removed, as the default 'make install'
already does the correct thing.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntfsprogs/ntfsprogs.mk |   26 ++++----------------------
 1 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/package/ntfsprogs/ntfsprogs.mk b/package/ntfsprogs/ntfsprogs.mk
index 2046d29..4557747 100644
--- a/package/ntfsprogs/ntfsprogs.mk
+++ b/package/ntfsprogs/ntfsprogs.mk
@@ -16,29 +16,11 @@ ifeq ($(BR2_PACKAGE_LIBFUSE),y)
 NTFSPROGS_DEPENDENCIES += libfuse
 endif
 
-$(eval $(call AUTOTARGETS,package,ntfsprogs))
-
-$(NTFSPROGS_TARGET_INSTALL_TARGET): $(NTFSPROGS_TARGET_INSTALL_STAGING)
-	$(call MESSAGE,"Installing to target")
-	cp -dpf $(STAGING_DIR)/usr/lib/libntfs.so* $(TARGET_DIR)/usr/lib/
-	$(INSTALL) -m 0755 $(addprefix $(STAGING_DIR)/usr/bin/,$(NTFSPROGS_BIN)) $(TARGET_DIR)/usr/bin
-	$(INSTALL) -m 0755 $(addprefix $(STAGING_DIR)/usr/sbin/,$(NTFSPROGS_SBIN)) $(TARGET_DIR)/usr/sbin
-	ln -s /usr/sbin/mkntfs $(TARGET_DIR)/sbin/mkfs.ntfs
-	touch $@
-
-ifeq ($(BR2_ENABLE_DEBUG),)
-$(NTFSPROGS_HOOK_POST_INSTALL): $(NTFSPROGS_TARGET_INSTALL_TARGET)
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/lib/libntfs.so*
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/usr/bin/,$(NTFSPROGS_BIN))
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/usr/sbin/,$(NTFSPROGS_SBIN))
-	touch $@
-endif
-
-$(NTFSPROGS_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(NTFSPROGS_DIR) uninstall
+define NTFSPROGS_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libntfs.so*
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(NTFSPROGS_BIN))
 	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(NTFSPROGS_SBIN))
 	-unlink $(TARGET_DIR)/sbin/mkfs.ntfs
-	rm -f $(NTFSPROGS_TARGET_INSTALL_STAGING) $(NTFSPROGS_TARGET_INSTALL_TARGET) $(NTFSPROGS_HOOK_POST_INSTALL)
+endef
+
+$(eval $(call AUTOTARGETS,package,ntfsprogs))
-- 
1.7.0.4
