From: guoren at kernel.org <guoren@kernel.org>
Date: Fri, 31 May 2019 14:39:01 +0800
Subject: [Buildroot] [PATCH V4 04/11] arch/csky: Add FLOAT_ABI compiler
 options
In-Reply-To: <1559284748-32011-1-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
Message-ID: <1559284748-32011-5-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

C-SKY CPU is seperated into two ABIs:
 - abiv1: mcore based ISA with ELF_NUM:39 and do not support FPU & VDSP.
          (CPU: 610)
 - abiv2: C-SKY own ISA with ELF_NUM:252 and support FPU & VDSP.
          (CPU: 807, 810, 860)

BR2_GCC_TARGET_FLOAT_ABI will have a value for abiv1. Except the value
will always be "soft" because there's no FPU support in ck610, which is
the only core using abiv1.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.csky | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index af9bbd5..a967d2f 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -30,6 +30,10 @@ config BR2_CSKY_VDSP
 	bool "Enable VDSP enhanced instructions Co-processor"
 	depends on BR2_CSKY_FPU
 
+config BR2_GCC_TARGET_FLOAT_ABI
+	default "soft"		if !BR2_CSKY_FPU
+	default "hard"		if BR2_CSKY_FPU
+
 config BR2_ARCH
 	default "csky"
 
-- 
2.7.4
