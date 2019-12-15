From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 14 Dec 2019 17:15:16 -0800
Subject: [Buildroot] [PATCH 1/2] package/libsemanage: add option to manually
 define policy version
In-Reply-To: <20191215011517.1977342-1-aduskett@gmail.com>
References: <20191215011517.1977342-1-aduskett@gmail.com>
Message-ID: <20191215011517.1977342-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The semodule package derives the maximum SELinux policy version from
the libsemanage library.

By default, libsemanage returns the highest supported policy version that
libsepol supports found in include/sepol/policydb/policydb.h and not from the
Kernel. However, if the maximum supported SELinux policy version supported by
the Kernel is lower than the maximum supported policy version from libsemanage,
if a user attempts to build a policy using the semodule program, semodule fails
when creating a policy with the error:
policydb version X does not match my version range 15-X.

This default value may be overwrriten by setting the policy-version = line in
/etc/semanage/semanage.conf.

Create an option that allows a user to overwrite the default policy version to
ensure that semodule works on older kernels.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libsemanage/Config.in      | 29 +++++++++++++++++++++++++++++
 package/libsemanage/libsemanage.mk | 23 +++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 3c7050ee51..814bf293d7 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -17,6 +17,35 @@ config BR2_PACKAGE_LIBSEMANAGE
 
 	  http://selinuxproject.org/page/Main_Page
 
+if BR2_PACKAGE_LIBSEMANAGE
+
+config BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION
+	bool "Manually specify the policy version"
+	help
+	  Manually specify the policy version to build.
+
+if BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION
+
+config BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION
+	int "maximum policy version"
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
+endif # BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION
+
+endif # BR2_PACKAGE_LIBSEMANAGE
+
 comment "libsemanage needs a toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index fd90346049..1415916b1f 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -13,6 +13,29 @@ LIBSEMANAGE_INSTALL_STAGING = YES
 
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
+LIBSEMANAGE_MAX_POLICY_VERSION = 31
+ifeq ($(BR2_PACKAGE_LIBSEMANAGE_POLICY_MANUAL_VERSION),y)
+LIBSEMANAGE_MAX_POLICY_VERSION = $(BR2_PACKAGE_LIBSEMANAGE_POLICY_MAX_VERSION)
+endif
+
+define LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY
+	$(SED) "/policy-version = /c\policy-version = $(LIBSEMANAGE_MAX_POLICY_VERSION)" \
+		$(TARGET_DIR)/etc/selinux/semanage.conf
+endef
+LIBSEMANAGE_POST_INSTALL_TARGET_HOOKS += LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY
+HOST_LIBSEMANAGE_POST_INSTALL_HOOKS += LIBSEMANAGE_SET_SEMANAGE_MAX_POLICY
+
 define LIBSEMANAGE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) all
 endef
-- 
2.23.0
