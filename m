From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 17 May 2016 14:04:40 -0500
Subject: [Buildroot] [PATCH 1/4] fmc: add powerpc e6500 support
Message-ID: <1463511883-27657-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/fmc/Config.in | 6 +++---
 package/fmc/fmc.mk    | 8 +++++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

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
index 49c5fe8..4712385 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -18,9 +18,15 @@ FMC_MAKE_OPTS = \
 	LIBXML2_HEADER_PATH="$(STAGING_DIR)/usr/include/libxml2" \
 	TCLAP_HEADER_PATH="$(STAGING_DIR)/usr/include"
 
+ifeq ($(BR2_powerpc64), y)
+	EXTRA_FLAGS = "M64BIT=1"
+else
+	EXTRA_FLAGS = ""
+endif
+
 define FMC_BUILD_CMDS
 	# The linking step has dependency issues so using MAKE1
-	$(TARGET_MAKE_ENV) $(MAKE1) $(FMC_MAKE_OPTS) -C $(@D)/source
+	$(TARGET_MAKE_ENV) $(MAKE1) $(FMC_MAKE_OPTS) $(call qstrip,$(EXTRA_FLAGS)) -C $(@D)/source
 endef
 
 define FMC_INSTALL_TARGET_CMDS
-- 
1.9.1
