From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jan 2013 20:09:50 +0100
Subject: [Buildroot] [PATCH 3/5] package/customize: remove
In-Reply-To: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358363393-29977-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This mechanism of root filesystem customization has been deprecated
since a long time, so let's remove it now.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 -
 package/customize/Config.in    |    7 -------
 package/customize/customize.mk |   32 --------------------------------
 3 files changed, 40 deletions(-)
 delete mode 100644 package/customize/Config.in
 delete mode 100644 package/customize/customize.mk
 delete mode 100644 package/customize/source/.empty

diff --git a/package/Config.in b/package/Config.in
index ba03b3c..5c78784 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1,7 +1,6 @@
 menu "Package Selection for the target"
 
 source "package/busybox/Config.in"
-source "package/customize/Config.in"
 
 # Audio and video applications
 source "package/multimedia/Config.in"
diff --git a/package/customize/Config.in b/package/customize/Config.in
deleted file mode 100644
index 8f8aaa2..0000000
--- a/package/customize/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_CUSTOMIZE
-	bool "customize"
-	depends on BR2_DEPRECATED
-	help
-	  Add custom stuff to your buildroot.
-
-	  (edit package/customize/customize.mk)
diff --git a/package/customize/customize.mk b/package/customize/customize.mk
deleted file mode 100644
index d2b8518..0000000
--- a/package/customize/customize.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-#############################################################
-#
-# Any custom stuff you feel like doing....
-#
-#############################################################
-CUST_DIR:=package/customize/source
-
-$(BUILD_DIR)/.customize:
-	rm -f $(BUILD_DIR)/series
-	(cd $(CUST_DIR); \
-	 /bin/ls -d * > $(BUILD_DIR)/series || \
-	 touch $(BUILD_DIR)/series )
-	for f in `cat $(BUILD_DIR)/series`; do \
-		cp -af $(CUST_DIR)/$$f $(TARGET_DIR); \
-	done
-	rm -f $(BUILD_DIR)/series
-	touch $@
-
-customize: $(BUILD_DIR)/.customize
-
-customize-clean:
-	rm -f $(BUILD_DIR)/.customize
-
-.PHONY: customize
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_CUSTOMIZE),y)
-TARGETS+=customize
-endif
diff --git a/package/customize/source/.empty b/package/customize/source/.empty
deleted file mode 100644
index e69de29..0000000
-- 
1.7.9.5
