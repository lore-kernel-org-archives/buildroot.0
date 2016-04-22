From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 22 Apr 2016 22:50:14 +0200
Subject: [Buildroot] [PATCH v9 02/11] core: re-enter make if $(CURDIR) or
	$(O) are not absolute canonical path
In-Reply-To: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
References: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1461358223-18312-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When $(CURDIR) or $(O) contain symlinks in their path, they can be
resolved differently, depending on each package build-system (whether it
uses the given paths or get the absolute canonical ones).

This will make easier tracking down host machine paths leaking into the
host, target or staging trees, the CURDIR and O variables are set to
their absolute canonical paths.

In order to recall the toplevel makefile with absolute canonical paths
for $(CURDIR) and $(O), we need to:
1- Move the O variable definition out of any if-block; so they are
   always available.
2- Compute the absolute canonical paths for $(CURDIR) and $(O) that will
   be passed to the sub-make. This is achieved using the 'realpath' make
   primitive. However, some care must be taken when manipulating O:
   - the out-of-tree makefile wrapper happens a trailing "/.", we need
     to strip this part away to not break the comparison driving the
     sub-make call;
   - according to [1,2], realpath returns an empty string in case of
     non-existing entry. So, to avoid passing an empty O= variable to
     sub-make, it is necessary to define the output directory and create
     it prior to call realpath on it (because on the first invocation,
     $(O) usually does not yet exists), hence the trick doing the mkdir
     right before calling realpath.
3- Update EXTRAMAKEARGS with the absobulte canonical $(O) and use it
   when call recalling the toplevel makefile with umask and paths
   correctly set.
4- Lastly, update the condition for setting the CONFIG_DIR and
   NEED_WRAPPER variables.

Notes:
* This change takes care of the makefile wrapper installed in $(O) to
  avoid unneeded make recursion.
* Now, only $(O) is strip away from MAKEOVERRIDES whatever the build is
  done in- or out-of-tree (i.o.w. without or with O set in the command
  line); wheares is the previous implementation, all variables set on
  the command line were stripped away only in the case of out-of-tree
  build.

[1] https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html
[2] http://man7.org/linux/man-pages/man3/realpath.3.html

Reported-by: Matthew Weber <matt@thewebers.ws>
Cc: Matthew Weber <matt@thewebers.ws>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v8->v9:
- none

changes v7->v8:
- keep @ at the beginning of the command (Yann)
- make ifneq condition easier to read/parsed (Yann)
- fix O definition before re-entering make (Reported by Matthew)
- use EXTRAMAKEARGS when re-entering make
- update the condition for CONFIG_DIR and NEED_WRAPPER

changes v6->v7:
- none

changes v5->v6:
- new patch
---
 Makefile | 86 +++++++++++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 58 insertions(+), 28 deletions(-)

diff --git a/Makefile b/Makefile
index 3d86c9b..a05b9e1 100644
--- a/Makefile
+++ b/Makefile
@@ -24,18 +24,68 @@
 # You shouldn't need to mess with anything beyond this point...
 #--------------------------------------------------------------
 
-# Trick for always running with a fixed umask
+# Set O variable if not already done on the command line;
+# or avoid confusing packages that can use the O=<dir> syntax for out-of-tree
+# build by preventing it from being forwarded to sub-make calls.
+ifneq ("$(origin O)", "command line")
+O := $(CURDIR)/output
+else
+# Other packages might also support Linux-style out of tree builds
+# with the O=<dir> syntax (E.G. BusyBox does). As make automatically
+# forwards command line variable definitions those packages get very
+# confused. Fix this by telling make to not do so, only for O=..., but
+# keep all others (such as BR2_EXTERNAL, BR2_DL_DIR, etc).
+MAKEOVERRIDES := $(filter-out O=%,$(MAKEOVERRIDES))
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
+# its pre-requisites, which are:
+#  1- Permissive enough umask:
+#       Wrong or too restrictive umask will prevent Buildroot and packages from
+#       creating files and directories.
+#  2- Absolute canonical CWD (i.e. $(CURDIR)):
+#       Otherwise, some packages will use CWD as-is, others will compute its
+#       absolute canonical path. This makes harder tracking and fixing host
+#       machine path leaks.
+#  3- Absolute canonical output location (i.e. $(O)):
+#       For the same reason as the one for CWD.
+
+# Current state:
+CUR_UMASK := $(shell umask)
+# Remove the trailing '/.' from $(O) as it can be added by the makefile wrapper
+# installed in the $(O) directory.
+O := $(patsubst %/.,%,$(O))
+
+# Buildroot requirements:
 UMASK = 0022
-ifneq ($(shell umask),$(UMASK))
+REAL_CURDIR := $(realpath $(CURDIR))
+# realpath needs the entry to exists, otherwise an empty string is returned.
+REAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))
+
+# Make sure O= is passed (with its absolute canonical path) everywhere the
+# toplevel makefile is called back.
+EXTRAMAKEARGS := O=$(REAL_O)
+
+# Check Buildroot execution pre-requisites here.
+ifneq ($(CUR_UMASK):$(CURDIR):$(O),$(UMASK):$(REAL_CURDIR):$(REAL_O))
 .PHONY: _all $(MAKECMDGOALS)
 
 $(MAKECMDGOALS): _all
 	@:
 
 _all:
-	@umask $(UMASK) && $(MAKE) --no-print-directory $(MAKECMDGOALS)
+	@umask $(UMASK) && \
+		$(MAKE) -C $(REAL_CURDIR) --no-print-directory \
+			$(MAKECMDGOALS) $(EXTRAMAKEARGS)
 
-else # umask
+else # umask / $(CURDIR) / $(O)
 
 # This is our default rule, so must come first
 all:
@@ -110,30 +160,10 @@ comma := ,
 empty :=
 space := $(empty) $(empty)
 
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
-ifeq ($(O),output)
-CONFIG_DIR := $(TOPDIR)
+# Here, both $(O) and $(CURDIR) are absolute canonical paths.
+ifeq ($(O),$(CURDIR)/output)
+CONFIG_DIR := $(CURDIR)
 NEED_WRAPPER =
 else
 CONFIG_DIR := $(O)
@@ -1017,4 +1047,4 @@ include docs/manual/manual.mk
 
 .PHONY: $(noconfig_targets)
 
-endif #umask
+endif #umask / $(CURDIR) / $(O)
-- 
2.8.0
