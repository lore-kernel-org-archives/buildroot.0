From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:59:57 +0200
Subject: [Buildroot] [git commit branch/next] arch/csky: specify
 BR2_GCC_TARGET_FLOAT_ABI
Message-ID: <20190531210133.AC7658D48D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9b722732d5fcb2fc3f16c09bf869112b3f64fbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The C-SKY architecture uses two different ABIs, depending on the core
being used:

 - "abiv1" is a mcore based ISA with ELF_NUM:39 and does not support
   FPU & VDSP. It is used only for the ck610 core.

 - "abiv2" is C-SKY's own ISA with ELF_NUM:252 and supports FPU &
   VDSP. It is used for the ck807, ck810, ck860 cores.

Since "abiv1" does not support FPU, BR2_GCC_TARGET_FLOAT_ABI will
always have the value "soft" for the ck610 core.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Thomas: rework commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.csky | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index 1aede81282..ebde7fe476 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -27,6 +27,10 @@ config BR2_CSKY_VDSP
 	bool "Enable VDSP enhanced instructions Co-processor"
 	depends on BR2_CSKY_FPU
 
+config BR2_GCC_TARGET_FLOAT_ABI
+	default "soft"		if !BR2_CSKY_FPU
+	default "hard"		if BR2_CSKY_FPU
+
 config BR2_ARCH
 	default "csky"
 
