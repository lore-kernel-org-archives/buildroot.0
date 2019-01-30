From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 30 Jan 2019 11:47:26 +0100
Subject: [Buildroot] [PATCH v4 4/7] optee-test: new package
In-Reply-To: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
References: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1548845249-28201-4-git-send-email-etienne.carriere@linaro.org>
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

This change references in Buildroot the today's latest OP-TEE
revision release tagged 3.4.0 with an added patch to fix an issue
reported by recent GCC toolchains.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

---
Changes v3 -> v4:
   - Upgrade from OP-TEE release 3.3.0 to 3.4.0. Local patches for 3.3.0
     are not applicable. Add a local patch to fix a loop optimization
     issue reported by recent GCC.

Changes v2 -> v3:
  - Add an entry in file DEVELOPERS.
  - Clean Config.in layout and description sections.
  - Drop BR2_PACKAGE_OPTEE_TEST_SYNCED_VERSION.
  - Clean optee-test.mk layout.
  - Replace common optee-test.hash with per-version .hash files.
  - Patch optee_benchmark 3.3.0 against an issue reported by GCC warns.
  - Remove dependency of BR2_PACKAGE_OPTEE_EXAMPLES and Arm architecture.
    As the package depends on BR2_TARGET_OPTEE_OS, leave it to optee-os
    to define the supported architectures.

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
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...-regression-4100-update-string-conversion.patch | 67 ++++++++++++++++++++++
 package/optee-test/3.4.0/optee-test.hash           |  4 ++
 package/optee-test/Config.in                       | 63 ++++++++++++++++++++
 package/optee-test/optee-test.mk                   | 45 +++++++++++++++
 6 files changed, 181 insertions(+)
 create mode 100644 package/optee-test/3.4.0/0001-regression-4100-update-string-conversion.patch
 create mode 100644 package/optee-test/3.4.0/optee-test.hash
 create mode 100644 package/optee-test/Config.in
 create mode 100644 package/optee-test/optee-test.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5efb4ad..f572224 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -685,6 +685,7 @@ N:	Etienne Carriere <etienne.carriere@linaro.org>
 F:	boot/optee-os/
 F:	package/optee-client/
 F:	package/optee-examples/
+F:	package/optee-test/
 
 N:	Eugene Tarassov <eugene@largest.net>
 F:	package/tcf-agent/
diff --git a/package/Config.in b/package/Config.in
index 1c3ceab..fb71fe7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2079,6 +2079,7 @@ menu "Security"
 	source "package/checkpolicy/Config.in"
 	source "package/optee-client/Config.in"
 	source "package/optee-examples/Config.in"
+	source "package/optee-test/Config.in"
 	source "package/paxtest/Config.in"
 	source "package/policycoreutils/Config.in"
 	source "package/refpolicy/Config.in"
diff --git a/package/optee-test/3.4.0/0001-regression-4100-update-string-conversion.patch b/package/optee-test/3.4.0/0001-regression-4100-update-string-conversion.patch
new file mode 100644
index 0000000..094262d
--- /dev/null
+++ b/package/optee-test/3.4.0/0001-regression-4100-update-string-conversion.patch
@@ -0,0 +1,67 @@
+commit 662c802aa6c154a26e1d218fd768e92e6ee9a6d9
+Author: Etienne Carriere <etienne.carriere@linaro.org>
+Date:   Wed Jan 30 10:13:59 2019 +0100
+
+    regression 4100: update string conversion loop
+    
+    Change the loop used to convert string into numerical value.
+    The original loop was fine but its implementation hits toolchain
+    unsafe-loop-optimizations feature. The new implementation
+    proposed here simplifies a bit the loop and prevents toolchain
+    from complaining when directive -Werror=unsafe-loop-optimizations
+    is enabled.
+    
+    Issue reported by the Buildroot cross toolchain [1] with the
+    following error traces:
+    
+    build/armv7/build/optee-test-3.4.0/host/xtest/regression_4100.c:447:8: error: missed loop optimization, the loop counter may overflow [-Werror=unsafe-loop-optimizations]
+      while (spos) {
+            ^
+    build/optee-test-3.4.0/host/xtest/regression_4100.c:454:6: error: missed loop optimization, the loop counter may overflow [-Werror=unsafe-loop-optimizations]
+       if (!spos)
+          ^
+    
+    [1] arm-buildroot-linux-uclibcgnueabihf-gcc.br_real (Buildroot 2019.02-git-00933-gb75e93c) 7.4.0
+    
+    Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+
+diff --git a/host/xtest/regression_4100.c b/host/xtest/regression_4100.c
+index b477f38..88346d4 100644
+--- a/host/xtest/regression_4100.c
++++ b/host/xtest/regression_4100.c
+@@ -445,21 +445,24 @@ static TEEC_Result convert_from_string(ADBG_Case_t *c, TEEC_Session *s,
+ 		return TEEC_ERROR_OUT_OF_MEMORY;
+ 
+ 	while (spos) {
+-		spos--;
+-		nibble = digit_value(str[spos]);
+-		if (nibble == -1)
++		nibble = digit_value(str[spos - 1]);
++		if (nibble == -1) {
++			spos--;
+ 			break;
++		}
+ 		os[ospos] = nibble;
+ 
+-		if (!spos)
+-			break;
++		if (spos > 1) {
++			nibble = digit_value(str[spos - 2]);
++			if (nibble == -1) {
++				spos -= 2;
++				break;
++			}
++			os[ospos] |= nibble << 4;
++			ospos--;
++			spos--;
++		}
+ 		spos--;
+-		nibble = digit_value(str[spos]);
+-		if (nibble == -1)
+-			break;
+-
+-		os[ospos] |= nibble << 4;
+-		ospos--;
+ 	}
+ 
+ 	if (spos)
diff --git a/package/optee-test/3.4.0/optee-test.hash b/package/optee-test/3.4.0/optee-test.hash
new file mode 100644
index 0000000..c8ae51b
--- /dev/null
+++ b/package/optee-test/3.4.0/optee-test.hash
@@ -0,0 +1,4 @@
+# From https://github.com/OP-TEE/optee_test/archive/3.4.0.tar.gz
+sha256 755904c5b845763a2460c32c21100a57c713009b6b88cc3fc21f0e5be8645e2b  optee-test-3.4.0.tar.gz
+# Locally computed
+sha256 6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
new file mode 100644
index 0000000..fc9a632
--- /dev/null
+++ b/package/optee-test/Config.in
@@ -0,0 +1,63 @@
+config BR2_PACKAGE_OPTEE_TEST
+	bool "optee-test"
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
+	  OP-TEE trusted applications.
+
+	  Trusted application binary files are installed in the target
+	  directory /lib/optee_armtz as other trusted applications.
+	  At runtime OP-TEE OS can load trusted applications from this
+	  non-secure filesystem/directory into the secure world for
+	  execution.
+
+	  http://github.com/OP-TEE/optee_test
+
+if BR2_PACKAGE_OPTEE_TEST
+
+choice
+	prompt "version"
+	default BR2_PACKAGE_OPTEE_TEST_LATEST
+	help
+	  Select the version of OP-TEE test you want to use
+
+config BR2_PACKAGE_OPTEE_TEST_LATEST
+	bool "3.4.0"
+	help
+	  This fetches the registered release tag from the
+	  OP-TEE official Git repository.
+
+config BR2_PACKAGE_OPTEE_TEST_CUSTOM_GIT
+	bool "Custom Git repository"
+	help
+	  Sync with a specific OP-TEE Git repository.
+
+endchoice
+
+if BR2_PACKAGE_OPTEE_TEST_CUSTOM_GIT
+
+config BR2_PACKAGE_OPTEE_TEST_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_PACKAGE_OPTEE_TEST_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by
+	  Git E.G. a sha id, a tag, branch, ..
+
+endif
+
+config BR2_PACKAGE_OPTEE_TEST_VERSION
+	string
+	default "3.4.0"	if BR2_PACKAGE_OPTEE_TEST_LATEST
+	default BR2_PACKAGE_OPTEE_TEST_CUSTOM_REPO_VERSION \
+			if BR2_PACKAGE_OPTEE_TEST_CUSTOM_GIT
+
+endif #BR2_PACKAGE_OPTEE_TEST
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
new file mode 100644
index 0000000..0ec7238
--- /dev/null
+++ b/package/optee-test/optee-test.mk
@@ -0,0 +1,45 @@
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
+OPTEE_TEST_DEPENDENCIES = optee-client optee-os
+
+ifeq ($(BR2_PACKAGE_OPTEE_TEST_CUSTOM_GIT),y)
+OPTEE_TEST_SITE = $(call qstrip,$(BR2_PACKAGE_OPTEE_TEST_CUSTOM_REPO_URL))
+OPTEE_TEST_SITE_METHOD = git
+BR_NO_CHECK_HASH_FOR += $(OPTEE_TEST_SOURCE)
+else
+OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
+endif
+
+ifeq ($(BR2_aarch64),y)
+OPTEE_TEST_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm64
+endif
+ifeq ($(BR2_arm),y)
+OPTEE_TEST_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm32
+endif
+OPTEE_TEST_CONF_OPTS = -DOPTEE_TEST_SDK=$(OPTEE_TEST_SDK)
+
+# Trusted Application are not built from CMake due to ta_dev_kit dependencies.
+# We must build and install them on target.
+define OPTEE_TEST_BUILD_TAS
+	@$(foreach f,$(wildcard $(@D)/ta/*/Makefile), \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
+			TA_DEV_KIT_DIR=$(OPTEE_TEST_SDK) \
+			-C $(dir $f) all &&) true
+endef
+define OPTEE_TEST_INSTALL_TAS
+	@mkdir -p $(TARGET_DIR)/lib/optee_armtz
+	@$(INSTALL) -D -m 444 -t $(TARGET_DIR)/lib/optee_armtz $(@D)/ta/*/*.ta
+endef
+OPTEE_TEST_POST_BUILD_HOOKS += OPTEE_TEST_BUILD_TAS
+OPTEE_TEST_POST_INSTALL_TARGET_HOOKS += OPTEE_TEST_INSTALL_TAS
+
+$(eval $(cmake-package))
