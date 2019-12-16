From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Mon, 16 Dec 2019 15:06:34 +0000
Subject: [Buildroot] [PATCH v2 2/2] boot/at91bootstrap3: implement custom
 tarball
In-Reply-To: <1576508766-25676-1-git-send-email-eugen.hristev@microchip.com>
References: <1576508766-25676-1-git-send-email-eugen.hristev@microchip.com>
Message-ID: <1576508766-25676-2-git-send-email-eugen.hristev@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eugen Hristev <eugen.hristev@microchip.com>

Implement possibility to take AT91Bootstrap as a custom tarball.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v2:
- use BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)

 boot/at91bootstrap3/Config.in         |  8 ++++++++
 boot/at91bootstrap3/at91bootstrap3.mk | 17 ++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index c3fc9d35d4..faab7635da 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -27,8 +27,15 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	  This option allows Buildroot to get the AT91 Bootstrap 3
 	  source code from a Git repository.
 
+config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
+	bool "Custom tarball"
+
 endchoice
 
+config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION
+	string "URL of custom AT91Bootstrap tarball"
+	depends on BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
+
 if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL
@@ -47,6 +54,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	default "v3.9.0" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
+	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
 	string "custom patch dir"
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 685be5bbd7..9dcbac8d28 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -6,7 +6,13 @@
 
 AT91BOOTSTRAP3_VERSION = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_VERSION))
 
-ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL),y)
+# Handle custom AT91Bootstrap tarballs as specified by the configuration
+AT91BOOTSTRAP3_TARBALL = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION))
+AT91BOOTSTRAP3_SITE = $(patsubst %/,%,$(dir $(AT91BOOTSTRAP3_TARBALL)))
+AT91BOOTSTRAP3_SOURCE = $(notdir $(AT91BOOTSTRAP3_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
+else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
 AT91BOOTSTRAP3_SITE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL))
 AT91BOOTSTRAP3_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
@@ -54,6 +60,15 @@ AT91BOOTSTRAP3_KCONFIG_OPTS = $(AT91BOOTSTRAP3_MAKE_OPTS)
 # Must be before we call to kconfig-package
 ifeq ($(BR_BUILDING),y)
 
+#
+# Check custom tarball option
+#
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL),y)
+ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION)),)
+$(error No custom AT91Bootstrap3 tarball specified. Check your BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION setting)
+endif # qstrip BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION
+endif # BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
+
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_DEFCONFIG),y)
 # We must use the user-supplied kconfig value, because
 # AT91BOOTSTRAP3_KCONFIG_DEFCONFIG will at least contain
-- 
2.17.1
