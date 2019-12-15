From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 14 Dec 2019 17:15:17 -0800
Subject: [Buildroot] [PATCH 2/2] package/libsemanage: allow the user to
 specify a kernel version
In-Reply-To: <20191215011517.1977342-1-aduskett@gmail.com>
References: <20191215011517.1977342-1-aduskett@gmail.com>
Message-ID: <20191215011517.1977342-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If a user specified a kernel version being build, then libsemanage can
derive the maximum policy from the chosen Kernel.

This change gives three main benefits:
 1) A user no longer has to select a policy version manually.
 2) A user is guaranteed the maximum supported version automatically.
 3) If a user has manually selected a policy version that version may now be
   checked against the maximum version allowed by the Kernel.
   - If the manually selected policy is lower, print a warning.
   - If the manually selected policy is greater, throw an error.

The logic to determine the maximum policy is in
package/libsemanage/get-kernel-max-policy-version.sh as it is much easier to
understand and maintain than to have the logic in libsemanage.mk itself.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libsemanage/Config.in                 |  7 +-
 .../get-kernel-max-policy-version.sh          | 82 +++++++++++++++++++
 package/libsemanage/libsemanage.mk            | 42 ++++++++++
 3 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100755 package/libsemanage/get-kernel-max-policy-version.sh

diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 814bf293d7..6c3e269579 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -44,7 +44,12 @@ config BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION
 
 endif # BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION
 
-endif # BR2_PACKAGE_LIBSEMANAGE
+config BR2_PACKAGE_LIBSEMANAGE_KERNEL_VERSION
+	string "Kernel version being built"
+	help
+	  The version of the kernel being built. This version must be in
+	  the standard X.X format (IE: 4.0 or 5.2.1)
+endif
 
 comment "libsemanage needs a toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
diff --git a/package/libsemanage/get-kernel-max-policy-version.sh b/package/libsemanage/get-kernel-max-policy-version.sh
new file mode 100755
index 0000000000..015e2bf16d
--- /dev/null
+++ b/package/libsemanage/get-kernel-max-policy-version.sh
@@ -0,0 +1,82 @@
+#!/bin/sh
+# The following logic is used to determine the maximum policy value and is
+# derived from the selected kernel version.
+# The following kernel versions support the following maximum policy number
+# found in security/selinux/include/security.h:
+# <= 2.6: 25
+# > 2.6 <= 3.5: 26
+# > 3.5 <= 3.14: 28 (27 and 28 were added@the same time.)
+# > 3.14 <= 4.3: 29
+# > 4.3 <= 4.13: 30
+# > 4.13 <= 5.5: 31
+
+function get_max_kernel_policy_version(){
+  LIBSEMANAGE_LINUX_VERSION="${1}"
+  # Only the major and minor versions are needed. Sub minor version bumps do not
+  # receive SELinux policy version bump updates.
+  LIBSEMANAGE_LINUX_VERSION_MAJOR=$(echo ${LIBSEMANAGE_LINUX_VERSION} | cut -d"." -f1)
+  LIBSEMANAGE_LINUX_VERSION_MINOR=$(echo ${LIBSEMANAGE_LINUX_VERSION} | cut -d"." -f2)
+  # Default maximum policy version
+  MAX_POLICY_VERSION="31"
+  # <= 2.6.x
+  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 2 ]; then
+    MAX_POLICY_VERSION="25"
+  fi
+
+  # > 2.6 <= 3.5
+  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 3 -a ${LIBSEMANAGE_LINUX_VERSION_MINOR} -le 4 ]; then
+    MAX_POLICY_VERSION="26"
+  fi
+
+  # > 3.5 <= 3.14
+  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 3 -a ${LIBSEMANAGE_LINUX_VERSION_MINOR} -lt 14 ]; then
+    MAX_POLICY_VERSION="28"
+  fi
+
+  # > 3.14
+  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 3 -a ${LIBSEMANAGE_LINUX_VERSION_MINOR} -ge 14 ]; then
+    MAX_POLICY_VERSION="29"
+  fi
+
+  # > 4.0 < 4.3
+  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 4 -a ${LIBSEMANAGE_LINUX_VERSION_MINOR} -lt 3 ]; then
+    MAX_POLICY_VERSION="29"
+  fi
+
+  # > 4.3
+  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 4 -a ${LIBSEMANAGE_LINUX_VERSION_MINOR} -ge 3 ]; then
+    MAX_POLICY_VERSION="30"
+  fi
+
+  # > 4.13
+  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 4 -a ${LIBSEMANAGE_LINUX_VERSION_MINOR} -ge 13 ]; then
+    MAX_POLICY_VERSION="31"
+  fi
+
+  # > 5.0 <= 5.5
+  if [ ${LIBSEMANAGE_LINUX_VERSION_MAJOR} -eq 5 -a ${LIBSEMANAGE_LINUX_VERSION_MINOR} -lt 5 ]; then
+    MAX_POLICY_VERSION="31"
+  fi
+
+  echo ${MAX_POLICY_VERSION}
+}
+
+function policy_version_check(){
+  KERNEL_MAX_SELINUX_POLICY_VERSION="${1}"
+  SEPOLICY_MAX_VERSION="${2}"
+  if [ ${SEPOLICY_MAX_VERSION} -lt ${KERNEL_MAX_SELINUX_POLICY_VERSION} ]; then
+    echo lt
+  fi
+
+  if [ ${SEPOLICY_MAX_VERSION} -gt ${KERNEL_MAX_SELINUX_POLICY_VERSION} ]; then
+    echo gt
+  fi
+}
+
+if [[ "${1}" == "get_max_kernel_policy_version" ]]; then
+  get_max_kernel_policy_version "${2}"
+fi
+
+if [[ "${1}" == "policy_version_check" ]]; then
+  policy_version_check "${2}" "${3}"
+fi
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index d260e449eb..57c58a5570 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -25,14 +25,56 @@ LIBSEMANAGE_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
 # This default value may be overwrriten by setting the policy-version = line in
 # /etc/semanage/semanage.conf.
 LIBSEMANAGE_MAX_POLICY_VERSION = 31
+
+# If a kernel version is specified, get the maximum supported policy version
+# of that kernel.
+LIBSEMANAGE_KERNEL_VERSION = $(call qstrip,$(BR2_PACKAGE_LIBSEMANAGE_KERNEL_VERSION))
+ifneq ($(LIBSEMANAGE_KERNEL_VERSION),)
+LIBSEMANAGE_MAX_KERNEL_POLICY_VERSION := \
+	$(shell package/libsemanage/get-kernel-max-policy-version.sh \
+	"get_max_kernel_policy_version" \
+	$(BR2_PACKAGE_LIBSEMANAGE_KERNEL_VERSION))
+LIBSEMANAGE_MAX_POLICY_VERSION = $(LIBSEMANAGE_MAX_KERNEL_POLICY_VERSION)
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION),y)
 LIBSEMANAGE_MAX_POLICY_VERSION = $(BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION)
+
+# If a kernel version is specified, check if the policy version set by the user
+# is lower or greater than the maximum supported policy version in the kernel.
+# If the policy is lower, display a warning.
+# If the policy is greater, throw an error.
+ifneq ($(LIBSEMANAGE_KERNEL_VERSION),)
+LIBSEMANAGE_MANUAL_POLICY_VERSION_CHECK := \
+	$(shell package/libsemanage/get-kernel-max-policy-version.sh \
+	"policy_version_check" \
+	$(LIBSEMANAGE_MAX_KERNEL_POLICY_VERSION) \
+	$(BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION))
+
+ifeq ($(LIBSEMANAGE_MANUAL_POLICY_VERSION_CHECK),lt)
+$(warning \
+	The policy version set for libsemanage $(BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION) \
+	is lower than the maximum policy version supported by the kernel being built: \
+	$(LIBSEMANAGE_MAX_KERNEL_POLICY_VERSION). It is HIGHLY recommended that you set the \
+	policy version to $(LIBSEMANAGE_MAX_KERNEL_POLICY_VERSION)! \
+	)
+endif
+
+ifeq ($(LIBSEMANAGE_MANUAL_POLICY_VERSION_CHECK),gt)
+$(error \
+	The policy version set for libsemanage $(BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION) \
+	is higher than the maximum policy version supported by the kernel being built: \
+	$(LIBSEMANAGE_MAX_KERNEL_POLICY_VERSION). \
+	)
 endif
+endif # ifeq ($(LIBSEMANAGE_KERNEL_VERSION),y)
+endif # ($(BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION),y)
 
 define LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY
 	$(SED) "/policy-version = /c\policy-version = $(LIBSEMANAGE_MAX_POLICY_VERSION)" \
 		$(TARGET_DIR)/etc/selinux/semanage.conf
 endef
+
 LIBSEMANAGE_POST_INSTALL_TARGET_HOOKS += LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY
 HOST_LIBSEMANAGE_POST_INSTALL_HOOKS += LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY
 
-- 
2.23.0
