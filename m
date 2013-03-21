From: Sonic Zhang <sonic.adi@gmail.com>
Date: Thu, 21 Mar 2013 14:38:27 +0800
Subject: [Buildroot] [PATCH 1/2] package: Makefile.in: Add target
	compilation flags for NOMMU architecture.
Message-ID: <1363847908-5662-1-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

- Add BR2_TARGET_ABI_FLAT option
- Add NOMMU compiling macro
- Add FLAT ABI specific link flags
- Add stack size to FLAT link flags if macro <PKG>_FLAT_STACKSIZE is defined.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 arch/Config.in           |    3 +++
 package/Makefile.in      |    8 ++++++++
 package/pkg-autotools.mk |    5 +++++
 package/pkg-generic.mk   |    5 +++++
 4 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 472b10c..120c67e 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -174,6 +174,9 @@ config BR2_GCC_TARGET_ABI
 config BR2_GCC_TARGET_CPU
 	string
 
+config BR2_TARGET_ABI_FLAT
+	bool
+
 if BR2_arm || BR2_armeb
 source "arch/Config.in.arm"
 endif
diff --git a/package/Makefile.in b/package/Makefile.in
index a8bf36b..acfd9c8 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -103,6 +103,14 @@ TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
+ifeq ($(BR2_TARGET_ABI_FLAT),y)
+TARGET_LDFLAGS += -Wl,-elf2flt
+endif
+
+ifneq ($(BR2_USE_MMU), y)
+TARGET_CFLAGS += -D__NOMMU__
+endif
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
 else
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 890506b..b23feec 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -82,6 +82,11 @@ $(2)_CLEAN_OPT			?= clean
 $(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
 $(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
 
+ifeq ($(BR2_TARGET_ABI_FLAT),y)
+ ifneq ($$($(2)_FLAT_STACKSIZE),)
+  $(2)_CONF_ENV			+= LDFLAGS="$(TARGET_LDFLAGS) -Wl,-elf2flt=-s$($(2)_FLAT_STACKSIZE)"
+ endif
+endif
 
 #
 # Configure step. Only define it if not already defined by the package
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 57b0fd0..47ac33a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -303,6 +303,11 @@ endif
 
 $(2)_REDISTRIBUTE		?= YES
 
+ifeq ($(BR2_TARGET_ABI_FLAT),y)
+ ifneq ($$($(2)_FLAT_STACKSIZE),)
+  $(2)_FLAT_LDFLAGS = -Wl,-elf2flt=-s$($(2)_FLAT_STACKSIZE)
+ endif
+endif
 
 $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
-- 
1.7.0.4
