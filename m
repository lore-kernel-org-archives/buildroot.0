From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  3 Feb 2020 05:29:49 -0800
Subject: [Buildroot] [PATCH 3/5] Move refpolicy policy version selection to
 libsepol
In-Reply-To: <20200203132951.1331252-1-aduskett@gmail.com>
References: <20200203132951.1331252-1-aduskett@gmail.com>
Message-ID: <20200203132951.1331252-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, a user sets a policy version via the refpolicy package.
Having the option here has a few disadvantages:

  - The Refpolicy package is not technically needed to use SELinux.
  - When building a modular policy, Refpolicy will ignore the version string
    and build the highest version possible which will cause libsemanage to
    possibly fail when loading the policy.

Specifying a manual policy version in /etc/selinux/semanage.conf forces
libsemanage to load a specific policy version, which fixes the above issue.
However, because refpolicy currently defines the policy version, libsemanage
does not have a way to determine the policy version, as refpolicy is not a
dependency of libsemanage.

To work around these limitations, move the policy version number
selection to libsepol, as a system using SELinux always requires this library.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 Config.in.legacy               |  6 ++++++
 package/libsepol/Config.in     |  7 +++++++
 package/refpolicy/Config.in    | 11 +++++++----
 package/refpolicy/refpolicy.mk |  5 +++--
 4 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4b84116e0c..3bddca9be0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_REFPOLICY_POLICY_VERSION
+	bool "refpolicy version selection moved to libsepol"
+	select BR2_LEGACY
+	help
+	  The policy version selection was moved to libsepol
+
 config BR2_PACKAGE_CELT051
 	bool "celt051 package was removed"
 	select BR2_LEGACY
diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index cfa923e452..4453e298a6 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -7,5 +7,12 @@ config BR2_PACKAGE_LIBSEPOL
 
 	  http://selinuxproject.org/page/Main_Page
 
+if BR2_PACKAGE_LIBSEPOL
+
+config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
+	string "Policy version"
+	default "30"
+endif
+
 comment "libsepol needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index d9cf6e6531..ecb662600d 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_REFPOLICY
 	bool "refpolicy"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libsepol
 	select BR2_PACKAGE_BUSYBOX_SELINUX if BR2_PACKAGE_BUSYBOX
+	# Even though libsepol is not necessary for building, we get the policy
+	# version from libsepol
+	select BR2_PACKAGE_LIBSEPOL
 	help
 	  The SELinux Reference Policy project (refpolicy) is a
 	  complete SELinux policy that can be used as the system
@@ -24,10 +28,6 @@ config BR2_PACKAGE_REFPOLICY
 
 if BR2_PACKAGE_REFPOLICY
 
-config BR2_PACKAGE_REFPOLICY_POLICY_VERSION
-	string "Policy version"
-	default "30"
-
 choice
 	prompt "SELinux default state"
 	default BR2_PACKAGE_REFPOLICY_POLICY_STATE_PERMISSIVE
@@ -55,3 +55,6 @@ config BR2_PACKAGE_REFPOLICY_POLICY_STATE
 	default "disabled" if BR2_PACKAGE_REFPOLICY_POLICY_STATE_DISABLED
 
 endif
+
+comment "refpolicy needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index d13be18f73..001519f8cd 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -16,7 +16,8 @@ REFPOLICY_DEPENDENCIES = \
 	host-policycoreutils \
 	host-python3 \
 	host-setools \
-	host-gawk
+	host-gawk \
+	libsepol
 
 # Cannot use multiple threads to build the reference policy
 REFPOLICY_MAKE = \
@@ -26,7 +27,7 @@ REFPOLICY_MAKE = \
 	$(MAKE1)
 
 REFPOLICY_POLICY_VERSION = \
-	$(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_VERSION))
+	$(call qstrip,$(BR2_PACKAGE_LIBSEPOL_POLICY_VERSION))
 REFPOLICY_POLICY_STATE = \
 	$(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_STATE))
 
-- 
2.24.1
