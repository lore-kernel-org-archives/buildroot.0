From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Tue,  3 Mar 2009 11:58:30 +0100
Subject: [Buildroot] ntfsprogs: new package
In-Reply-To: <1236077910-15674-8-git-send-email-razzor@kopf-tisch.de>
References: <> <1236077910-15674-1-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-2-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-3-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-4-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-5-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-6-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-7-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-8-git-send-email-razzor@kopf-tisch.de>
Message-ID: <1236077910-15674-9-git-send-email-razzor@kopf-tisch.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wide collection of NTFS utilities from http://www.linux-ntfs.org/
---
 package/Config.in              |    1 +
 package/ntfsprogs/Config.in    |    5 +++++
 package/ntfsprogs/ntfsprogs.mk |   40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 package/ntfsprogs/Config.in
 create mode 100644 package/ntfsprogs/ntfsprogs.mk

diff --git a/package/Config.in b/package/Config.in
index e0b906b..69aefcd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -254,6 +254,7 @@ source "package/memtester/Config.in"
 source "package/mkdosfs/Config.in"
 source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
+source "package/ntfsprogs/Config.in"
 source "package/pciutils/Config.in"
 source "package/pcmcia/Config.in"
 source "package/setserial/Config.in"
diff --git a/package/ntfsprogs/Config.in b/package/ntfsprogs/Config.in
new file mode 100644
index 0000000..165bb78
--- /dev/null
+++ b/package/ntfsprogs/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_NTFSPROGS
+    bool "ntfsprogs"
+    default n
+    help
+        wide collection of NTFS utilities from http://www.linux-ntfs.org/
diff --git a/package/ntfsprogs/ntfsprogs.mk b/package/ntfsprogs/ntfsprogs.mk
new file mode 100644
index 0000000..b34fe7a
--- /dev/null
+++ b/package/ntfsprogs/ntfsprogs.mk
@@ -0,0 +1,40 @@
+#############################################################
+#
+# ntfsprogs
+#
+#############################################################
+NTFSPROGS_VERSION:=2.0.0
+NTFSPROGS_SOURCE:=ntfsprogs-$(NTFSPROGS_VERSION).tar.gz
+NTFSPROGS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/linux-ntfs/
+NTFSPROGS_CONF_OPT:=--disable-gnome-vfs --program-prefix=""
+NTFSPROGS_INSTALL_STAGING:=yes
+
+NTFSPROGS_BIN:=ntfscat ntfscluster ntfscmp ntfsfix ntfsinfo ntfsls
+NTFSPROGS_SBIN:=ntfsclone ntfscp ntfslabel ntfsresize ntfsundelete mkntfs
+
+$(eval $(call AUTOTARGETS,package,ntfsprogs))
+
+$(NTFSPROGS_TARGET_INSTALL_TARGET): $(NTFSPROGS_TARGET_INSTALL_STAGING)
+	$(call MESSAGE,"Installing to target")
+	cp -dpf $(STAGING_DIR)/usr/lib/libntfs.so* $(TARGET_DIR)/usr/lib/
+	$(INSTALL) -m 0755 $(addprefix $(STAGING_DIR)/usr/bin/,$(NTFSPROGS_BIN)) $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 0755 $(addprefix $(STAGING_DIR)/usr/sbin/,$(NTFSPROGS_SBIN)) $(TARGET_DIR)/usr/sbin
+	ln -s /usr/sbin/mkntfs $(TARGET_DIR)/sbin/mkfs.ntfs
+	touch $@
+
+ifeq ($(BR2_ENABLE_DEBUG),)
+$(NTFSPROGS_HOOK_POST_INSTALL): $(NTFSPROGS_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/lib/libntfs.so*
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/usr/bin/,$(NTFSPROGS_BIN))
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/usr/sbin/,$(NTFSPROGS_SBIN))
+	touch $@
+endif
+
+$(NTFSPROGS_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(NTFSPROGS_DIR) uninstall
+	rm -f $(TARGET_DIR)/usr/lib/libntfs.so*
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(NTFSPROGS_BIN))
+	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(NTFSPROGS_SBIN))
+	-unlink $(TARGET_DIR)/sbin/mkfs.ntfs
+	rm -f $(NTFSPROGS_TARGET_INSTALL_STAGING) $(NTFSPROGS_TARGET_INSTALL_TARGET) $(NTFSPROGS_HOOK_POST_INSTALL)
-- 
1.5.4.3
