From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 19 Apr 2015 15:35:12 +0300
Subject: [Buildroot] [PATCH] package/gdb: backport xtensa gdbserver fixes
Message-ID: <1429446912-3366-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 ...gdbserver-xtensa-drop-xtensa_usrregs_info.patch | 47 ++++++++++++++++++++++
 ...erver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch | 46 +++++++++++++++++++++
 ...gdbserver-xtensa-drop-xtensa_usrregs_info.patch | 47 ++++++++++++++++++++++
 ...erver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch | 46 +++++++++++++++++++++
 4 files changed, 186 insertions(+)
 create mode 100644 package/gdb/7.8.2/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
 create mode 100644 package/gdb/7.8.2/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
 create mode 100644 package/gdb/7.9/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
 create mode 100644 package/gdb/7.9/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch

diff --git a/package/gdb/7.8.2/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch b/package/gdb/7.8.2/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
new file mode 100644
index 0000000..93fe749
--- /dev/null
+++ b/package/gdb/7.8.2/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
@@ -0,0 +1,47 @@
+From deb44829ecc1dd38275af0fcf91acd319e227a89 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Fri, 17 Apr 2015 03:07:41 +0300
+Subject: [PATCH 1/2] gdbserver/xtensa: drop xtensa_usrregs_info
+
+xtensa_usrregs_info refers to undefined variables xtensa_num_regs and
+xtensa_regmap. Drop xtensa_usrregs_info and replace pointer to usrregs
+in regs_info with NULL since all registers are read/set through regsets.
+
+2015-04-17  Max Filippov  <jcmvbkbc@gmail.com>
+gdb/gdbserver/
+	* linux-xtensa-low.c (xtensa_usrregs_info): Remove.
+	(regs_info): Replace usrregs pointer with NULL.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: deb44829ecc1dd38275af0fcf91acd319e227a89
+Changes to ChangeLog are dropped.
+
+ gdb/gdbserver/linux-xtensa-low.c | 8 +-------
+ 2 files changed, 6 insertions(+), 7 deletions(-)
+
+diff --git a/gdb/gdbserver/linux-xtensa-low.c b/gdb/gdbserver/linux-xtensa-low.c
+index f7fafaf..e786da5 100644
+--- a/gdb/gdbserver/linux-xtensa-low.c
++++ b/gdb/gdbserver/linux-xtensa-low.c
+@@ -186,16 +186,10 @@ static struct regsets_info xtensa_regsets_info =
+     NULL, /* disabled_regsets */
+   };
+ 
+-static struct usrregs_info xtensa_usrregs_info =
+-  {
+-    xtensa_num_regs,
+-    xtensa_regmap,
+-  };
+-
+ static struct regs_info regs_info =
+   {
+     NULL, /* regset_bitmap */
+-    &xtensa_usrregs_info,
++    NULL, /* usrregs */
+     &xtensa_regsets_info
+   };
+ 
+-- 
+1.8.1.4
+
diff --git a/package/gdb/7.8.2/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch b/package/gdb/7.8.2/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
new file mode 100644
index 0000000..027f700
--- /dev/null
+++ b/package/gdb/7.8.2/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
@@ -0,0 +1,46 @@
+From a2d5a9d76f2366ed93095fc5a63eafa06b22f808 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Fri, 17 Apr 2015 02:52:50 +0300
+Subject: [PATCH 2/2] gdbserver/xtensa: fix typo in XCHAL_HAVE_LOOPS
+
+This fixes lbeg/lend/lcount registers handling through gdbserver.
+
+2015-04-17  Max Filippov  <jcmvbkbc@gmail.com>
+gdb/gdbserver/
+	* linux-xtensa-low.c (xtensa_fill_gregset)
+	(xtensa_store_gregset): Check XCHAL_HAVE_LOOPS instead of
+	XCHAL_HAVE_LOOP.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: a2d5a9d76f2366ed93095fc5a63eafa06b22f808
+Changes to ChangeLog are dropped.
+
+ gdb/gdbserver/linux-xtensa-low.c | 4 ++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/gdbserver/linux-xtensa-low.c b/gdb/gdbserver/linux-xtensa-low.c
+index e786da5..4daccee 100644
+--- a/gdb/gdbserver/linux-xtensa-low.c
++++ b/gdb/gdbserver/linux-xtensa-low.c
+@@ -59,7 +59,7 @@ xtensa_fill_gregset (struct regcache *regcache, void *buf)
+ 
+   /* Loop registers, if hardware has it.  */
+ 
+-#if XCHAL_HAVE_LOOP
++#if XCHAL_HAVE_LOOPS
+   collect_register_by_name (regcache, "lbeg", (char*)&rset[R_LBEG]);
+   collect_register_by_name (regcache, "lend", (char*)&rset[R_LEND]);
+   collect_register_by_name (regcache, "lcount", (char*)&rset[R_LCOUNT]);
+@@ -94,7 +94,7 @@ xtensa_store_gregset (struct regcache *regcache, const void *buf)
+ 
+   /* Loop registers, if hardware has it.  */
+ 
+-#if XCHAL_HAVE_LOOP
++#if XCHAL_HAVE_LOOPS
+   supply_register_by_name (regcache, "lbeg", (char*)&rset[R_LBEG]);
+   supply_register_by_name (regcache, "lend", (char*)&rset[R_LEND]);
+   supply_register_by_name (regcache, "lcount", (char*)&rset[R_LCOUNT]);
+-- 
+1.8.1.4
+
diff --git a/package/gdb/7.9/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch b/package/gdb/7.9/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
new file mode 100644
index 0000000..93fe749
--- /dev/null
+++ b/package/gdb/7.9/0002-gdbserver-xtensa-drop-xtensa_usrregs_info.patch
@@ -0,0 +1,47 @@
+From deb44829ecc1dd38275af0fcf91acd319e227a89 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Fri, 17 Apr 2015 03:07:41 +0300
+Subject: [PATCH 1/2] gdbserver/xtensa: drop xtensa_usrregs_info
+
+xtensa_usrregs_info refers to undefined variables xtensa_num_regs and
+xtensa_regmap. Drop xtensa_usrregs_info and replace pointer to usrregs
+in regs_info with NULL since all registers are read/set through regsets.
+
+2015-04-17  Max Filippov  <jcmvbkbc@gmail.com>
+gdb/gdbserver/
+	* linux-xtensa-low.c (xtensa_usrregs_info): Remove.
+	(regs_info): Replace usrregs pointer with NULL.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: deb44829ecc1dd38275af0fcf91acd319e227a89
+Changes to ChangeLog are dropped.
+
+ gdb/gdbserver/linux-xtensa-low.c | 8 +-------
+ 2 files changed, 6 insertions(+), 7 deletions(-)
+
+diff --git a/gdb/gdbserver/linux-xtensa-low.c b/gdb/gdbserver/linux-xtensa-low.c
+index f7fafaf..e786da5 100644
+--- a/gdb/gdbserver/linux-xtensa-low.c
++++ b/gdb/gdbserver/linux-xtensa-low.c
+@@ -186,16 +186,10 @@ static struct regsets_info xtensa_regsets_info =
+     NULL, /* disabled_regsets */
+   };
+ 
+-static struct usrregs_info xtensa_usrregs_info =
+-  {
+-    xtensa_num_regs,
+-    xtensa_regmap,
+-  };
+-
+ static struct regs_info regs_info =
+   {
+     NULL, /* regset_bitmap */
+-    &xtensa_usrregs_info,
++    NULL, /* usrregs */
+     &xtensa_regsets_info
+   };
+ 
+-- 
+1.8.1.4
+
diff --git a/package/gdb/7.9/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch b/package/gdb/7.9/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
new file mode 100644
index 0000000..027f700
--- /dev/null
+++ b/package/gdb/7.9/0003-gdbserver-xtensa-fix-typo-in-XCHAL_HAVE_LOOPS.patch
@@ -0,0 +1,46 @@
+From a2d5a9d76f2366ed93095fc5a63eafa06b22f808 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Fri, 17 Apr 2015 02:52:50 +0300
+Subject: [PATCH 2/2] gdbserver/xtensa: fix typo in XCHAL_HAVE_LOOPS
+
+This fixes lbeg/lend/lcount registers handling through gdbserver.
+
+2015-04-17  Max Filippov  <jcmvbkbc@gmail.com>
+gdb/gdbserver/
+	* linux-xtensa-low.c (xtensa_fill_gregset)
+	(xtensa_store_gregset): Check XCHAL_HAVE_LOOPS instead of
+	XCHAL_HAVE_LOOP.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: a2d5a9d76f2366ed93095fc5a63eafa06b22f808
+Changes to ChangeLog are dropped.
+
+ gdb/gdbserver/linux-xtensa-low.c | 4 ++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/gdbserver/linux-xtensa-low.c b/gdb/gdbserver/linux-xtensa-low.c
+index e786da5..4daccee 100644
+--- a/gdb/gdbserver/linux-xtensa-low.c
++++ b/gdb/gdbserver/linux-xtensa-low.c
+@@ -59,7 +59,7 @@ xtensa_fill_gregset (struct regcache *regcache, void *buf)
+ 
+   /* Loop registers, if hardware has it.  */
+ 
+-#if XCHAL_HAVE_LOOP
++#if XCHAL_HAVE_LOOPS
+   collect_register_by_name (regcache, "lbeg", (char*)&rset[R_LBEG]);
+   collect_register_by_name (regcache, "lend", (char*)&rset[R_LEND]);
+   collect_register_by_name (regcache, "lcount", (char*)&rset[R_LCOUNT]);
+@@ -94,7 +94,7 @@ xtensa_store_gregset (struct regcache *regcache, const void *buf)
+ 
+   /* Loop registers, if hardware has it.  */
+ 
+-#if XCHAL_HAVE_LOOP
++#if XCHAL_HAVE_LOOPS
+   supply_register_by_name (regcache, "lbeg", (char*)&rset[R_LBEG]);
+   supply_register_by_name (regcache, "lend", (char*)&rset[R_LEND]);
+   supply_register_by_name (regcache, "lcount", (char*)&rset[R_LCOUNT]);
+-- 
+1.8.1.4
+
-- 
1.8.1.4
