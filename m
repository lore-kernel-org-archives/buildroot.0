From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 May 2014 13:44:28 +0200
Subject: [Buildroot] [git commit] docs/manual: document how to use the cross
	debugger
Message-ID: <20140505114607.77E149CAFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1614bf6be7766271f69bea245b37972802e13395
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[ThomasDS: some rewording, add <buildroot> path prefix in example]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/advanced.txt                 |    2 +
 docs/manual/using-buildroot-debugger.txt |   53 ++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 0 deletions(-)

diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
index 0ad79f7..05c5242 100644
--- a/docs/manual/advanced.txt
+++ b/docs/manual/advanced.txt
@@ -5,6 +5,8 @@
 
 include::using-buildroot-toolchain.txt[]
 
+include::using-buildroot-debugger.txt[]
+
 include::ccache-support.txt[]
 
 include::download-location.txt[]
diff --git a/docs/manual/using-buildroot-debugger.txt b/docs/manual/using-buildroot-debugger.txt
new file mode 100644
index 0000000..962ecf7
--- /dev/null
+++ b/docs/manual/using-buildroot-debugger.txt
@@ -0,0 +1,53 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Using +gdb+ in Buildroot
+
+Buildroot allows to do cross-debugging, where the debugger runs on the
+build machine and communicates with +gdbserver+ on the target to
+control the execution of the program.
+
+To achieve this:
+
+* If you are using an _internal toolchain_ (built by Buildroot), you
+  must enable +BR2_PACKAGE_HOST_GDB+, +BR2_PACKAGE_GDB+ and
+  +BR2_PACKAGE_GDB_SERVER+. This ensures that both the cross gdb and
+  gdbserver get built, and that gdbserver gets installed to your target.
+
+* If you are using an _external toolchain_, you should enable
+  +BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY+, which will copy the
+  gdbserver included with the external toolchain to the target. If your
+  external toolchain does not have a cross gdb or gdbserver, it is also
+  possible to let Buildroot build them, by enabling the same options as
+  for the _internal toolchain backend_.
+
+Now, to start debugging a program called +foo+, you should run on the
+target:
+
+----------------------------
+gdbserver :2345 foo
+----------------------------
+
+This will cause +gdbserver+ to listen on TCP port 2345 for a connection
+from the cross gdb.
+
+Then, on the host, you should start the cross gdb using the following
+command line:
+
+----------------------------
+<buildroot>/output/host/usr/bin/<tuple>-gdb -x <buildroot>/output/staging/usr/share/buildroot/gdbinit foo
+----------------------------
+
+Of course, +foo+ must be available in the current directory, built
+with debugging symbols. Typically you start this command from the
+directory where +foo+ is built (and not from +output/target/+ as the
+binaries in that directory are stripped).
+
+The +<buildroot>/output/staging/usr/share/buildroot/gdbinit+ file will tell the
+cross gdb where to find the libraries of the target.
+
+Finally, to connect to the target from the cross gdb:
+
+----------------------------
+(gdb) target remote <target ip address>:2345
+----------------------------
