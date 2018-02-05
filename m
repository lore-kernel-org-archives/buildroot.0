From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  5 Feb 2018 22:10:11 +0100
Subject: [Buildroot] [PATCH v2 1/5] package/gdb: rework dependency for C++11
In-Reply-To: <20180205211015.26819-1-thomas.petazzoni@bootlin.com>
References: <20180205211015.26819-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180205211015.26819-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we are about to switch to 8.0 as the default gdb dependency, we
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

 - In Config.in, we handle gdb more like a regular target package,
   with a Config.in comment when its dependencies are not met. A
   hidden boolean BR2_PACKAGE_GDB_NEEDS_CXX11 indicates when the
   currently selected version requires C++11. Based on that, we show
   the Config.in comment, and add the proper dependencies to
   BR2_PACKAGE_GDB. It is worth mentioning that
   BR2_PACKAGE_GDB_NEEDS_CXX11 is intentionally created to be !7.10 &&
   !7.11 && !7.12 instead of 8.0, because we will gradually add more
   C++11-requiring versions, and remove non-C++11-requiring versions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in      | 15 +++++++++++++++
 package/gdb/Config.in.host |  3 ---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index af020f40c5..b7f0565b92 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -11,15 +11,30 @@ comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
 	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 
+config BR2_PACKAGE_GDB_NEEDS_CXX11
+	bool
+	default y
+	depends on !BR2_GDB_VERSION_7_10
+	depends on !BR2_GDB_VERSION_7_11
+	depends on !BR2_GDB_VERSION_7_12
+
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
index 99e1cae5ba..8676c6f01b 100644
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
@@ -63,9 +62,7 @@ config BR2_GDB_VERSION_7_12
 config BR2_GDB_VERSION_8_0
 	bool "gdb 8.0.x"
 	# Needs a C++11 compiler
-	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 endchoice
 
-- 
2.14.3
