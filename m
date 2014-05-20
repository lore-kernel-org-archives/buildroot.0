From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 May 2014 23:51:37 +0200
Subject: [Buildroot] [git commit] uboot: check various configuration
	parameters and bail out if empty
Message-ID: <20140520215352.ABAFC9CCC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ed01c9aaa90a04fdc720c54d584617b35c69f6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the issues reported by Jerry <g4@novadsp.com>, it appears
that there are a number of U-Boot configuration variables we are not
checking properly, leaving users with weird behavior at build time.

This commit extends the existing U-Boot checks to verify that when a
custom version, custom tarball, or custom Git or Mercurial
repositories are selected, the appropriate fields are not empty in the
configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk |   26 ++++++++++++++++++++++++--
 1 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index da67706..532ac8b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -174,5 +174,27 @@ ifeq ($(filter source,$(MAKECMDGOALS)),)
 ifeq ($(UBOOT_BOARD_NAME),)
 $(error NO U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
 endif
-endif
-endif
+
+ifeq ($(BR2_TARGET_UBOOT_CUSTOM_VERSION),y)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE)),)
+$(error No custom U-Boot version specified. Check your BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE setting)
+endif # qstrip BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
+endif # BR2_TARGET_UBOOT_CUSTOM_VERSION
+
+ifeq ($(BR2_TARGET_UBOOT_CUSTOM_TARBALL),y)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION)),)
+$(error No custom U-Boot tarball specified. Check your BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION setting)
+endif # qstrip BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION
+endif # BR2_TARGET_UBOOT_CUSTOM_TARBALL
+
+ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT)$(BR2_TARGET_UBOOT_CUSTOM_HG),y)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL)),)
+$(error No custom U-Boot repository URL specified. Check your BR2_TARGET_UBOOT_CUSTOM_REPO_URL setting)
+endif # qstrip BR2_TARGET_UBOOT_CUSTOM_CUSTOM_REPO_URL
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION)),)
+$(error No custom U-Boot repository URL specified. Check your BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION setting)
+endif # qstrip BR2_TARGET_UBOOT_CUSTOM_CUSTOM_REPO_VERSION
+endif # BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
+
+endif # filter source
+endif # BR2_TARGET_UBOOT
