From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Mar 2016 11:32:21 -0300
Subject: [Buildroot] [PATCH 4/7] gdb: remove deprecated version 7.7
In-Reply-To: <1457706744-23401-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457706744-23401-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1457706744-23401-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's been deprecated for a year now so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy                                   |  7 +++
 ...lude-asm-ptrace.h-for-linux-aarch64-low.c.patch | 36 -----------
 ...clude-asm-ptrace.h-in-aarch64-linux-nat.c.patch | 37 -----------
 .../0003-Add-some-casts-for-building-on-musl.patch | 72 ----------------------
 ...musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch | 63 -------------------
 package/gdb/7.7.1/0005-move-__SIGRTMIN.patch       | 58 -----------------
 package/gdb/Config.in.host                         |  5 --
 package/gdb/gdb.hash                               |  1 -
 package/gdb/gdb.mk                                 |  5 --
 9 files changed, 7 insertions(+), 277 deletions(-)
 delete mode 100644 package/gdb/7.7.1/0001-Include-asm-ptrace.h-for-linux-aarch64-low.c.patch
 delete mode 100644 package/gdb/7.7.1/0002-Include-asm-ptrace.h-in-aarch64-linux-nat.c.patch
 delete mode 100644 package/gdb/7.7.1/0003-Add-some-casts-for-building-on-musl.patch
 delete mode 100644 package/gdb/7.7.1/0004-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
 delete mode 100644 package/gdb/7.7.1/0005-move-__SIGRTMIN.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index e03e30f..bb7c333 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_GDB_VERSION_7_7
+	bool "gdb 7.7 has been removed"
+	select BR2_LEGACY
+	help
+	  The 7.7 version of gdb has been removed. Use a newer version
+	  instead.
+
 config BR2_PACKAGE_FOOMATIC_FILTERS
 	bool "foomatic-filters"
 	select BR2_LEGACY
diff --git a/package/gdb/7.7.1/0001-Include-asm-ptrace.h-for-linux-aarch64-low.c.patch b/package/gdb/7.7.1/0001-Include-asm-ptrace.h-for-linux-aarch64-low.c.patch
deleted file mode 100644
index 89e34be..0000000
--- a/package/gdb/7.7.1/0001-Include-asm-ptrace.h-for-linux-aarch64-low.c.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From cbc39812c1721d7edd20285134fdf748d0f26127 Mon Sep 17 00:00:00 2001
-From: Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>
-Date: Fri, 23 May 2014 09:01:14 +0100
-Subject: [PATCH] Include asm/ptrace.h for linux-aarch64-low.c
-
-A recent change to glibc removed asm/ptrace.h from user.h for AArch64.
-This meant that cross-native builds of gdbserver using trunk glibc broke
-because linux-aarch64-low.c because user_hwdebug_state couldn't be found.
-
-This is like commit #036cd38182bde32d8297b630cd5c861d53b8949e
-
-2014-05-23  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
-
-        * linux-aarch64-low.c (asm/ptrace.h): Include.
-[Romain:
-  - rebase on top of 7.7.1]
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- gdb/gdbserver/linux-aarch64-low.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gdb/gdbserver/linux-aarch64-low.c b/gdb/gdbserver/linux-aarch64-low.c
-index 1b0da6c..ba66bc8 100644
---- a/gdb/gdbserver/linux-aarch64-low.c
-+++ b/gdb/gdbserver/linux-aarch64-low.c
-@@ -26,6 +26,7 @@
- #include <signal.h>
- #include <sys/user.h>
- #include <sys/ptrace.h>
-+#include <asm/ptrace.h>
- #include <sys/uio.h>
- 
- #include "gdb_proc_service.h"
--- 
-1.9.3
-
diff --git a/package/gdb/7.7.1/0002-Include-asm-ptrace.h-in-aarch64-linux-nat.c.patch b/package/gdb/7.7.1/0002-Include-asm-ptrace.h-in-aarch64-linux-nat.c.patch
deleted file mode 100644
index ccca8cb..0000000
--- a/package/gdb/7.7.1/0002-Include-asm-ptrace.h-in-aarch64-linux-nat.c.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 9c45794265a9dc9aebfbdc520d378dfc8fb7b694 Mon Sep 17 00:00:00 2001
-From: Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>
-Date: Thu, 22 May 2014 16:07:20 +0100
-Subject: [PATCH] Include asm/ptrace.h in aarch64-linux-nat.c
-
-A recent change to glibc removed asm/ptrace.h from user.h for
-AArch64. This meant that cross-native builds of gdb using trunk
-glibc broke because aarch64-linux-nat.c because user_hwdebug_state
-couldn't be found.
-
-Fixed by including asm/ptrace.h like other ports.
-
-2014-05-22  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
-
-       * aarch64-linux-nat.c (asm/ptrace.h): Include.
-
-[Romain: rebase on top of 7.7.1]
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- gdb/aarch64-linux-nat.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gdb/aarch64-linux-nat.c b/gdb/aarch64-linux-nat.c
-index 31c26c6..710aa9b 100644
---- a/gdb/aarch64-linux-nat.c
-+++ b/gdb/aarch64-linux-nat.c
-@@ -33,6 +33,7 @@
- 
- #include <sys/ptrace.h>
- #include <sys/utsname.h>
-+#include <asm/ptrace.h>
- 
- #include "gregset.h"
- 
--- 
-1.9.3
-
diff --git a/package/gdb/7.7.1/0003-Add-some-casts-for-building-on-musl.patch b/package/gdb/7.7.1/0003-Add-some-casts-for-building-on-musl.patch
deleted file mode 100644
index 2065283..0000000
--- a/package/gdb/7.7.1/0003-Add-some-casts-for-building-on-musl.patch
+++ /dev/null
@@ -1,72 +0,0 @@
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
-     fprintf (stderr, "Found thread %ld (LWP %d)\n",
--	     ti.ti_tid, ti.ti_lid);
-+	     (unsigned long) ti.ti_tid, ti.ti_lid);
-
-   if (lwpid != ti.ti_lid)
-     {
-@@ -319,11 +319,11 @@ attach_thread (const td_thrhandle_t *th_p, td_thrinfo_t *ti_p)
- 
-   if (debug_threads)
-     fprintf (stderr, "Attaching to thread %ld (LWP %d)\n",
--	     ti_p->ti_tid, ti_p->ti_lid);
-+	     (unsigned long) ti_p->ti_tid, ti_p->ti_lid);
-   linux_attach_lwp (ti_p->ti_lid);
-   lwp = find_lwp_pid (pid_to_ptid (ti_p->ti_lid));
-   if (lwp == NULL)
-     {
-       warning ("Could not attach to thread %ld (LWP %d)\n",
--	       ti_p->ti_tid, ti_p->ti_lid);
-+	       (unsigned long) ti_p->ti_tid, ti_p->ti_lid);
-       return 0;
-     }
- 
- 
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
diff --git a/package/gdb/7.7.1/0004-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch b/package/gdb/7.7.1/0004-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
deleted file mode 100644
index 60c357c..0000000
--- a/package/gdb/7.7.1/0004-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
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
diff --git a/package/gdb/7.7.1/0005-move-__SIGRTMIN.patch b/package/gdb/7.7.1/0005-move-__SIGRTMIN.patch
deleted file mode 100644
index 38ba1f0..0000000
--- a/package/gdb/7.7.1/0005-move-__SIGRTMIN.patch
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
index 6807694..b213901 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -31,10 +31,6 @@ choice
 	help
 	  Select the version of gdb you wish to use.
 
-	config BR2_GDB_VERSION_7_7
-		bool "gdb 7.7.x"
-		depends on BR2_DEPRECATED_SINCE_2015_05
-
 	config BR2_GDB_VERSION_7_8
 		bool "gdb 7.8.x"
 
@@ -54,7 +50,6 @@ config BR2_GDB_VERSION
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
 	default "arc-2015.12-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
-	default "7.7.1"    if BR2_GDB_VERSION_7_7
 	default "7.8.2"	   if BR2_GDB_VERSION_7_8
 	default "7.9.1"    if BR2_GDB_VERSION_7_9 || !BR2_PACKAGE_HOST_GDB
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 3abdcd0..caf1ef1 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,5 +1,4 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
-sha512	887b9b726dae8f6e3e5e41574460a67e4f9002b0d47bc985dcf63bdf3518397a90b6a208cb5b19e5ed2341715ad75cfeed4df4fb423f39f74218e36bc87f1cab	gdb-7.7.1.tar.bz2
 sha512	face5bf1b4ce144fc8604fc84620beed956177a11fd632b4e41906fc7f632910b2b43a50e6cfdfd6cbd876ee527c813bddab8df29dc560a6c36694cdb8edc4e4	gdb-7.8.2.tar.xz
 sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
 sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 32d52eb..ab38351 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -18,11 +18,6 @@ GDB_SITE = $(call github,Xilinx,gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 endif
 
-# Use .tar.bz2 for 7.7.x since there was no .tar.xz release back then
-ifneq ($(filter 7.7.%,$(GDB_VERSION)),)
-GDB_SOURCE = gdb-$(GDB_VERSION).tar.bz2
-endif
-
 GDB_LICENSE = GPLv2+, LGPLv2+, GPLv3+, LGPLv3+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
-- 
2.4.10
