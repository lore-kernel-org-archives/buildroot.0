From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Aug 2016 22:22:39 +0200
Subject: [Buildroot] [git commit] package/trace-cmd: fix build without ptrace
Message-ID: <20160821202242.E4358802AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25b248b7e6af754703d22eab4cd2a0024f1ea2c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport upstream patch.

Fixes:
http://autobuild.buildroot.net/results/78c/78ca1819cdecce81336cadca17762fde8276d13a

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ix-trace-record.c-with-non-ptrace-compile.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/trace-cmd/0001-trace-cmd-Fix-trace-record.c-with-non-ptrace-compile.patch b/package/trace-cmd/0001-trace-cmd-Fix-trace-record.c-with-non-ptrace-compile.patch
new file mode 100644
index 0000000..5f7d2ba
--- /dev/null
+++ b/package/trace-cmd/0001-trace-cmd-Fix-trace-record.c-with-non-ptrace-compile.patch
@@ -0,0 +1,32 @@
+From bdfcddd4f135dc1d4fefb0373d9ebb93ef5110cb Mon Sep 17 00:00:00 2001
+From: "Steven Rostedt (Red Hat)" <rostedt@goodmis.org>
+Date: Mon, 7 Dec 2015 16:41:19 -0500
+Subject: [PATCH] trace-cmd: Fix trace-record.c with non ptrace compile
+
+Fix ptrace_wait() when NO_PTRACE=1 is defined.
+
+Status: upstream
+
+Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
+[Romain backport to 2.6]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ trace-record.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/trace-record.c b/trace-record.c
+index df82883..f83ec4b 100644
+--- a/trace-record.c
++++ b/trace-record.c
+@@ -1099,7 +1099,7 @@ static void ptrace_wait(enum trace_type type, int main_pid)
+ 		 (!WIFEXITED(status) || pid != main_pid));
+ }
+ #else
+-static inline void ptrace_wait(int main_pid) { }
++static inline void ptrace_wait(enum trace_type type, int main_pid) { }
+ static inline void enable_ptrace(void) { }
+ static inline void ptrace_attach(int pid) { }
+ 
+-- 
+2.5.5
+
