From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Jun 2017 23:05:11 +0200
Subject: [Buildroot] [PATCH 1/3] gdb: introduce BR2_PACKAGE_GDB_ARCH_SUPPORTS
Message-ID: <1496523913-19323-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Before adding more architecture dependencies to gdb, let's introduce a
BR2_PACKAGE_GDB_ARCH_SUPPORTS, to avoid duplicating this list of
dependencies between the Config.in comment and the main Config.in
option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
2.7.4
