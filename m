From: Markus Mayer <mmayer@broadcom.com>
Date: Tue, 21 Jan 2020 15:09:56 -0800
Subject: [Buildroot] [PATCH 1/1] system/Config.in: introduce pre-build script
In-Reply-To: <20200121230956.23129-1-mmayer@broadcom.com>
References: <20200121230956.23129-1-mmayer@broadcom.com>
Message-ID: <20200121230956.23129-2-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We introduce the concept of a pre-build script that works similar to
the already existing post-build and post-image scripts.

The pre-build script(s) are executed before the build commences. This
allows a user to run some preperatory tasks prior to the build.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 Makefile         |  3 +++
 system/Config.in | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/Makefile b/Makefile
index a58ca7821d2d..9bf9f1aa05ee 100644
--- a/Makefile
+++ b/Makefile
@@ -579,6 +579,9 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 
 .PHONY: prepare
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
+	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT)), \
+		$(call MESSAGE,"Executing pre-build script $(s)"); \
+		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 .PHONY: world
 world: target-post-image
diff --git a/system/Config.in b/system/Config.in
index c8c5be40e096..7b890aed1abb 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -518,6 +518,16 @@ config BR2_ROOTFS_OVERLAY
 	  They are copied as-is into the rootfs, excluding files ending
 	  with ~ and .git, .svn and .hg directories.
 
+config BR2_ROOTFS_PRE_BUILD_SCRIPT
+	string "Custom scripts to run before commencing the build"
+	default ""
+	help
+	  Specify a space-separated list of scripts to be run before the
+	  build commences.
+
+	  This gives users the opportunity to do board-specific
+	  preparations before starting the build.
+
 config BR2_ROOTFS_POST_BUILD_SCRIPT
 	string "Custom scripts to run before creating filesystem images"
 	default ""
-- 
2.17.1
