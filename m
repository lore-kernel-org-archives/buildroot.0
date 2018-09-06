From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 21:45:16 +0200
Subject: [Buildroot] [git commit] sunxi-mali-mainline: add EULA license file
Message-ID: <20180907111608.746C57FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e1640e0996cda3d9519494dea578daacd187f44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sunxi-mali-mainline package has not license file at the moment.

License file is a pdf EULA, but its name contains whitespaces. This
gives problems when passing filename to SUNXI_MALI_MAINLINE_LICENSE_FILES
since it expects a list of files.
Other attempts with \ or \\ to keep spaces were tried with no luck.
Add a define to POST_PATCH_HOOKS to change pdf filename from
'EULA for Mali 400MP _AW.pdf' to 'EULA_for_Mali_400MP_AW.pdf'.
Add EULA file to hash.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-mali-mainline/sunxi-mali-mainline.hash |  1 +
 package/sunxi-mali-mainline/sunxi-mali-mainline.mk   | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash b/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
index 5d9d1a52b4..978be01024 100644
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 72969ecf470b9e5ce787c2f8f36242926e1e892af0891924ee59a2cd206de39f  sunxi-mali-mainline-d691cb93884ca8ac67860502117bbec283dc19aa.tar.gz
+sha256 8a06bcae44a41a886f339b4338422415a786787f113e9ed6456ae117104a0b6a  EULA_for_Mali_400MP_AW.pdf
diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
index 766bacf38d..701a1fbbb4 100644
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
@@ -8,6 +8,10 @@ SUNXI_MALI_MAINLINE_VERSION = d691cb93884ca8ac67860502117bbec283dc19aa
 SUNXI_MALI_MAINLINE_SITE = $(call github,bootlin,mali-blobs,$(SUNXI_MALI_MAINLINE_VERSION))
 SUNXI_MALI_MAINLINE_INSTALL_STAGING = YES
 SUNXI_MALI_MAINLINE_PROVIDES = libegl libgles
+SUNXI_MALI_MAINLINE_LICENSE = Allwinner End User Licence Agreement
+SUNXI_MALI_MAINLINE_EULA_ORIGINAL = EULA\ for\ Mali\ 400MP\ _AW.pdf
+SUNXI_MALI_MAINLINE_EULA_NO_SPACES = EULA_for_Mali_400MP_AW.pdf
+SUNXI_MALI_MAINLINE_LICENSE_FILES = $(SUNXI_MALI_MAINLINE_EULA_NO_SPACES)
 
 SUNXI_MALI_MAINLINE_REV = $(call qstrip,$(BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION))
 
@@ -36,4 +40,10 @@ define SUNXI_MALI_MAINLINE_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/
 endef
 
+define SUNXI_MALI_MAINLINE_FIXUP_LICENSE_FILE
+	mv $(@D)/$(SUNXI_MALI_MAINLINE_EULA_ORIGINAL) $(@D)/$(SUNXI_MALI_MAINLINE_EULA_NO_SPACES)
+endef
+
+SUNXI_MALI_MAINLINE_POST_PATCH_HOOKS += SUNXI_MALI_MAINLINE_FIXUP_LICENSE_FILE
+
 $(eval $(generic-package))
