From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 20 May 2017 16:41:42 -0400
Subject: [Buildroot] [PATCH v4 2/3] refpolicy add ability to specify policy
	version
In-Reply-To: <20170520204143.18154-1-Adamduskett@outlook.com>
References: <20170520204143.18154-1-Adamduskett@outlook.com>
Message-ID: <20170520204143.18154-2-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Refpolicy by default will build the highest version supported.
This may cause older kernels to not load the policy.

This patch adds a custom policy version string which is defaulted
to 30, which is the highest supported as of today.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
Changes v2 -> v3:
  - Removed Coverletter from patch set.

Changes v1 -> v2:
  - Added cover letter explaining the new patch set. 

 package/refpolicy/Config.in    | 8 ++++++++
 package/refpolicy/refpolicy.mk | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index a937055..9d4e0e6 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -35,3 +35,11 @@ comment "refpolicy needs a glibc toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_USES_GLIBC
+
+if BR2_PACKAGE_REFPOLICY
+
+config BR2_PACKAGE_REFPOLICY_VERSION
+	string "Policy version"
+	default "30"
+
+endif
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 117e570..fa02b5a 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -32,7 +32,7 @@ REFPOLICY_MAKE = \
 	$(MAKE1)
 
 define REFPOLICY_CONFIGURE_CMDS
-	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = 30" $(@D)/build.conf
+	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = $(BR2_PACKAGE_REFPOLICY_VERSION)" $(@D)/build.conf
 	$(SED) "/MONOLITHIC/c\MONOLITHIC = y" $(@D)/build.conf
 	$(SED) "/NAME/c\NAME = targeted" $(@D)/build.conf
 endef
-- 
2.9.3
