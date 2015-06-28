From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:48 +0200
Subject: [Buildroot] [RFC v4 14/16] Makefile: add STAGINGNOPKG_DIR variable
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-15-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the per-package staging feature will be added, the STAGING_DIR
variable will be used to refer to the per-package staging directory so
to be able to refer to the original STAGING_DIR a STAGINGNOPKG_DIR is
added.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile            | 14 +++++---------
 package/Makefile.in |  1 +
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index a0d4abb..b4e5a10 100644
--- a/Makefile
+++ b/Makefile
@@ -437,15 +437,11 @@ else
 LIB_SYMLINK = lib32
 endif
 
-$(STAGING_DIR):
-	@mkdir -p $(STAGING_DIR)/bin
-	@mkdir -p $(STAGING_DIR)/lib
-	@ln -snf lib $(STAGING_DIR)/$(LIB_SYMLINK)
-	@mkdir -p $(STAGING_DIR)/usr/lib
-	@ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
-	@mkdir -p $(STAGING_DIR)/usr/include
-	@mkdir -p $(STAGING_DIR)/usr/bin
-	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
+$(STAGINGNOPKG_DIR):
+	@mkdir -p $@/bin $@/lib $@/usr/lib $@/usr/include $@/usr/bin
+	@ln -snf lib $@/$(LIB_SYMLINK)
+	@ln -snf lib $@/usr/$(LIB_SYMLINK)
+	@ln -snf $@ $(BASE_DIR)/staging
 
 ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
 TARGET_SKELETON = $(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
diff --git a/package/Makefile.in b/package/Makefile.in
index 924c808..169c6b3 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -109,6 +109,7 @@ endif
 
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
+STAGINGNOPKG_DIR := $(STAGING_DIR)
 
 TARGET_OPTIMIZATION := $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
-- 
2.4.3
