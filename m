From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Feb 2011 15:09:15 -0300
Subject: [Buildroot] [PATCH] toolchain: reorganize target gcc options
Message-ID: <1296670155-7407-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Move target gcc language selections to the package menu.
* Disable objc & fortran options unless target gcc is selected.
* Rename the "native toolchain" option to gcc.
* Disable target gcc unless we're using a buildroot toolchain.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/gcc/Config.in   |   12 ------------
 toolchain/gcc/Config.in.2 |   20 ++++++++++++++++----
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 7a1905f..c975bb5 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -62,18 +62,6 @@ config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	help
 	  Any additional gcc configure options you may want to include....
 
-config BR2_GCC_CROSS_OBJC
-	bool "Objective-C cross-compiler support"
-	depends on !BR2_avr32
-	help
-	  Build an Objective-C cross-compiler
-
-config BR2_GCC_CROSS_FORTRAN
-	bool "Fortran cross-compiler support"
-	depends on !BR2_avr32
-	help
-	  Build a Fortran cross-compiler
-
 config BR2_GCC_CROSS_JAVA
        bool
 
diff --git a/toolchain/gcc/Config.in.2 b/toolchain/gcc/Config.in.2
index 705506b..886e99b 100644
--- a/toolchain/gcc/Config.in.2
+++ b/toolchain/gcc/Config.in.2
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GCC_TARGET
-	bool "native toolchain in the target filesystem"
-	depends on BR2_HAVE_DEVFILES
+	bool "gcc"
+	depends on BR2_HAVE_DEVFILES && BR2_TOOLCHAIN_BUILDROOT
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_BINUTILS_TARGET
 	select BR2_PACKAGE_MPC if BR2_GCC_VERSION_4_5_X
@@ -10,6 +10,18 @@ config BR2_PACKAGE_GCC_TARGET
 	  If you want the target system to be able to run
 	  binutils/gcc and compile native code, say Y here.
 
+config BR2_GCC_CROSS_FORTRAN
+	bool "fortran support"
+	depends on !BR2_avr32 && BR2_PACKAGE_GCC_TARGET
+	help
+	  Build a Fortran compiler
+
+config BR2_GCC_CROSS_OBJC
+	bool "objective-c support"
+	depends on !BR2_avr32 && BR2_PACKAGE_GCC_TARGET
+	help
+	  Build an Objective-C compiler
+
 config BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS
 	string "Additional target gcc options"
 	default ""
@@ -19,5 +31,5 @@ config BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS
 	  Including, but not limited to --disable-checking etc.
 	  Refer to */configure in your gcc sources.
 
-comment "native toolchain needs development files in target filesystem"
-	depends on !BR2_HAVE_DEVFILES
+comment "gcc needs development files in target filesystem"
+	depends on !BR2_HAVE_DEVFILES && BR2_TOOLCHAIN_BUILDROOT
-- 
1.7.3.4
