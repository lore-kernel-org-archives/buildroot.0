From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 23:42:34 +0100
Subject: [Buildroot] [git commit] at91bootstrap: allow specification of a
	custom patch directory
Message-ID: <20120203062553.2DD5E909B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=502465e435610b54b247b44cf61e7f0ba3d05a22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes bug #4664.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                             |    1 +
 boot/at91bootstrap/Config.in        |    9 +++++++++
 boot/at91bootstrap/at91bootstrap.mk |    9 +++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index b10fff8..dfc7d71 100644
--- a/CHANGES
+++ b/CHANGES
@@ -59,6 +59,7 @@
 	#3403: libgpg-error: bump to version 1.10
 	#3409: libgpg-error: download from gnupg.org
 	#3421: nano: make tiny flag optional
+	#4664: Cannot patch AT91Bootstrap
 	#4700: setlocalversion not working for combination svn/ubuntu 11.10...
 
 2011.11, Released November 30th, 2011:
diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index b232b3b..9cbaf81 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -10,6 +10,15 @@ config BR2_TARGET_AT91BOOTSTRAP
 
 if	BR2_TARGET_AT91BOOTSTRAP
 
+config BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR
+	string "custom patch dir"
+	help
+	  If your board requires custom patches, add the path to the
+	  directory containing the patches here. The patches must be
+	  named at91bootstrap-<version>-<something>.patch.
+
+	  Most users may leave this empty
+
 config BR2_TARGET_AT91BOOTSTRAP_BOARD
 	string "Bootstrap board"
 	default ""
diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index a7a856c..5592d37 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -21,6 +21,15 @@ define AT91BOOTSTRAP_EXTRACT_CMDS
 	rmdir $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)
 endef
 
+ifneq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR)),)
+define AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
+	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR) \
+		at91bootstrap-$(AT91BOOTSTRAP_VERSION)-\*.patch
+endef
+
+AT91BOOTSTRAP_POST_PATCH_HOOKS += AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
+endif
+
 define AT91BOOTSTRAP_BUILD_CMDS
 	$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)/$(AT91BOOTSTRAP_MAKE_SUBDIR)
 endef
