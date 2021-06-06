From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  6 Jun 2021 17:03:50 +0200
Subject: [Buildroot] [PATCH for-next 1/2] package/gdb: enable gdbserver
 support for riscv
Message-ID: <20210606150351.423542-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It turn out that gdbserver support for riscv is available since 10.1 release, since commit [1]

When BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS is not enabled, gdb will use the stable version (9.x)
where gdbserver for riscv is not available.

When BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS enabled, only allow gdb 10.1 in version choice and
allow enabling gdbserver for the target.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=bf84f7066626c78884436e1c39fb60f04c665f21

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
git tag --contains bf84f7066626c78884436e1c39fb60f04c665f21
returns gdb-10.1-release tag as the oldest containing this commit.
---
 package/gdb/Config.in      | 6 +++---
 package/gdb/Config.in.host | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 262740fc4c..68a24e0b36 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -19,8 +19,8 @@ config BR2_PACKAGE_GDB
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_INSTALL_LIBSTDCPP
-	# no gdbserver on riscv
-	select BR2_PACKAGE_GDB_DEBUGGER if BR2_riscv
+	# no gdbserver on riscv until 10.1 release
+	select BR2_PACKAGE_GDB_DEBUGGER if BR2_riscv && !BR2_GDB_VERSION_10
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
@@ -47,7 +47,7 @@ if BR2_PACKAGE_GDB
 config BR2_PACKAGE_GDB_SERVER
 	bool "gdbserver"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
-	depends on !BR2_riscv
+	depends on !BR2_riscv || BR2_riscv && BR2_GDB_VERSION_10
 	help
 	  Build the gdbserver stub to run on the target.
 	  A full gdb is needed to debug the progam.
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 07e75b2c0e..5aead236d0 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -4,7 +4,6 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
 	depends on !BR2_or1k
-	depends on !BR2_riscv
 	depends on !BR2_nds32
 
 comment "Host GDB Options"
@@ -70,9 +69,11 @@ choice
 
 config BR2_GDB_VERSION_8_3
 	bool "gdb 8.3.x"
+	depends on !BR2_riscv
 
 config BR2_GDB_VERSION_9_2
 	bool "gdb 9.2.x"
+	depends on !BR2_riscv
 
 config BR2_GDB_VERSION_10
 	bool "gdb 10.x"
-- 
2.31.1
