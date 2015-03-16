From: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
Date: Mon, 16 Mar 2015 18:00:09 +0800
Subject: [Buildroot] [PATCH 1/5] aarch64: add big endian(aarch64_be) support
In-Reply-To: <1426500013-1276-1-git-send-email-bamvor.zhangjian@huawei.com>
References: <1426500013-1276-1-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <1426500013-1276-2-git-send-email-bamvor.zhangjian@huawei.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zhang Jian(Bamvor) <bamvor.zhangjian@huawei.com>
---
 arch/Config.in         | 12 ++++++++++--
 arch/Config.in.aarch64 |  5 ++++-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 16ad8be..4e4ab37 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -46,7 +46,15 @@ config BR2_armeb
 	  http://en.wikipedia.org/wiki/ARM
 
 config BR2_aarch64
-	bool "AArch64"
+	bool "AArch64 (little endian)"
+	select BR2_ARCH_IS_64
+	help
+	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
+	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
+	  http://en.wikipedia.org/wiki/ARM
+
+config BR2_aarch64_be
+	bool "AArch64 (big endian)"
 	select BR2_ARCH_IS_64
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
@@ -309,7 +317,7 @@ if BR2_arm || BR2_armeb
 source "arch/Config.in.arm"
 endif
 
-if BR2_aarch64
+if BR2_aarch64 || BR2_aarch64_be
 source "arch/Config.in.aarch64"
 endif
 
diff --git a/arch/Config.in.aarch64 b/arch/Config.in.aarch64
index 2e79870..9830302 100644
--- a/arch/Config.in.aarch64
+++ b/arch/Config.in.aarch64
@@ -1,8 +1,11 @@
 config BR2_ARCH
 	default "aarch64"	if BR2_aarch64
+	default "aarch64_be"	if BR2_aarch64_be
 
 config BR2_ENDIAN
-	default "LITTLE"
+	default "LITTLE" if BR2_aarch64
+	default "BIG"	 if BR2_aarch64_be
 
 config BR2_ARCH_HAS_ATOMICS
 	default y
+
-- 
1.8.4.5
