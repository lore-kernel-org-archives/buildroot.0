From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 14 Dec 2016 14:40:58 +0100
Subject: [Buildroot] [PATCH 3/3] package/gdb: remove version 7.9
In-Reply-To: <20161214134058.29826-1-joerg.krause@embedded.rocks>
References: <20161214134058.29826-1-joerg.krause@embedded.rocks>
Message-ID: <20161214134058.29826-3-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that 7.12 has been added and 7.11 is the default version, let's
remove the old 7.9 release.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 Config.in.legacy                                   |   7 +
 .../0001-gdbserver-fix-uClibc-whithout-MMU.patch   |  34 ---
 ...gdbserver-xtensa-drop-xtensa_usrregs_info.patch |  47 ----
 ...erver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch |  46 ----
 .../7.9.1/0004-xtensa-implement-NPTL-helpers.patch | 267 ---------------------
 .../0005-Add-some-casts-for-building-on-musl.patch |  70 ------
 ...musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch |  63 -----
 package/gdb/7.9.1/0007-move-__SIGRTMIN.patch       |  58 -----
 package/gdb/Config.in.host                         |   4 -
 package/gdb/gdb.hash                               |   1 -
 10 files changed, 7 insertions(+), 590 deletions(-)
 delete mode 100644 package/gdb/7.9.1/0001-gdbserver-fix-uClibc-whithout-MMU.patch
 delete mode 100644 package/gdb/7.9.1/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
 delete mode 100644 package/gdb/7.9.1/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
 delete mode 100644 package/gdb/7.9.1/0004-xtensa-implement-NPTL-helpers.patch
 delete mode 100644 package/gdb/7.9.1/0005-Add-some-casts-for-building-on-musl.patch
 delete mode 100644 package/gdb/7.9.1/0006-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
 delete mode 100644 package/gdb/7.9.1/0007-move-__SIGRTMIN.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index b42eb41..3c672ee 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -194,6 +194,13 @@ config BR2_PACKAGE_SNOWBALL_INIT
 	  We no longer have support for the Snowball platform in
 	  Buildroot, so this package was no longer useful.
 
+config BR2_GDB_VERSION_7_9
+	bool "gdb 7.9 has been removed"
+	select BR2_LEGACY
+	help
+	  The 7.9 version of gdb has been removed. Use a newer version
+	  instead.
+
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
diff --git a/package/gdb/7.9.1/0001-gdbserver-fix-uClibc-whithout-MMU.patch b/package/gdb/7.9.1/0001-gdbserver-fix-uClibc-whithout-MMU.patch
deleted file mode 100644
index 340db67..0000000
--- a/package/gdb/7.9.1/0001-gdbserver-fix-uClibc-whithout-MMU.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 570805e96bb8c458795b04f4745700795997ef40 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Fri, 10 Apr 2015 22:58:07 +0200
-Subject: [PATCH] gdbserver: fix uClibc whithout MMU.
-
-Since commit d86d4aafd4fa22fa4cccb83253fb187b03f97f48, the pid
-must be retrieved from current_thread.
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
-index 4d19c87..7585b80 100644
---- a/gdb/gdbserver/linux-low.c
-+++ b/gdb/gdbserver/linux-low.c
-@@ -4933,7 +4933,7 @@ static int
- linux_read_offsets (CORE_ADDR *text_p, CORE_ADDR *data_p)
- {
-   unsigned long text, text_end, data;
--  int pid = lwpid_of (get_thread_lwp (current_thread));
-+  int pid = lwpid_of (current_thread);
- 
-   errno = 0;
- 
--- 
-1.9.3
-
diff --git a/package/gdb/7.9.1/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch b/package/gdb/7.9.1/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
deleted file mode 100644
index 93fe749..0000000
--- a/package/gdb/7.9.1/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
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
diff --git a/package/gdb/7.9.1/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch b/package/gdb/7.9.1/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
deleted file mode 100644
index 027f700..0000000
--- a/package/gdb/7.9.1/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
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
diff --git a/package/gdb/7.9.1/0004-xtensa-implement-NPTL-helpers.patch b/package/gdb/7.9.1/0004-xtensa-implement-NPTL-helpers.patch
deleted file mode 100644
index e7bc74e..0000000
--- a/package/gdb/7.9.1/0004-xtensa-implement-NPTL-helpers.patch
+++ /dev/null
@@ -1,267 +0,0 @@
-From d4eb69fc4b50f9a0babd70b28d0601b40f31bd0f Mon Sep 17 00:00:00 2001
-From: Max Filippov <jcmvbkbc@gmail.com>
-Date: Thu, 2 Jul 2015 15:10:58 +0300
-Subject: [PATCH] xtensa: implement NPTL helpers
-
-These changes allow debugging multithreaded NPTL xtensa applications.
-
-2015-08-20  Max Filippov  <jcmvbkbc@gmail.com>
-gdb/gdbserver/
-	* configure.srv (xtensa*-*-linux*): Add srv_linux_thread_db=yes.
-	* linux-xtensa-low.c (arch/xtensa.h gdb_proc_service.h): New
-	#includes.
-	(ps_get_thread_area): New function.
-
-2015-08-20  Max Filippov  <jcmvbkbc@gmail.com>
-gdb/
-	* arch/xtensa.h: New file.
-	* xtensa-linux-nat.c (gdb_proc_service.h): New #include.
-	(ps_get_thread_area): New function.
-	* xtensa-linux-tdep.c (xtensa_linux_init_abi): Add call to
-	set_gdbarch_fetch_tls_load_module_address to enable TLS support.
-	* xtensa-tdep.c (osabi.h): New #include.
-	(xtensa_gdbarch_init): Call gdbarch_init_osabi to register
-	xtensa-specific hooks.
-	* xtensa-tdep.h (struct xtensa_elf_gregset_t): Add threadptr
-	member and move the structure to arch/xtensa.h.
-
-Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
----
-Backported from: 40045d91812b25c88c8275b8c08d27c234b68ba8
-Changes to ChangeLog files are dropped.
-
- gdb/arch/xtensa.h                | 46 ++++++++++++++++++++++++++++++++++++++++
- gdb/gdbserver/configure.srv      |  1 +
- gdb/gdbserver/linux-xtensa-low.c | 21 ++++++++++++++++++
- gdb/xtensa-linux-nat.c           | 22 ++++++++++++++++++
- gdb/xtensa-linux-tdep.c          |  4 ++++
- gdb/xtensa-tdep.c                |  4 ++++
- gdb/xtensa-tdep.h                | 24 ++------------------
- 7 files changed, 100 insertions(+), 22 deletions(-)
- create mode 100644 gdb/arch/xtensa.h
-
-diff --git a/gdb/arch/xtensa.h b/gdb/arch/xtensa.h
-new file mode 100644
-index 0000000..fe96584
---- /dev/null
-+++ b/gdb/arch/xtensa.h
-@@ -0,0 +1,46 @@
-+/* Common Target-dependent code for the Xtensa port of GDB, the GNU debugger.
-+
-+   Copyright (C) 2003-2015 Free Software Foundation, Inc.
-+
-+   This file is part of GDB.
-+
-+   This program is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by
-+   the Free Software Foundation; either version 3 of the License, or
-+   (at your option) any later version.
-+
-+   This program is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+   GNU General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License
-+   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
-+
-+#ifndef XTENSA_H
-+#define XTENSA_H
-+
-+/* Xtensa ELF core file register set representation ('.reg' section).
-+   Copied from target-side ELF header <xtensa/elf.h>.  */
-+
-+typedef uint32_t xtensa_elf_greg_t;
-+
-+typedef struct
-+{
-+  xtensa_elf_greg_t pc;
-+  xtensa_elf_greg_t ps;
-+  xtensa_elf_greg_t lbeg;
-+  xtensa_elf_greg_t lend;
-+  xtensa_elf_greg_t lcount;
-+  xtensa_elf_greg_t sar;
-+  xtensa_elf_greg_t windowstart;
-+  xtensa_elf_greg_t windowbase;
-+  xtensa_elf_greg_t threadptr;
-+  xtensa_elf_greg_t reserved[7+48];
-+  xtensa_elf_greg_t ar[64];
-+} xtensa_elf_gregset_t;
-+
-+#define XTENSA_ELF_NGREG (sizeof (xtensa_elf_gregset_t) \
-+			  / sizeof (xtensa_elf_greg_t))
-+
-+#endif
-diff --git a/gdb/gdbserver/configure.srv b/gdb/gdbserver/configure.srv
-index 0b18d1d..320c26a 100644
---- a/gdb/gdbserver/configure.srv
-+++ b/gdb/gdbserver/configure.srv
-@@ -352,6 +352,7 @@ case "${target}" in
-   xtensa*-*-linux*)	srv_regobj=reg-xtensa.o
- 			srv_tgtobj="$srv_linux_obj linux-xtensa-low.o"
- 			srv_linux_regsets=yes
-+			srv_linux_thread_db=yes
- 			;;
-   tilegx-*-linux*)	srv_regobj=reg-tilegx.o
- 			srv_regobj="${srv_regobj} reg-tilegx32.o"
-diff --git a/gdb/gdbserver/linux-xtensa-low.c b/gdb/gdbserver/linux-xtensa-low.c
-index 4daccee..debe467 100644
---- a/gdb/gdbserver/linux-xtensa-low.c
-+++ b/gdb/gdbserver/linux-xtensa-low.c
-@@ -26,6 +26,8 @@ extern const struct target_desc *tdesc_xtensa;
- 
- #include <asm/ptrace.h>
- #include <xtensa-config.h>
-+#include "arch/xtensa.h"
-+#include "gdb_proc_service.h"
- 
- #include "xtensa-xtregs.c"
- 
-@@ -179,6 +181,25 @@ xtensa_breakpoint_at (CORE_ADDR where)
- 		  xtensa_breakpoint, xtensa_breakpoint_len) == 0;
- }
- 
-+/* Called by libthread_db.  */
-+
-+ps_err_e
-+ps_get_thread_area (const struct ps_prochandle *ph,
-+                    lwpid_t lwpid, int idx, void **base)
-+{
-+  xtensa_elf_gregset_t regs;
-+
-+  if (ptrace (PTRACE_GETREGS, lwpid, NULL, &regs) != 0)
-+    return PS_ERR;
-+
-+  /* IDX is the bias from the thread pointer to the beginning of the
-+     thread descriptor.  It has to be subtracted due to implementation
-+     quirks in libthread_db.  */
-+  *base = (void *) ((char *) regs.threadptr - idx);
-+
-+  return PS_OK;
-+}
-+
- static struct regsets_info xtensa_regsets_info =
-   {
-     xtensa_regsets, /* regsets */
-diff --git a/gdb/xtensa-linux-nat.c b/gdb/xtensa-linux-nat.c
-index 77ad3e0..5538d5b 100644
---- a/gdb/xtensa-linux-nat.c
-+++ b/gdb/xtensa-linux-nat.c
-@@ -37,6 +37,9 @@
- #include "gregset.h"
- #include "xtensa-tdep.h"
- 
-+/* Defines ps_err_e, struct ps_prochandle.  */
-+#include "gdb_proc_service.h"
-+
- /* Extended register set depends on hardware configs.
-    Keeping these definitions separately allows to introduce
-    hardware-specific overlays.  */
-@@ -280,6 +283,25 @@ xtensa_linux_store_inferior_registers (struct target_ops *ops,
-     store_xtregs (regcache, regnum);
- }
- 
-+/* Called by libthread_db.  */
-+
-+ps_err_e
-+ps_get_thread_area (const struct ps_prochandle *ph,
-+                    lwpid_t lwpid, int idx, void **base)
-+{
-+  xtensa_elf_gregset_t regs;
-+
-+  if (ptrace (PTRACE_GETREGS, lwpid, NULL, &regs) != 0)
-+    return PS_ERR;
-+
-+  /* IDX is the bias from the thread pointer to the beginning of the
-+     thread descriptor.  It has to be subtracted due to implementation
-+     quirks in libthread_db.  */
-+  *base = (void *) ((char *) regs.threadptr - idx);
-+
-+  return PS_OK;
-+}
-+
- void _initialize_xtensa_linux_nat (void);
- 
- void
-diff --git a/gdb/xtensa-linux-tdep.c b/gdb/xtensa-linux-tdep.c
-index 61ea9b0..99e0d3e 100644
---- a/gdb/xtensa-linux-tdep.c
-+++ b/gdb/xtensa-linux-tdep.c
-@@ -106,6 +106,10 @@ xtensa_linux_init_abi (struct gdbarch_info info, struct gdbarch *gdbarch)
- 				      xtensa_linux_gdb_signal_from_target);
-   set_gdbarch_gdb_signal_to_target (gdbarch,
- 				    xtensa_linux_gdb_signal_to_target);
-+
-+  /* Enable TLS support.  */
-+  set_gdbarch_fetch_tls_load_module_address (gdbarch,
-+                                             svr4_fetch_objfile_link_map);
- }
- 
- /* Provide a prototype to silence -Wmissing-prototypes.  */
-diff --git a/gdb/xtensa-tdep.c b/gdb/xtensa-tdep.c
-index 55e7d98..4b693ed 100644
---- a/gdb/xtensa-tdep.c
-+++ b/gdb/xtensa-tdep.c
-@@ -28,6 +28,7 @@
- #include "value.h"
- #include "dis-asm.h"
- #include "inferior.h"
-+#include "osabi.h"
- #include "floatformat.h"
- #include "regcache.h"
- #include "reggroups.h"
-@@ -3273,6 +3274,9 @@ xtensa_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
-   set_solib_svr4_fetch_link_map_offsets
-     (gdbarch, svr4_ilp32_fetch_link_map_offsets);
- 
-+  /* Hook in the ABI-specific overrides, if they have been registered.  */
-+  gdbarch_init_osabi (info, gdbarch);
-+
-   return gdbarch;
- }
- 
-diff --git a/gdb/xtensa-tdep.h b/gdb/xtensa-tdep.h
-index caa2988..5b28cab 100644
---- a/gdb/xtensa-tdep.h
-+++ b/gdb/xtensa-tdep.h
-@@ -18,6 +18,8 @@
-    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- 
- 
-+#include "arch/xtensa.h"
-+
- /* XTENSA_TDEP_VERSION can/should be changed along with XTENSA_CONFIG_VERSION
-    whenever the "tdep" structure changes in an incompatible way.  */
- 
-@@ -81,28 +83,6 @@ typedef enum
- } xtensa_target_flags_t;
- 
- 
--/* Xtensa ELF core file register set representation ('.reg' section).
--   Copied from target-side ELF header <xtensa/elf.h>.  */
--
--typedef uint32_t xtensa_elf_greg_t;
--
--typedef struct
--{
--  xtensa_elf_greg_t pc;
--  xtensa_elf_greg_t ps;
--  xtensa_elf_greg_t lbeg;
--  xtensa_elf_greg_t lend;
--  xtensa_elf_greg_t lcount;
--  xtensa_elf_greg_t sar;
--  xtensa_elf_greg_t windowstart;
--  xtensa_elf_greg_t windowbase;
--  xtensa_elf_greg_t reserved[8+48];
--  xtensa_elf_greg_t ar[64];
--} xtensa_elf_gregset_t;
--
--#define XTENSA_ELF_NGREG (sizeof (xtensa_elf_gregset_t) \
--			  / sizeof (xtensa_elf_greg_t))
--
- /*  Mask.  */
- 
- typedef struct 
--- 
-1.8.1.4
-
diff --git a/package/gdb/7.9.1/0005-Add-some-casts-for-building-on-musl.patch b/package/gdb/7.9.1/0005-Add-some-casts-for-building-on-musl.patch
deleted file mode 100644
index 2469eb7..0000000
--- a/package/gdb/7.9.1/0005-Add-some-casts-for-building-on-musl.patch
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
- 	       linux_ptrace_attach_fail_reason_string (ptid, err));
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
diff --git a/package/gdb/7.9.1/0006-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch b/package/gdb/7.9.1/0006-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
deleted file mode 100644
index 60c357c..0000000
--- a/package/gdb/7.9.1/0006-musl-Move-W_STOPCODE-to-common-gdb_wait-h.patch
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
diff --git a/package/gdb/7.9.1/0007-move-__SIGRTMIN.patch b/package/gdb/7.9.1/0007-move-__SIGRTMIN.patch
deleted file mode 100644
index 38ba1f0..0000000
--- a/package/gdb/7.9.1/0007-move-__SIGRTMIN.patch
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
index 3b2e279..3a187f0 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -39,9 +39,6 @@ choice
 	help
 	  Select the version of gdb you wish to use.
 
-	config BR2_GDB_VERSION_7_9
-		bool "gdb 7.9.x"
-
 	config BR2_GDB_VERSION_7_10
 		bool "gdb 7.10.x"
 
@@ -61,7 +58,6 @@ config BR2_GDB_VERSION
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
 	default "arc-2016.09-rc2-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
-	default "7.9.1"    if BR2_GDB_VERSION_7_9
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
 	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
 	default "7.12"     if BR2_GDB_VERSION_7_12
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index a44aaa3..c63d5e2 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,5 +1,4 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
-sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
 sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
 sha512  f80ec6c8a0f0b54c8b945666e875809174402b7e121efb378ebac931a91f9a1cc0048568f8e2f42ae8ae2392ff8d144c2e51d41c7398935017450aaf29838360	gdb-7.11.1.tar.xz
 sha512  f610338b3a24dfb387c295431d806a0c1375e8ce51b8dd8bbfd2efc4612d0c0ed40ad4393508afca0071eca70688f62bc4f199da5e75ad16f64d91c3bc046033	gdb-7.12.tar.xz
-- 
2.10.2
