From: Charles Manning <cdhmanning@gmail.com>
Date: Thu, 20 Dec 2012 12:25:19 +1300
Subject: [Buildroot] [PATCH] Add a config override file capability.
Message-ID: <1355959519-11726-1-git-send-email-cdhmanning@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is similar to the package override capability and allows the overriding
of configuration symbols without modifying .config.

Why? Same reason as having package overriding...

Examples:

1) Might need to override svn on a user-by-user basis to add --username
2) Might want to be able to set versions of code fetched from svn without
changing the .config. Just put the overriding symbols in the override file.

The override file is included straight after .config in the Makefile, so
this limits what should be done there...

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
---
 Config.in |    7 +++++++
 Makefile  |    9 +++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index b319ac7..9f42a26 100644
--- a/Config.in
+++ b/Config.in
@@ -419,6 +419,13 @@ config BR2_PACKAGE_OVERRIDE_FILE
 	  as the source directory for a particular package. See the
 	  Buildroot documentation for more details on this feature.
 
+config BR2_CONFIG_OVERRIDE_FILE
+	string "location of a configuration override file"
+	help
+	  A configuration override file is a short makefile that contains
+	  variable definitions of the form  BR2_xxx to override configurations
+	  in the .config configuration file.
+
 endmenu
 
 source "toolchain/Config.in"
diff --git a/Makefile b/Makefile
index 4b09437..d133a27 100644
--- a/Makefile
+++ b/Makefile
@@ -94,6 +94,15 @@ endif
 # Pull in the user's configuration file
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(CONFIG_DIR)/.config
+
+# Include the config override file if one has been provided in the
+# configuration.
+CONFIG_OVERRIDE_FILE=$(call qstrip,$(BR2_CONFIG_OVERRIDE_FILE))
+ifneq ($(CONFIG_OVERRIDE_FILE),)
+$(warning Overriding configuration with  $(CONFIG_OVERRIDE_FILE))
+include $(CONFIG_OVERRIDE_FILE)
+endif
+
 endif
 
 # To put more focus on warnings, be less verbose as default
-- 
1.7.1
