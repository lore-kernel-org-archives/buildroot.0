From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jan 2013 20:39:47 +0100
Subject: [Buildroot] [git commit] linux, uboot, mxs-bootlets,
	barebox: avoid double slash in CUSTOM_TARBALL
Message-ID: <20130113194912.3D4838018A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=579fea227394db02916d7487762c79a8e76e8748
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #5846

The $(dir ...) function leaves a slash at the end, so that the LINUX_SITE
variable for a custom tarball ends in a slash. The DOWNLOAD macro adds
another slash between SITE and SOURCE, which results in a double slash in
the download URL.

Fix this by stripping off the final slash from the _SITE in all packages that
have a custom tarball.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/barebox.mk           |    2 +-
 boot/mxs-bootlets/mxs-bootlets.mk |    2 +-
 boot/uboot/uboot.mk               |    2 +-
 linux/linux.mk                    |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 6cc4976..211e06e 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -9,7 +9,7 @@ BAREBOX_VERSION    = $(call qstrip,$(BR2_TARGET_BAREBOX_VERSION))
 ifeq ($(BAREBOX_VERSION),custom)
 # Handle custom Barebox tarballs as specified by the configuration
 BAREBOX_TARBALL = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION))
-BAREBOX_SITE    = $(dir $(BAREBOX_TARBALL))
+BAREBOX_SITE    = $(patsubst %/,%,$(dir $(BAREBOX_TARBALL)))
 BAREBOX_SOURCE  = $(notdir $(BAREBOX_TARBALL))
 else ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_GIT),y)
 BAREBOX_SITE        = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL))
diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index 1975d47..f93ff81 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL),y)
 	MXS_BOOTLETS_TARBALL = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL))
-	MXS_BOOTLETS_SITE = $(dir $(MXS_BOOTLETS_TARBALL))
+	MXS_BOOTLETS_SITE = $(patsubst %/,%,$(dir $(MXS_BOOTLETS_TARBALL)))
 	MXS_BOOTLETS_SOURCE  = $(notdir $(MXS_BOOTLETS_TARBALL))
 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT),y)
 	MXS_BOOTLETS_SITE = $(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL)
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 619f2e1..ea77259 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -14,7 +14,7 @@ UBOOT_INSTALL_IMAGES = YES
 ifeq ($(UBOOT_VERSION),custom)
 # Handle custom U-Boot tarballs as specified by the configuration
 UBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
-UBOOT_SITE    = $(dir $(UBOOT_TARBALL))
+UBOOT_SITE    = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
 UBOOT_SOURCE  = $(notdir $(UBOOT_TARBALL))
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
 UBOOT_SITE        = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL))
diff --git a/linux/linux.mk b/linux/linux.mk
index 61d4267..91a9f50 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -10,7 +10,7 @@ LINUX_LICENSE_FILES = COPYING
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 ifeq ($(LINUX_VERSION),custom)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
-LINUX_SITE = $(dir $(LINUX_TARBALL))
+LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
 LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
