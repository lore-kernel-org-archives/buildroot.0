From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri,  5 Mar 2021 14:48:38 +0100
Subject: [Buildroot] [PATCH 3/3] package/openblas: respect the optimization
 level specified by Buildroot
In-Reply-To: <20210305134839.30612-1-patrickdepinguin@gmail.com>
References: <20210305134839.30612-1-patrickdepinguin@gmail.com>
Message-ID: <20210305134839.30612-3-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

openblas internally sets -O2, after the flags being passed by Buildroot
(e.g. -Os).

Patch openblas to let the Buildroot-specified flag survives.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 ...don-t-specify-optimization-level-bui.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/openblas/0004-Makefile.system-don-t-specify-optimization-level-bui.patch

As this openblas patch is quite specific to Buildroot (the problem is hard to
handle generically as you don't really know which flags the user may manipulate
on the command-line), I don't think this can be upstreamed.

diff --git a/package/openblas/0004-Makefile.system-don-t-specify-optimization-level-bui.patch b/package/openblas/0004-Makefile.system-don-t-specify-optimization-level-bui.patch
new file mode 100644
index 0000000000..bcc3e0eb6a
--- /dev/null
+++ b/package/openblas/0004-Makefile.system-don-t-specify-optimization-level-bui.patch
@@ -0,0 +1,40 @@
+From 6d1c1350977d74fb2239f765bd92a5763cd3bb73 Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Date: Fri, 5 Mar 2021 14:09:23 +0100
+Subject: [PATCH] Makefile.system: don't specify optimization level
+ [buildroot-specific]
+
+Buildroot will pass an optimization level, but it is ignored because the
+openblas makefiles _append_ to the flags passed on the command-line.
+
+The CFLAGS/FFLAGS would e.g. contain '-Os -O2' in which -O2 survives.
+
+Remove the optimization level specified in openblas itself.
+
+Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+
+---
+ Makefile.system | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.system b/Makefile.system
+index 1e30d05a..04b0be16 100644
+--- a/Makefile.system
++++ b/Makefile.system
+@@ -1216,11 +1216,11 @@ FCOMMON_OPT += -g
+ endif
+ 
+ ifndef COMMON_OPT
+-COMMON_OPT = -O2
++COMMON_OPT =
+ endif
+ 
+ ifndef FCOMMON_OPT
+-FCOMMON_OPT = -O2 -frecursive
++FCOMMON_OPT = -frecursive
+ endif
+ 
+ override CFLAGS     += $(COMMON_OPT) $(CCOMMON_OPT) -I$(TOPDIR)
+-- 
+2.26.2
+
-- 
2.26.2
