From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 16:49:22 +0100
Subject: [Buildroot] [git commit] package/{refpolicy,
 libsepol}: move policy version selection from refpolicy to libsepol
Message-ID: <20200203154034.616C788929@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10e19b7532250d5868de11cc226c0f001ef2cdb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, a user sets a policy version via the refpolicy package.
Having the option here has a few disadvantages:

  - The Refpolicy package is not technically needed to use SELinux.
  - When building a modular policy, Refpolicy will ignore the version string
    and build the highest version possible which will cause libsemanage to
    possibly fail when loading the policy.

Specifying a manual policy version in /etc/selinux/semanage.conf
forces libsemanage to load a specific policy version, which fixes the
above issue.  However, because refpolicy currently defines the policy
version, libsemanage does not have a way to determine the policy
version, as refpolicy is not a dependency of libsemanage.

To work around these limitations, move the policy version number
selection to libsepol, as a system using SELinux always requires this
library.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy               | 11 +++++++++++
 package/libsepol/Config.in     |  9 +++++++++
 package/refpolicy/Config.in    | 12 ++++++++----
 package/refpolicy/refpolicy.mk |  2 +-
 4 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 061d0f7871..955e5f2f7d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -160,6 +160,17 @@ config BR2_PACKAGE_FIS
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_REFPOLICY_POLICY_VERSION
+	string "refpolicy policy version"
+	help
+	  The refpolicy policy version option has been moved to the
+	  libsepol package.
+
+config BR2_PACKAGE_REFPOLICY_POLICY_VERSION_WRAP
+	bool
+	default y if BR2_PACKAGE_REFPOLICY_POLICY_VERSION != ""
+	select BR2_LEGACY
+
 config BR2_PACKAGE_CELT051
 	bool "celt051 package was removed"
 	select BR2_LEGACY
diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index cfa923e452..049c915c36 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -7,5 +7,14 @@ config BR2_PACKAGE_LIBSEPOL
 
 	  http://selinuxproject.org/page/Main_Page
 
+if BR2_PACKAGE_LIBSEPOL
+
+config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
+	string "Policy version"
+	default BR2_PACKAGE_REFPOLICY_POLICY_VERSION if BR2_PACKAGE_REFPOLICY_POLICY_VERSION != ""
+	default "30"
+
+endif
+
 comment "libsepol needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index d9cf6e6531..f0c8a43563 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_REFPOLICY
 	bool "refpolicy"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libsepol
 	select BR2_PACKAGE_BUSYBOX_SELINUX if BR2_PACKAGE_BUSYBOX
+	# Even though libsepol is not necessary for building, we get
+	# the policy version from libsepol, so we select it, and treat
+	# it like a runtime dependency.
+	select BR2_PACKAGE_LIBSEPOL
 	help
 	  The SELinux Reference Policy project (refpolicy) is a
 	  complete SELinux policy that can be used as the system
@@ -24,10 +29,6 @@ config BR2_PACKAGE_REFPOLICY
 
 if BR2_PACKAGE_REFPOLICY
 
-config BR2_PACKAGE_REFPOLICY_POLICY_VERSION
-	string "Policy version"
-	default "30"
-
 choice
 	prompt "SELinux default state"
 	default BR2_PACKAGE_REFPOLICY_POLICY_STATE_PERMISSIVE
@@ -55,3 +56,6 @@ config BR2_PACKAGE_REFPOLICY_POLICY_STATE
 	default "disabled" if BR2_PACKAGE_REFPOLICY_POLICY_STATE_DISABLED
 
 endif
+
+comment "refpolicy needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index d13be18f73..3f421e2ac1 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -26,7 +26,7 @@ REFPOLICY_MAKE = \
 	$(MAKE1)
 
 REFPOLICY_POLICY_VERSION = \
-	$(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_VERSION))
+	$(call qstrip,$(BR2_PACKAGE_LIBSEPOL_POLICY_VERSION))
 REFPOLICY_POLICY_STATE = \
 	$(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_STATE))
 
