From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 25 Feb 2019 10:28:05 +0200
Subject: [Buildroot] [POC v2,
 ppsh-v7-work] make: Redirect logs per-package if per-package build
 is enabled
Message-ID: <20190225082805.11634-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There might a messy logs In case of parellel per-package build, so each
package will mix together it's logs on stdout, therefor needs some
approach to log output of each package into separate file.

Implemented approach which overrides 'SHELL' variable in the main
Makefile with a path to the 'support/shell_proxy', this script duplicates
output from executed commands to the 'output/per-package/$(pkg)/$(step).log'
file, this path is specified from Makefile only if there is $PKG
variable defined.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---

POC v2:
       1) Log output for per-package and per-step, it simplifes the logic
          how to refresh log per each step by removing it on each step start.

 Makefile               |  1 +
 package/pkg-generic.mk | 12 ++++++++++++
 support/shell_proxy    | 19 +++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100755 support/shell_proxy

diff --git a/Makefile b/Makefile
index 25bd0d40d9..a4d9f5545f 100644
--- a/Makefile
+++ b/Makefile
@@ -444,6 +444,7 @@ LZCAT := $(call qstrip,$(BR2_LZCAT))
 TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+SHELL = $(CURDIR)/support/shell_proxy $(if $(PKG),--redir=$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/$(LOG))
 HOST_DIR = $(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/host,$(call qstrip,$(BR2_HOST_DIR)))
 TARGET_DIR = $(if $(ROOTFS),$(ROOTFS_$(ROOTFS)_TARGET_DIR),$(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/target,$(BASE_TARGET_DIR)))
 else
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9575639b43..1b8bf3058f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -35,6 +35,7 @@
 # Start step
 # $1: step name
 define step_start
+	@$(if $(BR2_PER_PACKAGE_DIRECTORIES),rm -f $(PER_PACKAGE_DIR)/$($(PKG)_NAME)/$(LOG))
 	$(foreach hook,$(GLOBAL_INSTRUMENTATION_HOOKS),$(call $(hook),start,$(1),$($(PKG)_NAME))$(sep))
 endef
 
@@ -146,6 +147,7 @@ endif
 ################################################################################
 
 # Retrieve the archive
+$(BUILD_DIR)/%/.stamp_downloaded: LOG=download.log
 $(BUILD_DIR)/%/.stamp_downloaded:
 	@$(call step_start,download)
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DOWNLOAD_DEPENDENCIES))
@@ -164,6 +166,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 	$(Q)touch $@
 
 # Retrieve actual source archive, e.g. for prebuilt external toolchains
+$(BUILD_DIR)/%/.stamp_actual_downloaded: LOG=actual-download.log
 $(BUILD_DIR)/%/.stamp_actual_downloaded:
 	@$(call step_start,actual-download)
 	$(call DOWNLOAD,$($(PKG)_ACTUAL_SOURCE_SITE)/$($(PKG)_ACTUAL_SOURCE_TARBALL))
@@ -172,6 +175,7 @@ $(BUILD_DIR)/%/.stamp_actual_downloaded:
 	$(Q)touch $@
 
 # Unpack the archive
+$(BUILD_DIR)/%/.stamp_extracted: LOG=extract.log
 $(BUILD_DIR)/%/.stamp_extracted:
 	@$(call step_start,extract)
 	@$(call MESSAGE,"Extracting")
@@ -187,6 +191,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
 
 # Rsync the source directory if the <pkg>_OVERRIDE_SRCDIR feature is
 # used.
+$(BUILD_DIR)/%/.stamp_rsynced: LOG=rsync.log
 $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call step_start,rsync)
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
@@ -207,6 +212,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 # For BR2_GLOBAL_PATCH_DIR, only generate if it is defined
 $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS =  $(PKGDIR)
 $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS += $(addsuffix /$(RAWNAME),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))
+$(BUILD_DIR)/%/.stamp_patched: LOG=patch.log
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call step_start,patch)
 	@$(call MESSAGE,"Patching")
@@ -233,6 +239,7 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
 		$(error BR2_GLOBAL_PATCH_DIR contains nonexistent directory $(dir))))
 
 # Configure
+$(BUILD_DIR)/%/.stamp_configured: LOG=configure.log
 $(BUILD_DIR)/%/.stamp_configured:
 	@$(call step_start,configure)
 	@$(call MESSAGE,"Configuring")
@@ -245,6 +252,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	$(Q)touch $@
 
 # Build
+$(BUILD_DIR)/%/.stamp_built: LOG=build.log
 $(BUILD_DIR)/%/.stamp_built::
 	@$(call step_start,build)
 	@$(call MESSAGE,"Building")
@@ -255,6 +263,7 @@ $(BUILD_DIR)/%/.stamp_built::
 	$(Q)touch $@
 
 # Install to host dir
+$(BUILD_DIR)/%/.stamp_host_installed: LOG=install-host.log
 $(BUILD_DIR)/%/.stamp_host_installed:
 	@$(call step_start,install-host)
 	@$(call MESSAGE,"Installing to host directory")
@@ -285,6 +294,7 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 # can be under @BASE_DIR@ when it's a downloaded toolchain, and can be
 # empty when we use an internal toolchain.
 #
+$(BUILD_DIR)/%/.stamp_staging_installed: LOG=install-staging.log
 $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call step_start,install-staging)
 	@$(call MESSAGE,"Installing to staging directory")
@@ -319,6 +329,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 	$(Q)touch $@
 
 # Install to images dir
+$(BUILD_DIR)/%/.stamp_images_installed: LOG=install-image.log
 $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call step_start,install-image)
 	@mkdir -p $(BINARIES_DIR)
@@ -330,6 +341,7 @@ $(BUILD_DIR)/%/.stamp_images_installed:
 	$(Q)touch $@
 
 # Install to target dir
+$(BUILD_DIR)/%/.stamp_target_installed: LOG=install-target.log
 $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call step_start,install-target)
 	@$(call MESSAGE,"Installing to target")
diff --git a/support/shell_proxy b/support/shell_proxy
new file mode 100755
index 0000000000..a5068a1d5f
--- /dev/null
+++ b/support/shell_proxy
@@ -0,0 +1,19 @@
+#! /bin/sh
+
+shell="/bin/sh"
+
+if [ -x "$BASH" ]; then
+	shell=$BASH
+elif [ -x /bin/bash ]; then
+	shell=/bin/bash
+fi
+
+echo "$1" | grep -q 'redir'
+if [ $? -eq 0 ] ; then
+	redir_out=`echo $1 | awk -F'=' '{ print $2 }'`
+	mkdir -p `dirname $redir_out`
+	touch $redir_out
+	shift
+fi
+
+$shell "$@" | tee -a $redir_out
-- 
2.14.1
