From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 23:22:30 +0100
Subject: [Buildroot] [git commit] boot/at91bootstrap3: implement custom
 tarball download
Message-ID: <20191223223341.ADEF98E131@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fc1a2946a165533b7bb69335208d60d50794553
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Implement possibility to download AT91Bootstrap from a custom tarball
URL.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/at91bootstrap3/Config.in         |  8 ++++++++
 boot/at91bootstrap3/at91bootstrap3.mk | 13 ++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

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
index 685be5bbd7..48c3a918a1 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -6,7 +6,12 @@
 
 AT91BOOTSTRAP3_VERSION = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_VERSION))
 
-ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL),y)
+AT91BOOTSTRAP3_TARBALL = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION))
+AT91BOOTSTRAP3_SITE = $(patsubst %/,%,$(dir $(AT91BOOTSTRAP3_TARBALL)))
+AT91BOOTSTRAP3_SOURCE = $(notdir $(AT91BOOTSTRAP3_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
+else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
 AT91BOOTSTRAP3_SITE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL))
 AT91BOOTSTRAP3_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
@@ -78,6 +83,12 @@ $(error No custom at91bootstrap3 repository version specified. Check your BR2_TA
 endif
 endif
 
+ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL),y)
+ifeq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION)),)
+$(error No custom AT91Bootstrap3 tarball specified. Check your BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION setting)
+endif # qstrip BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION
+endif # BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
+
 endif # BR_BUILDING
 
 $(eval $(kconfig-package))
