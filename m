From: Veronika Kremneva <Veronika.Kremneva@synopsys.com>
Date: Fri, 11 Dec 2020 15:12:55 +0300
Subject: [Buildroot] [PATCH] toolchain-buildroot: glibc: Remove the default
 choice of built-in SunRPC
Message-ID: <20201211121255.17309-1-kremneva@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is an error present when building lmbench with glibc-2.26 and above:
----------------------------->8---------------------------
Makefile:226: recipe for target '../bin/arc/lib_udp.o' failed
make[2]: *** [../bin/arc/lib_udp.o] Error 1
In file included from lib_unix.c:9:
bench.h:39:10: fatal error: rpc/rpc.h: No such file or directory
   39 | #include <rpc/rpc.h>
      |          ^~~~~~~~~~~
compilation terminated.
Makefile:228: recipe for target '../bin/arc/lib_unix.o' failed
make[2]: *** [../bin/arc/lib_unix.o] Error 1
In file included from lib_timing.c:17:
bench.h:39:10: fatal error: rpc/rpc.h: No such file or directory
   39 | #include <rpc/rpc.h>
      |          ^~~~~~~~~~~
compilation terminated.
----------------------------->8---------------------------
You can find more details about failed builds here:
http://autobuild.buildroot.net/?reason=lmbench-3.0-a9

This happens because native implementation of Sun RPC was removed
from glibc and moved to a separate library (libtirpc):
https://fedoraproject.org/wiki/Changes/SunRPCRemoval

Yet in Buildroot we still assume BR2_TOOLCHAIN_HAS_NATIVE_RPC
in case of glibc, which is not true.

The following patch removes the default assumption that glibc
has a built-in implementation of SunRPC.

Signed-off-by: Veronika Kremneva <kremneva@synopsys.com>
---
 toolchain/toolchain-buildroot/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 2058ff1eb9..74aa9abc25 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -59,8 +59,6 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	depends on !BR2_powerpc_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
 	select BR2_TOOLCHAIN_USES_GLIBC
-	# our glibc.mk enables RPC support
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  This option selects glibc as the C library for the
 	  cross-compilation toolchain.
-- 
2.16.2
