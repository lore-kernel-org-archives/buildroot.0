From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue,  6 Oct 2009 20:26:08 +0200
Subject: [Buildroot] [PATCH 6/6] remove superfluous OPTIMIZE and DEBUG
	config knobs
In-Reply-To: <5959e530273437a31071499009cecc7a7e9ab461.1254853146.git.rep.dot.nop@gmail.com>
References: <cover.1254853146.git.rep.dot.nop@gmail.com>
	<1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	<4a5a0f10dbaecfd7b024c0cf1e90fd68a6730eac.1254853146.git.rep.dot.nop@gmail.com>
	<6fe0ac8fa1f42152f604ca708aff08b8f119073a.1254853146.git.rep.dot.nop@gmail.com>
	<582a63d745311a980a8700a2a0ec17c3ae0f5ca9.1254853146.git.rep.dot.nop@gmail.com>
	<5959e530273437a31071499009cecc7a7e9ab461.1254853146.git.rep.dot.nop@gmail.com>
Message-ID: <4bf0f4eae22ac9a6b1afa4621ff32b3f43887a85.1254853146.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is BR2_TARGET_OPTIMIZATION that is saved in the .config

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 Config.in           |  101 +--------------------------------------------------
 package/Makefile.in |   30 +--------------
 2 files changed, 3 insertions(+), 128 deletions(-)

diff --git a/Config.in b/Config.in
index 86e50ac..ca6b298 100644
--- a/Config.in
+++ b/Config.in
@@ -169,38 +169,7 @@ config BR2_ENABLE_DEBUG
 	bool "build packages with debugging symbols"
 	select BR2_PACKAGE_GDB_SERVER
 	help
-	  Build packages with debugging symbols
-	  enabled
-
-if BR2_ENABLE_DEBUG
-choice
-	prompt "gcc debug level"
-	default BR2_DEBUG_2
-	help
-	  Set the debug level for gcc
-
-config BR2_DEBUG_1
-	bool "debug level 1"
-	help
-	  Debug level 1 produces minimal information, enough
-	  for making backtraces in parts of the program that
-	  you don't plan to debug. This includes descriptions
-	  of functions and external variables, but no information
-	  about local variables and no line numbers.
-
-config BR2_DEBUG_2
-	bool "debug level 2"
-	help
-	  The default gcc debug level is 2
-
-config BR2_DEBUG_3
-	bool "debug level 3"
-	help
-	  Level 3 includes extra information, such as all the
-	  macro definitions present in the program. Some debuggers
-	  support macro expansion when you use -g3.
-endchoice
-endif
+	 Build packages with debugging symbols enabled
 
 choice
 	prompt "strip"
@@ -231,74 +200,6 @@ config BR2_STRIP_none
 	  none    do not strip (only for debugging!)
 endchoice
 
-choice
-	prompt "gcc optimization level"
-	default BR2_OPTIMIZE_S
-	help
-	  Set the optimization level for gcc
-
-config BR2_OPTIMIZE_0
-	bool "optimization level 0"
-	depends on !BR2_PACKAGE_LINUX
-	help
-	  Do not optimize. This is the default.
-
-config BR2_OPTIMIZE_1
-	bool "optimization level 1"
-	depends on !BR2_PACKAGE_LINUX
-	help
-	  Optimize. Optimizing compilation takes somewhat more time,
-	  and a lot more memory for a large function. With -O, the
-	  compiler tries to reduce code size and execution time,
-	  without performing any optimizations that take a great deal
-	  of compilation time. -O turns on the following optimization
-	  flags: -fdefer-pop -fdelayed-branch -fguess-branch-probability
-	  -fcprop-registers -floop-optimize -fif-conversion
-	  -fif-conversion2 -ftree-ccp -ftree-dce -ftree-dominator-opts
-	  -ftree-dse -ftree-ter -ftree-lrs -ftree-sra -ftree-copyrename
-	  -ftree-fre -ftree-ch -funit-at-a-time -fmerge-constants
-	  -O also turns on -fomit-frame-pointer on machines where doing
-	  so does not interfere with debugging.
-
-config BR2_OPTIMIZE_2
-	bool "optimization level 2"
-	help
-	  Optimize even more. GCC performs nearly all supported optimizations
-	  that do not involve a space-speed tradeoff. The compiler does not
-	  perform loop unrolling or function inlining when you specify -O2.
-	  As compared to -O, this option increases both compilation time and
-	  the performance of the generated code. -O2 turns on all optimization
-	  flags specified by -O. It also turns on the following optimization
-	  flags: -fthread-jumps -fcrossjumping -foptimize-sibling-calls
-	  -fcse-follow-jumps -fcse-skip-blocks -fgcse  -fgcse-lm
-	  -fexpensive-optimizations -fstrength-reduce -frerun-cse-after-loop
-	  -frerun-loop-opt -fcaller-saves -fpeephole2 -fschedule-insns
-	  -fschedule-insns2 -fsched-interblock -fsched-spec -fregmove
-	  -fstrict-aliasing -fdelete-null-pointer-checks -freorder-blocks
-	  -freorder-functions -falign-functions -falign-jumps -falign-loops
-	  -falign-labels -ftree-vrp -ftree-pre
-	  Please note the warning under -fgcse about invoking -O2 on programs
-	  that use computed gotos.
-
-config BR2_OPTIMIZE_3
-	bool "optimization level 3"
-	help
-	  Optimize yet more. -O3 turns on all optimizations specified by -O2
-	  and also turns on the -finline-functions, -funswitch-loops and
-	  -fgcse-after-reload options.
-
-config BR2_OPTIMIZE_S
-	bool "optimize for size"
-	help
-	  Optimize for size. -Os enables all -O2 optimizations that do not
-	  typically increase code size. It also performs further optimizations
-	  designed to reduce code size. -Os disables the following optimization
-	  flags: -falign-functions -falign-jumps -falign-loops -falign-labels
-	  -freorder-blocks -freorder-blocks-and-partition -fprefetch-loop-arrays
-	  -ftree-vect-loop-version
-
-endchoice
-
 config BR2_PREFER_STATIC_LIB
 	bool "prefer static libraries"
 	help
diff --git a/package/Makefile.in b/package/Makefile.in
index 0ffd22c..7777413 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -9,35 +9,9 @@ HOSTMAKE :=$(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
 
-ifeq ($(BR2_OPTIMIZE_0),y)
-TARGET_OPTIMIZATION+=-O0
-endif
-ifeq ($(BR2_OPTIMIZE_1),y)
-TARGET_OPTIMIZATION+=-O1
-endif
-ifeq ($(BR2_OPTIMIZE_2),y)
-TARGET_OPTIMIZATION+=-O2
-endif
-ifeq ($(BR2_OPTIMIZE_3),y)
-TARGET_OPTIMIZATION+=-O3
-endif
-ifeq ($(BR2_OPTIMIZE_S),y)
-TARGET_OPTIMIZATION+=-Os
-endif
-ifeq ($(BR2_DEBUG_1),y)
-TARGET_DEBUGGING=-g1
-endif
-ifeq ($(BR2_DEBUG_2),y)
-TARGET_DEBUGGING=-g2
-endif
-ifeq ($(BR2_DEBUG_3),y)
-TARGET_DEBUGGING=-g3
-endif
-
-
 #########################################################################
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
-TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
+TARGET_CFLAGS=$(TARGET_OPTIMIZATION) \
 	-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
 TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
@@ -91,7 +65,7 @@ TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 # else it's an external toolchain
 #########################################################################
 else
-TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) --sysroot $(STAGING_DIR)/
+TARGET_CFLAGS=$(TARGET_OPTIMIZATION) --sysroot $(STAGING_DIR)/
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_LDFLAGS=--sysroot $(STAGING_DIR)/
 endif
-- 
1.6.3.3
