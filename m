From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Jan 2018 22:09:41 -0600
Subject: [Buildroot] [PATCH v4 02/13] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1516766992-48428-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1516766992-48428-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This enables a user to build a complete system using these
options.  It is important to note that not all packages will
build correctly to start with.

Modeled after OpenWRT approach
https://github.com/openwrt/openwrt/blob/master/config/Config-build.in#L176

A good testing tool to check a target's elf files for compliance
to an array of hardening techniques can be found here:
https://github.com/slimm609/checksec.sh

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
--
Changes

v1 -> v2
 - Cosmetic caps on titles

v2 -> v3
 - Consolidated the way flags were set using CPPFLAGS (Arnout)
 - Removed fortran flag as not relevant for this feature (Arnout)
 - Added BR2_TOOLCHAIN_USES_GLIBC and optimization level dependency

v3 -> v4
[Nicolas C
 - Used BR2_OPTIMIZE_0 as Config.in dependency
   for Fortify instead of using a warning at
   make time.
 - Enable -> Disable for the None options I
   mislabeled as enabling (relro/fortify).
---
 Config.in           | 70 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 package/Makefile.in | 42 ++++++++++++++++++++------------
 2 files changed, 97 insertions(+), 15 deletions(-)

diff --git a/Config.in b/Config.in
index e7e5c2d..447b642 100644
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
+	  This option sets _FORTIFY_SOURCE set to 1 and only introduces
+	  checks that shouldn't change the behavior of conforming programs.
+	  Adds checks at compile-time only.
+
+config BR2_FORTIFY_SOURCE_2
+	bool "Aggressive"
+	help
+	  This option sets _FORTIFY_SOURCES set to 2 and some more checking
+	  is added, but some conforming programs might fail.
+	  Also adds checks at run-time (detected buffer overflow terminates
+	  the program)
+
+endchoice
+
+comment "Fortify Source needs a GLIBC toolchain and some level of optimization"
+	depends on (!BR2_TOOLCHAIN_USES_GLIBC || BR2_OPTIMIZE_0)
 endmenu
 
 source "toolchain/Config.in"
diff --git a/package/Makefile.in b/package/Makefile.in
index a1a5316..36c3d55 100644
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
-- 
1.9.1
