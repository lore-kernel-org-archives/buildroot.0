From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 22 Apr 2013 10:07:02 +0100
Subject: [Buildroot] [RFC] permit menu customization
Message-ID: <1366621622-7953-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

This patch is a first attempt at providing a mechanism by which the user
can specify a local menu configuration file, for extending the Buildroot
menu system.

The main use case I have in mind is the selection and configuration of
local packages.

One problem with what is proposed here is that it is necessary to
"bootstrap" the system by providing an empty Config.in.user file; ideally,
this file should be touched somewhere in the top-level Makefile, and added
to .gitignore, as it is really a build artefact.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 Config.in                      |    9 +++++++++
 Makefile                       |   20 ++++++++++++++++++++
 docs/manual/customize-menu.txt |   16 ++++++++++++++++
 docs/manual/customize.txt      |    2 ++
 4 files changed, 47 insertions(+)
 create mode 100644 Config.in.user
 create mode 100644 docs/manual/customize-menu.txt

diff --git a/Config.in b/Config.in
index bbb9885..7b92d67 100644
--- a/Config.in
+++ b/Config.in
@@ -437,6 +437,13 @@ config BR2_PACKAGE_OVERRIDE_FILE
 	  as the source directory for a particular package. See the
 	  Buildroot documentation for more details on this feature.
 
+config BR2_LOCAL_MENUCONFIG_FILE
+	string "location of a local menu configuration file"
+	default "$(TOPDIR)/Config.in.local"
+	help
+	  A local menu configuration file can be used to add custom
+	  entries to the Buildroot configuration menu.
+
 config BR2_GLOBAL_PATCH_DIR
 	string "global patch directory"
 	help
@@ -469,3 +476,5 @@ source "boot/Config.in"
 source "linux/Config.in"
 
 source "Config.in.legacy"
+
+source "Config.in.user"
diff --git a/Config.in.user b/Config.in.user
new file mode 100644
index 0000000..e69de29
diff --git a/Makefile b/Makefile
index 0a91658..2235403 100644
--- a/Makefile
+++ b/Makefile
@@ -711,6 +711,26 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
 		$(CONFIG_CONFIG_IN)
 
+# Update the user menu configuration file
+.PHONY: update-user-config
+menuconfig nconfig gconfig xconfig config oldconfig randconfig allyesconfig allnoconfig silentoldconfig release randpackageconfig allyespackageconfig allnopackageconfig source-check print-version olddefconfig: update-user-config
+%_defconfig: update-user-config
+CONFIG_USER_IN=Config.in.user
+CONFIG_LOCAL_IN:=$(shell grep -E '^BR2_LOCAL_MENUCONFIG_FILE=' $(BUILDROOT_CONFIG) | sed -r -e 's/^BR2_LOCAL_MENUCONFIG_FILE=\"//' -e 's/\"$$//' -e 's,\$$\(TOPDIR\),$(TOPDIR),g')
+update-user-config: $(CONFIG_USER_IN)
+	@echo "# Buildroot auto-generated file: DO NOT EDIT" >$<
+ifeq ($(CONFIG_LOCAL_IN),)
+	@echo "# No user menu configuration file specified" >>$<
+else
+	$(call MESSAGE,"Updating user configuration file")
+	@if test -e $(CONFIG_LOCAL_IN); then \
+		echo "# User menu configuration" >>$< ; \
+		echo "source \"$(CONFIG_LOCAL_IN)\"" >>$< ; \
+	else \
+		echo "# User menu configuration file does not exist: $(CONFIG_LOCAL_IN)" >>$<; \
+	fi
+endif
+
 # check if download URLs are outdated
 source-check:
 	$(MAKE) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
diff --git a/docs/manual/customize-menu.txt b/docs/manual/customize-menu.txt
new file mode 100644
index 0000000..f4825b7
--- /dev/null
+++ b/docs/manual/customize-menu.txt
@@ -0,0 +1,16 @@
+// -*- mode:doc -*- ;
+
+[[menu-custom]]
+Customizing the menu
+~~~~~~~~~~~~~~~~~~~~
+
+A local menu configuration file can be used to add custom entries to the
+Buildroot configuration menu.
+
+The +BR2_LOCAL_MENUCONFIG_FILE+ configuration file option can be
+used to specify the location of a local menu configuration file.
+
+A knowledge of the Kconfig configuration language syntax will be required
+in order to write a local menu configuration file. The documentation for this
+syntax is available at
+http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt[]
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index 0456ef1..61cb9fa 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -17,3 +17,5 @@ include::customize-toolchain.txt[]
 include::customize-store.txt[]
 
 include::customize-packages.txt[]
+
+include::customize-menu.txt[]
-- 
1.7.10.4
