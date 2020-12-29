From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 22:13:11 +0100
Subject: [Buildroot] [git commit] toolchain/buildroot: glibc does not always
 have native RPC
Message-ID: <20201229205610.9ADA583536@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05425a58df8088b9182ef636ac6354a47d9578e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with glibc-2.32, the RPC code has been removed from
glibc [0], and it is not possible anymore to enable it, even
with the --enable-obsolete-rpc configure option (which was
also removed).

riscv32 and arc both use a glibc 2.32+ so do not forcefully
enable native RPC for them.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
