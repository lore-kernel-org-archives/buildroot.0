From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Apr 2012 00:11:37 +0200
Subject: [Buildroot] [git commit] ltrace: fix build on powerpc/uClibc
Message-ID: <20120422221156.334B296B8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a556a81d278354a40fa2c6f2e4bf3b53ff24bba6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ltrace/ltrace-0.6.0-events.patch |   47 ++++++++++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/ltrace/ltrace-0.6.0-events.patch b/package/ltrace/ltrace-0.6.0-events.patch
new file mode 100644
index 0000000..f3699a1
--- /dev/null
+++ b/package/ltrace/ltrace-0.6.0-events.patch
@@ -0,0 +1,47 @@
+[PATCH] events.c: add similar system headers workaround as trace.c
+
+Needed for E.G. powerpc on uClibc.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ sysdeps/linux-gnu/events.c |   27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+
+Index: ltrace-0.6.0/sysdeps/linux-gnu/events.c
+===================================================================
+--- ltrace-0.6.0.orig/sysdeps/linux-gnu/events.c
++++ ltrace-0.6.0/sysdeps/linux-gnu/events.c
+@@ -11,6 +11,33 @@
+ 
+ #include "common.h"
+ 
++/* If the system headers did not provide the constants, hard-code the normal
++   values.  */
++#ifndef PTRACE_EVENT_FORK
++
++#define PTRACE_OLDSETOPTIONS    21
++#define PTRACE_SETOPTIONS       0x4200
++#define PTRACE_GETEVENTMSG      0x4201
++
++/* options set using PTRACE_SETOPTIONS */
++#define PTRACE_O_TRACESYSGOOD   0x00000001
++#define PTRACE_O_TRACEFORK      0x00000002
++#define PTRACE_O_TRACEVFORK     0x00000004
++#define PTRACE_O_TRACECLONE     0x00000008
++#define PTRACE_O_TRACEEXEC      0x00000010
++#define PTRACE_O_TRACEVFORKDONE 0x00000020
++#define PTRACE_O_TRACEEXIT      0x00000040
++
++/* Wait extended result codes for the above trace options.  */
++#define PTRACE_EVENT_FORK       1
++#define PTRACE_EVENT_VFORK      2
++#define PTRACE_EVENT_CLONE      3
++#define PTRACE_EVENT_EXEC       4
++#define PTRACE_EVENT_VFORK_DONE 5
++#define PTRACE_EVENT_EXIT       6
++
++#endif /* PTRACE_EVENT_FORK */
++
+ static Event event;
+ 
+ Event *
