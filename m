From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jun 2018 21:12:37 +0200
Subject: [Buildroot] [git commit] package/gdb: rework dependency for C++11
Message-ID: <20180624193409.107838127E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e3738db42919cb4487f7a64381ac7d3090d0e1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we are about to switch to 8.0 as the default gdb version, we
need to adjust how the gdb dependencies are handled. Indeed, from 8.0
onwards, gdb needs a C++11 capable compiler, i.e at least gcc 4.8.

Until now, Config.in.host was making sure that gdb 8.0 was not
selectable if the cross-compilation toolchain did not have C++ support
with gcc >= 4.8. This worked fine because the default version of gdb,
used as the target gdb version when no host gdb is built, was 7.11,
and did not require C++11.

With the switch to 8.0 as the default version, when target gdb is
enabled but not host gdb, 8.0 is used, which means we need a C++11
capable compiler. The dependencies in Config.in.host are no longer
sufficient.

So instead, we remove the target-related dependencies from
Config.in.host and move them properly to Config.in. The overall logic
is the following:

 - In Config.in.host, BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS ensures that
   we have at least host gcc 4.8 if we're on ARC, because the ARC gdb
   needs C++11. We remove the target toolchain related dependencies
   from here.

 - In Config.in.host, the version selection ensures that 8.0 cannot be
   selected if the host toolchain does not have at least gcc 4.8. We
   remove the target toolchain related dependencies from here.

 - In Config.in.host, we introduce a BR2_PACKAGE_GDB_NEEDS_CXX11
   option, that indicates whether the currently selected version of
   gdb requires C++11 support in the toolchain to build the target
   variant. Even though this option is more related to the target
   variant of gdb, we keep it in Config.in.host so that it appears
   next to the definition of BR2_GDB_VERSION, to make sure they are
   kept in sync.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in      |  8 ++++++++
 package/gdb/Config.in.host | 15 ++++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 6eea73b071..9a71c008a0 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -10,15 +10,23 @@ comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 
+comment "gdb/gdbserver >= 8.x needs a toolchain w/ C++, gcc >= 4.8"
+	depends on BR2_PACKAGE_GDB_NEEDS_CXX11
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_GDB
 	bool "gdb"
 	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_PACKAGE_GDB_NEEDS_CXX11
+	depends on BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_GDB_NEEDS_CXX11
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
 	select BR2_PACKAGE_GDB_SERVER if \
 		(!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_PACKAGE_GDB_NEEDS_CXX11
+	depends on BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_GDB_NEEDS_CXX11
 	help
 	  GDB, the GNU Project debugger, allows you to see what is
 	  going on `inside' another program while it executes -- or
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 0011966d88..8736908b6b 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -3,7 +3,6 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
 	default y
 	# The ARC version needs C++11, thus gcc >= 4.8, like gdb-8.0.x
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_arc
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_arc
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
 	depends on !BR2_microblaze
 	depends on !BR2_nios2
@@ -63,14 +62,24 @@ config BR2_GDB_VERSION_7_12
 config BR2_GDB_VERSION_8_0
 	bool "gdb 8.0.x"
 	# Needs a C++11 compiler
-	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 endchoice
 
 endif
 
+# Tells whether the currently selected gdb version requires C++11
+# support in the toolchain. When host-gdb is not enabled, the target
+# gdb built is 7.11, which doesn't require C++11 support. So it's only
+# if host-gdb is built, with the version set to 8.0 that C++11 support
+# is needed in the toolchain to build gdb for the target.
+#
+# Even though this option is related to target gdb dependencies, we
+# keep it next to the BR2_GDB_VERSION so that they are kept in sync.
+config BR2_PACKAGE_GDB_NEEDS_CXX11
+	bool
+	default y if BR2_GDB_VERSION_8_0
+
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
