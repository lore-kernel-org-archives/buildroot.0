From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Sun, 29 Jul 2012 23:59:50 +0800
Subject: [Buildroot] [PATCH 2/2] config: support overlay
In-Reply-To: <1343577590-14362-1-git-send-email-roylee17@gmail.com>
References: <1343577590-14362-1-git-send-email-roylee17@gmail.com>
Message-ID: <1343577590-14362-2-git-send-email-roylee17@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change-Id: I2c2b03ed1dde44bfb3ae6c1aaa8c548bbb3d1e9d
Signed-off-by: Tzu-Jung Lee <roylee17@gmail.com>
---
 Makefile |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 98e1a51..665251a 100644
--- a/Makefile
+++ b/Makefile
@@ -37,7 +37,11 @@ endif
 
 # absolute path
 TOPDIR:=$(shell pwd)
+ifneq ($(OVERLAY_DIR),)
+CONFIG_CONFIG_IN=$(OVERLAY_DIR)/Config.in
+else
 CONFIG_CONFIG_IN=Config.in
+endif
 CONFIG=support/kconfig
 DATE:=$(shell date +%Y%m%d)
 
@@ -60,8 +64,13 @@ empty:=
 space:=$(empty) $(empty)
 
 ifneq ("$(origin O)", "command line")
+ifneq ($(OVERLAY_DIR),)
 O:=output
+CONFIG_DIR:=$(OVERLAY_DIR)
+else
+O:=$(TOPDIR)/../output
 CONFIG_DIR:=$(TOPDIR)
+endif
 NEED_WRAPPER=
 else
 # other packages might also support Linux-style out of tree builds
@@ -576,6 +585,10 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(BR2_DEFCONFIG),=$(BR2_DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(OVERLAY_DIR)/configs/%_defconfig outputmakefile
+	@mkdir -p $(BUILD_DIR)/buildroot-config
+	@$(COMMON_CONFIG_ENV) $< --defconfig=$(OVERLAY_DIR)/configs/$@ $(CONFIG_CONFIG_IN)
+
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
-- 
1.7.8.6
