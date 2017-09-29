From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Sep 2017 15:47:09 +0200
Subject: [Buildroot] [PATCH] package/flex: really disable flex program
Message-ID: <20170929134709.24221-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit c128c5f3c7 (flex: Fix segfault of stage1flex when host has glibc
2.26 or newer) introduced an autoreconf of flex, but forgot to properly
account for the quirky way the flex program is disabled.

So far, we used to sed-out the bin_PROGRAMS from Makefile.in. But now
that we autoreconf, Makefile.in gets regenerated, and this breaks the
build on noMMU systems.

Since we autoreconf, let's add a patch to remove the flex binary
altogether.

Fixes:
    http://autobuild.buildroot.org/results/f70/f70b39632535bb9692d0a032166b2f4104532967/
    http://autobuild.buildroot.org/results/525/52567afdfe7992b3518de0e01227ba14aa300f21/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 .../0003-build-never-build-the-flex-program.patch  | 42 ++++++++++++++++++++++
 package/flex/flex.mk                               | 11 ------
 2 files changed, 42 insertions(+), 11 deletions(-)
 create mode 100644 package/flex/0003-build-never-build-the-flex-program.patch

diff --git a/package/flex/0003-build-never-build-the-flex-program.patch b/package/flex/0003-build-never-build-the-flex-program.patch
new file mode 100644
index 0000000000..550df179c9
--- /dev/null
+++ b/package/flex/0003-build-never-build-the-flex-program.patch
@@ -0,0 +1,42 @@
+From 097a4408b83a0bf8c584bbe4fe0239581b183732 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Fri, 29 Sep 2017 15:41:14 +0200
+Subject: [PATCH] build: never build the flex program
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Upstream status: not suitable, only for Buildroot.
+---
+ Makefile.am     | 4 ----
+ src/Makefile.am | 1 -
+ 2 files changed, 5 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 9db3420..3d61159 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -58,8 +58,4 @@ ChangeLog: $(srcdir)/tools/git2cl
+ indent:
+ 	cd src && $(MAKE) $(AM_MAKEFLAGS) indent
+ 
+-install-exec-hook:
+-	cd $(DESTDIR)$(bindir) && \
+-		$(LN_S) -f flex$(EXEEXT) flex++$(EXEEXT)
+-
+ .PHONY: ChangeLog indent
+diff --git a/src/Makefile.am b/src/Makefile.am
+index e379692..29d7560 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -4,7 +4,6 @@ LIBS = @LIBS@
+ 
+ m4 = @M4@
+ 
+-bin_PROGRAMS = flex
+ if ENABLE_BOOTSTRAP
+ noinst_PROGRAMS = stage1flex
+ endif
+-- 
+2.11.0
+
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index aeac4ada87..f550ce499c 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -20,16 +20,5 @@ FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4 \
 
 HOST_FLEX_DEPENDENCIES = host-m4
 
-define FLEX_DISABLE_PROGRAM
-	$(SED) 's/^bin_PROGRAMS.*//' $(@D)/src/Makefile.in
-endef
-FLEX_POST_PATCH_HOOKS += FLEX_DISABLE_PROGRAM
-
-# flex++ symlink is broken when flex binary is not installed
-define FLEX_REMOVE_BROKEN_SYMLINK
-	rm -f $(TARGET_DIR)/usr/bin/flex++
-endef
-FLEX_POST_INSTALL_TARGET_HOOKS += FLEX_REMOVE_BROKEN_SYMLINK
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.11.0
