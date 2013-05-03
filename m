From: Sonic Zhang <sonic.adi@gmail.com>
Date: Fri, 3 May 2013 18:39:36 +0800
Subject: [Buildroot] [PATCH v7 3/7] arch: toolchain: Introduce target CPU
	revision.
In-Reply-To: <1367577580-3518-1-git-send-email-sonic.adi@gmail.com>
References: <1367577580-3518-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1367577580-3518-3-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Adds the possibility to have a free-form CPU revision string and append it
to the target CPU. Only Blackfin actually uses this option.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---

v6-changes:
- The cpu revision test should have a $(call qstrip) to be effective.
- Add cpu revision to toolchain/gcc/gcc-uclibc-4.x.mk as well.

v3-changes:
- Detail the help text and fix the line length.
---
 arch/Config.in                           |    3 +++
 arch/Config.in.bfin                      |    8 ++++++++
 toolchain/gcc/gcc-uclibc-4.x.mk          |    6 +++++-
 toolchain/toolchain-external/ext-tool.mk |    4 ++++
 4 files changed, 20 insertions(+), 1 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 27a29c6..175add5 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -174,6 +174,9 @@ config BR2_GCC_TARGET_ABI
 config BR2_GCC_TARGET_CPU
 	string
 
+config BR2_GCC_TARGET_CPU_REVISION
+	string
+
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index ac96620..f755c8d 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -97,3 +97,11 @@ config BR2_GCC_TARGET_CPU
 	default bf548		if BR2_bf548
 	default bf549		if BR2_bf549
 	default bf561		if BR2_bf561
+
+config BR2_GCC_TARGET_CPU_REVISION
+	string "Target CPU revision"
+	help
+	  Specify a target CPU revision, which will be appended to the
+	  value of the -mcpu option. For example, if the selected CPU is
+	  bf609, and then selected CPU revision is "0.0", then gcc will
+	  receive the -mcpu=bf609-0.0 option.
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index bdc38cd..7fd7bdb 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -85,7 +85,11 @@ ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
 GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)
 endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
-GCC_WITH_CPU:=--with-cpu=$(BR2_GCC_TARGET_CPU)
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
+GCC_WITH_CPU:=--with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
+else
+GCC_WITH_CPU:=--with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
+endif
 endif
 
 # AVR32 GCC special configuration
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 92183a4..57ea266 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -134,7 +134,11 @@ TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += \
 endif
 
 CC_TARGET_TUNE_:=$(call qstrip,$(BR2_GCC_TARGET_TUNE))
+ifeq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
 CC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU))
+else
+CC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
+endif
 CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
 CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
 
-- 
1.7.0.4
