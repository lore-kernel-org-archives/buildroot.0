From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 10 May 2017 13:46:59 -0400
Subject: [Buildroot] [PATCH 2/3] refpolicy: add ability to specify policy
	version
In-Reply-To: <20170510174700.30734-1-aduskett@codeblue.com>
References: <20170510174700.30734-1-aduskett@codeblue.com>
Message-ID: <20170510174700.30734-2-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Refpolicy by default will build the highest version supported.
This may cause older kernels to not load the policy.

This patch adds a custom policy version string which is defaulted
to 30, which is the highest supported as of today.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/refpolicy/Config.in    | 8 ++++++++
 package/refpolicy/refpolicy.mk | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index e772cac..e12222e 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -27,3 +27,11 @@ config BR2_PACKAGE_REFPOLICY
 
 comment "refpolicy needs a toolchain w/ threads, glibc"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
+
+if BR2_PACKAGE_REFPOLICY
+
+config BR2_PACKAGE_REFPOLICY_VERSION
+	string "Policy version"
+	default "30"
+
+endif
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index d565cbd..1eb0c54 100644
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
