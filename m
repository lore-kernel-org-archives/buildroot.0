From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Apr 2013 12:04:34 +0200
Subject: [Buildroot] [PATCHv4 2/4] gdb: do not allow gdbserver/cross-gdb
	build in some cases
In-Reply-To: <1365329076-19853-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365329076-19853-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1365329076-19853-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When an external toolchain is used, and the user has chosen to copy
the external toolchain gdbserver to the target, then we should allow
the user to build a gdbserver and/or a cross-gdb: the ones of the
external toolchain should be used.

The reasoning is that one must use a gdbserver and cross-gdb of
identical versions to be sure that debugging will work properly.

Change suggested by Yann E. Morin.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in      |    7 ++++++-
 package/gdb/Config.in.host |    4 ++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 6eb29d5..38f4564 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -3,7 +3,11 @@ comment "gdb/gdbserver require a toolchain with thread and thread debug support"
 
 config BR2_PACKAGE_GDB
 	bool "gdb"
-	select BR2_PACKAGE_GDB_SERVER if !BR2_PACKAGE_GDB_DEBUGGER
+	# When the external toolchain gdbserver is copied to the
+	# target, we don't allow building a separate gdbserver. The
+	# one from the external toolchain should be used.
+	select BR2_PACKAGE_GDB_SERVER if \
+	       (!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
 	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	help
 	  GDB, the GNU Project debugger, allows you to see what is
@@ -25,6 +29,7 @@ if BR2_PACKAGE_GDB
 
 config BR2_PACKAGE_GDB_SERVER
 	bool "gdbserver"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	help
 	  Build the gdbserver stub to run on the target.
 	  A full gdb is needed to debug the progam.
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 223c426..1e09263 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_HOST_GDB
 	bool "Build cross gdb for the host"
+	# When the external toolchain gdbserver is used, we shouldn't
+	# allow to build a cross-gdb, as the one of the external
+	# toolchain should be used.
+	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	help
 	  Build a cross gdb that runs on the host machine and debugs
 	  programs running on the target. It requires 'gdbserver'
-- 
1.7.9.5
