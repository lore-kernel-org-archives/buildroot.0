From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 14 May 2017 13:21:56 -0400
Subject: [Buildroot] [PATCH v2 2/3] refpolicy add ability to specify policy
	version
In-Reply-To: <20170514172157.1780-1-Adamduskett@outlook.com>
References: <20170514172157.1780-1-Adamduskett@outlook.com>
Message-ID: <20170514172157.1780-3-Adamduskett@outlook.com>
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
Changes v1 -> v2:
  - Added cover letter explaining the new patch set. 

 package/refpolicy/Config.in    | 8 ++++++++
 package/refpolicy/refpolicy.mk | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

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
index d565cbd..b60c456 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -28,7 +28,7 @@ REFPOLICY_PYINC = -I$(HOST_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)/site-p
 REFPOLICY_MAKE = PYTHON="$(HOST_DIR)/usr/bin/python2" $(TARGET_MAKE_ENV) $(MAKE1)
 
 define REFPOLICY_CONFIGURE_CMDS
-	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = 30" $(@D)/build.conf
+	$(SED) "/OUTPUT_POLICY/c\OUTPUT_POLICY = $(BR2_PACKAGE_REFPOLICY_VERSION)" $(@D)/build.conf
 	$(SED) "/MONOLITHIC/c\MONOLITHIC = y" $(@D)/build.conf
 	$(SED) "/NAME/c\NAME = targeted" $(@D)/build.conf
 endef
-- 
2.9.3
