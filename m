From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 15 Dec 2019 10:00:03 -0800
Subject: [Buildroot] [PATCH v2 1/1] package/libsemanage: add option to
 manually define policy version
Message-ID: <20191215180003.2162894-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The semodule package derives the maximum SELinux policy version from
the libsemanage library.

By default, libsemanage returns the highest supported policy version that
libsepol supports found in include/sepol/policydb/policydb.h and not just from
the Kernel. However, if the maximum supported SELinux policy version supported
by the Kernel is lower than the maximum supported policy version from
libsemanage, if a user attempts to build a policy using the semodule program,
semodule fails when creating a policy with the error:
  "policydb version X does not match my version range 15-X."

This default value may be overwrriten by setting the policy-version = line in
/etc/semanage/semanage.conf.

Create an option that allows a user to overwrite the default policy version to
ensure that semodule works on older kernels.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Set the default value of the policy version based off of the toolchain
    header version (Thomas)
  - Remove the BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION option (Thomas)
  - Remove LIBSEMANAGE_MAX_POLICY_VERSION variable from libsemanage.mk (Thomas)
  - Fix the post install hook for hosts. (Thomas)


 package/libsemanage/Config.in      | 25 +++++++++++++++++++++++++
 package/libsemanage/libsemanage.mk | 24 ++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 3c7050ee51..04fa046b0f 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -17,6 +17,31 @@ config BR2_PACKAGE_LIBSEMANAGE
 
 	  http://selinuxproject.org/page/Main_Page
 
+if BR2_PACKAGE_LIBSEMANAGE
+
+config BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION
+	int "maximum policy version"
+	default 31 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
+	default 30 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+	default 29 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+	default 28 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+	default 26 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6
+	default 25
+	range 25 31
+	help
+	  The maximum SELinux policy version your kernel supports.
+
+	  Here's a handy table to help you choose:
+	  kernel version   SElinux policy max version
+	  <= 2.6.x         25
+	  > 2.6 <= 3.5     26
+	  > 3.5 <= 3.14    28 (27 and 28 were added@the same time)
+	  > 3.14 <= 4.3    29
+	  > 4.3 <= 4.13    30
+	  > 4.13 <= 5.5    31
+
+endif # BR2_PACKAGE_LIBSEMANAGE
+
 comment "libsemanage needs a toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index fd90346049..74e3a91c5e 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -13,6 +13,30 @@ LIBSEMANAGE_INSTALL_STAGING = YES
 
 LIBSEMANAGE_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
+# Semodule derives the maximum SELinux policy version from libsemanage.
+# By default, libsemanage returns the highest supported policy version that
+# libsepol supports found in include/sepol/policydb/policydb.h and not just
+# from the Kernel. However, if the maximum supported SELinux policy version
+# supported by the Kernel is lower than the maximum supported policy version
+# from libsemanage, if a user attempts to build a policy using the semodule
+# program, semodule fails when creating a policy with the error:
+# policydb version X does not match my version range 15-X.
+
+# This default value may be overwrriten by setting the policy-version = line in
+# /etc/semanage/semanage.conf.
+LIBSEMANAGE_MAX_POLICY_VERSION = $(BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION)
+
+define LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY_TARGET
+	$(SED) "/policy-version = /c\policy-version = $(LIBSEMANAGE_MAX_POLICY_VERSION)" \
+		$(TARGET_DIR)/etc/selinux/semanage.conf
+endef
+define LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY_HOST
+	$(SED) "/policy-version = /c\policy-version = $(LIBSEMANAGE_MAX_POLICY_VERSION)" \
+		$(HOST_DIR)/etc/selinux/semanage.conf
+endef
+LIBSEMANAGE_POST_INSTALL_TARGET_HOOKS += LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY_TARGET
+HOST_LIBSEMANAGE_POST_INSTALL_HOOKS += LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY_HOST
+
 define LIBSEMANAGE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) all
 endef
-- 
2.23.0
