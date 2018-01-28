From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 15:21:14 +0100
Subject: [Buildroot] [git commit] security hardening: add RELFO,
 FORTIFY options
Message-ID: <20180128145128.360AE834A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20a4583ebf7fe97ea22a1ea11621dd44a8114ca5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This enables a user to build a complete system using these
options.  It is important to note that not all packages will
build correctly to start with.

Modeled after OpenWRT approach
https://github.com/openwrt/openwrt/blob/master/config/Config-build.in#L176

A good testing tool to check a target's elf files for compliance
to an array of hardening techniques can be found here:
https://github.com/slimm609/checksec.sh

[Peter: reword fortify help texts, glibc comment]
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in           | 70 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 package/Makefile.in | 42 ++++++++++++++++++++------------
 2 files changed, 97 insertions(+), 15 deletions(-)

diff --git a/Config.in b/Config.in
index e7e5c2d..0002df5 100644
--- a/Config.in
+++ b/Config.in
@@ -734,6 +734,76 @@ endchoice
 comment "Stack Smashing Protection needs a toolchain w/ SSP"
 	depends on !BR2_TOOLCHAIN_HAS_SSP
 
+choice
+	bool "RELRO Protection"
+	depends on BR2_SHARED_LIBS
+	help
+	  Enable a link-time protection know as RELRO (RELocation Read Only)
+	  which helps to protect from certain type of exploitation techniques
+	  altering the content of some ELF sections.
+
+config BR2_RELRO_NONE
+	bool "None"
+	help
+	  Disables Relocation link-time protections.
+
+config BR2_RELRO_PARTIAL
+	bool "Partial"
+	help
+	  This option makes the dynamic section not writeable after
+	  initialization (with almost no performance penalty).
+
+config BR2_RELRO_FULL
+	bool "Full"
+	help
+	  This option includes the partial configuration, but also
+	  marks the GOT as read-only at the cost of initialization time
+	  during program loading, i.e every time an executable is started.
+
+endchoice
+
+comment "RELocation Read Only (RELRO) needs shared libraries"
+	depends on !BR2_SHARED_LIBS
+
+choice
+	bool "Buffer-overflow Detection (FORTIFY_SOURCE)"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_OPTIMIZE_0
+	help
+	  Enable the _FORTIFY_SOURCE macro which introduces additional
+	  checks to detect buffer-overflows in the following standard library
+	  functions: memcpy, mempcpy, memmove, memset, strcpy, stpcpy,
+	  strncpy, strcat, strncat, sprintf, vsprintf, snprintf, vsnprintf,
+	  gets.
+
+	  NOTE: This feature requires an optimization level of s/1/2/3/g
+
+	  Support for this feature has been present since GCC 4.x.
+
+config BR2_FORTIFY_SOURCE_NONE
+	bool "None"
+	help
+	  Disables additional checks to detect buffer-overflows.
+
+config BR2_FORTIFY_SOURCE_1
+	bool "Conservative"
+	help
+	  This option sets _FORTIFY_SOURCE to 1 and only introduces
+	  checks that shouldn't change the behavior of conforming
+	  programs.  Adds checks at compile-time only.
+
+config BR2_FORTIFY_SOURCE_2
+	bool "Aggressive"
+	help
+	  This option sets _FORTIFY_SOURCES to 2 and some more
+	  checking is added, but some conforming programs might fail.
+	  Also adds checks at run-time (detected buffer overflow
+	  terminates the program)
+
+endchoice
+
+comment "Fortify Source needs a glibc toolchain and optimization"
+	depends on (!BR2_TOOLCHAIN_USES_GLIBC || BR2_OPTIMIZE_0)
 endmenu
 
 source "toolchain/Config.in"
diff --git a/package/Makefile.in b/package/Makefile.in
index 61f0a8f..e387ce6 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -138,11 +138,37 @@ ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING = -g3
 endif
 
+TARGET_CFLAGS_RELRO = -Wl,-z,relro
+TARGET_CFLAGS_RELRO_FULL = -Wl,-z,now $(TARGET_CFLAGS_RELRO)
+
+TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
+
+ifeq ($(BR2_SSP_REGULAR),y)
+TARGET_CPPFLAGS += -fstack-protector
+else ifeq ($(BR2_SSP_STRONG),y)
+TARGET_CPPFLAGS += -fstack-protector-strong
+else ifeq ($(BR2_SSP_ALL),y)
+TARGET_CPPFLAGS += -fstack-protector-all
+endif
+
+ifeq ($(BR2_RELRO_PARTIAL),y)
+TARGET_CPPFLAGS += $(TARGET_CFLAGS_RELRO)
+TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
+else ifeq ($(BR2_RELRO_FULL),y)
+TARGET_CPPFLAGS += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
+TARGET_LDFLAGS += -pie
+endif
+
+ifeq ($(BR2_FORTIFY_SOURCE_1),y)
+TARGET_CPPFLAGS += -D_FORTIFY_SOURCE=1
+else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
+TARGET_CPPFLAGS += -D_FORTIFY_SOURCE=2
+endif
+
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
-TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
 ifeq ($(BR2_BINFMT_FLAT),y)
 TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
@@ -167,20 +193,6 @@ TARGET_FCFLAGS += -msep-data
 TARGET_CXXFLAGS += -msep-data
 endif
 
-ifeq ($(BR2_SSP_REGULAR),y)
-TARGET_CFLAGS += -fstack-protector
-TARGET_CXXFLAGS += -fstack-protector
-TARGET_FCFLAGS += -fstack-protector
-else ifeq ($(BR2_SSP_STRONG),y)
-TARGET_CFLAGS += -fstack-protector-strong
-TARGET_CXXFLAGS += -fstack-protector-strong
-TARGET_FCFLAGS += -fstack-protector-strong
-else ifeq ($(BR2_SSP_ALL),y)
-TARGET_CFLAGS += -fstack-protector-all
-TARGET_CXXFLAGS += -fstack-protector-all
-TARGET_FCFLAGS += -fstack-protector-all
-endif
-
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CROSS = $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-
 else
