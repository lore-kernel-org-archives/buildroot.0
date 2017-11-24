From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 22:45:48 +0100
Subject: [Buildroot] [git commit branch/next] arch/mips: inverse the mfpxx
 logic
Message-ID: <20171124215024.2BA79815F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e25d704e10230f7ea095b4bbb5660e73fbefdf29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.mips           | 4 ++--
 toolchain/toolchain-common.in | 4 ----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 13d1a47..f8e57ba 100644
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
index 1555377..d743c63 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -356,10 +356,6 @@ config BR2_TOOLCHAIN_HAS_MNAN_OPTION
 	bool
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
-config BR2_TOOLCHAIN_HAS_MFPXX_OPTION
-	bool
-	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_5
-
 config BR2_TOOLCHAIN_HAS_SYNC_1
 	bool
 	default y
