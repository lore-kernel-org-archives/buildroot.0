From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 16:24:40 +0200
Subject: [Buildroot] [git commit] gdb: remove versions 7.4 and 7.5
Message-ID: <20140710150057.F32E29C46A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02d85f65768e8cbc6f6e9215b30ef6b3d3b26bff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We already default to 7.6 for all architectures (except AVR32, ARC and
Microblaze that have their specific versions), and we have added 7.7
recently.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   |   18 +-
 package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch   |  314 --------------------
 package/gdb/7.4.1/05_all_readline-headers.patch    |   42 ---
 .../gdb-100-xtensa-fix-linux-ptrace-includes.patch |   60 ----
 .../7.4.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch |   42 ---
 .../gdb-100-xtensa-fix-linux-ptrace-includes.patch |   60 ----
 .../7.5.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch |   42 ---
 package/gdb/Config.in.host                         |   10 -
 8 files changed, 16 insertions(+), 572 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 54d1f4e..59c9804 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -170,6 +170,20 @@ config BR2_GCC_VERSION_4_6_X
 	  The 4.6.x version of gcc has been removed. Use a newer
 	  version instead.
 
+config BR2_GDB_VERSION_7_4
+	bool "gdb 7.4 has been removed"
+	select BR2_LEGACY
+	help
+	  The 7.4 version of gdb has been removed. Use a newer version
+	  instead.
+
+config BR2_GDB_VERSION_7_5
+	bool "gdb 7.5 has been removed"
+	select BR2_LEGACY
+	help
+	  The 7.5 version of gdb has been removed. Use a newer version
+	  instead.
+
 config BR2_PACKAGE_LIBV4L_DECODE_TM6000
 	bool "decode_tm6000"
 	select BR2_PACKAGE_LIBV4L_UTILS
@@ -428,7 +442,7 @@ config BR2_KERNEL_HEADERS_3_5
 
 config BR2_GDB_VERSION_7_2
 	bool "gdb 7.2.x is no longer supported"
-	select BR2_GDB_VERSION_7_5
+	select BR2_GDB_VERSION_7_6
 	select BR2_LEGACY
 	help
 	  Version 7.2.x of gdb has been deprecated for more than four
@@ -437,7 +451,7 @@ config BR2_GDB_VERSION_7_2
 
 config BR2_GDB_VERSION_7_3
 	bool "gdb 7.3.x is no longer supported"
-	select BR2_GDB_VERSION_7_5
+	select BR2_GDB_VERSION_7_6
 	select BR2_LEGACY
 	help
 	  Version 7.3.x of gdb has been deprecated for more than four
diff --git a/package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch b/package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
deleted file mode 100644
index 81a92db..0000000
--- a/package/gdb/7.4.1/00_all_ptrace_setsiginfo.patch
+++ /dev/null
@@ -1,314 +0,0 @@
-fix from upstream for building with newer kernel headers
-
-From a7f9ca9cb797d653dc7919538e1dfa0c26010331 Mon Sep 17 00:00:00 2001
-From: tschwinge <tschwinge>
-Date: Wed, 21 Mar 2012 13:43:50 +0000
-Subject: [PATCH] struct siginfo vs. siginfo_t
-
-gdb/
-	* amd64-linux-nat.c (amd64_linux_siginfo_fixup): Use siginfo_t instead
-	of struct siginfo.
-	* arm-linux-nat.c (arm_linux_stopped_data_address): Likewise.
-	* ia64-linux-nat.c (ia64_linux_stopped_data_address): Likewise.
-	* linux-nat.c (linux_nat_siginfo_fixup, siginfo_fixup)
-	(linux_xfer_siginfo, linux_nat_set_siginfo_fixup)
-	(linux_nat_get_siginfo): Likewise.
-	* linux-nat.h (struct lwp_info, linux_nat_set_siginfo_fixup)
-	(linux_nat_get_siginfo): Likewise.
-	* linux-tdep.c (linux_get_siginfo_type): Likewise.
-	* ppc-linux-nat.c (ppc_linux_stopped_data_address): Likewise.
-	* procfs.c (gdb_siginfo_t): Likewise.
-
-gdbserver/
-	* linux-arm-low.c (arm_stopped_by_watchpoint): Use siginfo_t instead of
-	struct siginfo.
-	* linux-low.c (siginfo_fixup, linux_xfer_siginfo): Likewise.
-	* linux-x86-low.c (x86_siginfo_fixup): Likewise.
-	* linux-low.h: Include <signal.h>.
-	(struct siginfo): Remove forward declaration.
-	(struct linux_target_ops) <siginfo_fixup>: Use siginfo_t instead of
-	struct siginfo.
----
- gdb/ChangeLog                 |   15 +++++++++++++++
- gdb/amd64-linux-nat.c         |    4 ++--
- gdb/arm-linux-nat.c           |    2 +-
- gdb/gdbserver/ChangeLog       |   11 +++++++++++
- gdb/gdbserver/linux-arm-low.c |    2 +-
- gdb/gdbserver/linux-low.c     |   10 +++++-----
- gdb/gdbserver/linux-low.h     |    5 ++---
- gdb/gdbserver/linux-x86-low.c |    4 ++--
- gdb/ia64-linux-nat.c          |    2 +-
- gdb/linux-nat.c               |   16 ++++++++--------
- gdb/linux-nat.h               |    6 +++---
- gdb/ppc-linux-nat.c           |    2 +-
- gdb/procfs.c                  |    2 +-
- 13 files changed, 53 insertions(+), 28 deletions(-)
-
-diff --git a/gdb/amd64-linux-nat.c b/gdb/amd64-linux-nat.c
-index f954483..5ebba3a 100644
---- a/gdb/amd64-linux-nat.c
-+++ b/gdb/amd64-linux-nat.c
-@@ -731,13 +731,13 @@ siginfo_from_compat_siginfo (siginfo_t *to, compat_siginfo_t *from)
-    INF.  */
- 
- static int
--amd64_linux_siginfo_fixup (struct siginfo *native, gdb_byte *inf, int direction)
-+amd64_linux_siginfo_fixup (siginfo_t *native, gdb_byte *inf, int direction)
- {
-   /* Is the inferior 32-bit?  If so, then do fixup the siginfo
-      object.  */
-   if (gdbarch_addr_bit (get_frame_arch (get_current_frame ())) == 32)
-     {
--      gdb_assert (sizeof (struct siginfo) == sizeof (compat_siginfo_t));
-+      gdb_assert (sizeof (siginfo_t) == sizeof (compat_siginfo_t));
- 
-       if (direction == 0)
- 	compat_siginfo_from_siginfo ((struct compat_siginfo *) inf, native);
-diff --git a/gdb/arm-linux-nat.c b/gdb/arm-linux-nat.c
-index c5ce21c..f9f6ba5 100644
---- a/gdb/arm-linux-nat.c
-+++ b/gdb/arm-linux-nat.c
-@@ -1137,7 +1137,7 @@ arm_linux_remove_watchpoint (CORE_ADDR addr, int len, int rw,
- static int
- arm_linux_stopped_data_address (struct target_ops *target, CORE_ADDR *addr_p)
- {
--  struct siginfo *siginfo_p = linux_nat_get_siginfo (inferior_ptid);
-+  siginfo_t *siginfo_p = linux_nat_get_siginfo (inferior_ptid);
-   int slot = siginfo_p->si_errno;
- 
-   /* This must be a hardware breakpoint.  */
-diff --git a/gdb/gdbserver/linux-arm-low.c b/gdb/gdbserver/linux-arm-low.c
-index ff2437d..01208ef 100644
---- a/gdb/gdbserver/linux-arm-low.c
-+++ b/gdb/gdbserver/linux-arm-low.c
-@@ -631,7 +631,7 @@ static int
- arm_stopped_by_watchpoint (void)
- {
-   struct lwp_info *lwp = get_thread_lwp (current_inferior);
--  struct siginfo siginfo;
-+  siginfo_t siginfo;
- 
-   /* We must be able to set hardware watchpoints.  */
-   if (arm_linux_get_hw_watchpoint_count () == 0)
-diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
-index d2d4c1d..4734f15 100644
---- a/gdb/gdbserver/linux-low.c
-+++ b/gdb/gdbserver/linux-low.c
-@@ -4779,7 +4779,7 @@ linux_qxfer_osdata (const char *annex,
-    layout of the inferiors' architecture.  */
- 
- static void
--siginfo_fixup (struct siginfo *siginfo, void *inf_siginfo, int direction)
-+siginfo_fixup (siginfo_t *siginfo, void *inf_siginfo, int direction)
- {
-   int done = 0;
- 
-@@ -4791,9 +4791,9 @@ siginfo_fixup (struct siginfo *siginfo, void *inf_siginfo, int direction)
-   if (!done)
-     {
-       if (direction == 1)
--	memcpy (siginfo, inf_siginfo, sizeof (struct siginfo));
-+	memcpy (siginfo, inf_siginfo, sizeof (siginfo_t));
-       else
--	memcpy (inf_siginfo, siginfo, sizeof (struct siginfo));
-+	memcpy (inf_siginfo, siginfo, sizeof (siginfo_t));
-     }
- }
- 
-@@ -4802,8 +4802,8 @@ linux_xfer_siginfo (const char *annex, unsigned char *readbuf,
- 		    unsigned const char *writebuf, CORE_ADDR offset, int len)
- {
-   int pid;
--  struct siginfo siginfo;
--  char inf_siginfo[sizeof (struct siginfo)];
-+  siginfo_t siginfo;
-+  char inf_siginfo[sizeof (siginfo_t)];
- 
-   if (current_inferior == NULL)
-     return -1;
-diff --git a/gdb/gdbserver/linux-low.h b/gdb/gdbserver/linux-low.h
-index 677d261..3aeae70 100644
---- a/gdb/gdbserver/linux-low.h
-+++ b/gdb/gdbserver/linux-low.h
-@@ -20,6 +20,7 @@
- #ifdef HAVE_THREAD_DB_H
- #include <thread_db.h>
- #endif
-+#include <signal.h>
- 
- #include "gdb_proc_service.h"
- 
-@@ -46,8 +47,6 @@ struct regset_info
- extern struct regset_info target_regsets[];
- #endif
- 
--struct siginfo;
--
- struct process_info_private
- {
-   /* Arch-specific additions.  */
-@@ -109,7 +108,7 @@ struct linux_target_ops
-      Returns true if any conversion was done; false otherwise.
-      If DIRECTION is 1, then copy from INF to NATIVE.
-      If DIRECTION is 0, copy from NATIVE to INF.  */
--  int (*siginfo_fixup) (struct siginfo *native, void *inf, int direction);
-+  int (*siginfo_fixup) (siginfo_t *native, void *inf, int direction);
- 
-   /* Hook to call when a new process is created or attached to.
-      If extra per-process architecture-specific data is needed,
-diff --git a/gdb/gdbserver/linux-x86-low.c b/gdb/gdbserver/linux-x86-low.c
-index ed1f8a8..b466b5d 100644
---- a/gdb/gdbserver/linux-x86-low.c
-+++ b/gdb/gdbserver/linux-x86-low.c
-@@ -918,13 +918,13 @@ siginfo_from_compat_siginfo (siginfo_t *to, compat_siginfo_t *from)
-    INF.  */
- 
- static int
--x86_siginfo_fixup (struct siginfo *native, void *inf, int direction)
-+x86_siginfo_fixup (siginfo_t *native, void *inf, int direction)
- {
- #ifdef __x86_64__
-   /* Is the inferior 32-bit?  If so, then fixup the siginfo object.  */
-   if (register_size (0) == 4)
-     {
--      if (sizeof (struct siginfo) != sizeof (compat_siginfo_t))
-+      if (sizeof (siginfo_t) != sizeof (compat_siginfo_t))
- 	fatal ("unexpected difference in siginfo");
- 
-       if (direction == 0)
-diff --git a/gdb/ia64-linux-nat.c b/gdb/ia64-linux-nat.c
-index 8773195..19b827f 100644
---- a/gdb/ia64-linux-nat.c
-+++ b/gdb/ia64-linux-nat.c
-@@ -637,7 +637,7 @@ static int
- ia64_linux_stopped_data_address (struct target_ops *ops, CORE_ADDR *addr_p)
- {
-   CORE_ADDR psr;
--  struct siginfo *siginfo_p;
-+  siginfo_t *siginfo_p;
-   struct regcache *regcache = get_current_regcache ();
- 
-   siginfo_p = linux_nat_get_siginfo (inferior_ptid);
-diff --git a/gdb/linux-nat.c b/gdb/linux-nat.c
-index f80c0c1..d81d55e 100644
---- a/gdb/linux-nat.c
-+++ b/gdb/linux-nat.c
-@@ -188,7 +188,7 @@ static void (*linux_nat_prepare_to_resume) (struct lwp_info *);
- /* The method to call, if any, when the siginfo object needs to be
-    converted between the layout returned by ptrace, and the layout in
-    the architecture of the inferior.  */
--static int (*linux_nat_siginfo_fixup) (struct siginfo *,
-+static int (*linux_nat_siginfo_fixup) (siginfo_t *,
- 				       gdb_byte *,
- 				       int);
- 
-@@ -4232,7 +4232,7 @@ linux_nat_mourn_inferior (struct target_ops *ops)
-    layout of the inferiors' architecture.  */
- 
- static void
--siginfo_fixup (struct siginfo *siginfo, gdb_byte *inf_siginfo, int direction)
-+siginfo_fixup (siginfo_t *siginfo, gdb_byte *inf_siginfo, int direction)
- {
-   int done = 0;
- 
-@@ -4244,9 +4244,9 @@ siginfo_fixup (struct siginfo *siginfo, gdb_byte *inf_siginfo, int direction)
-   if (!done)
-     {
-       if (direction == 1)
--	memcpy (siginfo, inf_siginfo, sizeof (struct siginfo));
-+	memcpy (siginfo, inf_siginfo, sizeof (siginfo_t));
-       else
--	memcpy (inf_siginfo, siginfo, sizeof (struct siginfo));
-+	memcpy (inf_siginfo, siginfo, sizeof (siginfo_t));
-     }
- }
- 
-@@ -4256,8 +4256,8 @@ linux_xfer_siginfo (struct target_ops *ops, enum target_object object,
- 		    const gdb_byte *writebuf, ULONGEST offset, LONGEST len)
- {
-   int pid;
--  struct siginfo siginfo;
--  gdb_byte inf_siginfo[sizeof (struct siginfo)];
-+  siginfo_t siginfo;
-+  gdb_byte inf_siginfo[sizeof (siginfo_t)];
- 
-   gdb_assert (object == TARGET_OBJECT_SIGNAL_INFO);
-   gdb_assert (readbuf || writebuf);
-@@ -5266,7 +5266,7 @@ linux_nat_set_new_thread (struct target_ops *t,
-    inferior.  */
- void
- linux_nat_set_siginfo_fixup (struct target_ops *t,
--			     int (*siginfo_fixup) (struct siginfo *,
-+			     int (*siginfo_fixup) (siginfo_t *,
- 						   gdb_byte *,
- 						   int))
- {
-@@ -5285,7 +5285,7 @@ linux_nat_set_prepare_to_resume (struct target_ops *t,
- }
- 
- /* Return the saved siginfo associated with PTID.  */
--struct siginfo *
-+siginfo_t *
- linux_nat_get_siginfo (ptid_t ptid)
- {
-   struct lwp_info *lp = find_lwp_pid (ptid);
-diff --git a/gdb/linux-nat.h b/gdb/linux-nat.h
-index c9878d9..d87f0cf 100644
---- a/gdb/linux-nat.h
-+++ b/gdb/linux-nat.h
-@@ -78,7 +78,7 @@ struct lwp_info
- 
-   /* Non-zero si_signo if this LWP stopped with a trap.  si_addr may
-      be the address of a hardware watchpoint.  */
--  struct siginfo siginfo;
-+  siginfo_t siginfo;
- 
-   /* STOPPED_BY_WATCHPOINT is non-zero if this LWP stopped with a data
-      watchpoint trap.  */
-@@ -184,7 +184,7 @@ void linux_nat_set_new_thread (struct target_ops *, void (*) (struct lwp_info *)
-    that ptrace returns, and the layout in the architecture of the
-    inferior.  */
- void linux_nat_set_siginfo_fixup (struct target_ops *,
--				  int (*) (struct siginfo *,
-+				  int (*) (siginfo_t *,
- 					   gdb_byte *,
- 					   int));
- 
-@@ -198,7 +198,7 @@ void linux_nat_set_prepare_to_resume (struct target_ops *,
- void linux_nat_switch_fork (ptid_t new_ptid);
- 
- /* Return the saved siginfo associated with PTID.  */
--struct siginfo *linux_nat_get_siginfo (ptid_t ptid);
-+siginfo_t *linux_nat_get_siginfo (ptid_t ptid);
- 
- /* Compute and return the processor core of a given thread.  */
- int linux_nat_core_of_thread_1 (ptid_t ptid);
-diff --git a/gdb/ppc-linux-nat.c b/gdb/ppc-linux-nat.c
-index 1bd157b..9bd11fd 100644
---- a/gdb/ppc-linux-nat.c
-+++ b/gdb/ppc-linux-nat.c
-@@ -2218,7 +2218,7 @@ ppc_linux_thread_exit (struct thread_info *tp, int silent)
- static int
- ppc_linux_stopped_data_address (struct target_ops *target, CORE_ADDR *addr_p)
- {
--  struct siginfo *siginfo_p;
-+  siginfo_t *siginfo_p;
- 
-   siginfo_p = linux_nat_get_siginfo (inferior_ptid);
- 
-diff --git a/gdb/procfs.c b/gdb/procfs.c
-index 903621d..cb4bc7c 100644
---- a/gdb/procfs.c
-+++ b/gdb/procfs.c
-@@ -266,7 +266,7 @@ typedef struct sigaction gdb_sigaction_t;
- #ifdef HAVE_PR_SIGINFO64_T
- typedef pr_siginfo64_t gdb_siginfo_t;
- #else
--typedef struct siginfo gdb_siginfo_t;
-+typedef siginfo_t gdb_siginfo_t;
- #endif
- 
- /* On mips-irix, praddset and prdelset are defined in such a way that
--- 
-1.7.9.7
-
diff --git a/package/gdb/7.4.1/05_all_readline-headers.patch b/package/gdb/7.4.1/05_all_readline-headers.patch
deleted file mode 100644
index e65adf6..0000000
--- a/package/gdb/7.4.1/05_all_readline-headers.patch
+++ /dev/null
@@ -1,42 +0,0 @@
---- a/readline/complete.c
-+++ b/readline/complete.c
-@@ -25,6 +25,11 @@
- #  include <config.h>
- #endif
- 
-+#ifdef HAVE_WCHAR_H /* wcwidth() */
-+# define _GNU_SOURCE
-+# include <wchar.h>
-+#endif
-+
- #include <sys/types.h>
- #include <fcntl.h>
- #if defined (HAVE_SYS_FILE_H)
---- a/readline/display.c
-+++ b/readline/display.c
-@@ -25,6 +25,11 @@
- #  include <config.h>
- #endif
- 
-+#ifdef HAVE_WCHAR_H /* wcwidth() */
-+# define _GNU_SOURCE
-+# include <wchar.h>
-+#endif
-+
- #include <sys/types.h>
- 
- #if defined (HAVE_UNISTD_H)
---- a/readline/mbutil.c
-+++ b/readline/mbutil.c
-@@ -25,6 +25,11 @@
- #  include <config.h>
- #endif
- 
-+#ifdef HAVE_WCHAR_H /* wcwidth() */
-+# define _GNU_SOURCE
-+# include <wchar.h>
-+#endif
-+
- #include <sys/types.h>
- #include <fcntl.h>
- #include "posixjmp.h"
diff --git a/package/gdb/7.4.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch b/package/gdb/7.4.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch
deleted file mode 100644
index 3b391d0..0000000
--- a/package/gdb/7.4.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From e671835b7afc90b3ff201b79f07a6fb67797bc5c Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Mon, 20 Jan 2014 09:53:12 +0200
-Subject: [PATCH] gdb: xtensa: fix linux ptrace includes
-
-Currently, xtensa code using the Linux ptrace interface only include
-sys/ptrace.h.  This file comes from the C library (glibc and uClibc,
-at least), and includes a declaration of the ptrace() functions, along
-with some cross architecture constants that are mostly copied from the
-file located at include/uapi/linux/ptrace.h in recent Linux kernels.
-
-For xtensa specific constants like PTRACE_GETXTREGS and
-PTRACE_SETXTREGS the asm/ptrace.h include from the Linux kernel UAPI
-is needed.  The code in gdbserver xtensa specific part doesn't call
-ptrace() directly, so we can remove the unneeded sys/ptrace.h include.
-The gdb xtensa specific code needs both headers, since it calls
-ptrace().
-
-gdb/
-	* xtensa-linux-nat.c: Include asm/ptrace.h.
-
-gdb/gdbserver/
-	* linux-xtensa-low.c: Include asm/ptrace.h instead of
-	sys/ptrace.h.
----
-Backported from: e671835b7afc90b3ff201b79f07a6fb67797bc5c
-Changes to Changelog files are dropped.
-
- gdb/gdbserver/linux-xtensa-low.c | 2 +-
- gdb/xtensa-linux-nat.c           | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gdb/gdbserver/linux-xtensa-low.c b/gdb/gdbserver/linux-xtensa-low.c
-index 7db97a9..479b65b 100644
---- a/gdb/gdbserver/linux-xtensa-low.c
-+++ b/gdb/gdbserver/linux-xtensa-low.c
-@@ -24,7 +24,7 @@
- void init_registers_xtensa (void);
- extern const struct target_desc *tdesc_xtensa;
- 
--#include <sys/ptrace.h>
-+#include <asm/ptrace.h>
- #include <xtensa-config.h>
- 
- #include "xtensa-xtregs.c"
-diff --git a/gdb/xtensa-linux-nat.c b/gdb/xtensa-linux-nat.c
-index 2372e79..9340c62 100644
---- a/gdb/xtensa-linux-nat.c
-+++ b/gdb/xtensa-linux-nat.c
-@@ -36,6 +36,7 @@
- #include <fcntl.h>
- #include <sys/procfs.h>
- #include <sys/ptrace.h>
-+#include <asm/ptrace.h>
- 
- #include "gregset.h"
- #include "xtensa-tdep.h"
--- 
-1.8.1.4
-
diff --git a/package/gdb/7.4.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch b/package/gdb/7.4.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch
deleted file mode 100644
index b5f5bdf..0000000
--- a/package/gdb/7.4.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 54bff650843cacd3c17a0afdb0fe32e15e1b65b0 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 22 Jan 2014 15:02:29 +0200
-Subject: [PATCH] gdb: xtensa: fix on 64-bit hosts
-
-On 64-bit hosts unsigned long is 64 bit.  Use uint32_t instead.
-
-gdb/
-2014-01-22  Baruch Siach  <baruch@tkos.co.il>
-
-	* xtensa-tdep.h (xtensa_elf_greg_t): Change type to uint32_t.
----
-Backported from: 54bff650843cacd3c17a0afdb0fe32e15e1b65b0
-Changes to Changelog files are dropped and #include <stdint.h> is added.
-
- gdb/xtensa-tdep.h | 3 +-
- 1 file changed, 2 insertion(+), 1 deletion(-)
-
-diff --git a/gdb/xtensa-tdep.h b/gdb/xtensa-tdep.h
-index 968b9d2..d7ba562 100644
---- a/gdb/xtensa-tdep.h
-+++ b/gdb/xtensa-tdep.h
-@@ -17,6 +17,7 @@
-    You should have received a copy of the GNU General Public License
-    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- 
-+#include <stdint.h>
- 
- /* XTENSA_TDEP_VERSION can/should be changed along with XTENSA_CONFIG_VERSION
-    whenever the "tdep" structure changes in an incompatible way.  */
-@@ -84,7 +84,7 @@ typedef enum
- /* Xtensa ELF core file register set representation ('.reg' section).
-    Copied from target-side ELF header <xtensa/elf.h>.  */
- 
--typedef unsigned long xtensa_elf_greg_t;
-+typedef uint32_t xtensa_elf_greg_t;
- 
- typedef struct
- {
--- 
-1.8.1.4
-
diff --git a/package/gdb/7.5.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch b/package/gdb/7.5.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch
deleted file mode 100644
index 3b391d0..0000000
--- a/package/gdb/7.5.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From e671835b7afc90b3ff201b79f07a6fb67797bc5c Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Mon, 20 Jan 2014 09:53:12 +0200
-Subject: [PATCH] gdb: xtensa: fix linux ptrace includes
-
-Currently, xtensa code using the Linux ptrace interface only include
-sys/ptrace.h.  This file comes from the C library (glibc and uClibc,
-at least), and includes a declaration of the ptrace() functions, along
-with some cross architecture constants that are mostly copied from the
-file located at include/uapi/linux/ptrace.h in recent Linux kernels.
-
-For xtensa specific constants like PTRACE_GETXTREGS and
-PTRACE_SETXTREGS the asm/ptrace.h include from the Linux kernel UAPI
-is needed.  The code in gdbserver xtensa specific part doesn't call
-ptrace() directly, so we can remove the unneeded sys/ptrace.h include.
-The gdb xtensa specific code needs both headers, since it calls
-ptrace().
-
-gdb/
-	* xtensa-linux-nat.c: Include asm/ptrace.h.
-
-gdb/gdbserver/
-	* linux-xtensa-low.c: Include asm/ptrace.h instead of
-	sys/ptrace.h.
----
-Backported from: e671835b7afc90b3ff201b79f07a6fb67797bc5c
-Changes to Changelog files are dropped.
-
- gdb/gdbserver/linux-xtensa-low.c | 2 +-
- gdb/xtensa-linux-nat.c           | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gdb/gdbserver/linux-xtensa-low.c b/gdb/gdbserver/linux-xtensa-low.c
-index 7db97a9..479b65b 100644
---- a/gdb/gdbserver/linux-xtensa-low.c
-+++ b/gdb/gdbserver/linux-xtensa-low.c
-@@ -24,7 +24,7 @@
- void init_registers_xtensa (void);
- extern const struct target_desc *tdesc_xtensa;
- 
--#include <sys/ptrace.h>
-+#include <asm/ptrace.h>
- #include <xtensa-config.h>
- 
- #include "xtensa-xtregs.c"
-diff --git a/gdb/xtensa-linux-nat.c b/gdb/xtensa-linux-nat.c
-index 2372e79..9340c62 100644
---- a/gdb/xtensa-linux-nat.c
-+++ b/gdb/xtensa-linux-nat.c
-@@ -36,6 +36,7 @@
- #include <fcntl.h>
- #include <sys/procfs.h>
- #include <sys/ptrace.h>
-+#include <asm/ptrace.h>
- 
- #include "gregset.h"
- #include "xtensa-tdep.h"
--- 
-1.8.1.4
-
diff --git a/package/gdb/7.5.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch b/package/gdb/7.5.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch
deleted file mode 100644
index b5f5bdf..0000000
--- a/package/gdb/7.5.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 54bff650843cacd3c17a0afdb0fe32e15e1b65b0 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 22 Jan 2014 15:02:29 +0200
-Subject: [PATCH] gdb: xtensa: fix on 64-bit hosts
-
-On 64-bit hosts unsigned long is 64 bit.  Use uint32_t instead.
-
-gdb/
-2014-01-22  Baruch Siach  <baruch@tkos.co.il>
-
-	* xtensa-tdep.h (xtensa_elf_greg_t): Change type to uint32_t.
----
-Backported from: 54bff650843cacd3c17a0afdb0fe32e15e1b65b0
-Changes to Changelog files are dropped and #include <stdint.h> is added.
-
- gdb/xtensa-tdep.h | 3 +-
- 1 file changed, 2 insertion(+), 1 deletion(-)
-
-diff --git a/gdb/xtensa-tdep.h b/gdb/xtensa-tdep.h
-index 968b9d2..d7ba562 100644
---- a/gdb/xtensa-tdep.h
-+++ b/gdb/xtensa-tdep.h
-@@ -17,6 +17,7 @@
-    You should have received a copy of the GNU General Public License
-    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- 
-+#include <stdint.h>
- 
- /* XTENSA_TDEP_VERSION can/should be changed along with XTENSA_CONFIG_VERSION
-    whenever the "tdep" structure changes in an incompatible way.  */
-@@ -84,7 +84,7 @@ typedef enum
- /* Xtensa ELF core file register set representation ('.reg' section).
-    Copied from target-side ELF header <xtensa/elf.h>.  */
- 
--typedef unsigned long xtensa_elf_greg_t;
-+typedef uint32_t xtensa_elf_greg_t;
- 
- typedef struct
- {
--- 
-1.8.1.4
-
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index d5954f2..cbc1361 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -27,14 +27,6 @@ choice
 		depends on BR2_avr32
 		bool "gdb 6.7.1-avr32-2.1.5"
 
-	config BR2_GDB_VERSION_7_4
-		bool "gdb 7.4.x"
-		depends on !BR2_powerpc64le
-
-	config BR2_GDB_VERSION_7_5
-		bool "gdb 7.5.x"
-		depends on !BR2_powerpc64le
-
 	config BR2_GDB_VERSION_7_6
 		bool "gdb 7.6.x"
 		depends on !BR2_powerpc64le
@@ -54,7 +46,5 @@ config BR2_GDB_VERSION
                                    (!BR2_PACKAGE_HOST_GDB && BR2_avr32)
 	default "arc-4.8-R3" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
-	default "7.4.1"    if BR2_GDB_VERSION_7_4
-	default "7.5.1"    if BR2_GDB_VERSION_7_5
 	default "7.6.2"    if BR2_GDB_VERSION_7_6 || !BR2_PACKAGE_HOST_GDB
 	default "7.7.1"    if BR2_GDB_VERSION_7_7 || BR2_powerpc64le
