From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 26 Jun 2010 00:15:31 +0200
Subject: [Buildroot] [PATCH 4/5] toolchain: move buildroot config files
In-Reply-To: <1277504132-11184-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1277504132-11184-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1277504132-11184-5-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Handle the internal toolchain backend mechanism the
same way we handle other backends.

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
---
 toolchain/Config.in                                |   12 +----
 .../{Config.in.1 => toolchain-buildroot/Config.in} |    2 +-
 toolchain/toolchain-buildroot/Config.in.2          |   37 ++++++++++++++++
 toolchain/{Config.in.2 => toolchain-common.in}     |   46 ++++----------------
 4 files changed, 50 insertions(+), 47 deletions(-)
 rename toolchain/{Config.in.1 => toolchain-buildroot/Config.in} (82%)
 create mode 100644 toolchain/toolchain-buildroot/Config.in.2
 rename toolchain/{Config.in.2 => toolchain-common.in} (84%)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 52b9d8b..fc9a048 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -16,16 +16,10 @@ config BR2_TOOLCHAIN_EXTERNAL
 
 endchoice
 
-source "toolchain/Config.in.1"
+source "toolchain/toolchain-buildroot/Config.in"
 source "toolchain/toolchain-external/Config.in"
-
-# we want gdb config in the middle of both source and external
-# toolchains, but mconf won't let us source the same file twice,
-# so put it here instead
-source "toolchain/gdb/Config.in"
-comment "Common Toolchain Options"
-
-source "toolchain/Config.in.2"
+source "toolchain/toolchain-common.in"
+source "toolchain/toolchain-buildroot/Config.in.2"
 source "toolchain/toolchain-external/Config.in.2"
 
 endmenu
diff --git a/toolchain/Config.in.1 b/toolchain/toolchain-buildroot/Config.in
similarity index 82%
rename from toolchain/Config.in.1
rename to toolchain/toolchain-buildroot/Config.in
index 5c26858..a9dd192 100644
--- a/toolchain/Config.in.1
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -1,4 +1,4 @@
-#
+# Config entries for internal toolchain backend
 
 if BR2_TOOLCHAIN_BUILDROOT
 source "toolchain/kernel-headers/Config.in"
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
new file mode 100644
index 0000000..512a608
--- /dev/null
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -0,0 +1,37 @@
+# Buildroot backend specific options
+
+if BR2_TOOLCHAIN_BUILDROOT
+source "toolchain/elf2flt/Config.in"
+source "toolchain/mklibs/Config.in"
+source "toolchain/sstrip/Config.in"
+
+config BR2_ENABLE_MULTILIB
+	bool "Enable multilib support?"
+	help
+	    Build libraries to support different ABIs.
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
+config BR2_CROSS_TOOLCHAIN_TARGET_UTILS
+	bool "Include target utils in cross toolchain"
+	default y
+	help
+	  When using buildroot to build a deployable cross toolchain,
+	  it is handy to include certain target apps with that toolchain
+	  as a convenience.
+	  Examples include ldd, gdbserver, and strace.
+
+	  Answer Y if you want these apps (if built) copied into the
+	  cross toolchain dir under <arch>-linux-uclibc/target_utils/.
+
+endif
diff --git a/toolchain/Config.in.2 b/toolchain/toolchain-common.in
similarity index 84%
rename from toolchain/Config.in.2
rename to toolchain/toolchain-common.in
index 35263ce..bea0c7c 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/toolchain-common.in
@@ -1,4 +1,12 @@
-#
+# Generic toolchain options
+
+# we want gdb config in the middle of both source and external
+# toolchains, but mconf won't let us source the same file twice,
+# so put it here instead
+source "toolchain/gdb/Config.in"
+
+comment "Common Toolchain Options"
+
 config BR2_LARGEFILE
 	bool "Enable large file (files > 2 GB) support?"
 	depends on !BR2_cris
@@ -162,39 +170,3 @@ config BR2_TARGET_OPTIMIZATION
 	help
 	  Optimizations to use when building for the target host.
 	  NOTE: gcc optimization level is defined in build options.
-
-if BR2_TOOLCHAIN_BUILDROOT
-source "toolchain/elf2flt/Config.in"
-source "toolchain/mklibs/Config.in"
-source "toolchain/sstrip/Config.in"
-
-config BR2_ENABLE_MULTILIB
-	bool "Enable multilib support?"
-	help
-	    Build libraries to support different ABIs.
-
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
-config BR2_CROSS_TOOLCHAIN_TARGET_UTILS
-	bool "Include target utils in cross toolchain"
-	default y
-	help
-	  When using buildroot to build a deployable cross toolchain,
-	  it is handy to include certain target apps with that toolchain
-	  as a convenience.
-	  Examples include ldd, gdbserver, and strace.
-
-	  Answer Y if you want these apps (if built) copied into the
-	  cross toolchain dir under <arch>-linux-uclibc/target_utils/.
-
-endif
-- 
1.7.1
