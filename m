From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 22:10:30 +0100
Subject: [Buildroot] [PATCH] toolchain/buildroot: glibc does not always have
 native RPC
Message-ID: <20201229211030.3325582-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with glibc-2.32, the RPC code has been removed from
glibc [0], and it is not possible anymore to enable it, even
with the --enable-obsolete-rpc configure option (which was
also removed).

riscv32 and arc both use a glibc 2.32+ so do not forecfully
enable native RPC for them.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-buildroot/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 2058ff1eb9..019495accf 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -59,8 +59,9 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	depends on !BR2_powerpc_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
 	select BR2_TOOLCHAIN_USES_GLIBC
-	# our glibc.mk enables RPC support
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	# our glibc.mk enables RPC support, except for riscv32 and arc
+	# that don't have it anymore (glibc 2.32+)
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC if !BR2_RISCV_32 && !BR2_arc
 	help
 	  This option selects glibc as the C library for the
 	  cross-compilation toolchain.
-- 
2.25.1
