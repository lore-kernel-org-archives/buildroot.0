From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 23:30:08 +0200
Subject: [Buildroot] [git commit] refpolicy: add ability to specify policy
	version
Message-ID: <20170606213040.5E0E78293C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d54aa0e861850986d847338c9e6218bffde3d801
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Refpolicy by default will build the highest version supported. This may
cause older kernels to not load the policy.

This patch adds a custom policy version string which is defaulted to 30,
which is the highest supported as of today.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Acked-by: Matt Weber  <matthew.weber@rockwellcollins.com>
[Thomas:
 - rename option to BR2_PACKAGE_REFPOLICY_POLICY_VERSION
 - use qstrip to remove double quotes]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/refpolicy/Config.in    | 8 ++++++++
 package/refpolicy/refpolicy.mk | 6 +++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index bcc74d4..6978562 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -33,3 +33,11 @@ comment "refpolicy needs a glibc toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_USES_GLIBC
+
+if BR2_PACKAGE_REFPOLICY
+
+config BR2_PACKAGE_REFPOLICY_POLICY_VERSION
+	string "Policy version"
+	default "30"
+
+endif
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 9a1d6da..4d85ee5 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -29,8 +29,12 @@ REFPOLICY_MAKE = \
 	$(TARGET_MAKE_ENV) \
 	$(MAKE1)
 
+REFPOLICY_POLICY_VERSION = \
+	$(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_VERSION))
+
 define REFPOLICY_CONFIGURE_CMDS
-	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = 30" $(@D)/build.conf
+	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = $(REFPOLICY_POLICY_VERSION)" \
+		$(@D)/build.conf
 	$(SED) "/MONOLITHIC/c\MONOLITHIC = y" $(@D)/build.conf
 	$(SED) "/NAME/c\NAME = targeted" $(@D)/build.conf
 endef
