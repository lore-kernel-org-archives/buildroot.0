From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  2 Jun 2015 10:46:20 +0200
Subject: [Buildroot] [PATCH v2 3/3] boot/at91bootstrap3: download via custom
	git url
In-Reply-To: <1433234780-21084-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1433234780-21084-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1433234780-21084-4-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the option to download at91bootstrap3 from
a custom git URL. This is a requirement for all that boards
that use a custom at91bootstrap3 version.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
 - Adding error handling for BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL and
   BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION

 boot/at91bootstrap3/Config.in         | 34 ++++++++++++++++++++++++++++++++++
 boot/at91bootstrap3/at91bootstrap3.mk | 19 ++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 8ac40ed..9f2f49b 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -10,6 +10,40 @@ config BR2_TARGET_AT91BOOTSTRAP3
 
 if BR2_TARGET_AT91BOOTSTRAP3
 
+choice
+
+	prompt "AT91 Bootstrap 3 version"
+
+config BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	bool "3.7.2"
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
+	default "v3.7.2" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
+	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
+		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
+
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
 	string "custom patch dir"
 	help
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 2e25617..c045261 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -4,8 +4,15 @@
 #
 ################################################################################
 
-AT91BOOTSTRAP3_VERSION = v3.7.2
+AT91BOOTSTRAP3_VERSION = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_VERSION))
+
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
+AT91BOOTSTRAP3_SITE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL))
+AT91BOOTSTRAP3_SITE_METHOD = git
+else
 AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
+endif
+
 AT91BOOTSTRAP3_LICENSE = BSD-2c with endorsement clause
 AT91BOOTSTRAP3_LICENSE_FILES = main.c
 
@@ -57,4 +64,14 @@ ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE)),)
 $(error No at91bootstrap3 configuration file specified, check your BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE setting)
 endif
 endif
+
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
+ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL)),)
+$(error No custom at91bootstrap3 repository URL specified. Check your BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL setting)
+endif
+ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION)),)
+$(error No custom at91bootstrap3 repository version specified. Check your BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION setting)
+endif
+endif
+
 endif
-- 
2.4.2
