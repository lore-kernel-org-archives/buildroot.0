From: Denis THULIN <denis.thulin@openwide.fr>
Date: Mon, 31 Aug 2015 11:59:07 +0200
Subject: [Buildroot] [PATCH 2/6] Adds package test infrastructure
In-Reply-To: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
References: <1441015151-3108-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <1441015151-3108-3-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a test generation step in pkg-generic.mk.

The tests are generated used various information found in the package's
.mk file. Tests can be written either directly inside the .mk file or
in a separate file.
The test are written for robot-framework.

The create-test step is an order only dependency of
TARGET_INSTALL_TARGET. It requires configure to be done.
There are two kinds of tests:
 - host tests: Tests that are ran directly on the output/target
   directory. Those test are mostly meant to make sure that some files
 - target tests: Tests that are meant to be ran from a running
   buildroot on itself. Those need to be copied manually inside the
   the rootfs and require package python-robotframework (And python 2
   as robotframework does not work with python 3).

For any kind of test, you can put global test resources (Keywords,
Variables, Libraries) inside the support/test/<test-kind>/ folder.
Those can be used from any test of this kind.

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---
 Makefile                    |  9 ++++-
 package/Makefile.in         |  1 +
 package/pkg-generic.mk      | 20 +++++++++-
 package/pkg-test.mk         | 94 +++++++++++++++++++++++++++++++++++++++++++++
 tests/host/resource.robot   |  7 ++++
 tests/target/resource.robot |  1 +
 tests/tests.mk              | 17 ++++++++
 7 files changed, 146 insertions(+), 3 deletions(-)
 create mode 100644 package/pkg-test.mk
 create mode 100644 tests/host/resource.robot
 create mode 100644 tests/target/resource.robot
 create mode 100644 tests/tests.mk

diff --git a/Makefile b/Makefile
index 07fd69b..63c27c1 100644
--- a/Makefile
+++ b/Makefile
@@ -196,6 +196,7 @@ TARGET_DIR := $(BASE_DIR)/target
 # .config. HOST_DIR will be overwritten later when .config is included.
 HOST_DIR := $(BASE_DIR)/host
 GRAPHS_DIR := $(BASE_DIR)/graphs
+TEST_DIR := $(BASE_DIR)/tests
 
 LEGAL_INFO_DIR = $(BASE_DIR)/legal-info
 REDIST_SOURCES_DIR_TARGET = $(LEGAL_INFO_DIR)/sources
@@ -422,6 +423,8 @@ include fs/common.mk
 
 include $(BR2_EXTERNAL)/external.mk
 
+include tests/tests.mk
+
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR)
 
@@ -556,7 +559,7 @@ endif
 
 $(TARGETS_ROOTFS): target-finalize
 
-target-finalize: $(PACKAGES)
+target-finalize: $(PACKAGES) tests-common-resources
 	@$(call MESSAGE,"Finalizing target directory")
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
@@ -623,6 +626,7 @@ endif
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
+
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
@@ -825,7 +829,8 @@ printvars:
 clean:
 	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
-		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
+		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) \
+		$(TEST_DIR)
 
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
diff --git a/package/Makefile.in b/package/Makefile.in
index 545694f..68a970a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -400,3 +400,4 @@ include package/pkg-generic.mk
 include package/pkg-kconfig.mk
 include package/pkg-rebar.mk
 include package/pkg-kernel-module.mk
+include package/pkg-test.mk
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6a7d97e..f688219 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -222,6 +222,17 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 	$(Q)touch $@
 	@$(call step_end,install-staging)
 
+# Create corresponding tests
+$(BUILD_DIR)/%/.stamp_tests_created:
+	$(call step_start,create-tests)
+	$(foreach hook,$($(PKG)_PRE_CREATE_TESTS_HOOKS),$(call $(hook))$(sep))
+	@$(call MESSAGE,"Creating corresponding tests")
+	$(call TEST_BUILD_ALL)
+	$(foreach hook,$($(PKG)_POST_CREATE_TESTS_HOOKS),$(call $(hook))$(sep))
+	$(Q)touch $@
+	@$(call step_end,create-tests)
+
+
 # Install to images dir
 $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call step_start,install-image)
@@ -472,7 +483,7 @@ $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
-
+$(2)_CREATE_TESTS =	$$($(2)_DIR)/.stamp_tests_created
 # default extract command
 $(2)_EXTRACT_CMDS ?= \
 	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
@@ -563,6 +574,9 @@ ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 #  configure
 $$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_PATCH)
 
+$(1)-create-tests:		$$($(2)_CREATE_TESTS)
+$$($(2)_TARGET_INSTALL_TARGET):	| $$($(2)_CREATE_TESTS)
+
 $(1)-patch:		$$($(2)_TARGET_PATCH)
 $$($(2)_TARGET_PATCH):	$$($(2)_TARGET_EXTRACT)
 # Order-only dependency
@@ -663,6 +677,9 @@ $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
 $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
+$$($(2)_CREATE_TESTS):			PKG=$(2)
+$$($(2)_CREATE_TESTS):			pkg=$(1)
+$$($(2)_CREATE_TESTS):			ORIGINAL_DIR=$(pkgdir)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
 $$($(2)_TARGET_RSYNC):                  SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):                  PKG=$(2)
@@ -833,6 +850,7 @@ endif
 	$(1)-graph-depends \
 	$(1)-install \
 	$(1)-install-host \
+	$(1)-create-tests \
 	$(1)-install-images \
 	$(1)-install-staging \
 	$(1)-install-target \
diff --git a/package/pkg-test.mk b/package/pkg-test.mk
new file mode 100644
index 0000000..34c5494
--- /dev/null
+++ b/package/pkg-test.mk
@@ -0,0 +1,94 @@
+################################################################################
+#
+# This file contains everything that is necessary in order to create
+# Robotframework tests for any buildroot package. Tests are written either
+# directly inside the package's .mk file or inside specified directories and
+# files. Common ressource files and libraries can be found in support/tests.
+#
+################################################################################
+
+# TEST_BUILD_ALL is called by pkg-generic. It Creates two kinds of tests:
+# Tests that are meant to be ran on the output/target directory, called host
+# tests.
+# And tests that are ran directly on the running buildroot, called target
+# tests.
+# Those need to be copied to the rootfs and require package
+# python-robotframework to run (And python 2 as robot framework does not
+# support python 3 yet).
+define TEST_BUILD_ALL
+	$(eval HOST_TEST := )
+	$(eval TEST_KIND := target)
+	$(call TEST_BUILD)
+	$(eval HOST_TEST := _HOST)
+	$(eval TEST_KIND := host)
+	$(call TEST_BUILD)
+endef
+
+# To create tests, we need a lot of information:
+# 	- $(PKG)_TEST_DIR is the test output directory
+# 	- $(PKG)_TEST_SUITE is the tests suite being created
+# 	- $(ORIGINAL_DIR)/$(TEST_KIND)_test_material is a set of directory from
+# 	  which tests/resource/libraries are to be copied.
+# 	- $(TEST_DIR)/$(TEST_KIND)/resources/resource.robot is a global resource
+# 	  file.
+# 	  A tiny wrapper around the telnet library is also provided
+# 	- $(PKG)_TEST_ORIGINAL is a robotframework test file that is merged with
+# 	  the test suite being built. Test that take more than two lines should be
+# 	  written there rather than in the .mk file (and use variables as much as
+# 	  possible)
+# 	- $(PKG)_TEST_VARIABLES is a list of variables used by test suites.
+# 	  Those should look like myvar="Itsvalue". Those variables will be formated
+# 	  to work inside the test suite
+# 	- $(PKG)_TEST_INSTALL_LOCATION should contain a file or a folder that makes
+# 	  sure the package is installed inside the target directory. A test is
+# 	  automatically created if it is present.
+# 	- $(PKG)_TEST_CASES contains all test cases that are written inside the .mk
+# 	  file. Use a define to write your tests this way. Please use TEST_ORIGINAL
+# 	  rather than this if your test is more than two lines long.
+# 	- $(PKG)_TEST_KEYWORDS contains keywords from the .mk file.
+define TEST_BUILD
+	$(eval $(PKG)_TEST_DIR := $(TEST_DIR)/$(TEST_KIND)/$(pkg))
+	$(eval $(PKG)_TEST_SUITE := $($(PKG)_TEST_DIR)/$(pkg).robot)
+
+	@mkdir -p $($(PKG)_TEST_DIR)
+	if [ ! -z $($(PKG)$(HOST_TEST)_TEST_MATERIAL) ]; then \
+		cp -r $(ORIGINAL_DIR)$($(PKG)$(HOST_TEST)_TEST_MATERIAL) $($(PKG)_TEST_DIR); \
+	fi
+
+	@echo '*** Settings ***' > $($(PKG)_TEST_SUITE)
+	@echo "Resource    ../resources/resource.robot" >> $($(PKG)_TEST_SUITE)
+
+	@if [ ! -z $($(PKG)$(HOST_TEST)_TEST_ORIGINAL) ]; then \
+		sed -n -e '/\*\*\* Settings \*\*\*/,/\*\*\*/ {/\*\*\*/b; /^$$/b; p}' \
+		$(ORIGINAL_DIR)$($(PKG)$(HOST_TEST)_TEST_ORIGINAL) >> $($(PKG)_TEST_SUITE); \
+	fi
+
+	@echo '*** Variables ***' >> $($(PKG)_TEST_SUITE)
+	@for var in $($(PKG)$(HOST_TEST)_TEST_VARIABLES); do \
+		echo $$var | sed 's/^\(.*\)=\(.*\)$$/$${\1}=    \2/' >> $($(PKG)_TEST_SUITE); \
+	done
+	@if [ ! -z $($(PKG)$(HOST_TEST)_TEST_ORIGINAL) ]; then \
+		sed -n -e '/\*\*\* Variables \*\*\*/,/\*\*\*/ {/\*\*\*/b; /^$$/b; p}' \
+		$(ORIGINAL_DIR)$($(PKG)$(HOST_TEST)_TEST_ORIGINAL) >> $($(PKG)_TEST_SUITE); \
+	fi
+
+	@echo '*** Test Cases ***' >> $($(PKG)_TEST_SUITE)
+	@if [ $(TEST_KIND) = host ]; then \
+		if [ ! -z $($(PKG)_TEST_INSTALL_LOCATION) ] ; then \
+			echo '$(pkg) Is Installed' >> $($(PKG)_TEST_SUITE); \
+			echo '    [Template]     Package Installed On Target' >> $($(PKG)_TEST_SUITE); \
+			echo '    $($(PKG)_TEST_INSTALL_LOCATION)' >> $($(PKG)_TEST_SUITE); \
+		fi; \
+	fi
+	@echo -e $($(PKG)$(HOST_TEST)_TEST_CASES) >> $($(PKG)_TEST_SUITE)
+	@if [ ! -z $($(PKG)$(HOST_TEST)_TEST_ORIGINAL) ]; then \
+		sed -n -e '/\*\*\* Test Cases \*\*\*/,/\*\*\*/ {/\*\*\*/b; /^$$/b; p}' \
+		$(ORIGINAL_DIR)$($(PKG)$(HOST_TEST)_TEST_ORIGINAL) >> $($(PKG)_TEST_SUITE); \
+	fi
+
+	@echo '*** Keywords ***' >> $($(PKG)_TEST_SUITE)
+	@if [ ! -z $($(PKG)$(HOST_TEST)_TEST_ORIGINAL) ]; then \
+		sed -n -e '/\*\*\* Keywords \*\*\*/,/\*\*\*/ {/\*\*\*/b; /^$$/b; p}' \
+		$(ORIGINAL_DIR)$($(PKG)$(HOST_TEST)_TEST_ORIGINAL) >> $($(PKG)_TEST_SUITE); \
+	fi
+endef
diff --git a/tests/host/resource.robot b/tests/host/resource.robot
new file mode 100644
index 0000000..650d4c8
--- /dev/null
+++ b/tests/host/resource.robot
@@ -0,0 +1,7 @@
+*** Settings ***
+Library         OperatingSystem
+Variables       common_variables.py
+*** Keywords ***
+Package Installed On Target
+    [arguments]    ${File}
+    OperatingSystem.Should Exist    ${target_dir}/${File}
diff --git a/tests/target/resource.robot b/tests/target/resource.robot
new file mode 100644
index 0000000..c742ffc
--- /dev/null
+++ b/tests/target/resource.robot
@@ -0,0 +1 @@
+*** Variables ***
diff --git a/tests/tests.mk b/tests/tests.mk
new file mode 100644
index 0000000..a246c6e
--- /dev/null
+++ b/tests/tests.mk
@@ -0,0 +1,17 @@
+tests-common-resources: host-python-robotframework
+	rm -rf $(TEST_DIR)/host/resources
+	rm -rf $(TEST_DIR)/target/resources
+	mkdir -p $(TEST_DIR)/host
+	cp -r tests/host $(TEST_DIR)/host/resources
+	echo target_dir = \"$(TARGET_DIR)\" >> $(TEST_DIR)/host/resources/common_variables.py
+	mkdir -p $(TEST_DIR)/target
+	cp -r tests/target $(TEST_DIR)/target/resources
+
+
+PYBOT = $(HOST_DIR)/usr/bin/pybot
+PYBOT_OPTS ?= -d $(TEST_DIR)/logs -x xunit.xml
+
+tests: tests-common-resources
+	@$(PYBOT) $(PYBOT_OPTS) $(TEST_DIR)/host
+
+.PHONY: test-common-resources tests
-- 
2.5.0
