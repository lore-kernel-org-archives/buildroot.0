From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Nov 2018 21:51:26 +0100
Subject: [Buildroot] [git commit] package/gdb: prevent gdbserver being
 selected for RISC-V builds
Message-ID: <20181129205107.74F7A88F9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44a9babcc67cd011e957ba9fd1cf741891957c12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is currently no version of gdbserver for RISC-V. Until this
is implemented we will prevent both the direct and indirect
selection of gdbserver for RISC-V builds. In practice this means
that 'cross gdb for the host' cannot be selected and that
'full debugger' must be automatically selected for the gdb target
package.

[Peter: simplify logic, add comment]
Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in      | 3 +++
 package/gdb/Config.in.host | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 55c1b194ce..0c3465d145 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -20,6 +20,8 @@ config BR2_PACKAGE_GDB
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_PACKAGE_GDB_NEEDS_CXX11
 	depends on BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_GDB_NEEDS_CXX11
+	# no gdbserver on riscv
+	select BR2_PACKAGE_GDB_DEBUGGER if BR2_riscv
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
@@ -46,6 +48,7 @@ if BR2_PACKAGE_GDB
 config BR2_PACKAGE_GDB_SERVER
 	bool "gdbserver"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
+	depends on !BR2_riscv
 	help
 	  Build the gdbserver stub to run on the target.
 	  A full gdb is needed to debug the progam.
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index df8817d91d..ade2371d5c 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -7,6 +7,7 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	depends on !BR2_microblaze
 	depends on !BR2_nios2
 	depends on !BR2_or1k
+	depends on !BR2_riscv
 
 comment "Host GDB Options"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
