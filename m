From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 27 Mar 2017 00:40:31 +0200
Subject: [Buildroot] [PATCH 1/2] gdb: add upstream patch to fix
	inconsistency with glibc header
Message-ID: <20170326224032.10708-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In glibc 2.25, the proc_service.h header was copied from gdb to glibc.
However, in the process the 'const' was removed, which leads to build
failures with glibc >= 2.25.

gdb 7.12.1 already contains this patch. The patch for 7.11.1 comes
straight from upstream, the patch for 7.10.1 is backported by me.

Fixes http://autobuild.buildroot.net/results/6b1b44e72147113b3f0e3f049cb9026d6c7dffb7

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...7-Sync-proc_service-definition-with-GLIBC.patch | 287 +++++++++++++++
 ...2-Sync-proc_service-definition-with-GLIBC.patch | 389 +++++++++++++++++++++
 2 files changed, 676 insertions(+)
 create mode 100644 package/gdb/7.10.1/0007-Sync-proc_service-definition-with-GLIBC.patch
 create mode 100644 package/gdb/7.11.1/0002-Sync-proc_service-definition-with-GLIBC.patch

diff --git a/package/gdb/7.10.1/0007-Sync-proc_service-definition-with-GLIBC.patch b/package/gdb/7.10.1/0007-Sync-proc_service-definition-with-GLIBC.patch
new file mode 100644
index 0000000000..2a53778770
--- /dev/null
+++ b/package/gdb/7.10.1/0007-Sync-proc_service-definition-with-GLIBC.patch
@@ -0,0 +1,287 @@
+From ccc18e0b2dc77a6619df31fd4fadfb3a37401616 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Sun, 26 Mar 2017 23:06:45 +0200
+Subject: [PATCH] Sync proc_service definition with GLIBC
+
+GLIBC BZ#20311 [1] proc_service.h install patch also remove 'const'
+attributes from ps_get_thread_area and comment #15 discuss why to remove
+the const attribute (basically since it a callback with the struct
+ps_prochandle owned by the client it should be able to modify it if
+it the case).
+
+On default build this is not the issue and current g++ does not trigger
+any issue with this mismatch declaration.  However, on some bootstrap
+build configuration where gdbserver is build with gcc instead this
+triggers:
+
+error: conflicting types for 'ps_get_thread_area'
+
+This patch fixes it by syncing the declaration with GLIBC.
+
+[1] https://sourceware.org/bugzilla/show_bug.cgi?id=20311
+
+gdb/ChangeLog:
+
+2016-08-25  Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+
+	* aarch64-linux-nat.c (ps_get_thread_area): Remove const from
+	struct ps_prochandle.
+	* amd64-linux-nat.c (ps_get_thread_area): Likewise.
+	* arm-linux-nat.c (ps_get_thread_area): Likewise.
+	* gdb_proc_service.h (ps_get_thread_area): Likewise.
+	* i386-linux-nat.c (ps_get_thread_area): Likewise.
+	* m68klinux-nat.c (ps_get_thread_area): Likewise.
+	* mips-linux-nat.c (ps_get_thread_area): Likewise.
+	* nat/aarch64-linux.c (aarch64_ps_get_thread_area): Likewise.
+	* nat/aarch64-linux.h (aarch64_ps_get_thread_area): Likewise.
+	* xtensa-linux-nat.c (ps_get_thread_area): Likewise.
+
+gdb/gdbserver/ChangeLog:
+
+2016-08-25  Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+
+	PR server/20491
+	* gdb_proc_service.h (ps_get_thread_area): Remove const from struct
+	ps_prochandle.
+	* linux-aarch64-low.c (ps_get_thread_area): Likewise.
+	* linux-arm-low.c (ps_get_thread_area): Likewise.
+	* linux-crisv32-low.c (ps_get_thread_area): Likewise.
+	* linux-m68k-low.c (ps_get_thread_area): Likewise.
+	* linux-mips-low.c (ps_get_thread_area): Likewise.
+	* linux-nios2-low.c (ps_get_thread_area): Likewise.
+	* linux-tic6x-low.c (ps_get_thread_area): Likewise.
+	* linux-x86-low.c (ps_get_thread_area): Likewise.
+	* linux-xtensa-low.c (ps_get_thread_area): Likewise.
+
+(cherry picked from commit 140bf80050b34f0947b34dba93b830ea2bfc5040)
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gdb/aarch64-linux-nat.c           | 2 +-
+ gdb/amd64-linux-nat.c             | 2 +-
+ gdb/arm-linux-nat.c               | 2 +-
+ gdb/gdb_proc_service.h            | 2 +-
+ gdb/gdbserver/gdb_proc_service.h  | 2 +-
+ gdb/gdbserver/linux-aarch64-low.c | 2 +-
+ gdb/gdbserver/linux-arm-low.c     | 2 +-
+ gdb/gdbserver/linux-crisv32-low.c | 2 +-
+ gdb/gdbserver/linux-m68k-low.c    | 2 +-
+ gdb/gdbserver/linux-mips-low.c    | 2 +-
+ gdb/gdbserver/linux-nios2-low.c   | 2 +-
+ gdb/gdbserver/linux-tic6x-low.c   | 2 +-
+ gdb/gdbserver/linux-x86-low.c     | 2 +-
+ gdb/i386-linux-nat.c              | 2 +-
+ gdb/m68klinux-nat.c               | 2 +-
+ gdb/mips-linux-nat.c              | 2 +-
+ 16 files changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/gdb/aarch64-linux-nat.c b/gdb/aarch64-linux-nat.c
+index 9959b81a2d..aa0f8d76bd 100644
+--- a/gdb/aarch64-linux-nat.c
++++ b/gdb/aarch64-linux-nat.c
+@@ -734,7 +734,7 @@ aarch64_linux_new_fork (struct lwp_info *parent, pid_t child_pid)
+    storage (or its descriptor).  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   struct iovec iovec;
+diff --git a/gdb/amd64-linux-nat.c b/gdb/amd64-linux-nat.c
+index 2e1b081b0f..7f076a9148 100644
+--- a/gdb/amd64-linux-nat.c
++++ b/gdb/amd64-linux-nat.c
+@@ -244,7 +244,7 @@ amd64_linux_store_inferior_registers (struct target_ops *ops,
+    a request for a thread's local storage address.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+                     lwpid_t lwpid, int idx, void **base)
+ {
+   if (gdbarch_bfd_arch_info (target_gdbarch ())->bits_per_word == 32)
+diff --git a/gdb/arm-linux-nat.c b/gdb/arm-linux-nat.c
+index c167bce18b..8462655139 100644
+--- a/gdb/arm-linux-nat.c
++++ b/gdb/arm-linux-nat.c
+@@ -778,7 +778,7 @@ supply_fpregset (struct regcache *regcache, const gdb_fpregset_t *fpregsetp)
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+                     lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+diff --git a/gdb/gdb_proc_service.h b/gdb/gdb_proc_service.h
+index e7369911a1..91fbc29a76 100644
+--- a/gdb/gdb_proc_service.h
++++ b/gdb/gdb_proc_service.h
+@@ -124,7 +124,7 @@ extern pid_t ps_getpid (struct ps_prochandle *);
+ /* Fetch the special per-thread address associated with the given LWP.
+    This call is only used on a few platforms (most use a normal register).
+    The meaning of the `int' parameter is machine-dependent.  */
+-extern ps_err_e ps_get_thread_area (const struct ps_prochandle *,
++extern ps_err_e ps_get_thread_area (struct ps_prochandle *,
+ 				    lwpid_t, int, psaddr_t *);
+ 
+ 
+diff --git a/gdb/gdbserver/gdb_proc_service.h b/gdb/gdbserver/gdb_proc_service.h
+index cbafbf3206..7f9b1e4de0 100644
+--- a/gdb/gdbserver/gdb_proc_service.h
++++ b/gdb/gdbserver/gdb_proc_service.h
+@@ -107,7 +107,7 @@ extern pid_t ps_getpid (struct ps_prochandle *);
+ /* Fetch the special per-thread address associated with the given LWP.
+    This call is only used on a few platforms (most use a normal register).
+    The meaning of the `int' parameter is machine-dependent.  */
+-extern ps_err_e ps_get_thread_area (const struct ps_prochandle *,
++extern ps_err_e ps_get_thread_area (struct ps_prochandle *,
+ 				    lwpid_t, int, psaddr_t *);
+ 
+ 
+diff --git a/gdb/gdbserver/linux-aarch64-low.c b/gdb/gdbserver/linux-aarch64-low.c
+index 8a30b00029..a0ac35620d 100644
+--- a/gdb/gdbserver/linux-aarch64-low.c
++++ b/gdb/gdbserver/linux-aarch64-low.c
+@@ -1089,7 +1089,7 @@ aarch64_stopped_by_watchpoint (void)
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   struct iovec iovec;
+diff --git a/gdb/gdbserver/linux-arm-low.c b/gdb/gdbserver/linux-arm-low.c
+index dd77b48ecd..560e7d8496 100644
+--- a/gdb/gdbserver/linux-arm-low.c
++++ b/gdb/gdbserver/linux-arm-low.c
+@@ -334,7 +334,7 @@ arm_reinsert_addr (void)
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+diff --git a/gdb/gdbserver/linux-crisv32-low.c b/gdb/gdbserver/linux-crisv32-low.c
+index 65e6c09df2..fd5e627123 100644
+--- a/gdb/gdbserver/linux-crisv32-low.c
++++ b/gdb/gdbserver/linux-crisv32-low.c
+@@ -336,7 +336,7 @@ cris_stopped_data_address (void)
+ }
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+                     lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+diff --git a/gdb/gdbserver/linux-m68k-low.c b/gdb/gdbserver/linux-m68k-low.c
+index 4501904e39..7415930360 100644
+--- a/gdb/gdbserver/linux-m68k-low.c
++++ b/gdb/gdbserver/linux-m68k-low.c
+@@ -160,7 +160,7 @@ m68k_breakpoint_at (CORE_ADDR pc)
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+diff --git a/gdb/gdbserver/linux-mips-low.c b/gdb/gdbserver/linux-mips-low.c
+index 1695c4cf0d..acc2468bce 100644
+--- a/gdb/gdbserver/linux-mips-low.c
++++ b/gdb/gdbserver/linux-mips-low.c
+@@ -640,7 +640,7 @@ mips_stopped_data_address (void)
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+diff --git a/gdb/gdbserver/linux-nios2-low.c b/gdb/gdbserver/linux-nios2-low.c
+index 7bd3c9795d..719883edef 100644
+--- a/gdb/gdbserver/linux-nios2-low.c
++++ b/gdb/gdbserver/linux-nios2-low.c
+@@ -150,7 +150,7 @@ nios2_breakpoint_at (CORE_ADDR where)
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+                     lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+diff --git a/gdb/gdbserver/linux-tic6x-low.c b/gdb/gdbserver/linux-tic6x-low.c
+index 0a0d220c34..26c4dee999 100644
+--- a/gdb/gdbserver/linux-tic6x-low.c
++++ b/gdb/gdbserver/linux-tic6x-low.c
+@@ -266,7 +266,7 @@ tic6x_breakpoint_at (CORE_ADDR where)
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+diff --git a/gdb/gdbserver/linux-x86-low.c b/gdb/gdbserver/linux-x86-low.c
+index 484eadba05..15f25d71d5 100644
+--- a/gdb/gdbserver/linux-x86-low.c
++++ b/gdb/gdbserver/linux-x86-low.c
+@@ -231,7 +231,7 @@ is_64bit_tdesc (void)
+ /* Called by libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+ #ifdef __x86_64__
+diff --git a/gdb/i386-linux-nat.c b/gdb/i386-linux-nat.c
+index 349ce68f5c..80d6a516ea 100644
+--- a/gdb/i386-linux-nat.c
++++ b/gdb/i386-linux-nat.c
+@@ -603,7 +603,7 @@ i386_linux_store_inferior_registers (struct target_ops *ops,
+    storage (or its descriptor).  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   unsigned int base_addr;
+diff --git a/gdb/m68klinux-nat.c b/gdb/m68klinux-nat.c
+index 8f89d7b87a..6e528b4e91 100644
+--- a/gdb/m68klinux-nat.c
++++ b/gdb/m68klinux-nat.c
+@@ -508,7 +508,7 @@ m68k_linux_store_inferior_registers (struct target_ops *ops,
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph, 
++ps_get_thread_area (struct ps_prochandle *ph, 
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) < 0)
+diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
+index a36bb6356f..9f6d6975a0 100644
+--- a/gdb/mips-linux-nat.c
++++ b/gdb/mips-linux-nat.c
+@@ -152,7 +152,7 @@ mips64_linux_register_addr (struct gdbarch *gdbarch, int regno, int store)
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+                     lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+-- 
+2.11.0
+
diff --git a/package/gdb/7.11.1/0002-Sync-proc_service-definition-with-GLIBC.patch b/package/gdb/7.11.1/0002-Sync-proc_service-definition-with-GLIBC.patch
new file mode 100644
index 0000000000..b3f723a8ef
--- /dev/null
+++ b/package/gdb/7.11.1/0002-Sync-proc_service-definition-with-GLIBC.patch
@@ -0,0 +1,389 @@
+From 140bf80050b34f0947b34dba93b830ea2bfc5040 Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Thu, 25 Aug 2016 08:42:03 +0100
+Subject: [PATCH] Sync proc_service definition with GLIBC
+
+GLIBC BZ#20311 [1] proc_service.h install patch also remove 'const'
+attributes from ps_get_thread_area and comment #15 discuss why to remove
+the const attribute (basically since it a callback with the struct
+ps_prochandle owned by the client it should be able to modify it if
+it the case).
+
+On default build this is not the issue and current g++ does not trigger
+any issue with this mismatch declaration.  However, on some bootstrap
+build configuration where gdbserver is build with gcc instead this
+triggers:
+
+error: conflicting types for 'ps_get_thread_area'
+
+This patch fixes it by syncing the declaration with GLIBC.
+
+[1] https://sourceware.org/bugzilla/show_bug.cgi?id=20311
+
+gdb/ChangeLog:
+
+2016-08-25  Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+
+	* aarch64-linux-nat.c (ps_get_thread_area): Remove const from
+	struct ps_prochandle.
+	* amd64-linux-nat.c (ps_get_thread_area): Likewise.
+	* arm-linux-nat.c (ps_get_thread_area): Likewise.
+	* gdb_proc_service.h (ps_get_thread_area): Likewise.
+	* i386-linux-nat.c (ps_get_thread_area): Likewise.
+	* m68klinux-nat.c (ps_get_thread_area): Likewise.
+	* mips-linux-nat.c (ps_get_thread_area): Likewise.
+	* nat/aarch64-linux.c (aarch64_ps_get_thread_area): Likewise.
+	* nat/aarch64-linux.h (aarch64_ps_get_thread_area): Likewise.
+	* xtensa-linux-nat.c (ps_get_thread_area): Likewise.
+
+gdb/gdbserver/ChangeLog:
+
+2016-08-25  Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+
+	PR server/20491
+	* gdb_proc_service.h (ps_get_thread_area): Remove const from struct
+	ps_prochandle.
+	* linux-aarch64-low.c (ps_get_thread_area): Likewise.
+	* linux-arm-low.c (ps_get_thread_area): Likewise.
+	* linux-crisv32-low.c (ps_get_thread_area): Likewise.
+	* linux-m68k-low.c (ps_get_thread_area): Likewise.
+	* linux-mips-low.c (ps_get_thread_area): Likewise.
+	* linux-nios2-low.c (ps_get_thread_area): Likewise.
+	* linux-tic6x-low.c (ps_get_thread_area): Likewise.
+	* linux-x86-low.c (ps_get_thread_area): Likewise.
+	* linux-xtensa-low.c (ps_get_thread_area): Likewise.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gdb/ChangeLog                     | 14 ++++++++++++++
+ gdb/aarch64-linux-nat.c           |  2 +-
+ gdb/amd64-linux-nat.c             |  2 +-
+ gdb/arm-linux-nat.c               |  2 +-
+ gdb/gdb_proc_service.h            |  2 +-
+ gdb/gdbserver/ChangeLog           | 15 +++++++++++++++
+ gdb/gdbserver/gdb_proc_service.h  |  2 +-
+ gdb/gdbserver/linux-aarch64-low.c |  2 +-
+ gdb/gdbserver/linux-arm-low.c     |  2 +-
+ gdb/gdbserver/linux-crisv32-low.c |  2 +-
+ gdb/gdbserver/linux-m68k-low.c    |  2 +-
+ gdb/gdbserver/linux-mips-low.c    |  2 +-
+ gdb/gdbserver/linux-nios2-low.c   |  2 +-
+ gdb/gdbserver/linux-tic6x-low.c   |  2 +-
+ gdb/gdbserver/linux-x86-low.c     |  2 +-
+ gdb/gdbserver/linux-xtensa-low.c  |  2 +-
+ gdb/i386-linux-nat.c              |  2 +-
+ gdb/m68klinux-nat.c               |  2 +-
+ gdb/mips-linux-nat.c              |  2 +-
+ gdb/nat/aarch64-linux.c           |  2 +-
+ gdb/nat/aarch64-linux.h           |  2 +-
+ gdb/xtensa-linux-nat.c            |  2 +-
+ 22 files changed, 49 insertions(+), 20 deletions(-)
+
+diff --git a/gdb/ChangeLog b/gdb/ChangeLog
+index 9b6562502e..a03afdb82f 100644
+--- a/gdb/ChangeLog
++++ b/gdb/ChangeLog
+@@ -1,3 +1,17 @@
++2016-08-25  Adhemerval Zanella  <adhemerval.zanella@linaro.org>
++
++	* aarch64-linux-nat.c (ps_get_thread_area): Remove const from
++	struct ps_prochandle.
++	* amd64-linux-nat.c (ps_get_thread_area): Likewise.
++	* arm-linux-nat.c (ps_get_thread_area): Likewise.
++	* gdb_proc_service.h (ps_get_thread_area): Likewise.
++	* i386-linux-nat.c (ps_get_thread_area): Likewise.
++	* m68klinux-nat.c (ps_get_thread_area): Likewise.
++	* mips-linux-nat.c (ps_get_thread_area): Likewise.
++	* nat/aarch64-linux.c (aarch64_ps_get_thread_area): Likewise.
++	* nat/aarch64-linux.h (aarch64_ps_get_thread_area): Likewise.
++	* xtensa-linux-nat.c (ps_get_thread_area): Likewise.
++
+ 2016-06-01  Joel Brobecker  <brobecker@adacore.com>
+ 
+ 	* version.in: Set GDB version number to 7.11.1.DATE-git.
+diff --git a/gdb/aarch64-linux-nat.c b/gdb/aarch64-linux-nat.c
+index fe1631dbbb..5166eebd33 100644
+--- a/gdb/aarch64-linux-nat.c
++++ b/gdb/aarch64-linux-nat.c
+@@ -457,7 +457,7 @@ aarch64_linux_new_fork (struct lwp_info *parent, pid_t child_pid)
+    storage (or its descriptor).  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   int is_64bit_p
+diff --git a/gdb/amd64-linux-nat.c b/gdb/amd64-linux-nat.c
+index 391a646992..9da36fd1ba 100644
+--- a/gdb/amd64-linux-nat.c
++++ b/gdb/amd64-linux-nat.c
+@@ -245,7 +245,7 @@ amd64_linux_store_inferior_registers (struct target_ops *ops,
+    a request for a thread's local storage address.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+                     lwpid_t lwpid, int idx, void **base)
+ {
+   if (gdbarch_bfd_arch_info (target_gdbarch ())->bits_per_word == 32)
+diff --git a/gdb/arm-linux-nat.c b/gdb/arm-linux-nat.c
+index d77ca93498..d11bdc6e22 100644
+--- a/gdb/arm-linux-nat.c
++++ b/gdb/arm-linux-nat.c
+@@ -477,7 +477,7 @@ supply_fpregset (struct regcache *regcache, const gdb_fpregset_t *fpregsetp)
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+                     lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+diff --git a/gdb/gdb_proc_service.h b/gdb/gdb_proc_service.h
+index 04d3c03884..a1a8eb5b2f 100644
+--- a/gdb/gdb_proc_service.h
++++ b/gdb/gdb_proc_service.h
+@@ -124,7 +124,7 @@ extern pid_t ps_getpid (struct ps_prochandle *);
+ /* Fetch the special per-thread address associated with the given LWP.
+    This call is only used on a few platforms (most use a normal register).
+    The meaning of the `int' parameter is machine-dependent.  */
+-extern ps_err_e ps_get_thread_area (const struct ps_prochandle *,
++extern ps_err_e ps_get_thread_area (struct ps_prochandle *,
+ 				    lwpid_t, int, psaddr_t *);
+ 
+ 
+diff --git a/gdb/gdbserver/ChangeLog b/gdb/gdbserver/ChangeLog
+index 08fef5b06e..ea278b1250 100644
+--- a/gdb/gdbserver/ChangeLog
++++ b/gdb/gdbserver/ChangeLog
+@@ -1,3 +1,18 @@
++2016-08-25  Adhemerval Zanella  <adhemerval.zanella@linaro.org>
++
++	PR server/20491
++	* gdb_proc_service.h (ps_get_thread_area): Remove const from struct
++	ps_prochandle.
++	* linux-aarch64-low.c (ps_get_thread_area): Likewise.
++	* linux-arm-low.c (ps_get_thread_area): Likewise.
++	* linux-crisv32-low.c (ps_get_thread_area): Likewise.
++	* linux-m68k-low.c (ps_get_thread_area): Likewise.
++	* linux-mips-low.c (ps_get_thread_area): Likewise.
++	* linux-nios2-low.c (ps_get_thread_area): Likewise.
++	* linux-tic6x-low.c (ps_get_thread_area): Likewise.
++	* linux-x86-low.c (ps_get_thread_area): Likewise.
++	* linux-xtensa-low.c (ps_get_thread_area): Likewise.
++
+ 2016-04-15  Pedro Alves  <palves@redhat.com>
+ 
+ 	* linux-low.c (check_stopped_by_breakpoint): Rename to ...
+diff --git a/gdb/gdbserver/gdb_proc_service.h b/gdb/gdbserver/gdb_proc_service.h
+index 99bf226b01..cec9231ee5 100644
+--- a/gdb/gdbserver/gdb_proc_service.h
++++ b/gdb/gdbserver/gdb_proc_service.h
+@@ -107,7 +107,7 @@ extern pid_t ps_getpid (struct ps_prochandle *);
+ /* Fetch the special per-thread address associated with the given LWP.
+    This call is only used on a few platforms (most use a normal register).
+    The meaning of the `int' parameter is machine-dependent.  */
+-extern ps_err_e ps_get_thread_area (const struct ps_prochandle *,
++extern ps_err_e ps_get_thread_area (struct ps_prochandle *,
+ 				    lwpid_t, int, psaddr_t *);
+ 
+ 
+diff --git a/gdb/gdbserver/linux-aarch64-low.c b/gdb/gdbserver/linux-aarch64-low.c
+index 806a76260f..b86f210390 100644
+--- a/gdb/gdbserver/linux-aarch64-low.c
++++ b/gdb/gdbserver/linux-aarch64-low.c
+@@ -421,7 +421,7 @@ aarch64_stopped_by_watchpoint (void)
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   return aarch64_ps_get_thread_area (ph, lwpid, idx, base,
+diff --git a/gdb/gdbserver/linux-arm-low.c b/gdb/gdbserver/linux-arm-low.c
+index 0f627069e0..9f043878c7 100644
+--- a/gdb/gdbserver/linux-arm-low.c
++++ b/gdb/gdbserver/linux-arm-low.c
+@@ -269,7 +269,7 @@ get_next_pcs_read_memory_unsigned_integer (CORE_ADDR memaddr,
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+diff --git a/gdb/gdbserver/linux-crisv32-low.c b/gdb/gdbserver/linux-crisv32-low.c
+index 16c1f72015..fea6d5bf9b 100644
+--- a/gdb/gdbserver/linux-crisv32-low.c
++++ b/gdb/gdbserver/linux-crisv32-low.c
+@@ -309,7 +309,7 @@ cris_stopped_data_address (void)
+ }
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+                     lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+diff --git a/gdb/gdbserver/linux-m68k-low.c b/gdb/gdbserver/linux-m68k-low.c
+index df3d7c6d9c..78a340fa8f 100644
+--- a/gdb/gdbserver/linux-m68k-low.c
++++ b/gdb/gdbserver/linux-m68k-low.c
+@@ -152,7 +152,7 @@ m68k_breakpoint_at (CORE_ADDR pc)
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+diff --git a/gdb/gdbserver/linux-mips-low.c b/gdb/gdbserver/linux-mips-low.c
+index 30a03d5f43..9356bb3d99 100644
+--- a/gdb/gdbserver/linux-mips-low.c
++++ b/gdb/gdbserver/linux-mips-low.c
+@@ -637,7 +637,7 @@ mips_stopped_data_address (void)
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+diff --git a/gdb/gdbserver/linux-nios2-low.c b/gdb/gdbserver/linux-nios2-low.c
+index ea0ded1f1e..98a85ed8e3 100644
+--- a/gdb/gdbserver/linux-nios2-low.c
++++ b/gdb/gdbserver/linux-nios2-low.c
+@@ -145,7 +145,7 @@ nios2_breakpoint_at (CORE_ADDR where)
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+                     lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+diff --git a/gdb/gdbserver/linux-tic6x-low.c b/gdb/gdbserver/linux-tic6x-low.c
+index e40a3aff51..6b90560dc4 100644
+--- a/gdb/gdbserver/linux-tic6x-low.c
++++ b/gdb/gdbserver/linux-tic6x-low.c
+@@ -274,7 +274,7 @@ tic6x_breakpoint_at (CORE_ADDR where)
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+diff --git a/gdb/gdbserver/linux-x86-low.c b/gdb/gdbserver/linux-x86-low.c
+index 0c4954a58d..8bac10a54b 100644
+--- a/gdb/gdbserver/linux-x86-low.c
++++ b/gdb/gdbserver/linux-x86-low.c
+@@ -236,7 +236,7 @@ is_64bit_tdesc (void)
+ /* Called by libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+ #ifdef __x86_64__
+diff --git a/gdb/gdbserver/linux-xtensa-low.c b/gdb/gdbserver/linux-xtensa-low.c
+index 6e945eac17..431082c01f 100644
+--- a/gdb/gdbserver/linux-xtensa-low.c
++++ b/gdb/gdbserver/linux-xtensa-low.c
+@@ -177,7 +177,7 @@ xtensa_breakpoint_at (CORE_ADDR where)
+ /* Called by libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+                     lwpid_t lwpid, int idx, void **base)
+ {
+   xtensa_elf_gregset_t regs;
+diff --git a/gdb/i386-linux-nat.c b/gdb/i386-linux-nat.c
+index a41ee21081..70d954fdc0 100644
+--- a/gdb/i386-linux-nat.c
++++ b/gdb/i386-linux-nat.c
+@@ -603,7 +603,7 @@ i386_linux_store_inferior_registers (struct target_ops *ops,
+    storage (or its descriptor).  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   unsigned int base_addr;
+diff --git a/gdb/m68klinux-nat.c b/gdb/m68klinux-nat.c
+index 24b6242ba3..5b8684b719 100644
+--- a/gdb/m68klinux-nat.c
++++ b/gdb/m68klinux-nat.c
+@@ -508,7 +508,7 @@ m68k_linux_store_inferior_registers (struct target_ops *ops,
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph, 
++ps_get_thread_area (struct ps_prochandle *ph, 
+ 		    lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) < 0)
+diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
+index bfe9fcbe68..0f20f16814 100644
+--- a/gdb/mips-linux-nat.c
++++ b/gdb/mips-linux-nat.c
+@@ -152,7 +152,7 @@ mips64_linux_register_addr (struct gdbarch *gdbarch, int regno, int store)
+ /* Fetch the thread-local storage pointer for libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+                     lwpid_t lwpid, int idx, void **base)
+ {
+   if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
+diff --git a/gdb/nat/aarch64-linux.c b/gdb/nat/aarch64-linux.c
+index 5ae5aa8602..1828977e28 100644
+--- a/gdb/nat/aarch64-linux.c
++++ b/gdb/nat/aarch64-linux.c
+@@ -205,7 +205,7 @@ aarch64_siginfo_from_compat_siginfo (siginfo_t *to, compat_siginfo_t *from)
+    storage (or its descriptor).  */
+ 
+ ps_err_e
+-aarch64_ps_get_thread_area (const struct ps_prochandle *ph,
++aarch64_ps_get_thread_area (struct ps_prochandle *ph,
+ 			    lwpid_t lwpid, int idx, void **base,
+ 			    int is_64bit_p)
+ {
+diff --git a/gdb/nat/aarch64-linux.h b/gdb/nat/aarch64-linux.h
+index 7221982b78..aac7c68c06 100644
+--- a/gdb/nat/aarch64-linux.h
++++ b/gdb/nat/aarch64-linux.h
+@@ -122,7 +122,7 @@ void aarch64_linux_prepare_to_resume (struct lwp_info *lwp);
+ 
+ void aarch64_linux_new_thread (struct lwp_info *lwp);
+ 
+-ps_err_e aarch64_ps_get_thread_area (const struct ps_prochandle *ph,
++ps_err_e aarch64_ps_get_thread_area (struct ps_prochandle *ph,
+ 				       lwpid_t lwpid, int idx, void **base,
+ 				       int is_64bit_p);
+ 
+diff --git a/gdb/xtensa-linux-nat.c b/gdb/xtensa-linux-nat.c
+index 54da83791a..836d3f80ee 100644
+--- a/gdb/xtensa-linux-nat.c
++++ b/gdb/xtensa-linux-nat.c
+@@ -286,7 +286,7 @@ xtensa_linux_store_inferior_registers (struct target_ops *ops,
+ /* Called by libthread_db.  */
+ 
+ ps_err_e
+-ps_get_thread_area (const struct ps_prochandle *ph,
++ps_get_thread_area (struct ps_prochandle *ph,
+                     lwpid_t lwpid, int idx, void **base)
+ {
+   xtensa_elf_gregset_t regs;
+-- 
+2.11.0
+
-- 
2.11.0
