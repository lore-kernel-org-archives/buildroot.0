From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 18:00:48 +0200
Subject: [Buildroot] [git commit] gdb: introduce
	BR2_PACKAGE_GDB_ARCH_SUPPORTS
Message-ID: <20170611160106.65EF780F40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cd10a135ddb647f43e87fb2299e23850c34c475
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Before adding more architecture dependencies to gdb, let's introduce a
BR2_PACKAGE_GDB_ARCH_SUPPORTS, to avoid duplicating this list of
dependencies between the Config.in comment and the main Config.in
option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v2:
 - None
Changes since v1:
 - None
---
 package/gdb/Config.in | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 026cdea..3acc6ef 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -1,11 +1,17 @@
+config BR2_PACKAGE_GDB_ARCH_SUPPORTS
+	bool
+	default y
+	depends on !BR2_bfin
+	depends on !BR2_nios2
+
 comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
-	depends on !BR2_nios2 && !BR2_bfin
+	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 
 config BR2_PACKAGE_GDB
 	bool "gdb"
 	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	depends on !BR2_nios2 && !BR2_bfin
+	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
