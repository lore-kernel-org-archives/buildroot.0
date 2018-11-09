From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Fri,  9 Nov 2018 17:00:23 +0300
Subject: [Buildroot] [PATCH] toolchain: Enable Glibc for all little-endian
 ARCs with atomic ops
Message-ID: <20181109140023.21402-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Initially we had a port only for ARCv2 cores but
then with a simple change ARCompact cores got supported as well.

So we generalize from BR2_archs to BR2_arcle as we haven't tried
to get glibc working on big-endian ARCs yet.

Also we never bothered to check avaialbility of atomic
instructions in the core but in case of Glibc for ARC this is
really a must, so we add this check here.

Note in case of uClibc we may have system w/o HW atomics but:
 1. Only single-core systems are allowed
 2. Atomic instructions are emulated via arc_usr_cmpxchg syscall

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 7d9428c70ed0..8d6997e7790b 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -48,7 +48,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
 		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
 		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
-		   BR2_archs38
+		   BR2_arcle
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
@@ -56,6 +56,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
 	depends on !BR2_powerpc_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
+	depends on BR2_ARC_ATOMIC_EXT || !BR2_arc
 	select BR2_TOOLCHAIN_USES_GLIBC
 	# our glibc.mk enables RPC support
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-- 
2.19.1
