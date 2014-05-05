From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 05 May 2014 11:25:51 +0200
Subject: [Buildroot] [PATCH 2 of 2 v4] docs/manual: document how to use the
	cross debugger
In-Reply-To: <patchbomb.1399281949@argentina>
References: <patchbomb.1399281949@argentina>
Message-ID: <8af4a6986e373b11c6c7.1399281951@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[ThomasDS: some rewording, add <buildroot> path prefix in example]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v4: add 'target remote' command line (Samuel)
v3: retain proper authorship of ThomasP
v2: some rewording, taking into account the comment of Baruch, also
clarifying the example command (typically foo is not in the buildroot root).


 docs/manual/advanced.txt                 |   2 +
 docs/manual/using-buildroot-debugger.txt |  53 +++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 0 deletions(-)
 create mode 100644 docs/manual/using-buildroot-debugger.txt

diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
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
