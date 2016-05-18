From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 18 May 2016 08:41:25 -0500
Subject: [Buildroot] [PATCH v2 1/2] fmc: added powerpc e6500 support
Message-ID: <1463578886-43470-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
--

v1 -> v2

package/fmc/fmc.mk
 - Added missing sed of Makefile to set PLATFORM

(Suggested by Thomas)
package/fmc/Config.in
 - Removed extra space in powerpc64 if
 - Appended to MAKE_OPTS instead of creating new variable
---
 package/fmc/Config.in | 6 +++---
 package/fmc/fmc.mk    | 6 ++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/fmc/Config.in b/package/fmc/Config.in
index a50f80d..b7398e2 100644
--- a/package/fmc/Config.in
+++ b/package/fmc/Config.in
@@ -1,14 +1,14 @@
 comment "fmc needs a toolchain w/ C++"
-	depends on BR2_powerpc_e500mc
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 comment "fmc needs a Linux kernel to be built"
-	depends on BR2_powerpc_e500mc
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_FMC
 	bool "fmc"
-	depends on BR2_powerpc_e500mc
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LINUX_KERNEL # fmlib
 	select BR2_PACKAGE_TCLAP
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index 49c5fe8..fb38cd0 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -1,3 +1,4 @@
+
 ################################################################################
 #
 # fmc
@@ -18,7 +19,12 @@ FMC_MAKE_OPTS = \
 	LIBXML2_HEADER_PATH="$(STAGING_DIR)/usr/include/libxml2" \
 	TCLAP_HEADER_PATH="$(STAGING_DIR)/usr/include"
 
+ifeq ($(BR2_powerpc64),y)
+	FMC_MAKE_OPTS += M64BIT=1
+endif
+
 define FMC_BUILD_CMDS
+	$(SED) "s:P4080:$(FMLIB_PLATFORM):g" $(@D)/source/Makefile
 	# The linking step has dependency issues so using MAKE1
 	$(TARGET_MAKE_ENV) $(MAKE1) $(FMC_MAKE_OPTS) -C $(@D)/source
 endef
-- 
1.9.1
