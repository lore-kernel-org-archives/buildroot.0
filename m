From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  7 Apr 2015 08:35:25 +0200
Subject: [Buildroot] [PATCH v2] boot/at91bootstrap3: Add the option to
	download via git
Message-ID: <1428388525-19186-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds an option to download at91bootstrap3 via a
custom git repository. Useful for all the vendor
customized versions.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changelog:

v1 -> v2:
  - Adapted to the latest changes in at91bootstrap3 files

 boot/at91bootstrap3/Config.in         | 35 +++++++++++++++++++++++++++++++++++
 boot/at91bootstrap3/at91bootstrap3.mk |  7 +++++++
 2 files changed, 42 insertions(+)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 8ac40ed..089b05d 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -10,6 +10,41 @@ config BR2_TARGET_AT91BOOTSTRAP3
 
 if BR2_TARGET_AT91BOOTSTRAP3
 
+choice
+
+	prompt "AT91 Bootstrap 3 version"
+
+config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	bool "3.7.1"
+
+config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
+	bool "Custom Git repository"
+	help
+	  This option allows Buildroot to get the AT91 Bootstrap 3 source
+	  code from a Git repository.
+
+endchoice
+
+if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
+
+config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by Git
+	  E.G. a sha id, a tag, branch, ..
+
+endif
+
+config BR2_TARGET_AT91BOOTSTRAP3_VERSION
+	string
+	default "v3.7.1" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
+		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
+
+
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
 	string "custom patch dir"
 	help
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 3e3b78e..e8a751a 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -5,7 +5,14 @@
 ################################################################################
 
 AT91BOOTSTRAP3_VERSION = v3.7.1
+AT91BOOTSTRAP3_VERSION = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_VERSION))
+
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
+AT91BOOTSTRAP3_SITE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL))
+AT91BOOTSTRAP3_SITE_METHOD = git
+else
 AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
+endif
 
 AT91BOOTSTRAP3_INSTALL_IMAGES = YES
 AT91BOOTSTRAP3_INSTALL_TARGET = NO
-- 
2.3.5
