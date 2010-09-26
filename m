From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:14:08 -0700
Subject: [Buildroot] [PATCH 17/18] lockfile-progs: convert to gentargets and
	bump to 0.1.15
In-Reply-To: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485249-29212-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485249-29212-17-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 .../lockfile-progs-0.1.11-sus3v-legacy.patch       |   11 -----
 .../lockfile-progs-0.1.15-sus3v-legacy.patch       |   11 +++++
 package/lockfile-progs/lockfile-progs.mk           |   47 ++++++--------------
 3 files changed, 25 insertions(+), 44 deletions(-)
 delete mode 100644 package/lockfile-progs/lockfile-progs-0.1.11-sus3v-legacy.patch
 create mode 100644 package/lockfile-progs/lockfile-progs-0.1.15-sus3v-legacy.patch

diff --git a/package/lockfile-progs/lockfile-progs-0.1.11-sus3v-legacy.patch b/package/lockfile-progs/lockfile-progs-0.1.11-sus3v-legacy.patch
deleted file mode 100644
index 8cf552e..0000000
--- a/package/lockfile-progs/lockfile-progs-0.1.11-sus3v-legacy.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- /lockfile-progs.orig.c	2007-10-11 10:32:09.000000000 -0300
-+++ /lockfile-progs.c	2007-10-11 10:32:28.000000000 -0300
-@@ -93,7 +93,7 @@
-     { NULL, 0, NULL, 0 }
-   };
- 
--  char *cmd_name = rindex(argv[0], '/');
-+  char *cmd_name = strrchr(argv[0], '/');
-   int mail_cmd_p = 0;
- 
-   if(cmd_name != NULL) {
diff --git a/package/lockfile-progs/lockfile-progs-0.1.15-sus3v-legacy.patch b/package/lockfile-progs/lockfile-progs-0.1.15-sus3v-legacy.patch
new file mode 100644
index 0000000..8cf552e
--- /dev/null
+++ b/package/lockfile-progs/lockfile-progs-0.1.15-sus3v-legacy.patch
@@ -0,0 +1,11 @@
+--- /lockfile-progs.orig.c	2007-10-11 10:32:09.000000000 -0300
++++ /lockfile-progs.c	2007-10-11 10:32:28.000000000 -0300
+@@ -93,7 +93,7 @@
+     { NULL, 0, NULL, 0 }
+   };
+ 
+-  char *cmd_name = rindex(argv[0], '/');
++  char *cmd_name = strrchr(argv[0], '/');
+   int mail_cmd_p = 0;
+ 
+   if(cmd_name != NULL) {
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 3925ca3..e95fcea 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -3,42 +3,23 @@
 # lockfile-progs
 #
 #############################################################
-LOCKFILE_PROGS_VERSION=0.1.11-0.1
-LOCKFILE_PROGS_SOURCE:=lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
-LOCKFILE_PROGS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/
-LOCKFILE_PROGS_CAT:=$(ZCAT)
-LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/lockfile-progs-0.1.11
-LOCKFILE_PROGS_BINARY:=usr/bin/lockfile-create
+LOCKFILE_PROGS_VERSION = 0.1.15
+LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
+LOCKFILE_PROGS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/
+LOCKFILE_PROGS_BINARY = usr/bin/lockfile-create
 
-$(DL_DIR)/$(LOCKFILE_PROGS_SOURCE):
-	 $(call DOWNLOAD,$(LOCKFILE_PROGS_SITE),$(LOCKFILE_PROGS_SOURCE))
+define LOCKFILE_PROGS_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
 
-lockfile-progs-source: $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE)
-
-$(LOCKFILE_PROGS_DIR)/.unpacked: $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE)
-	$(LOCKFILE_PROGS_CAT) $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LOCKFILE_PROGS_DIR) package/lockfile-progs/ \*.patch
-	touch $(LOCKFILE_PROGS_DIR)/.unpacked
-
-$(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY): $(LOCKFILE_PROGS_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LOCKFILE_PROGS_DIR)
-	cp -a $(LOCKFILE_PROGS_DIR)/bin/lockfile* $(TARGET_DIR)/usr/bin
+define LOCKFILE_PROGS_INSTALL_TARGET_CMDS
+	cp -a $(@D)/bin/lockfile* $(TARGET_DIR)/usr/bin
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY)
+endef
 
-lockfile-progs: liblockfile $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY)
-
-lockfile-progs-clean:
+define LOCKFILE_PROGS_CLEAN_CMDS
 	-rm -f $(TARGET_DIR)/usr/bin/lockfile-*
-	-$(MAKE) -C $(LOCKFILE_PROGS_DIR) clean
-
-lockfile-progs-dirclean:
-	rm -rf $(LOCKFILE_PROGS_DIR)
+	-$(MAKE) -C $(@D) clean
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LOCKFILE_PROGS),y)
-TARGETS+=lockfile-progs
-endif
+$(eval $(call GENTARGETS,package,lockfile-progs))
-- 
1.7.3
