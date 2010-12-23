From: heiko at zuerker.org <heiko@zuerker.org>
Date: Thu, 23 Dec 2010 16:15:07 -0600
Subject: [Buildroot] [PATCH] busybox: add option to disable automatic
	configuration changes depending on buildroot settings
Message-ID: <8a37582ac05b4d5f7cf49873ac2f8155f3df7d08.1293142151.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/busybox/Config.in  |    6 ++++++
 package/busybox/busybox.mk |    6 ++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 79a6341..99deeff 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -61,6 +61,12 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	  Show packages in menuconfig that are potentially also provided
 	  by busybox.
 
+config BR2_PACKAGE_BUSYBOX_DONT_CHANGE_CONFIG
+	bool "Don't automatically adjust busybox configuration" if BR2_PACKAGE_BUSYBOX
+	help
+	  Don't automatically adjust the busybox configuration,
+	  according on how buildroot is configured.
+
 endif
 
 if !BR2_PACKAGE_BUSYBOX # kconfig doesn't support else
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a94e4c0..7cf1b58 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -39,6 +39,9 @@ define BUSYBOX_SET_BB_PWD
 endef
 endif
 
+# automatically adjust the busybox configuration depending on the buildroot settings
+ifneq ($BR2_PACKAGE_BUSYBOX_DONT_CHANGE_CONFIG),y)
+
 ifeq ($(BR2_LARGEFILE),y)
 define BUSYBOX_SET_LARGEFILE
 	$(call KCONFIG_ENABLE_OPT,CONFIG_LFS,$(BUSYBOX_BUILD_CONFIG))
@@ -96,6 +99,9 @@ define BUSYBOX_NETKITTELNET
 endef
 endif
 
+# end of busybox config adjustments
+endif
+
 define BUSYBOX_COPY_CONFIG
 	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
 endef
-- 
1.7.3.2
