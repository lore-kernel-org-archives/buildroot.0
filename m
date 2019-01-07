From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon,  7 Jan 2019 11:24:55 +0100
Subject: [Buildroot] [PATCH v3 4/7] optee-test: new package
In-Reply-To: <1546856698-20032-1-git-send-email-etienne.carriere@linaro.org>
References: <1542996547-5003-1-git-send-email-etienne.carriere@linaro.org>
 <1546856698-20032-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1546856698-20032-4-git-send-email-etienne.carriere@linaro.org>
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
revision release tagged 3.3.0 with few added patches:
- fix an issue with the CMake files,
- fix few issues with recent GCC releases (8.x)

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
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
 .../optee-test/3.3.0/0001-cmake-rely-on-C.patch    | 32 +++++++++++
 ...ent-unexpected-build-warning-with-strncpy.patch | 54 +++++++++++++++++++
 ...egression-4011-correct-potential-overflow.patch | 60 +++++++++++++++++++++
 package/optee-test/3.3.0/optee-test.hash           |  4 ++
 package/optee-test/Config.in                       | 63 ++++++++++++++++++++++
 package/optee-test/optee-test.mk                   | 45 ++++++++++++++++
 8 files changed, 260 insertions(+)
 create mode 100644 package/optee-test/3.3.0/0001-cmake-rely-on-C.patch
 create mode 100644 package/optee-test/3.3.0/0002-xtest-prevent-unexpected-build-warning-with-strncpy.patch
 create mode 100644 package/optee-test/3.3.0/0003-regression-4011-correct-potential-overflow.patch
 create mode 100644 package/optee-test/3.3.0/optee-test.hash
 create mode 100644 package/optee-test/Config.in
 create mode 100644 package/optee-test/optee-test.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c9f2e00..28ba658 100644
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
index b76db17..e5b6dad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2078,6 +2078,7 @@ menu "Security"
 	source "package/checkpolicy/Config.in"
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
diff --git a/package/optee-test/3.3.0/0002-xtest-prevent-unexpected-build-warning-with-strncpy.patch b/package/optee-test/3.3.0/0002-xtest-prevent-unexpected-build-warning-with-strncpy.patch
new file mode 100644
index 0000000..55e796b
--- /dev/null
+++ b/package/optee-test/3.3.0/0002-xtest-prevent-unexpected-build-warning-with-strncpy.patch
@@ -0,0 +1,54 @@
+commit 30db8e0261fabe83bea6eb1922d9581e140125b6
+Author: Etienne Carriere <etienne.carriere@linaro.org>
+Date:   Fri Dec 21 15:36:00 2018 +0100
+
+    xtest: prevent unexpected build warning with strncpy
+    
+    This change modifies adbg_run.c to prevent a false positive
+    warning reported by GCC 8.2 on usage of strncpy():
+    
+        build/optee_test/host/xtest/adbg/src/adbg_run.c: In function 'Do_ADBG_AppendToSuite':
+        build/optee_test/host/xtest/adbg/src/adbg_run.c:103:3: error: 'strncpy' specified bound depends on the length of the source argument [-Werror=stringop-overflow=]
+           strncpy(p, Source_p->SuiteID_p, size);
+           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+        build/optee_test/host/xtest/adbg/src/adbg_run.c:88:9: note: length computed here
+          size = strlen(Source_p->SuiteID_p);
+                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
+        cc1: all warnings being treated as errors
+    
+    From [1]:
+      Using strncpy Safely
+      In general, it is not possible to avoid string truncation by strncpy
+      except by sizing the destination to be at least a byte larger than
+      the length of the source string. With that approach, however, using
+      strncpy becomes unnecessary and the function can be avoided in favor
+      of other APIs such as strcpy or (less preferably) memcpy. Much has
+      been written about the problems with strncpy and we recommend to
+      avoid it whenever possible. It is, however, worth keeping in mind
+      that unlike other standard string-handling functions, strncpy always
+      writes exactly as many characters as specified by the third argument;
+      if the source string is shorter, the function fills the remaining
+      bytes with NULs.
+    
+    This change prefers using a snprintf() as used in the alternate
+    instruction block of the strncpy() call.
+    
+    [1] https://developers.redhat.com/blog/2018/05/24/detecting-string-truncation-with-gcc-8/
+    
+    Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+    Signed-off-by: Simon Hughes <simon.hughes@arm.com>
+    Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+diff --git a/host/xtest/adbg/src/adbg_run.c b/host/xtest/adbg/src/adbg_run.c
+index 406e429..2739db5 100644
+--- a/host/xtest/adbg/src/adbg_run.c
++++ b/host/xtest/adbg/src/adbg_run.c
+@@ -100,7 +100,7 @@ int Do_ADBG_AppendToSuite(
+ 		snprintf(p, size, "%s+%s", Dest_p->SuiteID_p,
+ 			 Source_p->SuiteID_p);
+ 	else
+-		strncpy(p, Source_p->SuiteID_p, size);
++		snprintf(p, size, "%s", Source_p->SuiteID_p);
+ 	free((void *)Dest_p->SuiteID_p);
+ 	Dest_p->SuiteID_p = p;
+ 
diff --git a/package/optee-test/3.3.0/0003-regression-4011-correct-potential-overflow.patch b/package/optee-test/3.3.0/0003-regression-4011-correct-potential-overflow.patch
new file mode 100644
index 0000000..77b7cd7
--- /dev/null
+++ b/package/optee-test/3.3.0/0003-regression-4011-correct-potential-overflow.patch
@@ -0,0 +1,60 @@
+commit 4e352aad0cfceeec1d9adde879a034039a0cf267
+Author: Etienne Carriere <etienne.carriere@linaro.org>
+Date:   Fri Dec 21 15:36:25 2018 +0100
+
+    regression 4011: correct potential overflow
+    
+    Fix issues reported by GCC 8.2.0.
+    
+    build/optee_test/host/xtest/regression_4000.c: In function 'xtest_tee_test_4011':
+    build/optee_test/host/xtest/regression_4000.c:5029:3: error: 'memmove' pointer overflow between offset [0, 8] and size [4294967295, 2147483647] accessing array 'tmp' with type 'uint8_t[1024]' {aka 'unsigned char[1024]'} [-Werror=array-bounds]
+       memmove(tmp + n + i, tmp + m, tmp_size - m);
+       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+    build/optee_test/host/xtest/regression_4000.c:4927:10: note: array 'tmp' declared here
+      uint8_t tmp[1024];
+              ^~~
+    build/optee_test/host/xtest/regression_4000.c:5029:3: error: 'memmove' specified size 4294967295 exceeds maximum object size 2147483647 [-Werror=stringop-overflow=]
+       memmove(tmp + n + i, tmp + m, tmp_size - m);
+       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+    cc1: all warnings being treated as errors
+    
+    Reported-by: Simon Hughes <simon.hughes@arm.com>
+    Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+    Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+diff --git a/host/xtest/regression_4000.c b/host/xtest/regression_4000.c
+index 766aad2..205a226 100644
+--- a/host/xtest/regression_4000.c
++++ b/host/xtest/regression_4000.c
+@@ -5018,18 +5018,28 @@ static void xtest_tee_test_4011(ADBG_Case_t *c)
+ 				out, out_size, tmp, &tmp_size)))
+ 			goto out;
+ 
++		if (!ADBG_EXPECT_COMPARE_UNSIGNED(c, tmp_size, <=, sizeof(tmp)))
++			goto out;
++
+ 		/* 4.1 */
+-		for (n = 0; n < tmp_size; n++)
++		for (n = 0; n < tmp_size - i; n++)
+ 			if (tmp[n] == 0xff)
+ 				break;
++
++		/* Shall find@least a padding start before buffer end */
++	        if (!ADBG_EXPECT_COMPARE_UNSIGNED(c, n, <, tmp_size - i - 1))
++			goto out;
++
+ 		for (m = n + 1; m < tmp_size; m++)
+ 			if (tmp[m] != 0xff)
+ 				break;
++
+ 		/* 4.2 */
+ 		memmove(tmp + n + i, tmp + m, tmp_size - m);
++
+ 		/* 4.3 */
+-		for (n = n + tmp_size - m + i; n < tmp_size; n++)
+-			tmp[n] = 0;
++		n = n + i + tmp_size - m;
++		memset(tmp + n, 0, tmp_size - n);
+ 
+ 		/* 5 */
+ 		out_size = sizeof(out);
diff --git a/package/optee-test/3.3.0/optee-test.hash b/package/optee-test/3.3.0/optee-test.hash
new file mode 100644
index 0000000..0da2212
--- /dev/null
+++ b/package/optee-test/3.3.0/optee-test.hash
@@ -0,0 +1,4 @@
+# From https://github.com/OP-TEE/optee_test/archive/3.3.0.tar.gz
+sha256 9651d5db0d28856e45d6bc25ce603bfcf641435bd3264d95b449f093665c8521  optee-test-3.3.0.tar.gz
+# Locally computed
+sha256 6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
new file mode 100644
index 0000000..40ac8e8
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
+	bool "3.3.0"
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
+	default "3.3.0"	if BR2_PACKAGE_OPTEE_TEST_LATEST
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
-- 
1.9.1
