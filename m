From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  3 Feb 2020 17:59:44 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_93532
In-Reply-To: <20200203165946.50232-1-giulio.benetti@benettiengineering.com>
References: <20200203165946.50232-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200203165946.50232-2-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC hangs while building bullet for the Riscv32 Arch:
http://autobuild.buildroot.net/results/9a4/9a405ec6fabfa306c14a671a5e09359ac623c25b/

Reported on gcc bugzilla:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93532

This bug manifests up to version 8.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 858121d2c5..1be898731a 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -159,6 +159,14 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	bool
 	default y if BR2_microblaze
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93532
+# An infinite loop exists on riscv32 gcc. This doesn't manifest on gcc 9.x
+# http://autobuild.buildroot.net/results/9a4/9a405ec6fabfa306c14a671a5e09359ac623c25b/
+config BR2_TOOLCHAIN_HAS_GCC_BUG_93532
+	bool
+	default y if BR2_RISCV_32
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.20.1
