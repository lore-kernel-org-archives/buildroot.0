From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Oct 2016 13:34:31 +0200
Subject: [Buildroot] [PATCH v10 3/4] core: re-enter make if $(CURDIR) or
	$(O) are not canonical paths
In-Reply-To: <20161016113432.9544-1-s.martin49@gmail.com>
References: <20161016113432.9544-1-s.martin49@gmail.com>
Message-ID: <20161016113432.9544-4-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When $(CURDIR) and/or $(O) contain symlinks in their paths, they can be
resolved differently, depending on each package build-system (whether it
uses the given paths or get the absolute canonical ones).

Using absolute canonical paths will help achieving reproducible builds and
will make easier tracking down host machine paths leaking into the host,
target or staging trees.
So, this change ensure the build takes place with the CURDIR and O
variables are set to their absolute canonical paths.

In order to recall the toplevel makefile with absolute canonical paths
for $(CURDIR) and $(O), we need to:
1- Compute the absolute canonical paths for $(CURDIR) and $(O) that will
   be passed to the sub-make. This is achieved using the 'realpath' make
   primitive. However, some care must be taken when manipulating O:
   - the out-of-tree makefile wrapper happens a trailing "/.", we need
     to strip this part away to not break the comparison driving the
     sub-make call;
   - the user can leave a trailing '/' to $(O);
   - according to [1,2], realpath returns an empty string in case of
     non-existing entry. So, to avoid passing an empty O= variable to
     sub-make, it is necessary to define the output directory and create
     it prior to call realpath on it (because on the first invocation,
     $(O) usually does not yet exists), hence the trick doing the mkdir
     right before calling realpath.
2- Update EXTRAMAKEARGS with the absolute canonical $(O) and use it
   when call recalling the top-level makefile with umask and paths
   correctly set.
3- Lastly, update the condition for setting the CONFIG_DIR and
   NEED_WRAPPER variables.

Note:
* This change takes care of the makefile wrapper installed in $(O) to
  avoid unneeded make recursion.

[1] https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html
[2] http://man7.org/linux/man-pages/man3/realpath.3.html

Reported-by: Matthew Weber <matt@thewebers.ws>
Cc: Matthew Weber <matt@thewebers.ws>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v9->v10:
- only keep what is about checking umask and canonical paths for CWD and
  O (Arnout)
- fix assignation (Arnout)
- remove the unrelated MAKEOVERRIDES cleanup (Arnout)
- fixes typos in commit log (Arnout)

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
 Makefile | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index aa749d4..f28d7f3 100644
--- a/Makefile
+++ b/Makefile
@@ -33,7 +33,7 @@ SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 # or avoid confusing packages that can use the O=<dir> syntax for out-of-tree
 # build by preventing it from being forwarded to sub-make calls.
 ifneq ("$(origin O)", "command line")
-O := output
+O := $(CURDIR)/output
 else
 # Other packages might also support Linux-style out of tree builds
 # with the O=<dir> syntax (E.G. BusyBox does). As make automatically
@@ -50,25 +50,45 @@ endif
 
 # Check if the current Buildroot execution meets all the pre-requisites.
 # If they are not met, Buildroot will actually do its job in a sub-make meeting
-# its pre-requisites, which is:
+# its pre-requisites, which are:
 #  1- Permissive enough umask:
 #       Wrong or too restrictive umask will prevent Buildroot and packages from
 #       creating files and directories.
+#  2- Absolute canonical CWD (i.e. $(CURDIR)):
+#       Otherwise, some packages will use CWD as-is, others will compute its
+#       absolute canonical path. This makes harder tracking and fixing host
+#       machine path leaks.
+#  3- Absolute canonical output location (i.e. $(O)):
+#       For the same reason as the one for CWD.
+
+# Remove the trailing '/.' from $(O) as it can be added by the makefile wrapper
+# installed in the $(O) directory.
+# Also remove the trailing '/' the user can set when on the command line.
+override O := $(patsubst %/,%,$(patsubst %.,%,$(O)))
+CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))
+
+CANONICAL_CURDIR = $(realpath $(CURDIR))
 
 CUR_UMASK = $(shell umask)
 REQ_UMASK = 0022
 
+# Make sure O= is passed (with its absolute canonical path) everywhere the
+# toplevel makefile is called back.
+EXTRAMAKEARGS := O=$(CANONICAL_O)
+
 # Check Buildroot execution pre-requisites here.
-ifneq ($(CUR_UMASK),$(REQ_UMASK))
+ifneq ($(CUR_UMASK):$(CURDIR):$(O),$(REQ_UMASK):$(CANONICAL_CURDIR):$(CANONICAL_O))
 .PHONY: _all $(MAKECMDGOALS)
 
 $(MAKECMDGOALS): _all
 	@:
 
 _all:
-	@umask $(UMASK) && $(MAKE) --no-print-directory $(MAKECMDGOALS)
+	@umask $(UMASK) && \
+		$(MAKE) -C $(CANONICAL_CURDIR) --no-print-directory \
+			$(MAKECMDGOALS) $(EXTRAMAKEARGS)
 
-else # umask
+else # umask / $(CURDIR) / $(O)
 
 # This is our default rule, so must come first
 all:
@@ -138,8 +158,9 @@ endif
 include support/misc/utils.mk
 
 # Set variables related to in-tree or out-of-tree build.
-ifeq ($(O),output)
-CONFIG_DIR := $(TOPDIR)
+# Here, both $(O) and $(CURDIR) are absolute canonical paths.
+ifeq ($(O),$(CURDIR)/output)
+CONFIG_DIR := $(CURDIR)
 NEED_WRAPPER =
 else
 CONFIG_DIR := $(O)
@@ -1036,4 +1057,4 @@ include docs/manual/manual.mk
 
 .PHONY: $(noconfig_targets)
 
-endif #umask
+endif #umask / $(CURDIR) / $(O)
-- 
2.10.0
