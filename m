From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 10:37:37 +0100
Subject: [Buildroot] [PATCH v3 2/3] gdb: do not allow gdbserver/cross-gdb
	build in some cases
In-Reply-To: <1364117858-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364117858-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364117858-6626-3-git-send-email-thomas.petazzoni@free-electrons.com>
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
 package/gdb/Config.in      |    8 +++++++-
 package/gdb/Config.in.host |    4 ++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 10ac7aa..3bf5827 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_GDB
 	bool "gdb"
-	select BR2_PACKAGE_GDB_SERVER if !BR2_PACKAGE_GDB_DEBUGGER
+	# When the external toolchain gdbserver is copied to the
+	# target, we don't allow building a sepaate gdbserver. The one
+	# from the external toolchain should be used.
+	select BR2_PACKAGE_GDB_SERVER if \
+	       (!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
+	select BR2_PACKAGE_GDB_DEBUGGER if BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
 	help
 	  GDB, the GNU Project debugger, allows you to see what is
 	  going on `inside' another program while it executes -- or
@@ -21,6 +26,7 @@ if BR2_PACKAGE_GDB
 
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
