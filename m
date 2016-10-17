From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 17 Oct 2016 23:05:42 +0200
Subject: [Buildroot] [PATCH v12 2/3] core: reorder top-level Makefile and
	document things
In-Reply-To: <20161017210543.21573-1-s.martin49@gmail.com>
References: <20161017210543.21573-1-s.martin49@gmail.com>
Message-ID: <20161017210543.21573-3-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change only moves things around and comments what is done in the
top-level Makefile file, in order to prepare the next changes.

Note that moving the definition of $(O) before or after re-entering make
does not change anything on the buildroot behavior.

This change also renames the variable UMASK to REQ_UMASK.

Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
changes v11->v12:
- update commit log (Arnout)
- reintroduce EXTRAMAKEARGS (Arnout)
- remove CUR_UMASK since only used once (Arnout)
- update A/R/T tags

changes v10->v11:
- fix typos in umask variable

changes v9->v10:
- new patch (Arnout)
- s/:=/=/ in CUR_MASK assignation (Arnout)
---
 Makefile | 59 ++++++++++++++++++++++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/Makefile b/Makefile
index 2c0ac23..717b2db 100644
--- a/Makefile
+++ b/Makefile
@@ -29,16 +29,46 @@ SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 	 else if [ -x /bin/bash ]; then echo /bin/bash; \
 	 else echo sh; fi; fi)
 
-# Trick for always running with a fixed umask
-UMASK = 0022
-ifneq ($(shell umask),$(UMASK))
+# Set O variable if not already done on the command line;
+# or avoid confusing packages that can use the O=<dir> syntax for out-of-tree
+# build by preventing it from being forwarded to sub-make calls.
+ifneq ("$(origin O)", "command line")
+O := output
+else
+# Other packages might also support Linux-style out of tree builds
+# with the O=<dir> syntax (E.G. BusyBox does). As make automatically
+# forwards command line variable definitions those packages get very
+# confused. Fix this by telling make to not do so.
+MAKEOVERRIDES :=
+# Strangely enough O is still passed to submakes with MAKEOVERRIDES
+# (with make 3.81 atleast), the only thing that changes is the output
+# of the origin function (command line -> environment).
+# Unfortunately some packages don't look at origin (E.G. uClibc 0.9.31+)
+# To really make O go away, we have to override it.
+override O := $(O)
+endif
+
+# Check if the current Buildroot execution meets all the pre-requisites.
+# If they are not met, Buildroot will actually do its job in a sub-make meeting
+# its pre-requisites, which is:
+#  1- Permissive enough umask:
+#       Wrong or too restrictive umask will prevent Buildroot and packages from
+#       creating files and directories.
+
+REQ_UMASK = 0022
+
+# we need to pass O= everywhere we call back into the toplevel makefile
+EXTRAMAKEARGS = O=$(O)
+
+# Check Buildroot execution pre-requisites here.
+ifneq ($(shell umask),$(REQ_UMASK))
 .PHONY: _all $(MAKECMDGOALS)
 
 $(MAKECMDGOALS): _all
 	@:
 
 _all:
-	@umask $(UMASK) && $(MAKE) --no-print-directory $(MAKECMDGOALS)
+	@umask $(REQ_UMASK) && $(MAKE) --no-print-directory $(MAKECMDGOALS)
 
 else # umask
 
@@ -109,27 +139,6 @@ endif
 # Include some helper macros and variables
 include support/misc/utils.mk
 
-# Set O variable if not already done on the command line;
-# or avoid confusing packages that can use the O=<dir> syntax for out-of-tree
-# build by preventing it from being forwarded to sub-make calls.
-ifneq ("$(origin O)", "command line")
-O := output
-else
-# other packages might also support Linux-style out of tree builds
-# with the O=<dir> syntax (E.G. BusyBox does). As make automatically
-# forwards command line variable definitions those packages get very
-# confused. Fix this by telling make to not do so
-MAKEOVERRIDES =
-# strangely enough O is still passed to submakes with MAKEOVERRIDES
-# (with make 3.81 atleast), the only thing that changes is the output
-# of the origin function (command line -> environment).
-# Unfortunately some packages don't look at origin (E.G. uClibc 0.9.31+)
-# To really make O go away, we have to override it.
-override O := $(O)
-# we need to pass O= everywhere we call back into the toplevel makefile
-EXTRAMAKEARGS = O=$(O)
-endif
-
 # Set variables related to in-tree or out-of-tree build.
 ifeq ($(O),output)
 CONFIG_DIR := $(TOPDIR)
-- 
2.10.0
