From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 23 Nov 2018 19:11:30 +0100
Subject: [Buildroot] [PATCH v2 5/5] optee-test: new package
In-Reply-To: <1542900177-17343-5-git-send-email-etienne.carriere@linaro.org>
References: <1542900177-17343-5-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1542996690-5392-1-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OP-TEE test package provide test materials as part of the OP-TEE
project helping platforms to verify their OP-TEE components
against a set of regression and performance tests.

Package is added in the BR package configuration next to the
OP-TEE client package.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v1 -> v2:
  - Replace BR2_arm with BR2_ARM_CPU_ARMV7 as OP-TEE supports only
    BR2_ARM_CPU_ARMV7 architectures among the 32bit Arm machines.
  - Add missing dependency on BR2_TARGET_OPTEE_OS and select
    BR2_PACKAGE_OPTEE_CLIENT when enabled.
  - Add option BR2_PACKAGE_OPTEE_TEST_SYNCED_VERSION to ensure
    OP-TEE test version is synced with OP-TEE OS version.
  - Fix official repo URL in Config.in package description.
  - Remove useless OPTEE_TEST_INSTALL_STAGING=YES.
  - Do not force output build directory and rely on native one: out/.

---
 package/Config.in                                  |  1 +
 .../optee-test/3.3.0/0001-cmake-rely-on-C.patch    | 32 +++++++++
 package/optee-test/Config.in                       | 75 ++++++++++++++++++++++
 package/optee-test/optee-test.hash                 |  4 ++
 package/optee-test/optee-test.mk                   | 48 ++++++++++++++
 5 files changed, 160 insertions(+)
 create mode 100644 package/optee-test/3.3.0/0001-cmake-rely-on-C.patch
 create mode 100644 package/optee-test/Config.in
 create mode 100644 package/optee-test/optee-test.hash
 create mode 100644 package/optee-test/optee-test.mk

diff --git a/package/Config.in b/package/Config.in
index 35870d0..ff53a75 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2050,6 +2050,7 @@ menu "Security"
 	source "package/optee-benchmark/Config.in"
 	source "package/optee-client/Config.in"
 	source "package/optee-examples/Config.in"
+	source "package/optee-test/Config.in"
 	source "package/paxtest/Config.in"
 	source "package/policycoreutils/Config.in"
 	source "package/refpolicy/Config.in"
diff --git a/package/optee-test/3.3.0/0001-cmake-rely-on-C.patch b/package/optee-test/3.3.0/0001-cmake-rely-on-C.patch
new file mode 100644
index 0000000..ea7b966
--- /dev/null
+++ b/package/optee-test/3.3.0/0001-cmake-rely-on-C.patch
@@ -0,0 +1,32 @@
+cmake: component rely on C support
+
+Without specifing optee_client source expects only C source file
+support cmake may attempt to look for resources as g++. When
+building with environments that do not provide such tools as when
+building from native buildroot ofr a qemu target, optee_client
+fails to build. This change ensure a minimal C support allows to
+build optee_client with cmake.
+
+Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0290205..a3fd269 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,5 @@
+ cmake_minimum_required (VERSION 3.2)
++project (optee_test C)
+ 
+ # Default cross compile settings
+ set (CMAKE_TOOLCHAIN_FILE CMakeToolchain.txt)
+diff --git a/ta/CMakeLists.txt b/ta/CMakeLists.txt
+index 22d7727..795237e 100644
+--- a/ta/CMakeLists.txt
++++ b/ta/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-project (xtest-ta-headers)
++project (xtest-ta-headers C)
+ 
+ add_library(${PROJECT_NAME} INTERFACE)
+ 
diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
new file mode 100644
index 0000000..545db03
--- /dev/null
+++ b/package/optee-test/Config.in
@@ -0,0 +1,75 @@
+config BR2_PACKAGE_OPTEE_TEST
+	bool "optee_test"
+	depends on BR2_aarch64 || BR2_ARM_CPU_ARMV7A
+	depends on BR2_TARGET_OPTEE_OS
+	select BR2_PACKAGE_OPTEE_CLIENT
+	help
+	  This build option enables OP-TEE test package from the
+	  OP-TEE project. It helps platforms to verify the OP-TEE
+	  installation against a set of regression and performance
+	  tests.
+
+	  The package generates userspace test applications and
+	  data files for the Linux userland. It also generates
+	  OP-TEE trusted applications embedded in the target
+	  directory /lib/optee-armtz. These are loaded into the
+	  secure world at runtime.
+
+	  http://github.com/OP-TEE/optee_test
+
+if BR2_PACKAGE_OPTEE_TEST
+
+choice
+	prompt "OP-TEE test version"
+	default BR2_PACKAGE_OPTEE_TEST_LATEST
+	help
+	  Select the version of OP-TEE test you want to use
+
+config BR2_PACKAGE_OPTEE_TEST_LATEST
+	bool "sync with latest release tag"
+	help
+	  This fetches the latest registered release tag from
+	  the OP-TEE test official Git repository.
+
+config BR2_PACKAGE_OPTEE_TEST_CUSTOM_GIT
+	bool "sync with a specific Git"
+	help
+	  Sync with a specific OP-TEE Git repository.
+
+endchoice
+
+config BR2_PACKAGE_OPTEE_TEST_SYNCED_VERSION
+	bool "use same version ref for OP-TEE components"
+	depends on BR2_PACKAGE_OPTEE_TEST_LATEST
+	help
+	  When enabled, OP-TEE examples version must match the version
+	  set for the other OP-TEE components.
+
+config BR2_PACKAGE_OPTEE_TEST_VERSION
+	string
+	default BR2_TARGET_OPTEE_OS_VERSION \
+			if BR2_PACKAGE_OPTEE_TEST_SYNCED_VERSION
+	default "3.3.0"	if BR2_PACKAGE_OPTEE_TEST_LATEST
+	default BR2_PACKAGE_OPTEE_TEST_CUSTOM_REPO_VERSION \
+			if BR2_PACKAGE_OPTEE_TEST_CUSTOM_GIT
+	help
+	  Reference in the target Git repository to sync with.
+
+if BR2_PACKAGE_OPTEE_TEST_CUSTOM_GIT
+
+config BR2_PACKAGE_OPTEE_TEST_CUSTOM_REPO_URL
+	string "Git repository site"
+	help
+	  Specific location of the reference source tree Git
+	  repository.
+
+config BR2_PACKAGE_OPTEE_TEST_CUSTOM_REPO_VERSION
+	string "target reference to pull in the Git repository"
+	help
+	  Package version reference to sync with. As source file
+	  reference is a Git repository, the version reference can
+	  be any Git reference as a tag or a sha1.
+
+endif
+
+endif #BR2_PACKAGE_OPTEE_TEST
diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
new file mode 100644
index 0000000..0da2212
--- /dev/null
+++ b/package/optee-test/optee-test.hash
@@ -0,0 +1,4 @@
+# From https://github.com/OP-TEE/optee_test/archive/3.3.0.tar.gz
+sha256 9651d5db0d28856e45d6bc25ce603bfcf641435bd3264d95b449f093665c8521  optee-test-3.3.0.tar.gz
+# Locally computed
+sha256 6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
new file mode 100644
index 0000000..8040ee5
--- /dev/null
+++ b/package/optee-test/optee-test.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# optee-test
+#
+################################################################################
+
+OPTEE_TEST_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_TEST_VERSION))
+OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
+OPTEE_TEST_LICENSE_FILES = LICENSE.md
+
+ifeq ($(BR2_PACKAGE_OPTEE_TEST_CUSTOM_GIT),y)
+OPTEE_TEST_SITE = $(call qstrip,$(BR2_PACKAGE_OPTEE_TEST_CUSTOM_REPO_URL))
+OPTEE_TEST_SITE_METHOD = git
+BR_NO_CHECK_HASH_FOR += $(OPTEE_TEST_SOURCE)
+else
+OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
+endif
+
+OPTEE_TEST_DEPENDENCIES = optee-client optee-os
+
+ifeq ($(BR2_aarch64),y)
+OPTEE_TEST_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm64
+endif
+ifeq ($(BR2_arm),y)
+OPTEE_TEST_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm32
+endif
+OPTEE_TEST_CONF_OPTS = -DOPTEE_TEST_SDK=$(OPTEE_TEST_SDK)
+
+define OPTEE_TEST_BUILD_TAS
+	@$(foreach f,$(wildcard $(@D)/ta/*/Makefile), \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
+			TA_DEV_KIT_DIR=$(OPTEE_TEST_SDK) \
+			-C $(dir $f) all &&) true
+endef
+
+define OPTEE_TEST_INSTALL_TAS
+	@$(foreach f,$(wildcard $(@D)/ta/*/out/*.ta), \
+		mkdir -p $(TARGET_DIR)/lib/optee_armtz && \
+		$(INSTALL) -v -p --mode=444 \
+			--target-directory=$(TARGET_DIR)/lib/optee_armtz $f \
+			&&) true
+endef
+
+OPTEE_TEST_POST_BUILD_HOOKS += OPTEE_TEST_BUILD_TAS
+OPTEE_TEST_POST_INSTALL_TARGET_HOOKS += OPTEE_TEST_INSTALL_TAS
+
+$(eval $(cmake-package))
-- 
1.9.1
