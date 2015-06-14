From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:42:48 +0200
Subject: [Buildroot] [git commit] boot/at91bootstrap3: download via custom
	git url
Message-ID: <20150615141619.BC54981D83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c839605ff078fd0c26c1cd4485e14643f0de453a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the option to download at91bootstrap3 from
a custom git URL. This is a requirement for all that boards
that use a custom at91bootstrap3 version.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap3/Config.in         |   34 +++++++++++++++++++++++++++++++++
 boot/at91bootstrap3/at91bootstrap3.mk |   19 +++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletions(-)

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
index df3896e..1c68094 100644
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
 AT91BOOTSTRAP3_LICENSE = Atmel License
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
