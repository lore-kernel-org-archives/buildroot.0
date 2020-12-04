From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Thu,  3 Dec 2020 17:45:49 -0800
Subject: [Buildroot] [PATCH] Revert "package/gdb: prevent gdbserver being
 selected for RISC-V builds"
Message-ID: <20201204014549.2669932-1-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 44a9babcc67cd011e957ba9fd1cf741891957c12.

As of Buildroot 2020.11 (glibc build of qemu_riscv64_virt_defconfig),
cross-gdb for RISCV buildis fine and can also attach to a qemu
instance, so remove the gate on not building it.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 package/gdb/Config.in      | 3 ---
 package/gdb/Config.in.host | 1 -
 2 files changed, 4 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 48ec3e0202ac..c90d47cf0de6 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -20,8 +20,6 @@ config BR2_PACKAGE_GDB
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
-	# no gdbserver on riscv
-	select BR2_PACKAGE_GDB_DEBUGGER if BR2_riscv
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
@@ -48,7 +46,6 @@ if BR2_PACKAGE_GDB
 config BR2_PACKAGE_GDB_SERVER
 	bool "gdbserver"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
-	depends on !BR2_riscv
 	help
 	  Build the gdbserver stub to run on the target.
 	  A full gdb is needed to debug the progam.
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 4b868e22556b..199f1c72b001 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -5,7 +5,6 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	depends on !BR2_microblaze
 	depends on !BR2_nios2
 	depends on !BR2_or1k
-	depends on !BR2_riscv
 	depends on !BR2_nds32
 
 comment "Host GDB Options"
-- 
2.25.1
