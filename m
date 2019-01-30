From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed, 30 Jan 2019 11:47:25 +0100
Subject: [Buildroot] [PATCH v4 3/7] optee-examples: new package
In-Reply-To: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
References: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1548845249-28201-3-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package generates embedded Linux based OS userland client
applications and OP-TEE OS trusted applications all embedded in
the file system. These applications shows how to use the APIs
OP-TEE OS is based on, both in the non secure and secure worlds.

Package is added next to the OP-TEE client package in the BR
package configuration.

This change references in Buildroot the today's latest OP-TEE
revision release tagged 3.4.0 with an added patch to fix an issue
reported by recent GCC toolchains.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

---
Changes v3 -> v4:
  - Upgrade from OP-TEE release 3.3.0 to 3.4.0.

Changes v2 -> v3:
  - Add an entry in file DEVELOPERS.
  - Clean Config.in layout and description sections.
  - Drop BR2_PACKAGE_OPTEE_EXAMPLES_SYNCED_VERSION.
  - Clean optee-examples.mk layout.
  - Replace common optee-examples.hash with per-version .hash files.
  - Simplify install command in iotee-test.mk
  - Patch optee_test 3.3.0 against an issue in the CMake files.
  - Remove dependency of BR2_PACKAGE_OPTEE_EXAMPLES. As the package
    depends on BR2_TARGET_OPTEE_OS, leave it to optee-os to define
    the supported architectures.

Changes v1 -> v2:
  - Replace BR2_arm with BR2_ARM_CPU_ARMV7 as OP-TEE supports only
    BR2_ARM_CPU_ARMV7 architectures among the 32bit Arm machines.
  - Select OP-TEE client and add dependency on OP-TEE OS.
  - Add option BR2_PACKAGE_OPTEE_EXAMPLES_SYNCED_VERSION to ensure
    OP-TEE examples version is synced with OP-TEE OS version.
  - Do not force output build directory, rely on native path: out/.
  - Replace if/endif with depends on in Config.in.
  - Remove useless OPTEE_EXAMPLES_INSTALL_STAGING=YES.
  - Add package official URL in Config.in package description.

---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-fix-deprecated-size_t-type-for-size.patch | 37 ++++++++++++++
 package/optee-examples/3.4.0/optee-examples.hash   |  4 ++
 package/optee-examples/Config.in                   | 59 ++++++++++++++++++++++
 package/optee-examples/optee-examples.mk           | 44 ++++++++++++++++
 6 files changed, 146 insertions(+)
 create mode 100644 package/optee-examples/3.4.0/0001-fix-deprecated-size_t-type-for-size.patch
 create mode 100644 package/optee-examples/3.4.0/optee-examples.hash
 create mode 100644 package/optee-examples/Config.in
 create mode 100644 package/optee-examples/optee-examples.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f028179..5efb4ad 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -684,6 +684,7 @@ F:	package/szip/
 N:	Etienne Carriere <etienne.carriere@linaro.org>
 F:	boot/optee-os/
 F:	package/optee-client/
+F:	package/optee-examples/
 
 N:	Eugene Tarassov <eugene@largest.net>
 F:	package/tcf-agent/
diff --git a/package/Config.in b/package/Config.in
index ae9f557..1c3ceab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2078,6 +2078,7 @@ endmenu
 menu "Security"
 	source "package/checkpolicy/Config.in"
 	source "package/optee-client/Config.in"
+	source "package/optee-examples/Config.in"
 	source "package/paxtest/Config.in"
 	source "package/policycoreutils/Config.in"
 	source "package/refpolicy/Config.in"
diff --git a/package/optee-examples/3.4.0/0001-fix-deprecated-size_t-type-for-size.patch b/package/optee-examples/3.4.0/0001-fix-deprecated-size_t-type-for-size.patch
new file mode 100644
index 0000000..ba1716a
--- /dev/null
+++ b/package/optee-examples/3.4.0/0001-fix-deprecated-size_t-type-for-size.patch
@@ -0,0 +1,37 @@
+commit fca0caba591f31f66325826c74acd26aefd52dee
+Author: Etienne Carriere <etienne.carriere@linaro.org>
+Date:   Tue Dec 18 22:35:16 2018 +0100
+
+    secure_storage: fix deprecated size_t type for size
+    
+    size_t types is an deprecated type used in GPD API v1.0.
+    Update
+    
+    Error reported by GCC 7.3-2018.05:
+      secure_storage_ta.c:203:6: warning: passing argument 4 of 'TEE_ReadObjectData' from incompatible pointer type [-Wincompatible-pointer-types]
+          &read_bytes);
+    
+    Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+
+diff --git a/secure_storage/ta/secure_storage_ta.c b/secure_storage/ta/secure_storage_ta.c
+index d120e47..3ccc12d 100644
+--- a/secure_storage/ta/secure_storage_ta.c
++++ b/secure_storage/ta/secure_storage_ta.c
+@@ -146,7 +146,7 @@ static TEE_Result read_raw_object(uint32_t param_types, TEE_Param params[4])
+ 	TEE_ObjectHandle object;
+ 	TEE_ObjectInfo object_info;
+ 	TEE_Result res;
+-	size_t read_bytes;
++	uint32_t read_bytes;
+ 	char *obj_id;
+ 	size_t obj_id_sz;
+ 	char *data;
+@@ -202,7 +202,7 @@ static TEE_Result read_raw_object(uint32_t param_types, TEE_Param params[4])
+ 	res = TEE_ReadObjectData(object, data, object_info.dataSize,
+ 				 &read_bytes);
+ 	if (res != TEE_SUCCESS || read_bytes != object_info.dataSize) {
+-		EMSG("TEE_ReadObjectData failed 0x%08x, read %u over %u",
++		EMSG("TEE_ReadObjectData failed 0x%08x, read %" PRIu32 " over %u",
+ 				res, read_bytes, object_info.dataSize);
+ 		goto exit;
+ 	}
diff --git a/package/optee-examples/3.4.0/optee-examples.hash b/package/optee-examples/3.4.0/optee-examples.hash
new file mode 100644
index 0000000..077fd97
--- /dev/null
+++ b/package/optee-examples/3.4.0/optee-examples.hash
@@ -0,0 +1,4 @@
+# From https://github.com/linaro-swg/optee_examples/archive/3.4.0.tar.gz
+sha256 d833753980ac438c1675787857bb8352997352212334274de9419770097ce039  optee-examples-3.4.0.tar.gz
+# Locally computed
+sha256 6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
new file mode 100644
index 0000000..a240e54
--- /dev/null
+++ b/package/optee-examples/Config.in
@@ -0,0 +1,59 @@
+config BR2_PACKAGE_OPTEE_EXAMPLES
+	bool "optee-examples"
+	depends on BR2_TARGET_OPTEE_OS
+	select BR2_PACKAGE_OPTEE_CLIENT
+	help
+	  Enable the OP-TEE examples package that brings examples of
+	  implementation of OP-TEE non-secure client applications and
+	  secure trusted applications. OP-TEE examples is a
+	  component delivered by the OP-TEE project.
+
+	  Trusted application binary files are installed in the target
+	  directory /lib/optee_armtz as other trusted applications.
+	  At runtime OP-TEE OS can load trusted applications from this
+	  non-secure filesystem/directory into the secure world for
+	  execution.
+
+	  https://github.com/linaro-swg/optee_examples
+
+if BR2_PACKAGE_OPTEE_EXAMPLES
+
+choice
+	prompt "version"
+	default BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
+	help
+	  Select the version of OP-TEE exmaples you want to use
+
+config BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
+	bool "3.4.0"
+	help
+	  This fetches the registered release tag from the
+	  OP-TEE official Git repository.
+
+config BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_GIT
+	bool "Custom Git repository"
+	help
+	  Sync with a specific OP-TEE Git repository.
+
+endchoice
+
+if BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_GIT
+
+config BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by
+	  Git E.G. a sha id, a tag, branch, ..
+
+endif
+
+config BR2_PACKAGE_OPTEE_EXAMPLES_VERSION
+	string
+	default "3.4.0"	if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
+	default BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_REPO_VERSION \
+			if BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_GIT
+
+endif #BR2_PACKAGE_OPTEE_EXAMPLES
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
new file mode 100644
index 0000000..38701d4
--- /dev/null
+++ b/package/optee-examples/optee-examples.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# optee-examples
+#
+################################################################################
+
+OPTEE_EXAMPLES_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_EXAMPLES_VERSION))
+OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
+OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
+
+OPTEE_EXAMPLES_DEPENDENCIES = optee-client optee-os
+
+ifeq ($(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_GIT),y)
+OPTEE_EXAMPLES_SITE = $(call qstrip,$(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_REPO_URL))
+OPTEE_EXAMPLES_SITE_METHOD = git
+BR_NO_CHECK_HASH_FOR += $(OPTEE_EXAMPLES_SOURCE)
+else
+OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
+endif
+
+ifeq ($(BR2_aarch64),y)
+OPTEE_EXAMPLES_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm64
+endif
+ifeq ($(BR2_arm),y)
+OPTEE_EXAMPLES_SDK = $(STAGING_DIR)/lib/optee/export-ta_arm32
+endif
+
+# Trusted Application are not built from CMake due to ta_dev_kit dependencies.
+# We must build and install them on target.
+define OPTEE_EXAMPLES_BUILD_TAS
+	@$(foreach f,$(wildcard $(@D)/*/ta/Makefile), \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
+			TA_DEV_KIT_DIR=$(OPTEE_EXAMPLES_SDK) \
+			O=out -C $(dir $f) all &&) true
+endef
+define OPTEE_EXAMPLES_INSTALL_TAS
+	@mkdir -p $(TARGET_DIR)/lib/optee_armtz
+	@$(INSTALL) -D -m 444 -t $(TARGET_DIR)/lib/optee_armtz $(@D)/*/ta/out/*.ta
+endef
+OPTEE_EXAMPLES_POST_BUILD_HOOKS += OPTEE_EXAMPLES_BUILD_TAS
+OPTEE_EXAMPLES_POST_INSTALL_TARGET_HOOKS += OPTEE_EXAMPLES_INSTALL_TAS
+
+$(eval $(cmake-package))
