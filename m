From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Jul 2013 15:13:57 +0200
Subject: [Buildroot] [git commit] toolchain: remove the old BR2_VFP_FLOAT
	option
Message-ID: <20130716140823.16EEA9A079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d806005b08ec3228a252af4d2f038844a4d6fed2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have a much better way of selecting between the various
VFP versions and capabilities, the BR2_VFP_FLOAT version no longer
makes sense. This commit gets rid of it, and adds the appropriate
Config.in.legacy code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy                                   |    9 +++++++++
 toolchain/toolchain-buildroot/Config.in.2          |   12 ------------
 toolchain/toolchain-external/ext-tool.mk           |    5 -----
 .../toolchain-external/ext-toolchain-wrapper.c     |    3 ---
 4 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 01bf900..b92b656 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -76,6 +76,15 @@ config BR2_ELF2FLT
 	  BR2_PACKAGE_HOST_ELF2FLT due to the conversion of elf2flt to
 	  the package infrastructure.
 
+config BR2_VFP_FLOAT
+	bool "the ARM VFP floating point option has been renamed"
+	select BR2_LEGACY
+	help
+	  Due to a major refactoring of the floating-point handling of
+	  the ARM architecture support, the BR2_VFP_FLOAT option has
+	  been replaced with a choice of options that allows to select
+	  between various VFP versions/capabilities.
+
 ###############################################################################
 comment "Legacy options removed in 2013.05"
 
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index e223d9d..a9c102f 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -28,16 +28,4 @@ config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 
 source "package/elf2flt/Config.in.host"
 
-config BR2_VFP_FLOAT
-	bool "Use ARM Vector Floating Point unit"
-	depends on !BR2_SOFT_FLOAT
-	depends on BR2_arm || BR2_armeb
-	help
-	  Setting this option will enable the "-mfpu=vfp" option.
-	  If your ARM CPU has a Vector Floating Point Unit (VFP)
-	  and the toolchain supports the option, then the
-	  code can be optimized.
-
-	  Most people will answer N.
-
 endif
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 9d3dec4..67fc40d 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -196,11 +196,6 @@ TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
 endif
 
-ifeq ($(BR2_VFP_FLOAT),y)
-TOOLCHAIN_EXTERNAL_CFLAGS += -mfpu=vfp
-TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_VFPFLOAT=1
-endif
-
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
 endif
diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index f81aed4..afca6fa 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -47,9 +47,6 @@ static char *predef_args[] = {
 #ifdef BR_SOFTFLOAT
 	"-msoft-float",
 #endif /* BR_SOFTFLOAT */
-#ifdef BR_VFPFLOAT
-	"-mfpu=vfp",
-#endif /* BR_VFPFLOAT */
 #ifdef BR_64
 	"-m64",
 #endif
