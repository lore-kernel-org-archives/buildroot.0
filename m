From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Wed, 12 Mar 2008 06:07:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package
Message-ID: <20080312130714.F267412011A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-12 06:07:10 -0700 (Wed, 12 Mar 2008)
New Revision: 21313

Log:
added more debugging options for packages

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2008-03-12 11:23:11 UTC (rev 21312)
+++ trunk/buildroot/Config.in	2008-03-12 13:07:10 UTC (rev 21313)
@@ -184,7 +184,44 @@
 	help
 	  This option show recent versions of packages.
 
+config BR2_ENABLE_DEBUG
+	bool "build packages with debugging symbols"
+	default n
+	help
+	  Build packages with debugging symbols
+	  enabled
+
+if BR2_ENABLE_DEBUG
 choice
+	prompt "gcc debug level"
+	default BR2_DEBUG_2
+	help
+	  Set the debug level for gcc
+
+config BR2_DEBUG_1
+	bool "debug level 1"
+	help
+	  Debug level 1 produces minimal information, enough 
+	  for making backtraces in parts of the program that 
+	  you don't plan to debug. This includes descriptions 
+	  of functions and external variables, but no information
+	  about local variables and no line numbers.
+
+config BR2_DEBUG_2
+	bool "debug level 2"
+	help
+	  The default gcc debug level is 2
+
+config BR2_DEBUG_3
+	bool "debug level 3"
+	help
+	  Level 3 includes extra information, such as all the 
+	  macro definitions present in the program. Some debuggers
+	  support macro expansion when you use -g3.
+endchoice
+endif
+
+choice
 	prompt "strip"
 	default BR2_STRIP_strip
 	help
@@ -196,12 +233,14 @@
 
 config BR2_STRIP_strip
 	bool "strip"
+	depends !BR2_ENABLE_DEBUG
 	help
 	  strip   is the normal strip command
 
 config BR2_STRIP_sstrip
 	bool "sstrip"
 	select BR2_PACKAGE_SSTRIP_HOST
+	depends !BR2_ENABLE_DEBUG
 	help
 	  sstrip  is a strip that discards more than the normal strip
 
@@ -211,15 +250,72 @@
 	  none    do not strip (only for debugging!)
 endchoice
 
-if BR2_STRIP_none
-config BR2_ENABLE_DEBUG
-	bool "build packages with debugging symbols"
-	default n
+choice
+	prompt "gcc optimization level"
+	default BR2_OPTIMIZE_0
 	help
-	  Build packages with debugging symbols
-	  enabled
-endif
+	  Set the optimization level for gcc
 
+config BR2_OPTIMIZE_0
+	bool "optimization level 0"
+	help
+	  Do not optimize. This is the default. 
+
+config BR2_OPTIMIZE_1
+	bool "optimization level 1"
+	help
+	  Optimize. Optimizing compilation takes somewhat more time, 
+	  and a lot more memory for a large function. With -O, the 
+	  compiler tries to reduce code size and execution time, 
+	  without performing any optimizations that take a great deal 
+	  of compilation time. -O turns on the following optimization 
+	  flags: -fdefer-pop -fdelayed-branch -fguess-branch-probability 
+	  -fcprop-registers -floop-optimize -fif-conversion 
+	  -fif-conversion2 -ftree-ccp -ftree-dce -ftree-dominator-opts 
+	  -ftree-dse -ftree-ter -ftree-lrs -ftree-sra -ftree-copyrename 
+	  -ftree-fre -ftree-ch -funit-at-a-time -fmerge-constants
+	  -O also turns on -fomit-frame-pointer on machines where doing 
+	  so does not interfere with debugging.
+
+config BR2_OPTIMIZE_2
+	bool "optimization level 2"
+	help
+	  Optimize even more. GCC performs nearly all supported optimizations
+	  that do not involve a space-speed tradeoff. The compiler does not 
+	  perform loop unrolling or function inlining when you specify -O2. 
+	  As compared to -O, this option increases both compilation time and 
+	  the performance of the generated code. -O2 turns on all optimization 
+	  flags specified by -O. It also turns on the following optimization 
+	  flags: -fthread-jumps -fcrossjumping -foptimize-sibling-calls 
+	  -fcse-follow-jumps -fcse-skip-blocks -fgcse  -fgcse-lm 
+	  -fexpensive-optimizations -fstrength-reduce -frerun-cse-after-loop  
+	  -frerun-loop-opt -fcaller-saves -fpeephole2 -fschedule-insns  
+	  -fschedule-insns2 -fsched-interblock -fsched-spec -fregmove 
+	  -fstrict-aliasing -fdelete-null-pointer-checks -freorder-blocks  
+	  -freorder-functions -falign-functions -falign-jumps -falign-loops  
+	  -falign-labels -ftree-vrp -ftree-pre
+	  Please note the warning under -fgcse about invoking -O2 on programs
+	  that use computed gotos.
+
+config BR2_OPTIMIZE_3
+	bool "optimization level 3"
+	help
+	  Optimize yet more. -O3 turns on all optimizations specified by -O2 
+	  and also turns on the -finline-functions, -funswitch-loops and 
+	  -fgcse-after-reload options.
+
+config BR2_OPTIMIZE_S
+	bool "optimize for size"
+	help
+	  Optimize for size. -Os enables all -O2 optimizations that do not 
+	  typically increase code size. It also performs further optimizations
+	  designed to reduce code size. -Os disables the following optimization 
+	  flags: -falign-functions -falign-jumps -falign-loops -falign-labels  
+	  -freorder-blocks -freorder-blocks-and-partition -fprefetch-loop-arrays
+	  -ftree-vect-loop-version
+     
+endchoice
+
 config BR2_PREFER_STATIC_LIB
 	bool "prefer static libraries"
 	default n

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2008-03-12 11:23:11 UTC (rev 21312)
+++ trunk/buildroot/package/Makefile.in	2008-03-12 13:07:10 UTC (rev 21313)
@@ -9,7 +9,32 @@
 MAKE1:=$(HOSTMAKE) MAKE="$(firstword $(HOSTMAKE)) -j1"
 MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
 
+ifeq ($(BR2_OPTIMIZE_0),y)
+TARGET_OPTIMIZATION=-O0
+endif
+ifeq ($(BR2_OPTIMIZE_1),y)
+TARGET_OPTIMIZATION=-O1
+endif
+ifeq ($(BR2_OPTIMIZE_2),y)
+TARGET_OPTIMIZATION=-O2
+endif
+ifeq ($(BR2_OPTIMIZE_3),y)
+TARGET_OPTIMIZATION=-O3
+endif
+ifeq ($(BR2_OPTIMIZE_S),y)
+TARGET_OPTIMIZATION=-Os
+endif
+ifeq ($(BR2_DEBUG_1),y)
+TARGET_DEBUGGING=-g1
+endif
+ifeq ($(BR2_DEBUG_2),y)
+TARGET_DEBUGGING=-g2
+endif
+ifeq ($(BR2_DEBUG_3),y)
+TARGET_DEBUGGING=-g3
+endif
 
+
 #########################################################################
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
