From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jan 2010 00:27:22 +0100
Subject: [Buildroot] [PATCH 3/6] Move BR2_SOFT_FLOAT and BR2_VFP_FLOAT to
	Build options
In-Reply-To: <cover.1263338839.git.thomas.petazzoni@free-electrons.com>
References: <cover.1263338839.git.thomas.petazzoni@free-electrons.com>
Message-ID: <dec9e118437c50f39437596da1717c5117b8d416.1263338839.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The soft floating point related options not only affect how the
toolchain is built, but more importantly affect how packages are
built. Therefore, just like optimization or stripping options,
floating point related options are global, and belong to the Build
options menu.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in             |   26 ++++++++++++++++++++++++++
 toolchain/Config.in.2 |   26 --------------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/Config.in b/Config.in
index c33701a..a658b40 100644
--- a/Config.in
+++ b/Config.in
@@ -300,6 +300,32 @@ config BR2_OPTIMIZE_S
 
 endchoice
 
+config BR2_PREFER_SOFT_FLOAT
+	bool
+	default y if BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel || BR2_nios2
+
+config BR2_SOFT_FLOAT
+	bool "Use software floating point by default"
+	depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel || BR2_powerpc || BR2_nios2
+	default $(BR2_PREFER_SOFT_FLOAT)
+	help
+	  If your target CPU does not have a Floating Point Unit (FPU) or a
+	  kernel FPU emulator, but you still wish to support floating point
+	  functions, then everything will need to be compiled with soft
+	  floating point support (-msoft-float).
+
+config BR2_VFP_FLOAT
+	bool "Use ARM Vector Floating Point unit"
+	depends on !BR2_SOFT_FLOAT
+	depends on BR2_arm || BR2_armeb
+	help
+	  Setting this option will enable the "-mfpu=vfp" option.
+	  If your ARM CPU has a Vector Floating Point Unit (VFP)
+	  and the toolchain supports the option, then the
+	  code can be optimized.
+
+	  Most people will answer N.
+
 config BR2_PREFER_STATIC_LIB
 	bool "prefer static libraries"
 	help
diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index 0fb90ce..0cb1384 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -53,20 +53,6 @@ config BR2_USE_WCHAR
 	  If you have an external binary toolchain that has been built 
 	  with WCHAR support then enable this option.
 
-config BR2_PREFER_SOFT_FLOAT
-	bool
-	default y if BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel || BR2_nios2
-
-config BR2_SOFT_FLOAT
-	bool "Use software floating point by default"
-	depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel || BR2_powerpc || BR2_nios2
-	default $(BR2_PREFER_SOFT_FLOAT)
-	help
-	  If your target CPU does not have a Floating Point Unit (FPU) or a
-	  kernel FPU emulator, but you still wish to support floating point
-	  functions, then everything will need to be compiled with soft
-	  floating point support (-msoft-float).
-
 config BR2_USE_SSP
 	bool "Enable stack protection support"
 	help
@@ -146,18 +132,6 @@ config BR2_ENABLE_MULTILIB
 	help
 	    Build libraries to support different ABIs.
 
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
 config BR2_CROSS_TOOLCHAIN_TARGET_UTILS
 	bool "Include target utils in cross toolchain"
 	default y
-- 
1.6.3.3
