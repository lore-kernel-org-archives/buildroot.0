From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 9 Apr 2013 14:29:44 +0800
Subject: [Buildroot] [PATCH v3 3/7] arch: toolchain: Introduce target CPU
	revision.
In-Reply-To: <1365488988-21604-1-git-send-email-sonic.adi@gmail.com>
References: <1365488988-21604-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1365488988-21604-3-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

v3-changes:
- Detail the help text and fix the line length.

v2-changes:
none

v1-changes:
- Adds the possibility to have a free-form CPU revision string and append it
to the target CPU. Only Blackfin actually uses this option.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 arch/Config.in                           |    3 +++
 arch/Config.in.bfin                      |    8 ++++++++
 toolchain/toolchain-external/ext-tool.mk |    4 ++++
 3 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 5dd6467..b4ee38b 100644
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
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 92183a4..27fd296 100644
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
