From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 11:53:51 +0200
Subject: [Buildroot] [PATCH 2/3] arch/mips: inverse the mfpxx logic
In-Reply-To: <cover.1504432422.git.yann.morin.1998@free.fr>
References: <cover.1504432422.git.yann.morin.1998@free.fr>
Message-ID: <97a1396440baea0fec1c3fb6593d9cf7f3655f99.1504432422.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the possibility to choose the floating point mode (32, xx or
64) is conditional on having a sufficiently recent gcc version.

Which means that the architecture selection depends on the gcc version.

But that's opposite to what we've always done in Buildroot: the software
versions are conditional to the architecture options. There is nothing
we can do about the hardware: it is there, we can't change it, while we
can restrict ourselves to using software that is working on said
hardware.

Thus, we inverse the logic, to move the condition onto the software
side: whenever mfpxx is selected, we restrict the toolchain selection to
at least a gcc-5.

And now, the blind BR2_TOOLCHAIN_HAS_MFPXX_OPTION symbol is no longer
needed, so we get rid of it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips           | 4 ++--
 toolchain/toolchain-common.in | 4 ----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 13d1a477e6..f8e57bab33 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -146,7 +146,7 @@ config BR2_MIPS_SOFT_FLOAT
 choice
 	prompt "FP mode"
 	depends on !BR2_ARCH_IS_64 && !BR2_MIPS_SOFT_FLOAT
-	default BR2_MIPS_FP32_MODE_XX if BR2_TOOLCHAIN_HAS_MFPXX_OPTION
+	default BR2_MIPS_FP32_MODE_XX
 	help
 	  MIPS32 supports different FP modes (32,xx,64). Information about FP
 	  modes can be found here:
@@ -159,7 +159,7 @@ config BR2_MIPS_FP32_MODE_32
 
 config BR2_MIPS_FP32_MODE_XX
 	bool "xx"
-	depends on BR2_TOOLCHAIN_HAS_MFPXX_OPTION
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 
 config BR2_MIPS_FP32_MODE_64
 	bool "64"
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index dd192b9ba4..0002682e12 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -346,10 +346,6 @@ config BR2_TOOLCHAIN_HAS_MNAN_OPTION
 	bool
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
-config BR2_TOOLCHAIN_HAS_MFPXX_OPTION
-	bool
-	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_5
-
 config BR2_TOOLCHAIN_HAS_SYNC_1
 	bool
 	default y
-- 
2.11.0
