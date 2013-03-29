From: Sonic Zhang <sonic.adi@gmail.com>
Date: Fri, 29 Mar 2013 17:50:38 +0800
Subject: [Buildroot] [PATCH v2 2/7] arch: toolchain: Introduce target CPU
	revision.
In-Reply-To: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1364550643-11793-2-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

v2-changes:
none

v1-changes:
- Adds the possibility to have a free-form CPU revision string and append it
to the target CPU. Only Blackfin actually uses this option.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 arch/Config.in                           |    3 +++
 arch/Config.in.bfin                      |    5 +++++
 toolchain/toolchain-external/ext-tool.mk |    4 ++++
 3 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 472b10c..c341848 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -174,6 +174,9 @@ config BR2_GCC_TARGET_ABI
 config BR2_GCC_TARGET_CPU
 	string
 
+config BR2_GCC_TARGET_CPU_REVISION
+	string
+
 if BR2_arm || BR2_armeb
 source "arch/Config.in.arm"
 endif
diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index ac96620..021f5fe 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -97,3 +97,8 @@ config BR2_GCC_TARGET_CPU
 	default bf548		if BR2_bf548
 	default bf549		if BR2_bf549
 	default bf561		if BR2_bf561
+
+config BR2_GCC_TARGET_CPU_REVISION
+	string "Target CPU revision"
+	help
+	  Specify target cpu revision which is passed to compiler as a parameter.
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index b477bc0..407e1ad 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -134,7 +134,11 @@ TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += \
 endif
 
 CC_TARGET_TUNE_:=$(call qstrip,$(BR2_GCC_TARGET_TUNE))
+ifeq ($(BR2_GCC_TARGET_CPU_REVISION),)
 CC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU))
+else
+CC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
+endif
 CC_TARGET_ARCH_:=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
 CC_TARGET_ABI_:=$(call qstrip,$(BR2_GCC_TARGET_ABI))
 
-- 
1.7.0.4
