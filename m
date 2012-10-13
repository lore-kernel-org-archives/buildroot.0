From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 01:13:50 +0200
Subject: [Buildroot] [PATCH 01/13] Add BR2_PROJECT_DIR config option
In-Reply-To: <20121013231344.17317.92930.stgit@localhost>
References: <20121013231344.17317.92930.stgit@localhost>
Message-ID: <20121013231350.17317.23758.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

This option will be used by subsequent patches to set default values
for paths.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in |   13 +++++++++++++
 Makefile  |    3 +++
 2 files changed, 16 insertions(+)

diff --git a/Config.in b/Config.in
index dab7787..438964a 100644
--- a/Config.in
+++ b/Config.in
@@ -16,6 +16,19 @@ config BR2_HOSTARCH
 
 source "target/Config.in.arch"
 
+# BR2_DEFCONFIG must be set through two configs, because 'option env='
+# removes it from the .config.
+config BR2_PROJECT_DIR_FROM_ENV
+	string
+	option env="BR2_PROJECT_DIR"
+
+config BR2_PROJECT_DIR
+	string "Project directory"
+	default BR2_PROJECT_DIR_FROM_ENV
+	help
+	  This option is used to set defaults for many other configuration
+	  variables.  Each one of those can still be overridden individually.
+
 menu "Build options"
 
 menu "Commands"
diff --git a/Makefile b/Makefile
index 0128839..d6136ed 100644
--- a/Makefile
+++ b/Makefile
@@ -96,6 +96,8 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(CONFIG_DIR)/.config
 endif
 
+PROJECT_DIR = $(realpath $(call qstrip,$(BR2_PROJECT_DIR)))
+
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifdef V
@@ -557,6 +559,7 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
+	BR2_PROJECT_DIR=$(PROJECT_DIR) \
 	BUILDROOT_CONFIG=$(CONFIG_DIR)/.config
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
