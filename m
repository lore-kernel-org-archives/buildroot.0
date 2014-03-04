From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Mar 2014 22:41:25 +0100
Subject: [Buildroot] [PATCH 2/2] docs/manual: document how to use the cross
	debugger
In-Reply-To: <1393969285-13984-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393969285-13984-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1393969285-13984-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/advanced.txt                 |  2 ++
 docs/manual/using-buildroot-debugger.txt | 47 ++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 docs/manual/using-buildroot-debugger.txt

diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
index fb337f5..ba74a93 100644
--- a/docs/manual/advanced.txt
+++ b/docs/manual/advanced.txt
@@ -6,6 +6,8 @@ Advanced usage
 
 include::using-buildroot-toolchain.txt[]
 
+include::using-buildroot-debugger.txt[]
+
 include::ccache-support.txt[]
 
 include::download-location.txt[]
diff --git a/docs/manual/using-buildroot-debugger.txt b/docs/manual/using-buildroot-debugger.txt
new file mode 100644
index 0000000..816addb
--- /dev/null
+++ b/docs/manual/using-buildroot-debugger.txt
@@ -0,0 +1,47 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+Using gdb in Buildroot
+~~~~~~~~~~~~~~~~~~~~~~
+
+Buildroot allows to do cross-debugging, where the debugger runs on the
+build machine and communicates with _gdbserver_ on the target to
+control the execution of the program.
+
+To achieve this:
+
+* In the _internal toolchain backend_, you must enable
+  +BR2_PACKAGE_HOST_GDB+, +BR2_PACKAGE_GDB+ and
+  +BR2_PACKAGE_GDB_SERVER+. This ensures that both the cross gdb and
+  gdbserver gets built, and that the gdbserver gets installed to your
+  target.
+
+* In the _external toolchain backend_, you should enable
+  +BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY+, which will copy the
+  external toolchain gdbserver to the target. If your external
+  toolchain does not have cross gdb and gdbserver, it is also possible
+  to build them using the same options as for the _internal toolchain
+  backend_.
+
+Now, to start debugging a program called +foo+, you should run on the
+target:
+
+----------------------------
+gdbserver :2345 foo
+----------------------------
+
+This will make +gdbserver+ listen on TCP port 2345 for a connection
+for the cross gdb.
+
+Then, you should start the cross gdb using the following command line:
+
+----------------------------
+./output/host/usr/bin/<tuple>-gdb -x ./output/staging/usr/share/buildroot/gdbinit foo
+----------------------------
+
+Of course, +foo+ must be available in the current directory, built
+with debugging symbols.
+
+The +./output/staging/usr/share/buildroot/gdbinit+ file will tell the
+cross gdb where to find the libraries of the target.
+
-- 
1.8.3.2
