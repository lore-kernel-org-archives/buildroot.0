From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 22:23:23 +0200
Subject: [Buildroot] [git commit] fmc: added powerpc e6500 support
Message-ID: <20160612202417.22DB981A1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7487bbc25d7736c00e2940e7e7c954ae80d1285
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
[Thomas:
 - remove useless indentation.]
 - calculate FMC_PLATFORM from BR2_PACKAGE_FMLIB_PLATFORM.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fmc/Config.in | 6 +++---
 package/fmc/fmc.mk    | 9 +++++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

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
index 2146bc2..0a2e488 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -1,3 +1,4 @@
+
 ################################################################################
 #
 # fmc
@@ -18,7 +19,15 @@ FMC_MAKE_OPTS = \
 	LIBXML2_HEADER_PATH="$(STAGING_DIR)/usr/include/libxml2" \
 	TCLAP_HEADER_PATH="$(STAGING_DIR)/usr/include"
 
+ifeq ($(BR2_powerpc64),y)
+FMC_MAKE_OPTS += M64BIT=1
+endif
+
+# fmc's platform is the same as fmlib's.
+FMC_PLATFORM = $(call qstrip,$(BR2_PACKAGE_FMLIB_PLATFORM))
+
 define FMC_BUILD_CMDS
+	$(SED) "s:P4080:$(FMC_PLATFORM):g" $(@D)/source/Makefile
 	# The linking step has dependency issues so using MAKE1
 	$(TARGET_MAKE_ENV) $(MAKE1) $(FMC_MAKE_OPTS) -C $(@D)/source
 endef
