From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 23:08:15 +0100
Subject: [Buildroot] [git commit] gdb: arc: remove C++ dependency and
	disable build with C++
Message-ID: <20161115222223.E7E477FF59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca99d0ea925e5a8e42bd270402b0171a39d1d955
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gdb arc-2016.09-rc1 is based on upstream 7.12 gdb version where we can
still disable C++ build. For more information take a look at:
https://sourceware.org/gdb/wiki/cxx-conversion

We wanted to build gdb with C++ as it is used as default in 7.12
and is even a mandatory requirement since 2016/09.

But unfortunately we missed one runtime failure that C++ build causes
and so now we have to disable C++ build.

When gdb arc-2016.09-rc1 is built as a C++ application it segfaults at
runtime for ARC.

We are going to fix the issue in 2017.03 ARC toolchain release.  and
before this we remove C++ dependency are adding temporary workaround
to prevent runtime segfaults.

The workaround is to disable building gdb as C++ application via
passing --disable-build-with-cxx config option when building gdb for
ARC.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in | 6 ------
 package/gdb/gdb.mk    | 7 +++++++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 0c6966a..809e02d 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -2,10 +2,6 @@ comment "gdb/gdbserver needs a toolchain w/ threads, threads debug"
 	depends on !BR2_nios2 && !BR2_bfin
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 
-comment "gdb/gdbserver needs a toolchain w/ C++"
-	depends on BR2_arc
-	depends on !BR2_INSTALL_LIBSTDCPP
-
 config BR2_PACKAGE_GDB
 	bool "gdb"
 	# When the external toolchain gdbserver is copied to the
@@ -15,8 +11,6 @@ config BR2_PACKAGE_GDB
 		(!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
 	depends on BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	depends on !BR2_nios2 && !BR2_bfin
-	# Since ARC gdb moved to 7.12 toolchain requires C++ support to build gdb.
-	depends on !BR2_arc || BR2_INSTALL_LIBSTDCPP
 	help
 	  GDB, the GNU Project debugger, allows you to see what is
 	  going on `inside' another program while it executes -- or
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index ccf9e49..ea27d0c 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -100,6 +100,13 @@ GDB_CONF_OPTS = \
 	--disable-werror \
 	--enable-static
 
+# When gdb is built as C++ application for ARC it segfaults at runtime
+# So we pass --disable-build-with-cxx config option to force gdb not to
+# be built as C++ app.
+ifeq ($(BR2_arc),y)
+GDB_CONF_OPTS += --disable-build-with-cxx
+endif
+
 ifeq ($(BR2_PACKAGE_GDB_TUI),y)
 GDB_CONF_OPTS += --enable-tui
 else
