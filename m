From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Sep 2019 21:43:53 +0200
Subject: [Buildroot] [git commit] arch/riscv: set the default float ABI
 based on ISA extensions
Message-ID: <20190919194453.03F3E8EBED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aee39cbf27e833fad9962eb99b5655dbadcfee60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch sets the default floating point ABI based on the ISA
extensions that have been selected rather than defaulting to soft
float.

For 64-bit:

ISA 'D' selects  lp64d
ISA 'F' selects  lp64f
Otherwise select lp64

For 32-bit:

ISA 'D' selects  ilp32d
ISA 'F' selects  ilp32f
Otherwise select ilp32

This change was proposed by Palmer Dabbelt at SiFive.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.riscv | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index bdd2672602..1fc20e5de7 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -80,8 +80,12 @@ endchoice
 
 choice
 	prompt "Target ABI"
-	default BR2_RISCV_ABI_ILP32 if !BR2_ARCH_IS_64
-	default BR2_RISCV_ABI_LP64 if BR2_ARCH_IS_64
+	default BR2_RISCV_ABI_ILP32D if !BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVD
+	default BR2_RISCV_ABI_ILP32F if !BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVF
+	default BR2_RISCV_ABI_ILP32  if !BR2_ARCH_IS_64
+	default BR2_RISCV_ABI_LP64D  if BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVD
+	default BR2_RISCV_ABI_LP64F  if BR2_ARCH_IS_64 && BR2_RISCV_ISA_RVF
+	default BR2_RISCV_ABI_LP64   if BR2_ARCH_IS_64
 
 config BR2_RISCV_ABI_ILP32
 	bool "ilp32"
