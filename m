From: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
Date: Mon, 16 Mar 2015 18:00:12 +0800
Subject: [Buildroot] [PATCH 4/5] aarch64: ilp32: add ilp32 menuconfig
In-Reply-To: <1426500013-1276-1-git-send-email-bamvor.zhangjian@huawei.com>
References: <1426500013-1276-1-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <1426500013-1276-5-git-send-email-bamvor.zhangjian@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
---
 arch/Config.in.aarch64 | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/Config.in.aarch64 b/arch/Config.in.aarch64
index 9830302..d383246 100644
--- a/arch/Config.in.aarch64
+++ b/arch/Config.in.aarch64
@@ -9,3 +9,38 @@ config BR2_ENDIAN
 config BR2_ARCH_HAS_ATOMICS
 	default y
 
+config BR2_GCC_TARGET_ABI
+	default "lp64" if BR2_AARCH64_LP64
+	default "ilp32" if BR2_AARCH64_ILP32
+
+choice
+	prompt "Target ABI"
+	depends on BR2_aarch64 || BR2_aarch64_be
+	default BR2_AARCH64_LP64
+	help
+	  Application Binary Interface to use. The Application Binary
+	  Interface describes the calling conventions (how arguments
+	  are passed to functions, how the return value is passed, how
+	  system calls are made, etc.).
+
+config BR2_AARCH64_LP64
+	bool "LP64"
+	help
+	  The LP64 is the default ABI in aarch64. It means that
+	  long and pointer is 64bit.
+
+ config BR2_AARCH64_ILP32
+	bool "ILP32"
+	help
+	  ILP32 is a method for running 32bit application on 64bit platform, such
+	  binary is elf32 with aarch64 assembly and is compiled by 64bit compiler.
+	  Refer the following table:
+
+	    \-            |  arm 32bit  | arm64 ILP32 | arm64 LP64
+	  ----------------|-------------|-------------|-------------
+	  instruction set |   armv7-a   |   armv8-a   |   armv8-a
+	  int             |   32bit     |   32bit     |   32bit
+	  long            |   32bit     | **32bit**   |   64bit
+	  pointer         |   32bit     | **32bit**   |   64bit
+
+endchoice
-- 
1.8.4.5
