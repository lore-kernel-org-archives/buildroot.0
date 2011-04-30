From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Sat, 30 Apr 2011 15:42:48 +0200
Subject: [Buildroot] [PATCH 1/2] package: add jimtcl support
Message-ID: <1304170969-30138-1-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

you will download it via git
and can specify which repos and/or which commit

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Patrice Vilchez <patrice.vilchez@atmel.com>
---
 package/Config.in        |    1 +
 package/jimtcl/Config.in |   65 ++++++++++++++++++++++++++++++++++++++++++++++
 package/jimtcl/jimtcl.mk |   30 +++++++++++++++++++++
 3 files changed, 96 insertions(+), 0 deletions(-)
 create mode 100644 package/jimtcl/Config.in
 create mode 100644 package/jimtcl/jimtcl.mk

diff --git a/package/Config.in b/package/Config.in
index 76b2076..cd89892 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -231,6 +231,7 @@ source "package/php/Config.in"
 source "package/python/Config.in"
 source "package/ruby/Config.in"
 source "package/tcl/Config.in"
+source "package/jimtcl/Config.in"
 endmenu
 
 menu "Libraries"
diff --git a/package/jimtcl/Config.in b/package/jimtcl/Config.in
new file mode 100644
index 0000000..7847d19
--- /dev/null
+++ b/package/jimtcl/Config.in
@@ -0,0 +1,65 @@
+menuconfig BR2_PACKAGE_JIMTCL
+	bool "jimtcl"
+	help
+	  Small footprint implementation of Tcl programming language
+
+	  http://jim.berlios.de/
+
+if BR2_PACKAGE_JIMTCL
+
+choice
+	prompt "JIMTCL Version"
+	default BR2_TARGET_JIMTCL_GIT
+	help
+	  Select the specific jimtcl version you want to use
+
+config BR2_TARGET_JIMTCL_GIT
+	bool "Official git"
+
+config BR2_TARGET_JIMTCL_GIT_CUSTOM
+	bool "Custom"
+
+endchoice
+
+if BR2_TARGET_JIMTCL_GIT_CUSTOM
+
+config BR2_TARGET_JIMTCL_CUSTOM_GIT_LOCATION
+	string "URL of custom jimtcl git"
+
+endif
+
+choice
+	prompt "jimtcl Version"
+	default BR2_TARGET_JIMTCL_2011.01
+	help
+	  Select the specific jimtcl version you want to use
+
+config BR2_TARGET_JIMTCL_0_70
+	bool "0.70"
+
+config BR2_TARGET_JIMTCL_0_63
+	bool "0.63"
+
+config BR2_TARGET_JIMTCL_0_51
+	bool "0.51"
+
+config BR2_TARGET_JIMTCL_CUSTOM
+	bool "Custom"
+
+endchoice
+
+config BR2_TARGET_JIMTCL_VERSION
+	string
+	default "0.70"		if BR2_TARGET_JIMTCL_0_70
+	default "0.63"		if BR2_TARGET_JIMTCL_0_63
+	default "0.51"		if BR2_TARGET_JIMTCL_0_51
+	default "custom"	if BR2_TARGET_JIMTCL_VERSION_CUSTOM
+
+if BR2_TARGET_JIMTCL_VERSION_CUSTOM
+
+config BR2_TARGET_JIMTCL_CUSTOM_COMMIT
+	string "URL of custom jimtcl commit"
+
+endif
+
+endif
diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
new file mode 100644
index 0000000..d4f4c52
--- /dev/null
+++ b/package/jimtcl/jimtcl.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# jimtcl
+#
+#############################################################
+JIMTCL_VERSION:=$(call qstrip,$(BR2_TARGET_JIMTCL_VERSION))
+JIMTCL_SITE_METHOD:=git
+DL_TOOLS_DEPENDENCIES += git
+
+ifneq ($(BR2_TARGET_JIMTCL_CUSTOM_GIT_LOCATION),)
+JIMTCL_SITE:=$(call qstrip,$(BR2_TARGET_JIMTCL_CUSTOM_GIT_LOCATION))
+else
+JIMTCL_SITE:=http://repo.or.cz/r/jimtcl.git
+endif
+
+ifeq ($(JIMTCL_VERSION),custom)
+JIMTCL_VERSION=$(call qstrip,$(BR2_TARGET_JIMTCL_CUSTOM_COMMIT))
+endif
+
+# Force it as the version can be a name such as HEAD
+JIMTCL_DL_VERSION=$(OPENOCD_VERSION)
+
+JIMTCL_INSTALL_STAGING = YES
+JIMTCL_INSTALL_TARGET = NO
+
+OPENOCD_AUTORECONF = YES
+
+JIMTCL_INSTALL_STAGING_OPT= DESTDIR=$(STAGING_DIR)/usr install
+
+$(eval $(call AUTOTARGETS,package,jimtcl))
-- 
1.7.4.1
