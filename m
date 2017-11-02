From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  2 Nov 2017 19:14:05 +0100
Subject: [Buildroot] [PATCH] package/gdb: ARC version has stringent
 dependencies on host gcc
Message-ID: <20171102181405.6476-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ARC gdb version requires a gcc >= 4.8 (because C++11).

Since the host variant uses the same sources as the target variant, we
must ensure that we have a host gcc >= 4.8 as well.

Move the architecture dependencies to their own symbol, and also hide
the comment when they are not met.

Fixes:
    http://autobuild.buildroot.net/results/43eae264991aa369490236c7bd59c0b6a67fcf25/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in.host | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index c2cfc34284..797c07c3f9 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -1,4 +1,17 @@
+config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
+	bool
+	default y
+	# The ARC version needs C++11, thus gcc >= 4.8, like gdb-8.0.x
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_arc
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_arc
+	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
+	depends on !BR2_microblaze
+	depends on !BR2_nios2
+	depends on !BR2_or1k
+
 comment "Host GDB Options"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
+	depends on BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 
 config BR2_PACKAGE_HOST_GDB
 	bool "Build cross gdb for the host"
@@ -6,10 +19,7 @@ config BR2_PACKAGE_HOST_GDB
 	# allow to build a cross-gdb, as the one of the external
 	# toolchain should be used.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
-	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
-	depends on !BR2_microblaze
-	depends on !BR2_nios2
-	depends on !BR2_or1k
+	depends on BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	help
 	  Build a cross gdb that runs on the host machine and debugs
 	  programs running on the target. It requires 'gdbserver'
-- 
2.11.0
