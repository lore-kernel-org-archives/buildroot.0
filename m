From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 29 May 2015 11:38:46 +0200
Subject: [Buildroot] [PATCH 3/3] boot/at91bootstrap3: download via custom
	git url
In-Reply-To: <1432892326-10261-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1432892326-10261-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1432892326-10261-4-git-send-email-angelo.compagnucci@gmail.com>
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
 boot/at91bootstrap3/Config.in         | 34 ++++++++++++++++++++++++++++++++++
 boot/at91bootstrap3/at91bootstrap3.mk |  9 ++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

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
index b73821e..fae2e8e 100644
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
 AT91BOOTSTRAP3_LICENSE = BSD-2c
 AT91BOOTSTRAP3_LICENSE_FILES = main.c
 
-- 
1.9.1
