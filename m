From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 09:33:48 +0100
Subject: [Buildroot] [git commit] uboot: fix custom patch dir legacy handling
Message-ID: <20161220091252.06A3680AD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f61583fc2eb0ebf1d712581c2dae60e8fb692973
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3e3fef39e71ed0426130b36aa00e4630ebb537ae added new and improved
patch handling, with BR2_TARGET_UBOOT_PATCH.  This was in addition to
the existing BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR option, that only
handled directories.

Later, commit 21b25d28fc7af3bb1b2c55e4a46e0d067ebc0081 moved the old
BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR to legacy options.  But on the way,
bad things happened:

* The original option was a string, while the one added to Config.in.legacy
is a bool.  This results in a warning from defconfigs that actually define
the old BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR (because a string is not a valid
value for a bool), but it does not result in the legacy option being
selected.  Consequently, BR2_LEGACY is not selected either.

* The advice at the top of Config.in.legacy to add a hidden WRAP option
to select BR2_LEGACY was not heeded.

* The advice at the top of Config.in.legacy to use the old string
option as the default for the new string option was not heeded.  In
this case, the variable was not just renamed, as the old option
supported directories only, while the new one supports files too.
But since the old option is a subset of the new option, it can still
be used to set a useful default.

So, this mod turns the legacy option back to a string, adds a hidden
bool WRAP option to set BR2_LEGACY when the string is non emoty, and
uses the legacy option to set the default for the new option.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy     | 11 +++++++++--
 boot/uboot/Config.in |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2811c7b..c8039ba 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -567,12 +567,19 @@ config BR2_PACKAGE_QT5QUICK1
 	  from upstream starting from Qt 5.6.
 
 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
-	bool "uboot custom patch dir removed"
-	select BR2_LEGACY
+	string "uboot custom patch dir has been removed"
 	help
 	  The uboot custom patch directory option has been removed. Use
 	  the improved BR2_TARGET_UBOOT_PATCH option instead.
 
+config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR_WRAP
+	bool
+	default y if BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR != ""
+	select BR2_LEGACY
+
+# Note: BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR is still referenced from
+# boot/uboot/Config.in
+
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID
 	bool "xf86-input-void removed"
 	select BR2_LEGACY
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 3b4bfac..2a9f14a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -95,6 +95,7 @@ config BR2_TARGET_UBOOT_VERSION
 
 config BR2_TARGET_UBOOT_PATCH
 	string "Custom U-Boot patches"
+	default BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR if BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR != ""  # legacy
 	help
 	  A space-separated list of patches to apply to U-Boot.
 	  Each patch can be described as an URL, a local file path,
