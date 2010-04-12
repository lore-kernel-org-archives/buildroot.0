From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 15:11:24 +0200
Subject: [Buildroot] [PATCH 12/21] Remove incorrect 'dummy' example
In-Reply-To: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1a952fcbad64099127011384e16b8183c183fc53.1271077873.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the introduction of the AUTOTARGETS infrastructure, the dummy
example is no longer correct. Moreover, the documentation now contains
extensive details about how new packages should be added, either using
the GENTARGETS or the AUTOTARGETS infrastructures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dummy/Config.in |    7 ----
 package/dummy/dummy.mk  |   93 -----------------------------------------------
 2 files changed, 0 insertions(+), 100 deletions(-)
 delete mode 100644 package/dummy/Config.in
 delete mode 100644 package/dummy/dummy.mk

diff --git a/package/dummy/Config.in b/package/dummy/Config.in
deleted file mode 100644
index 71c1fed..0000000
--- a/package/dummy/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_DUMMY
-	bool "dummy"
-	help
-	  This is a dummy package to show how to integrate a new package into
-	  Buildroot. The syntax for this file is the default kbuild from the
-	  Linux kernel, more information at
-	  http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=tree;f=Documentation/kbuild
diff --git a/package/dummy/dummy.mk b/package/dummy/dummy.mk
deleted file mode 100644
index 34d166f..0000000
--- a/package/dummy/dummy.mk
+++ /dev/null
@@ -1,93 +0,0 @@
-#############################################################
-#
-# dummy
-#
-#############################################################
-
-# Current version, use the latest unless there are any known issues.
-DUMMY_VERSION=1.2.3
-# The filename of the package to download.
-DUMMY_SOURCE=dummy-$(DUMMY_VERSION).tar.bz2
-# The site and path to where the source packages are.
-DUMMY_SITE=http://www.example.net/dummy/source
-# The directory which the source package is extracted to.
-DUMMY_DIR=$(BUILD_DIR)/dummy-$(DUMMY_VERSION)
-# Which decompression to use, BZCAT or ZCAT.
-DUMMY_CAT:=$(BZCAT)
-# Target binary for the package.
-DUMMY_BINARY:=dummy
-# Not really needed, but often handy define.
-DUMMY_TARGET_BINARY:=usr/bin/$(DUMMY_BINARY)
-
-# The download rule. Main purpose is to download the source package.
-$(DL_DIR)/$(DUMMY_SOURCE):
-	$(call DOWNLOAD,$(DUMMY_SITE),$(DUMMY_SOURCE))
-
-# The unpacking rule. Main purpose is to extract the source package, apply any
-# patches and update config.guess and config.sub.
-$(DUMMY_DIR)/.unpacked: $(DL_DIR)/$(DUMMY_SOURCE)
-	$(DUMMY_CAT) $(DL_DIR)/$(DUMMY_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(DUMMY_DIR) package/dummy/ dummy-$(DUMMY_VERSION)-\*.patch\*
-	$(CONFIG_UPDATE) $(DUMMY_DIR)
-	touch $@
-
-# The configure rule. Main purpose is to get the package ready for compilation,
-# usually by running the configure script with different kinds of options
-# specified.
-$(DUMMY_DIR)/.configured: $(DUMMY_DIR)/.unpacked
-	(cd $(DUMMY_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
-
-$(DUMMY_DIR)/$(DUMMY_BINARY): $(DUMMY_DIR)/.configured
-	$(MAKE) -C $(DUMMY_DIR)
-
-# The installing rule. Main purpose is to install the binary into the target
-# root directory and make sure it is stripped from debug symbols to reduce the
-# space requirements to a minimum.
-#
-# Only the files needed to run the application should be installed to the
-# target root directory, to not waste valuable flash space.
-$(TARGET_DIR)/$(DUMMY_TARGET_BINARY): $(DUMMY_DIR)/$(DUMMY_BINARY)
-	cp -dpf $(DUMMY_DIR)/dummy $@
-	$(STRIPCMD) --strip-unneeded $@
-
-# Main rule which shows which other packages must be installed before the dummy
-# package is installed. This to ensure that all depending libraries are
-# installed.
-dummy: $(TARGET_DIR)/$(DUMMY_TARGET_BINARY)
-
-# Source download rule. Main purpose to download the source package. Since some
-# people would like to work offline, it is mandotory to implement a rule which
-# downloads everything this package needs.
-dummy-source: $(DL_DIR)/$(DUMMY_SOURCE)
-
-# Clean rule. Main purpose is to clean the build directory, thus forcing a new
-# rebuild the next time Buildroot is made.
-dummy-clean:
-	-$(MAKE) -C $(DUMMY_DIR) clean
-
-# Directory clean rule. Main purpose is to remove the build directory, forcing
-# a new extraction, patching and rebuild the next time Buildroot is made.
-dummy-dirclean:
-	rm -rf $(DUMMY_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-# This is how the dummy package is added to the list of rules to build.
-ifeq ($(BR2_PACKAGE_DUMMY),y)
-TARGETS+=dummy
-endif
-- 
1.6.3.3
