From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 08:46:11 +0200
Subject: [Buildroot] [git commit branch/next] gdb: remove version 7.8
Message-ID: <20160517065435.C582A81ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20ed897b3805a2a7e3285210e864d420ad7bdc7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that 7.11 has been added and 7.10 is the default version, let's
remove the old 7.8 release.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                   | 10 ++++
 .../0001-gdbserver-fix-uClibc-whithout-MMU.patch   | 34 -----------
 ...gdbserver-xtensa-drop-xtensa_usrregs_info.patch | 47 ---------------
 ...erver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch | 46 --------------
 .../0004-Add-some-casts-for-building-on-musl.patch | 70 ----------------------
 ...musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch | 63 -------------------
 package/gdb/7.8.2/0006-move-__SIGRTMIN.patch       | 58 ------------------
 package/gdb/Config.in.host                         |  4 --
 package/gdb/gdb.hash                               |  1 -
 9 files changed, 10 insertions(+), 323 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 824a220..ff11d75 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -143,6 +143,16 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2016.08"
+
+config BR2_GDB_VERSION_7_8
+	bool "gdb 7.8 has been removed"
+	select BR2_LEGACY
+	help
+	  The 7.8 version of gdb has been removed. Use a newer version
+	  instead.
+
+###############################################################################
 comment "Legacy options removed in 2016.05"
 
 config BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE
diff --git a/package/gdb/7.8.2/0001-gdbserver-fix-uClibc-whithout-MMU.patch b/package/gdb/7.8.2/0001-gdbserver-fix-uClibc-whithout-MMU.patch
deleted file mode 100644
index 42168df..0000000
--- a/package/gdb/7.8.2/0001-gdbserver-fix-uClibc-whithout-MMU.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 59432cbfe267ad89b7cfc73dcd702b8282ef4e9d Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Fri, 10 Apr 2015 22:58:07 +0200
-Subject: [PATCH] gdbserver: fix uClibc whithout MMU.
-
-Since commit d86d4aafd4fa22fa4cccb83253fb187b03f97f48, the pid
-must be retrieved from current_inferior.
-
-The change has not been made in the function linux_read_offsets().
-
-Fixes:
-http://autobuild.buildroot.net/results/9e4/9e4df085319e346803c26c65478accb27eb950ae/build-end.log
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- gdb/gdbserver/linux-low.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
-index 1a40897..71d078a 100644
---- a/gdb/gdbserver/linux-low.c
-+++ b/gdb/gdbserver/linux-low.c
-@@ -4933,7 +4933,7 @@ static int
- linux_read_offsets (CORE_ADDR *text_p, CORE_ADDR *data_p)
- {
-   unsigned long text, text_end, data;
--  int pid = lwpid_of (get_thread_lwp (current_inferior));
-+  int pid = lwpid_of (current_inferior);
- 
-   errno = 0;
- 
--- 
-1.9.3
-
diff --git a/package/gdb/7.8.2/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch b/package/gdb/7.8.2/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
deleted file mode 100644
index 93fe749..0000000
--- a/package/gdb/7.8.2/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From deb44829ecc1dd38275af0fcf91acd319e227a89 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Fri, 17 Apr 2015 03:07:41 +0300
-Subject: [PATCH 1/2] gdbserver/xtensa: drop xtensa_usrregs_info
-
-xtensa_usrregs_info refers to undefined variables xtensa_num_regs and
-xtensa_regmap. Drop xtensa_usrregs_info and replace pointer to usrregs
-in regs_info with NULL since all registers are read/set through regsets.
-
-2015-04-17  Max Filippov  <jcmvbkbc@gmail.com>
-gdb/gdbserver/
-	* linux-xtensa-low.c (xtensa_usrregs_info): Remove.
-	(regs_info): Replace usrregs pointer with NULL.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: deb44829ecc1dd38275af0fcf91acd319e227a89
-Changes to ChangeLog are dropped.
-
- gdb/gdbserver/linux-xtensa-low.c | 8 +-------
- 2 files changed, 6 insertions(+), 7 deletions(-)
-
-diff --git a/gdb/gdbserver/linux-xtensa-low.c b/gdb/gdbserver/linux-xtensa-low.c
-index f7fafaf..e786da5 100644
---- a/gdb/gdbserver/linux-xtensa-low.c
-+++ b/gdb/gdbserver/linux-xtensa-low.c
-@@ -186,16 +186,10 @@ static struct regsets_info xtensa_regsets_info =
-     NULL, /* disabled_regsets */
-   };
- 
--static struct usrregs_info xtensa_usrregs_info =
--  {
--    xtensa_num_regs,
--    xtensa_regmap,
--  };
--
- static struct regs_info regs_info =
-   {
-     NULL, /* regset_bitmap */
--    &xtensa_usrregs_info,
-+    NULL, /* usrregs */
-     &xtensa_regsets_info
-   };
- 
--- 
-1.8.1.4
-
diff --git a/package/gdb/7.8.2/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch b/package/gdb/7.8.2/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
deleted file mode 100644
index 027f700..0000000
--- a/package/gdb/7.8.2/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From a2d5a9d76f2366ed93095fc5a63eafa06b22f808 Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Fri, 17 Apr 2015 02:52:50 +0300
-Subject: [PATCH 2/2] gdbserver/xtensa: fix typo in XCHAL_HAVE_LOOPS
-
-This fixes lbeg/lend/lcount registers handling through gdbserver.
-
-2015-04-17  Max Filippov  <jcmvbkbc@gmail.com>
-gdb/gdbserver/
-	* linux-xtensa-low.c (xtensa_fill_gregset)
-	(xtensa_store_gregset): Check XCHAL_HAVE_LOOPS instead of
-	XCHAL_HAVE_LOOP.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: a2d5a9d76f2366ed93095fc5a63eafa06b22f808
-Changes to ChangeLog are dropped.
-
- gdb/gdbserver/linux-xtensa-low.c | 4 ++--
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/gdb/gdbserver/linux-xtensa-low.c b/gdb/gdbserver/linux-xtensa-low.c
-index e786da5..4daccee 100644
---- a/gdb/gdbserver/linux-xtensa-low.c
-+++ b/gdb/gdbserver/linux-xtensa-low.c
-@@ -59,7 +59,7 @@ xtensa_fill_gregset (struct regcache *regcache, void *buf)
- 
-   /* Loop registers, if hardware has it.  */
- 
--#if XCHAL_HAVE_LOOP
-+#if XCHAL_HAVE_LOOPS
-   collect_register_by_name (regcache, "lbeg", (char*)&rset[R_LBEG]);
-   collect_register_by_name (regcache, "lend", (char*)&rset[R_LEND]);
-   collect_register_by_name (regcache, "lcount", (char*)&rset[R_LCOUNT]);
-@@ -94,7 +94,7 @@ xtensa_store_gregset (struct regcache *regcache, const void *buf)
- 
-   /* Loop registers, if hardware has it.  */
- 
--#if XCHAL_HAVE_LOOP
-+#if XCHAL_HAVE_LOOPS
-   supply_register_by_name (regcache, "lbeg", (char*)&rset[R_LBEG]);
-   supply_register_by_name (regcache, "lend", (char*)&rset[R_LEND]);
-   supply_register_by_name (regcache, "lcount", (char*)&rset[R_LCOUNT]);
--- 
-1.8.1.4
-
diff --git a/package/gdb/7.8.2/0004-Add-some-casts-for-building-on-musl.patch b/package/gdb/7.8.2/0004-Add-some-casts-for-building-on-musl.patch
deleted file mode 100644
index bf20c03..0000000
--- a/package/gdb/7.8.2/0004-Add-some-casts-for-building-on-musl.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From d41401ace01c234f42697e190a2ac95991780626 Mon Sep 17 00:00:00 2001
-From: Doug Evans <dje@google.com>
-Date: Mon, 26 Oct 2015 13:20:12 -0700
-Subject: [PATCH] Add some casts for building on musl.
-
-gdb/ChangeLog:
-
-	* linux-thread-db.c (find_new_threads_callback): Cast ti.ti_tid to
-	unsigned long for debug_printf.
-	(thread_db_pid_to_str): Ditto.
-
-gdb/gdbserver/ChangeLog:
-
-	* thread-db.c (find_one_thread): Cast ti.ti_tid to unsigned long
-	for debug_printf.
-	(attach_thread, find_new_threads_callback): Ditto.
-
-[Arnout: removed the parts that don't apply, including ChangeLog]
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- gdb/ChangeLog             | 5 +++++
- gdb/gdbserver/ChangeLog   | 6 ++++++
- gdb/gdbserver/thread-db.c | 9 +++++----
- gdb/linux-thread-db.c     | 5 +++--
- 4 files changed, 19 insertions(+), 6 deletions(-)
-
-diff --git a/gdb/gdbserver/thread-db.c b/gdb/gdbserver/thread-db.c
-index ffe722d..3df10ff 100644
---- a/gdb/gdbserver/thread-db.c
-+++ b/gdb/gdbserver/thread-db.c
-@@ -278,7 +278,7 @@ find_one_thread (ptid_t ptid)
- 
-   if (debug_threads)
-     debug_printf ("Found thread %ld (LWP %d)\n",
--		  ti.ti_tid, ti.ti_lid);
-+		  (unsigned long) ti.ti_tid, ti.ti_lid);
- 
-   if (lwpid != ti.ti_lid)
-     {
-@@ -319,12 +319,12 @@ attach_thread (const td_thrhandle_t *th_p, td_thrinfo_t *ti_p)
- 
-   if (debug_threads)
-     debug_printf ("Attaching to thread %ld (LWP %d)\n",
--		  ti_p->ti_tid, ti_p->ti_lid);
-+		  (unsigned long) ti_p->ti_tid, ti_p->ti_lid);
-   err = linux_attach_lwp (ptid);
-   if (err != 0)
-     {
-       warning ("Could not attach to thread %ld (LWP %d): %s\n",
--	       ti_p->ti_tid, ti_p->ti_lid,
-+	       (unsigned long) ti_p->ti_tid, ti_p->ti_lid,
- 	       linux_attach_fail_reason_string (ptid, err));
-       return 0;
-     }
-diff --git a/gdb/linux-thread-db.c b/gdb/linux-thread-db.c
-index 66e9595..41db29a 100644
---- a/gdb/linux-thread-db.c
-+++ b/gdb/linux-thread-db.c
-@@ -1816,7 +1817,7 @@ thread_db_pid_to_str (struct target_ops *ops, ptid_t ptid)
- 
-       tid = thread_info->priv->tid;
-       snprintf (buf, sizeof (buf), "Thread 0x%lx (LWP %ld)",
--		tid, ptid_get_lwp (ptid));
-+		(unsigned long) tid, ptid_get_lwp (ptid));
- 
-       return buf;
-     }
--- 
-1.9.4
-
diff --git a/package/gdb/7.8.2/0005-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch b/package/gdb/7.8.2/0005-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
deleted file mode 100644
index 60c357c..0000000
--- a/package/gdb/7.8.2/0005-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 963843d4d07aef6caa296dacf191f8adc9518596 Mon Sep 17 00:00:00 2001
-From: Doug Evans <dje@google.com>
-Date: Mon, 26 Oct 2015 13:24:01 -0700
-Subject: [PATCH] musl: Move W_STOPCODE to common/gdb_wait.h.
-
-gdb/ChangeLog:
-
-	* common/gdb_wait.h (W_STOPCODE): Define, moved here from
-	gdbserver/linux-low.c.
-	(WSETSTOP): Simplify.
-
-gdb/gdbserver/ChangeLog:
-
-	* linux-low.c (W_STOPCODE): Moved to common/gdb_wait.h.
-
-[Arnout: removed the parts that don't apply, including ChangeLog]
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- gdb/ChangeLog             | 6 ++++++
- gdb/common/gdb_wait.h     | 8 ++++----
- gdb/gdbserver/ChangeLog   | 4 ++++
- gdb/gdbserver/linux-low.c | 4 ----
- 4 files changed, 14 insertions(+), 8 deletions(-)
-
-diff --git a/gdb/common/gdb_wait.h b/gdb/common/gdb_wait.h
-index 9b250d2..412f813 100644
---- a/gdb/common/gdb_wait.h
-+++ b/gdb/common/gdb_wait.h
-@@ -85,12 +85,12 @@
- # endif
- #endif
- 
-+#ifndef W_STOPCODE
-+#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
-+#endif
-+
- #ifndef	WSETSTOP
--# ifdef	W_STOPCODE
- #define	WSETSTOP(w,sig)    ((w) = W_STOPCODE(sig))
--# else
--#define WSETSTOP(w,sig)	   ((w) = (0177 | ((sig) << 8)))
--# endif
- #endif
- 
- /* For native GNU/Linux we may use waitpid and the __WCLONE option.
-diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
-index 0c552b8..7ed67c7 100644
---- a/gdb/gdbserver/linux-low.c
-+++ b/gdb/gdbserver/linux-low.c
-@@ -70,10 +70,6 @@
- #define O_LARGEFILE 0
- #endif
- 
--#ifndef W_STOPCODE
--#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
--#endif
--
- /* This is the kernel's hard limit.  Not to be confused with
-    SIGRTMIN.  */
- #ifndef __SIGRTMIN
--- 
-1.9.4
-
diff --git a/package/gdb/7.8.2/0006-move-__SIGRTMIN.patch b/package/gdb/7.8.2/0006-move-__SIGRTMIN.patch
deleted file mode 100644
index 38ba1f0..0000000
--- a/package/gdb/7.8.2/0006-move-__SIGRTMIN.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 682b25469e66ea45b214e95962671373983c118f Mon Sep 17 00:00:00 2001
-From: Doug Evans <dje@google.com>
-Date: Mon, 26 Oct 2015 13:30:57 -0700
-Subject: [PATCH] Move __SIGRTMIN.
-
-gdb/ChangeLog:
-
-	* nat/linux-nat.h (__SIGRTMIN): Move here from gdbserver/linux-low.c.
-
-gdb/gdbserver/ChangeLog:
-
-	* linux-low.c (__SIGRTMIN): Move to nat/linux-nat.h.
-
-[Arnout: removed the parts that don't apply, including ChangeLog]
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- gdb/ChangeLog             | 4 ++++
- gdb/gdbserver/ChangeLog   | 4 ++++
- gdb/gdbserver/linux-low.c | 6 ------
- gdb/nat/linux-nat.h       | 5 +++++
- 4 files changed, 13 insertions(+), 6 deletions(-)
-
-diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
-index 7ed67c7..e778c4c 100644
---- a/gdb/gdbserver/linux-low.c
-+++ b/gdb/gdbserver/linux-low.c
-@@ -70,12 +70,6 @@
- #define O_LARGEFILE 0
- #endif
- 
--/* This is the kernel's hard limit.  Not to be confused with
--   SIGRTMIN.  */
--#ifndef __SIGRTMIN
--#define __SIGRTMIN 32
--#endif
--
- /* Some targets did not define these ptrace constants from the start,
-    so gdbserver defines them locally here.  In the future, these may
-    be removed after they are added to asm/ptrace.h.  */
-diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
-index 0633fa9..70e6274 100644
---- a/gdb/nat/linux-nat.h
-+++ b/gdb/nat/linux-nat.h
-@@ -25,6 +25,11 @@
- struct lwp_info;
- struct arch_lwp_info;
- 
-+/* This is the kernel's hard limit.  Not to be confused with SIGRTMIN.  */
-+#ifndef __SIGRTMIN
-+#define __SIGRTMIN 32
-+#endif
-+
- /* Unlike other extended result codes, WSTOPSIG (status) on
-    PTRACE_O_TRACESYSGOOD syscall events doesn't return SIGTRAP, but
-    instead SIGTRAP with bit 7 set.  */
--- 
-1.9.4
-
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 46e00f6..d006fb7 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -31,9 +31,6 @@ choice
 	help
 	  Select the version of gdb you wish to use.
 
-	config BR2_GDB_VERSION_7_8
-		bool "gdb 7.8.x"
-
 	config BR2_GDB_VERSION_7_9
 		bool "gdb 7.9.x"
 
@@ -53,7 +50,6 @@ config BR2_GDB_VERSION
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
 	default "arc-2016.03-rc2-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
-	default "7.8.2"	   if BR2_GDB_VERSION_7_8
 	default "7.9.1"    if BR2_GDB_VERSION_7_9
 	default "7.10.1"   if BR2_GDB_VERSION_7_10 || !BR2_PACKAGE_HOST_GDB
 	default "7.11"	   if BR2_GDB_VERSION_7_11
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 87ce09c..0fec3d0 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,5 +1,4 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
-sha512	face5bf1b4ce144fc8604fc84620beed956177a11fd632b4e41906fc7f632910b2b43a50e6cfdfd6cbd876ee527c813bddab8df29dc560a6c36694cdb8edc4e4	gdb-7.8.2.tar.xz
 sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
 sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
 sha512  eadd2a59a1e48b1484eb2bea85256d6b1912926bc8b690793d02babf2639608bd22a0f2de77d4f60092da3b1dafeaa6d75a7cff3e84bd4e22fc46364b68e5e9f	gdb-7.11.tar.xz
