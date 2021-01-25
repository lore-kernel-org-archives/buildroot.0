From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 22:40:54 +0100
Subject: [Buildroot] [git commit] package/trace-cmd: fix build without ptrace
Message-ID: <20210125213049.A22098180B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=931351630b58a08fca67507c2d0113a5428a0ec3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/4cf43a1ff70a2e2751e2a1a768940401c5583cdf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ove-add_event_pid-out-of-ifndef-NO_PTRACE.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/trace-cmd/0003-trace-cmd-Move-add_event_pid-out-of-ifndef-NO_PTRACE.patch b/package/trace-cmd/0003-trace-cmd-Move-add_event_pid-out-of-ifndef-NO_PTRACE.patch
new file mode 100644
index 0000000000..ca32e69ab1
--- /dev/null
+++ b/package/trace-cmd/0003-trace-cmd-Move-add_event_pid-out-of-ifndef-NO_PTRACE.patch
@@ -0,0 +1,51 @@
+From 2f55ded528cfd8ef468bdd1f8bb82dcf1cfae04a Mon Sep 17 00:00:00 2001
+From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
+Date: Wed, 16 Dec 2020 18:19:43 -0500
+Subject: [PATCH] trace-cmd: Move add_event_pid() out of #ifndef NO_PTRACE
+
+When NO_PTRACE is defined, add_event_pid() is also not defined, but it is
+used outside of NO_PTRACE pre processor block. And this causes a
+"add_event_pid" not defined build failure.
+
+Link: https://lore.kernel.org/linux-trace-devel/20201216232145.010165486 at goodmis.org
+
+Fixes: 0844cff1c ("trace-cmd: Fix "trace-cmd reset" command to restore the default value of set_event_pid")
+Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
+[Retrieved from:
+https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/commit/?id=2f55ded528cfd8ef468bdd1f8bb82dcf1cfae04a]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tracecmd/trace-record.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/tracecmd/trace-record.c b/tracecmd/trace-record.c
+index f8baed7d..e2d1cedf 100644
+--- a/tracecmd/trace-record.c
++++ b/tracecmd/trace-record.c
+@@ -1312,8 +1312,13 @@ static int trace_wait_for_processes(struct buffer_instance *instance) {
+ 	free(pidfds);
+ 	return ret;
+ }
+-#ifndef NO_PTRACE
+ 
++static void add_event_pid(struct buffer_instance *instance, const char *buf)
++{
++	tracefs_instance_file_write(instance->tracefs, "set_event_pid", buf);
++}
++
++#ifndef NO_PTRACE
+ /**
+  * append_pid_filter - add a new pid to an existing filter
+  * @curr_filter: the filter to append to. If NULL, then allocate one
+@@ -1369,11 +1374,6 @@ static void update_sched_events(struct buffer_instance *instance, int pid)
+ static int open_instance_fd(struct buffer_instance *instance,
+ 			    const char *file, int flags);
+ 
+-static void add_event_pid(struct buffer_instance *instance, const char *buf)
+-{
+-	tracefs_instance_file_write(instance->tracefs, "set_event_pid", buf);
+-}
+-
+ static void add_new_filter_child_pid(int pid, int child)
+ {
+ 	struct buffer_instance *instance;
