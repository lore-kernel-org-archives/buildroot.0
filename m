From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Sep 2013 23:27:43 +0200
Subject: [Buildroot] [RFCv1 05/11] toolchain: introduce a virtual package
In-Reply-To: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1378416469-17708-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit introduces a virtual package called 'toolchain', located
in 'toolchain/toolchain', which simply depends on
'toolchain-buildroot' or 'toolchain-external' depending on the
selected toolchain backend.

For now, toolchain-buildroot and toolchain-external are still manual
make targets, but the following patches convert those backends to use
the package infrastructure as well.

In addition to this:

 * The main Makefile is modified to always make BASE_TARGETS point to
   this new toolchain virtual package.

 * The main Makefile is changed to include all the toolchain/*/*.mk
   files: the toolchain virtual package, and the toolchain-buildroot
   and toolchain-external directories.

 * The dependency of the toolchain on prepare dirs and dependencies is
   moved to the toolchain virtual package. It is moved as a
   prerequisite of the "toolchain-source" rule to ensure that all
   directories are prepared before we even start extracting the
   toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                         | 18 +++---------------
 toolchain/toolchain/toolchain.mk | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+), 15 deletions(-)
 create mode 100644 toolchain/toolchain/toolchain.mk

diff --git a/Makefile b/Makefile
index f64a101..f2430eb 100644
--- a/Makefile
+++ b/Makefile
@@ -222,11 +222,7 @@ GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
 #
 ################################################################################
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-BASE_TARGETS += toolchain-buildroot
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-BASE_TARGETS += toolchain-external
-endif
+BASE_TARGETS = toolchain
 
 TARGETS:=
 
@@ -316,11 +312,7 @@ include support/dependencies/dependencies.mk
 # We also need the various per-package makefiles, which also add
 # each selected package to TARGETS if that package was selected
 # in the .config file.
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-include toolchain/toolchain-buildroot.mk
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-include toolchain/toolchain-external.mk
-endif
+include toolchain/*/*.mk
 
 # Include the package override file if one has been provided in the
 # configuration.
@@ -387,16 +379,12 @@ $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
-$(BASE_TARGETS): dirs $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
-
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BUILDROOT_CONFIG)
 	$(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
-toolchain: prepare dirs dependencies $(BASE_TARGETS)
-
-world: toolchain $(TARGETS_ALL)
+world: $(BASE_TARGETS) $(TARGETS_ALL)
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars \
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
new file mode 100644
index 0000000..44ed629
--- /dev/null
+++ b/toolchain/toolchain/toolchain.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# toolchain
+#
+################################################################################
+
+TOOLCHAIN_SOURCE =
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+TOOLCHAIN_DEPENDENCIES += toolchain-buildroot
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+TOOLCHAIN_DEPENDENCIES += toolchain-external
+endif
+
+$(eval $(generic-package))
+
+toolchain-source: prepare dirs dependencies $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
+
-- 
1.8.1.2
