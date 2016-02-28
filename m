From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 28 Feb 2016 01:30:34 +0100
Subject: [Buildroot] [PATCH] gdb: add upstream patches to fix musl build
Message-ID: <1456619434-13793-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backported three patches from upstream to all four versions of gdb
that we support.

The "skipping exited and joined thread" message only exists in 7.10.1
so that hunk is removed in the earlier versions. The ChangeLog
modifications are also removed.

Fixes
http://autobuild.buildroot.net/results/e81/e8156d0b89e7157b8f10e428fc0958b0eb29e50a/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I could probably have left out 7.7.1 since it's deprecated, but I
didn't notice that until after I had created the patches :-)

The patches have been manually edited, I haven't cherry-picked them in
git (problem with cloning the repo). But I have tested all 4 versions.
---
 .../0001-Add-some-casts-for-building-on-musl.patch | 90 ++++++++++++++++++++++
 ...musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch | 63 +++++++++++++++
 package/gdb/7.10.1/0003-move-__SIGRTMIN.patch      | 58 ++++++++++++++
 .../0003-Add-some-casts-for-building-on-musl.patch | 72 +++++++++++++++++
 ...musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch | 63 +++++++++++++++
 package/gdb/7.7.1/0005-move-__SIGRTMIN.patch       | 58 ++++++++++++++
 .../0004-Add-some-casts-for-building-on-musl.patch | 70 +++++++++++++++++
 ...musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch | 63 +++++++++++++++
 package/gdb/7.8.2/0006-move-__SIGRTMIN.patch       | 58 ++++++++++++++
 .../0005-Add-some-casts-for-building-on-musl.patch | 70 +++++++++++++++++
 ...musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch | 63 +++++++++++++++
 package/gdb/7.9.1/0007-move-__SIGRTMIN.patch       | 58 ++++++++++++++
 12 files changed, 786 insertions(+)
 create mode 100644 package/gdb/7.10.1/0001-Add-some-casts-for-building-on-musl.patch
 create mode 100644 package/gdb/7.10.1/0002-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
 create mode 100644 package/gdb/7.10.1/0003-move-__SIGRTMIN.patch
 create mode 100644 package/gdb/7.7.1/0003-Add-some-casts-for-building-on-musl.patch
 create mode 100644 package/gdb/7.7.1/0004-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
 create mode 100644 package/gdb/7.7.1/0005-move-__SIGRTMIN.patch
 create mode 100644 package/gdb/7.8.2/0004-Add-some-casts-for-building-on-musl.patch
 create mode 100644 package/gdb/7.8.2/0005-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
 create mode 100644 package/gdb/7.8.2/0006-move-__SIGRTMIN.patch
 create mode 100644 package/gdb/7.9.1/0005-Add-some-casts-for-building-on-musl.patch
 create mode 100644 package/gdb/7.9.1/0006-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
 create mode 100644 package/gdb/7.9.1/0007-move-__SIGRTMIN.patch

diff --git a/package/gdb/7.10.1/0001-Add-some-casts-for-building-on-musl.patch b/package/gdb/7.10.1/0001-Add-some-casts-for-building-on-musl.patch
new file mode 100644
index 0000000..863e26a
--- /dev/null
+++ b/package/gdb/7.10.1/0001-Add-some-casts-for-building-on-musl.patch
@@ -0,0 +1,90 @@
+From d41401ace01c234f42697e190a2ac95991780626 Mon Sep 17 00:00:00 2001
+From: Doug Evans <dje@google.com>
+Date: Mon, 26 Oct 2015 13:20:12 -0700
+Subject: [PATCH] Add some casts for building on musl.
+
+gdb/ChangeLog:
+
+	* linux-thread-db.c (find_new_threads_callback): Cast ti.ti_tid to
+	unsigned long for debug_printf.
+	(thread_db_pid_to_str): Ditto.
+
+gdb/gdbserver/ChangeLog:
+
+	* thread-db.c (find_one_thread): Cast ti.ti_tid to unsigned long
+	for debug_printf.
+	(attach_thread, find_new_threads_callback): Ditto.
+
+[Arnout: removed the parts that don't apply, including ChangeLog]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gdb/ChangeLog             | 5 +++++
+ gdb/gdbserver/ChangeLog   | 6 ++++++
+ gdb/gdbserver/thread-db.c | 9 +++++----
+ gdb/linux-thread-db.c     | 5 +++--
+ 4 files changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/gdb/gdbserver/thread-db.c b/gdb/gdbserver/thread-db.c
+index ffe722d..3df10ff 100644
+--- a/gdb/gdbserver/thread-db.c
++++ b/gdb/gdbserver/thread-db.c
+@@ -278,7 +278,7 @@ find_one_thread (ptid_t ptid)
+ 
+   if (debug_threads)
+     debug_printf ("Found thread %ld (LWP %d)\n",
+-		  ti.ti_tid, ti.ti_lid);
++		  (unsigned long) ti.ti_tid, ti.ti_lid);
+ 
+   if (lwpid != ti.ti_lid)
+     {
+@@ -319,12 +319,12 @@ attach_thread (const td_thrhandle_t *th_p, td_thrinfo_t *ti_p)
+ 
+   if (debug_threads)
+     debug_printf ("Attaching to thread %ld (LWP %d)\n",
+-		  ti_p->ti_tid, ti_p->ti_lid);
++		  (unsigned long) ti_p->ti_tid, ti_p->ti_lid);
+   err = linux_attach_lwp (ptid);
+   if (err != 0)
+     {
+       warning ("Could not attach to thread %ld (LWP %d): %s\n",
+-	       ti_p->ti_tid, ti_p->ti_lid,
++	       (unsigned long) ti_p->ti_tid, ti_p->ti_lid,
+ 	       linux_ptrace_attach_fail_reason_string (ptid, err));
+       return 0;
+     }
+@@ -392,7 +392,8 @@ find_new_threads_callback (const td_thrhandle_t *th_p, void *data)
+ 	 glibc PR17707.  */
+       if (debug_threads)
+ 	debug_printf ("thread_db: skipping exited and "
+-		      "joined thread (0x%lx)\n", ti.ti_tid);
++		      "joined thread (0x%lx)\n",
++		      (unsigned long) ti.ti_tid);
+       return 0;
+     }
+ 
+diff --git a/gdb/linux-thread-db.c b/gdb/linux-thread-db.c
+index 66e9595..41db29a 100644
+--- a/gdb/linux-thread-db.c
++++ b/gdb/linux-thread-db.c
+@@ -1585,7 +1585,8 @@ find_new_threads_callback (const td_thrhandle_t *th_p, void *data)
+       if (libthread_db_debug)
+ 	fprintf_unfiltered (gdb_stdlog,
+ 			    "thread_db: skipping exited and "
+-			    "joined thread (0x%lx)\n", ti.ti_tid);
++			    "joined thread (0x%lx)\n",
++			    (unsigned long) ti.ti_tid);
+       return 0;
+     }
+ 
+@@ -1816,7 +1817,7 @@ thread_db_pid_to_str (struct target_ops *ops, ptid_t ptid)
+ 
+       tid = thread_info->priv->tid;
+       snprintf (buf, sizeof (buf), "Thread 0x%lx (LWP %ld)",
+-		tid, ptid_get_lwp (ptid));
++		(unsigned long) tid, ptid_get_lwp (ptid));
+ 
+       return buf;
+     }
+-- 
+1.9.4
+
diff --git a/package/gdb/7.10.1/0002-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch b/package/gdb/7.10.1/0002-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
new file mode 100644
index 0000000..60c357c
--- /dev/null
+++ b/package/gdb/7.10.1/0002-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
@@ -0,0 +1,63 @@
+From 963843d4d07aef6caa296dacf191f8adc9518596 Mon Sep 17 00:00:00 2001
+From: Doug Evans <dje@google.com>
+Date: Mon, 26 Oct 2015 13:24:01 -0700
+Subject: [PATCH] musl: Move W_STOPCODE to common/gdb_wait.h.
+
+gdb/ChangeLog:
+
+	* common/gdb_wait.h (W_STOPCODE): Define, moved here from
+	gdbserver/linux-low.c.
+	(WSETSTOP): Simplify.
+
+gdb/gdbserver/ChangeLog:
+
+	* linux-low.c (W_STOPCODE): Moved to common/gdb_wait.h.
+
+[Arnout: removed the parts that don't apply, including ChangeLog]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gdb/ChangeLog             | 6 ++++++
+ gdb/common/gdb_wait.h     | 8 ++++----
+ gdb/gdbserver/ChangeLog   | 4 ++++
+ gdb/gdbserver/linux-low.c | 4 ----
+ 4 files changed, 14 insertions(+), 8 deletions(-)
+
+diff --git a/gdb/common/gdb_wait.h b/gdb/common/gdb_wait.h
+index 9b250d2..412f813 100644
+--- a/gdb/common/gdb_wait.h
++++ b/gdb/common/gdb_wait.h
+@@ -85,12 +85,12 @@
+ # endif
+ #endif
+ 
++#ifndef W_STOPCODE
++#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
++#endif
++
+ #ifndef	WSETSTOP
+-# ifdef	W_STOPCODE
+ #define	WSETSTOP(w,sig)    ((w) = W_STOPCODE(sig))
+-# else
+-#define WSETSTOP(w,sig)	   ((w) = (0177 | ((sig) << 8)))
+-# endif
+ #endif
+ 
+ /* For native GNU/Linux we may use waitpid and the __WCLONE option.
+diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
+index 0c552b8..7ed67c7 100644
+--- a/gdb/gdbserver/linux-low.c
++++ b/gdb/gdbserver/linux-low.c
+@@ -70,10 +70,6 @@
+ #define O_LARGEFILE 0
+ #endif
+ 
+-#ifndef W_STOPCODE
+-#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
+-#endif
+-
+ /* This is the kernel's hard limit.  Not to be confused with
+    SIGRTMIN.  */
+ #ifndef __SIGRTMIN
+-- 
+1.9.4
+
diff --git a/package/gdb/7.10.1/0003-move-__SIGRTMIN.patch b/package/gdb/7.10.1/0003-move-__SIGRTMIN.patch
new file mode 100644
index 0000000..38ba1f0
--- /dev/null
+++ b/package/gdb/7.10.1/0003-move-__SIGRTMIN.patch
@@ -0,0 +1,58 @@
+From 682b25469e66ea45b214e95962671373983c118f Mon Sep 17 00:00:00 2001
+From: Doug Evans <dje@google.com>
+Date: Mon, 26 Oct 2015 13:30:57 -0700
+Subject: [PATCH] Move __SIGRTMIN.
+
+gdb/ChangeLog:
+
+	* nat/linux-nat.h (__SIGRTMIN): Move here from gdbserver/linux-low.c.
+
+gdb/gdbserver/ChangeLog:
+
+	* linux-low.c (__SIGRTMIN): Move to nat/linux-nat.h.
+
+[Arnout: removed the parts that don't apply, including ChangeLog]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gdb/ChangeLog             | 4 ++++
+ gdb/gdbserver/ChangeLog   | 4 ++++
+ gdb/gdbserver/linux-low.c | 6 ------
+ gdb/nat/linux-nat.h       | 5 +++++
+ 4 files changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
+index 7ed67c7..e778c4c 100644
+--- a/gdb/gdbserver/linux-low.c
++++ b/gdb/gdbserver/linux-low.c
+@@ -70,12 +70,6 @@
+ #define O_LARGEFILE 0
+ #endif
+ 
+-/* This is the kernel's hard limit.  Not to be confused with
+-   SIGRTMIN.  */
+-#ifndef __SIGRTMIN
+-#define __SIGRTMIN 32
+-#endif
+-
+ /* Some targets did not define these ptrace constants from the start,
+    so gdbserver defines them locally here.  In the future, these may
+    be removed after they are added to asm/ptrace.h.  */
+diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
+index 0633fa9..70e6274 100644
+--- a/gdb/nat/linux-nat.h
++++ b/gdb/nat/linux-nat.h
+@@ -25,6 +25,11 @@
+ struct lwp_info;
+ struct arch_lwp_info;
+ 
++/* This is the kernel's hard limit.  Not to be confused with SIGRTMIN.  */
++#ifndef __SIGRTMIN
++#define __SIGRTMIN 32
++#endif
++
+ /* Unlike other extended result codes, WSTOPSIG (status) on
+    PTRACE_O_TRACESYSGOOD syscall events doesn't return SIGTRAP, but
+    instead SIGTRAP with bit 7 set.  */
+-- 
+1.9.4
+
diff --git a/package/gdb/7.7.1/0003-Add-some-casts-for-building-on-musl.patch b/package/gdb/7.7.1/0003-Add-some-casts-for-building-on-musl.patch
new file mode 100644
index 0000000..2065283
--- /dev/null
+++ b/package/gdb/7.7.1/0003-Add-some-casts-for-building-on-musl.patch
@@ -0,0 +1,72 @@
+From d41401ace01c234f42697e190a2ac95991780626 Mon Sep 17 00:00:00 2001
+From: Doug Evans <dje@google.com>
+Date: Mon, 26 Oct 2015 13:20:12 -0700
+Subject: [PATCH] Add some casts for building on musl.
+
+gdb/ChangeLog:
+
+	* linux-thread-db.c (find_new_threads_callback): Cast ti.ti_tid to
+	unsigned long for debug_printf.
+	(thread_db_pid_to_str): Ditto.
+
+gdb/gdbserver/ChangeLog:
+
+	* thread-db.c (find_one_thread): Cast ti.ti_tid to unsigned long
+	for debug_printf.
+	(attach_thread, find_new_threads_callback): Ditto.
+
+[Arnout: removed the parts that don't apply, including ChangeLog]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gdb/ChangeLog             | 5 +++++
+ gdb/gdbserver/ChangeLog   | 6 ++++++
+ gdb/gdbserver/thread-db.c | 9 +++++----
+ gdb/linux-thread-db.c     | 5 +++--
+ 4 files changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/gdb/gdbserver/thread-db.c b/gdb/gdbserver/thread-db.c
+index ffe722d..3df10ff 100644
+--- a/gdb/gdbserver/thread-db.c
++++ b/gdb/gdbserver/thread-db.c
+@@ -278,7 +278,7 @@ find_one_thread (ptid_t ptid)
+ 
+   if (debug_threads)
+     fprintf (stderr, "Found thread %ld (LWP %d)\n",
+-	     ti.ti_tid, ti.ti_lid);
++	     (unsigned long) ti.ti_tid, ti.ti_lid);
+
+   if (lwpid != ti.ti_lid)
+     {
+@@ -319,11 +319,11 @@ attach_thread (const td_thrhandle_t *th_p, td_thrinfo_t *ti_p)
+ 
+   if (debug_threads)
+     fprintf (stderr, "Attaching to thread %ld (LWP %d)\n",
+-	     ti_p->ti_tid, ti_p->ti_lid);
++	     (unsigned long) ti_p->ti_tid, ti_p->ti_lid);
+   linux_attach_lwp (ti_p->ti_lid);
+   lwp = find_lwp_pid (pid_to_ptid (ti_p->ti_lid));
+   if (lwp == NULL)
+     {
+       warning ("Could not attach to thread %ld (LWP %d)\n",
+-	       ti_p->ti_tid, ti_p->ti_lid);
++	       (unsigned long) ti_p->ti_tid, ti_p->ti_lid);
+       return 0;
+     }
+ 
+ 
+diff --git a/gdb/linux-thread-db.c b/gdb/linux-thread-db.c
+index 66e9595..41db29a 100644
+--- a/gdb/linux-thread-db.c
++++ b/gdb/linux-thread-db.c
+@@ -1816,7 +1817,7 @@ thread_db_pid_to_str (struct target_ops *ops, ptid_t ptid)
+ 
+       tid = thread_info->priv->tid;
+       snprintf (buf, sizeof (buf), "Thread 0x%lx (LWP %ld)",
+-		tid, ptid_get_lwp (ptid));
++		(unsigned long) tid, ptid_get_lwp (ptid));
+ 
+       return buf;
+     }
+-- 
+1.9.4
+
diff --git a/package/gdb/7.7.1/0004-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch b/package/gdb/7.7.1/0004-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
new file mode 100644
index 0000000..60c357c
--- /dev/null
+++ b/package/gdb/7.7.1/0004-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
@@ -0,0 +1,63 @@
+From 963843d4d07aef6caa296dacf191f8adc9518596 Mon Sep 17 00:00:00 2001
+From: Doug Evans <dje@google.com>
+Date: Mon, 26 Oct 2015 13:24:01 -0700
+Subject: [PATCH] musl: Move W_STOPCODE to common/gdb_wait.h.
+
+gdb/ChangeLog:
+
+	* common/gdb_wait.h (W_STOPCODE): Define, moved here from
+	gdbserver/linux-low.c.
+	(WSETSTOP): Simplify.
+
+gdb/gdbserver/ChangeLog:
+
+	* linux-low.c (W_STOPCODE): Moved to common/gdb_wait.h.
+
+[Arnout: removed the parts that don't apply, including ChangeLog]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gdb/ChangeLog             | 6 ++++++
+ gdb/common/gdb_wait.h     | 8 ++++----
+ gdb/gdbserver/ChangeLog   | 4 ++++
+ gdb/gdbserver/linux-low.c | 4 ----
+ 4 files changed, 14 insertions(+), 8 deletions(-)
+
+diff --git a/gdb/common/gdb_wait.h b/gdb/common/gdb_wait.h
+index 9b250d2..412f813 100644
+--- a/gdb/common/gdb_wait.h
++++ b/gdb/common/gdb_wait.h
+@@ -85,12 +85,12 @@
+ # endif
+ #endif
+ 
++#ifndef W_STOPCODE
++#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
++#endif
++
+ #ifndef	WSETSTOP
+-# ifdef	W_STOPCODE
+ #define	WSETSTOP(w,sig)    ((w) = W_STOPCODE(sig))
+-# else
+-#define WSETSTOP(w,sig)	   ((w) = (0177 | ((sig) << 8)))
+-# endif
+ #endif
+ 
+ /* For native GNU/Linux we may use waitpid and the __WCLONE option.
+diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
+index 0c552b8..7ed67c7 100644
+--- a/gdb/gdbserver/linux-low.c
++++ b/gdb/gdbserver/linux-low.c
+@@ -70,10 +70,6 @@
+ #define O_LARGEFILE 0
+ #endif
+ 
+-#ifndef W_STOPCODE
+-#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
+-#endif
+-
+ /* This is the kernel's hard limit.  Not to be confused with
+    SIGRTMIN.  */
+ #ifndef __SIGRTMIN
+-- 
+1.9.4
+
diff --git a/package/gdb/7.7.1/0005-move-__SIGRTMIN.patch b/package/gdb/7.7.1/0005-move-__SIGRTMIN.patch
new file mode 100644
index 0000000..38ba1f0
--- /dev/null
+++ b/package/gdb/7.7.1/0005-move-__SIGRTMIN.patch
@@ -0,0 +1,58 @@
+From 682b25469e66ea45b214e95962671373983c118f Mon Sep 17 00:00:00 2001
+From: Doug Evans <dje@google.com>
+Date: Mon, 26 Oct 2015 13:30:57 -0700
+Subject: [PATCH] Move __SIGRTMIN.
+
+gdb/ChangeLog:
+
+	* nat/linux-nat.h (__SIGRTMIN): Move here from gdbserver/linux-low.c.
+
+gdb/gdbserver/ChangeLog:
+
+	* linux-low.c (__SIGRTMIN): Move to nat/linux-nat.h.
+
+[Arnout: removed the parts that don't apply, including ChangeLog]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gdb/ChangeLog             | 4 ++++
+ gdb/gdbserver/ChangeLog   | 4 ++++
+ gdb/gdbserver/linux-low.c | 6 ------
+ gdb/nat/linux-nat.h       | 5 +++++
+ 4 files changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
+index 7ed67c7..e778c4c 100644
+--- a/gdb/gdbserver/linux-low.c
++++ b/gdb/gdbserver/linux-low.c
+@@ -70,12 +70,6 @@
+ #define O_LARGEFILE 0
+ #endif
+ 
+-/* This is the kernel's hard limit.  Not to be confused with
+-   SIGRTMIN.  */
+-#ifndef __SIGRTMIN
+-#define __SIGRTMIN 32
+-#endif
+-
+ /* Some targets did not define these ptrace constants from the start,
+    so gdbserver defines them locally here.  In the future, these may
+    be removed after they are added to asm/ptrace.h.  */
+diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
+index 0633fa9..70e6274 100644
+--- a/gdb/nat/linux-nat.h
++++ b/gdb/nat/linux-nat.h
+@@ -25,6 +25,11 @@
+ struct lwp_info;
+ struct arch_lwp_info;
+ 
++/* This is the kernel's hard limit.  Not to be confused with SIGRTMIN.  */
++#ifndef __SIGRTMIN
++#define __SIGRTMIN 32
++#endif
++
+ /* Unlike other extended result codes, WSTOPSIG (status) on
+    PTRACE_O_TRACESYSGOOD syscall events doesn't return SIGTRAP, but
+    instead SIGTRAP with bit 7 set.  */
+-- 
+1.9.4
+
diff --git a/package/gdb/7.8.2/0004-Add-some-casts-for-building-on-musl.patch b/package/gdb/7.8.2/0004-Add-some-casts-for-building-on-musl.patch
new file mode 100644
index 0000000..bf20c03
--- /dev/null
+++ b/package/gdb/7.8.2/0004-Add-some-casts-for-building-on-musl.patch
@@ -0,0 +1,70 @@
+From d41401ace01c234f42697e190a2ac95991780626 Mon Sep 17 00:00:00 2001
+From: Doug Evans <dje@google.com>
+Date: Mon, 26 Oct 2015 13:20:12 -0700
+Subject: [PATCH] Add some casts for building on musl.
+
+gdb/ChangeLog:
+
+	* linux-thread-db.c (find_new_threads_callback): Cast ti.ti_tid to
+	unsigned long for debug_printf.
+	(thread_db_pid_to_str): Ditto.
+
+gdb/gdbserver/ChangeLog:
+
+	* thread-db.c (find_one_thread): Cast ti.ti_tid to unsigned long
+	for debug_printf.
+	(attach_thread, find_new_threads_callback): Ditto.
+
+[Arnout: removed the parts that don't apply, including ChangeLog]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gdb/ChangeLog             | 5 +++++
+ gdb/gdbserver/ChangeLog   | 6 ++++++
+ gdb/gdbserver/thread-db.c | 9 +++++----
+ gdb/linux-thread-db.c     | 5 +++--
+ 4 files changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/gdb/gdbserver/thread-db.c b/gdb/gdbserver/thread-db.c
+index ffe722d..3df10ff 100644
+--- a/gdb/gdbserver/thread-db.c
++++ b/gdb/gdbserver/thread-db.c
+@@ -278,7 +278,7 @@ find_one_thread (ptid_t ptid)
+ 
+   if (debug_threads)
+     debug_printf ("Found thread %ld (LWP %d)\n",
+-		  ti.ti_tid, ti.ti_lid);
++		  (unsigned long) ti.ti_tid, ti.ti_lid);
+ 
+   if (lwpid != ti.ti_lid)
+     {
+@@ -319,12 +319,12 @@ attach_thread (const td_thrhandle_t *th_p, td_thrinfo_t *ti_p)
+ 
+   if (debug_threads)
+     debug_printf ("Attaching to thread %ld (LWP %d)\n",
+-		  ti_p->ti_tid, ti_p->ti_lid);
++		  (unsigned long) ti_p->ti_tid, ti_p->ti_lid);
+   err = linux_attach_lwp (ptid);
+   if (err != 0)
+     {
+       warning ("Could not attach to thread %ld (LWP %d): %s\n",
+-	       ti_p->ti_tid, ti_p->ti_lid,
++	       (unsigned long) ti_p->ti_tid, ti_p->ti_lid,
+ 	       linux_attach_fail_reason_string (ptid, err));
+       return 0;
+     }
+diff --git a/gdb/linux-thread-db.c b/gdb/linux-thread-db.c
+index 66e9595..41db29a 100644
+--- a/gdb/linux-thread-db.c
++++ b/gdb/linux-thread-db.c
+@@ -1816,7 +1817,7 @@ thread_db_pid_to_str (struct target_ops *ops, ptid_t ptid)
+ 
+       tid = thread_info->priv->tid;
+       snprintf (buf, sizeof (buf), "Thread 0x%lx (LWP %ld)",
+-		tid, ptid_get_lwp (ptid));
++		(unsigned long) tid, ptid_get_lwp (ptid));
+ 
+       return buf;
+     }
+-- 
+1.9.4
+
diff --git a/package/gdb/7.8.2/0005-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch b/package/gdb/7.8.2/0005-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
new file mode 100644
index 0000000..60c357c
--- /dev/null
+++ b/package/gdb/7.8.2/0005-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
@@ -0,0 +1,63 @@
+From 963843d4d07aef6caa296dacf191f8adc9518596 Mon Sep 17 00:00:00 2001
+From: Doug Evans <dje@google.com>
+Date: Mon, 26 Oct 2015 13:24:01 -0700
+Subject: [PATCH] musl: Move W_STOPCODE to common/gdb_wait.h.
+
+gdb/ChangeLog:
+
+	* common/gdb_wait.h (W_STOPCODE): Define, moved here from
+	gdbserver/linux-low.c.
+	(WSETSTOP): Simplify.
+
+gdb/gdbserver/ChangeLog:
+
+	* linux-low.c (W_STOPCODE): Moved to common/gdb_wait.h.
+
+[Arnout: removed the parts that don't apply, including ChangeLog]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gdb/ChangeLog             | 6 ++++++
+ gdb/common/gdb_wait.h     | 8 ++++----
+ gdb/gdbserver/ChangeLog   | 4 ++++
+ gdb/gdbserver/linux-low.c | 4 ----
+ 4 files changed, 14 insertions(+), 8 deletions(-)
+
+diff --git a/gdb/common/gdb_wait.h b/gdb/common/gdb_wait.h
+index 9b250d2..412f813 100644
+--- a/gdb/common/gdb_wait.h
++++ b/gdb/common/gdb_wait.h
+@@ -85,12 +85,12 @@
+ # endif
+ #endif
+ 
++#ifndef W_STOPCODE
++#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
++#endif
++
+ #ifndef	WSETSTOP
+-# ifdef	W_STOPCODE
+ #define	WSETSTOP(w,sig)    ((w) = W_STOPCODE(sig))
+-# else
+-#define WSETSTOP(w,sig)	   ((w) = (0177 | ((sig) << 8)))
+-# endif
+ #endif
+ 
+ /* For native GNU/Linux we may use waitpid and the __WCLONE option.
+diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
+index 0c552b8..7ed67c7 100644
+--- a/gdb/gdbserver/linux-low.c
++++ b/gdb/gdbserver/linux-low.c
+@@ -70,10 +70,6 @@
+ #define O_LARGEFILE 0
+ #endif
+ 
+-#ifndef W_STOPCODE
+-#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
+-#endif
+-
+ /* This is the kernel's hard limit.  Not to be confused with
+    SIGRTMIN.  */
+ #ifndef __SIGRTMIN
+-- 
+1.9.4
+
diff --git a/package/gdb/7.8.2/0006-move-__SIGRTMIN.patch b/package/gdb/7.8.2/0006-move-__SIGRTMIN.patch
new file mode 100644
index 0000000..38ba1f0
--- /dev/null
+++ b/package/gdb/7.8.2/0006-move-__SIGRTMIN.patch
@@ -0,0 +1,58 @@
+From 682b25469e66ea45b214e95962671373983c118f Mon Sep 17 00:00:00 2001
+From: Doug Evans <dje@google.com>
+Date: Mon, 26 Oct 2015 13:30:57 -0700
+Subject: [PATCH] Move __SIGRTMIN.
+
+gdb/ChangeLog:
+
+	* nat/linux-nat.h (__SIGRTMIN): Move here from gdbserver/linux-low.c.
+
+gdb/gdbserver/ChangeLog:
+
+	* linux-low.c (__SIGRTMIN): Move to nat/linux-nat.h.
+
+[Arnout: removed the parts that don't apply, including ChangeLog]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gdb/ChangeLog             | 4 ++++
+ gdb/gdbserver/ChangeLog   | 4 ++++
+ gdb/gdbserver/linux-low.c | 6 ------
+ gdb/nat/linux-nat.h       | 5 +++++
+ 4 files changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
+index 7ed67c7..e778c4c 100644
+--- a/gdb/gdbserver/linux-low.c
++++ b/gdb/gdbserver/linux-low.c
+@@ -70,12 +70,6 @@
+ #define O_LARGEFILE 0
+ #endif
+ 
+-/* This is the kernel's hard limit.  Not to be confused with
+-   SIGRTMIN.  */
+-#ifndef __SIGRTMIN
+-#define __SIGRTMIN 32
+-#endif
+-
+ /* Some targets did not define these ptrace constants from the start,
+    so gdbserver defines them locally here.  In the future, these may
+    be removed after they are added to asm/ptrace.h.  */
+diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
+index 0633fa9..70e6274 100644
+--- a/gdb/nat/linux-nat.h
++++ b/gdb/nat/linux-nat.h
+@@ -25,6 +25,11 @@
+ struct lwp_info;
+ struct arch_lwp_info;
+ 
++/* This is the kernel's hard limit.  Not to be confused with SIGRTMIN.  */
++#ifndef __SIGRTMIN
++#define __SIGRTMIN 32
++#endif
++
+ /* Unlike other extended result codes, WSTOPSIG (status) on
+    PTRACE_O_TRACESYSGOOD syscall events doesn't return SIGTRAP, but
+    instead SIGTRAP with bit 7 set.  */
+-- 
+1.9.4
+
diff --git a/package/gdb/7.9.1/0005-Add-some-casts-for-building-on-musl.patch b/package/gdb/7.9.1/0005-Add-some-casts-for-building-on-musl.patch
new file mode 100644
index 0000000..2469eb7
--- /dev/null
+++ b/package/gdb/7.9.1/0005-Add-some-casts-for-building-on-musl.patch
@@ -0,0 +1,70 @@
+From d41401ace01c234f42697e190a2ac95991780626 Mon Sep 17 00:00:00 2001
+From: Doug Evans <dje@google.com>
+Date: Mon, 26 Oct 2015 13:20:12 -0700
+Subject: [PATCH] Add some casts for building on musl.
+
+gdb/ChangeLog:
+
+	* linux-thread-db.c (find_new_threads_callback): Cast ti.ti_tid to
+	unsigned long for debug_printf.
+	(thread_db_pid_to_str): Ditto.
+
+gdb/gdbserver/ChangeLog:
+
+	* thread-db.c (find_one_thread): Cast ti.ti_tid to unsigned long
+	for debug_printf.
+	(attach_thread, find_new_threads_callback): Ditto.
+
+[Arnout: removed the parts that don't apply, including ChangeLog]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gdb/ChangeLog             | 5 +++++
+ gdb/gdbserver/ChangeLog   | 6 ++++++
+ gdb/gdbserver/thread-db.c | 9 +++++----
+ gdb/linux-thread-db.c     | 5 +++--
+ 4 files changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/gdb/gdbserver/thread-db.c b/gdb/gdbserver/thread-db.c
+index ffe722d..3df10ff 100644
+--- a/gdb/gdbserver/thread-db.c
++++ b/gdb/gdbserver/thread-db.c
+@@ -278,7 +278,7 @@ find_one_thread (ptid_t ptid)
+ 
+   if (debug_threads)
+     debug_printf ("Found thread %ld (LWP %d)\n",
+-		  ti.ti_tid, ti.ti_lid);
++		  (unsigned long) ti.ti_tid, ti.ti_lid);
+ 
+   if (lwpid != ti.ti_lid)
+     {
+@@ -319,12 +319,12 @@ attach_thread (const td_thrhandle_t *th_p, td_thrinfo_t *ti_p)
+ 
+   if (debug_threads)
+     debug_printf ("Attaching to thread %ld (LWP %d)\n",
+-		  ti_p->ti_tid, ti_p->ti_lid);
++		  (unsigned long) ti_p->ti_tid, ti_p->ti_lid);
+   err = linux_attach_lwp (ptid);
+   if (err != 0)
+     {
+       warning ("Could not attach to thread %ld (LWP %d): %s\n",
+-	       ti_p->ti_tid, ti_p->ti_lid,
++	       (unsigned long) ti_p->ti_tid, ti_p->ti_lid,
+ 	       linux_ptrace_attach_fail_reason_string (ptid, err));
+       return 0;
+     }
+diff --git a/gdb/linux-thread-db.c b/gdb/linux-thread-db.c
+index 66e9595..41db29a 100644
+--- a/gdb/linux-thread-db.c
++++ b/gdb/linux-thread-db.c
+@@ -1816,7 +1817,7 @@ thread_db_pid_to_str (struct target_ops *ops, ptid_t ptid)
+ 
+       tid = thread_info->priv->tid;
+       snprintf (buf, sizeof (buf), "Thread 0x%lx (LWP %ld)",
+-		tid, ptid_get_lwp (ptid));
++		(unsigned long) tid, ptid_get_lwp (ptid));
+ 
+       return buf;
+     }
+-- 
+1.9.4
+
diff --git a/package/gdb/7.9.1/0006-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch b/package/gdb/7.9.1/0006-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
new file mode 100644
index 0000000..60c357c
--- /dev/null
+++ b/package/gdb/7.9.1/0006-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
@@ -0,0 +1,63 @@
+From 963843d4d07aef6caa296dacf191f8adc9518596 Mon Sep 17 00:00:00 2001
+From: Doug Evans <dje@google.com>
+Date: Mon, 26 Oct 2015 13:24:01 -0700
+Subject: [PATCH] musl: Move W_STOPCODE to common/gdb_wait.h.
+
+gdb/ChangeLog:
+
+	* common/gdb_wait.h (W_STOPCODE): Define, moved here from
+	gdbserver/linux-low.c.
+	(WSETSTOP): Simplify.
+
+gdb/gdbserver/ChangeLog:
+
+	* linux-low.c (W_STOPCODE): Moved to common/gdb_wait.h.
+
+[Arnout: removed the parts that don't apply, including ChangeLog]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gdb/ChangeLog             | 6 ++++++
+ gdb/common/gdb_wait.h     | 8 ++++----
+ gdb/gdbserver/ChangeLog   | 4 ++++
+ gdb/gdbserver/linux-low.c | 4 ----
+ 4 files changed, 14 insertions(+), 8 deletions(-)
+
+diff --git a/gdb/common/gdb_wait.h b/gdb/common/gdb_wait.h
+index 9b250d2..412f813 100644
+--- a/gdb/common/gdb_wait.h
++++ b/gdb/common/gdb_wait.h
+@@ -85,12 +85,12 @@
+ # endif
+ #endif
+ 
++#ifndef W_STOPCODE
++#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
++#endif
++
+ #ifndef	WSETSTOP
+-# ifdef	W_STOPCODE
+ #define	WSETSTOP(w,sig)    ((w) = W_STOPCODE(sig))
+-# else
+-#define WSETSTOP(w,sig)	   ((w) = (0177 | ((sig) << 8)))
+-# endif
+ #endif
+ 
+ /* For native GNU/Linux we may use waitpid and the __WCLONE option.
+diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
+index 0c552b8..7ed67c7 100644
+--- a/gdb/gdbserver/linux-low.c
++++ b/gdb/gdbserver/linux-low.c
+@@ -70,10 +70,6 @@
+ #define O_LARGEFILE 0
+ #endif
+ 
+-#ifndef W_STOPCODE
+-#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
+-#endif
+-
+ /* This is the kernel's hard limit.  Not to be confused with
+    SIGRTMIN.  */
+ #ifndef __SIGRTMIN
+-- 
+1.9.4
+
diff --git a/package/gdb/7.9.1/0007-move-__SIGRTMIN.patch b/package/gdb/7.9.1/0007-move-__SIGRTMIN.patch
new file mode 100644
index 0000000..38ba1f0
--- /dev/null
+++ b/package/gdb/7.9.1/0007-move-__SIGRTMIN.patch
@@ -0,0 +1,58 @@
+From 682b25469e66ea45b214e95962671373983c118f Mon Sep 17 00:00:00 2001
+From: Doug Evans <dje@google.com>
+Date: Mon, 26 Oct 2015 13:30:57 -0700
+Subject: [PATCH] Move __SIGRTMIN.
+
+gdb/ChangeLog:
+
+	* nat/linux-nat.h (__SIGRTMIN): Move here from gdbserver/linux-low.c.
+
+gdb/gdbserver/ChangeLog:
+
+	* linux-low.c (__SIGRTMIN): Move to nat/linux-nat.h.
+
+[Arnout: removed the parts that don't apply, including ChangeLog]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gdb/ChangeLog             | 4 ++++
+ gdb/gdbserver/ChangeLog   | 4 ++++
+ gdb/gdbserver/linux-low.c | 6 ------
+ gdb/nat/linux-nat.h       | 5 +++++
+ 4 files changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
+index 7ed67c7..e778c4c 100644
+--- a/gdb/gdbserver/linux-low.c
++++ b/gdb/gdbserver/linux-low.c
+@@ -70,12 +70,6 @@
+ #define O_LARGEFILE 0
+ #endif
+ 
+-/* This is the kernel's hard limit.  Not to be confused with
+-   SIGRTMIN.  */
+-#ifndef __SIGRTMIN
+-#define __SIGRTMIN 32
+-#endif
+-
+ /* Some targets did not define these ptrace constants from the start,
+    so gdbserver defines them locally here.  In the future, these may
+    be removed after they are added to asm/ptrace.h.  */
+diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
+index 0633fa9..70e6274 100644
+--- a/gdb/nat/linux-nat.h
++++ b/gdb/nat/linux-nat.h
+@@ -25,6 +25,11 @@
+ struct lwp_info;
+ struct arch_lwp_info;
+ 
++/* This is the kernel's hard limit.  Not to be confused with SIGRTMIN.  */
++#ifndef __SIGRTMIN
++#define __SIGRTMIN 32
++#endif
++
+ /* Unlike other extended result codes, WSTOPSIG (status) on
+    PTRACE_O_TRACESYSGOOD syscall events doesn't return SIGTRAP, but
+    instead SIGTRAP with bit 7 set.  */
+-- 
+1.9.4
+
-- 
2.7.0
