From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Oct 2011 11:38:28 -0300
Subject: [Buildroot] [PATCH 2/6] devmem2: remove deprecated
In-Reply-To: <1318343912-5480-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318343912-5480-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318343912-5480-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in          |    3 ---
 package/devmem2/Config.in  |    7 -------
 package/devmem2/devmem2.mk |   42 ------------------------------------------
 3 files changed, 0 insertions(+), 52 deletions(-)
 delete mode 100644 package/devmem2/Config.in
 delete mode 100644 package/devmem2/devmem2.mk

diff --git a/package/Config.in b/package/Config.in
index 7176041..f8999cc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -157,9 +157,6 @@ source "package/cramfs/Config.in"
 source "package/dbus/Config.in"
 source "package/dbus-glib/Config.in"
 source "package/dbus-python/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/devmem2/Config.in"
-endif
 source "package/dmraid/Config.in"
 source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
diff --git a/package/devmem2/Config.in b/package/devmem2/Config.in
deleted file mode 100644
index 233b4b0..0000000
--- a/package/devmem2/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_DEVMEM2
-	bool "devmem2"
-	depends on BR2_DEPRECATED
-	help
-	  Simple program to read/write from/to any location in memory.
-
-	  http://free-electrons.com/pub/mirror/devmem2.c
diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
deleted file mode 100644
index 457a181..0000000
--- a/package/devmem2/devmem2.mk
+++ /dev/null
@@ -1,42 +0,0 @@
-#############################################################
-#
-# devmem2
-#
-#############################################################
-
-DEVMEM2_SOURCE:=devmem2.c
-DEVMEM2_SITE:=http://free-electrons.com/pub/mirror
-DEVMEM2_BINARY:=devmem2
-DEVMEM2_DIR:=$(BUILD_DIR)/devmem2
-
-$(DL_DIR)/$(DEVMEM2_SOURCE):
-	$(call DOWNLOAD,$(DEVMEM2_SITE),$(DEVMEM2_SOURCE))
-
-$(DEVMEM2_DIR)/$(DEVMEM2_SOURCE): $(DL_DIR)/$(DEVMEM2_SOURCE)
-	mkdir -p $(@D)
-	cp $^ $@
-
-$(DEVMEM2_DIR)/$(DEVMEM2_BINARY): $(DEVMEM2_DIR)/$(DEVMEM2_SOURCE)
-	$(TARGET_CC) $(TARGET_CFLAGS) -o $@ $^
-
-$(TARGET_DIR)/sbin/$(DEVMEM2_BINARY): $(DEVMEM2_DIR)/$(DEVMEM2_BINARY)
-	cp $^ $@
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
-
-devmem2: $(TARGET_DIR)/sbin/$(DEVMEM2_BINARY)
-
-devmem2-source: $(DL_DIR)/$(DEVMEM2_SOURCE)
-
-devmem2-clean:
-	rm -f $(TARGET_DIR/sbin/$(DEVMEM2_BINARY)
-
-devmem2-dirclean:
-	rm -rf $(DEVMEM2_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DEVMEM2),y)
-TARGETS+=devmem2
-endif
-- 
1.7.3.4
