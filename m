From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 3 Nov 2016 02:55:16 +0100
Subject: [Buildroot] [PATCH 1/2] core: don't reset MAKEOVERRIDES when
	re-entering make
Message-ID: <20161103015517.15943-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We reset MAKEOVERRIDES to avoid passing down variables that are
overridden on the command line to the package build systems. Indeed,
the variables overridden on the command line will be Buildroot
variables and not relevant to the package build system. In particular
the O option is used by some packages and the value passed in on the
command line is plain wrong for the individual package.

However, in commit 916e614b, MAKEOVERRIDES was moved earlier and it
was reset _before_ re-entering make in the cases when something has
to be fixed up (incorrect umask, non-absolute paths in O or CURDIR).
Therefore, if make is re-entered, any command line overrides are lost.

This particularly bites the autobuilders, because they use
O=<relative path> to specify the output directory, and they add
BR2_JLEVEL=... to avoid starting too many jobs in parallel. The
BR2_JLEVEL override is lost.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
I have a little worry, because there are two other places where we re-
enter top-level make and those are not handled: silentoldconfig and
external-deps. BR2_JLEVEL is not relevant for those, but other command-
line overridden options may be. However, this hasn't changed from before
commit 916e614b so I guess it's OK.
---
 Makefile | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index c00e200..4b494a3 100644
--- a/Makefile
+++ b/Makefile
@@ -35,11 +35,6 @@ SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 ifneq ("$(origin O)", "command line")
 O := $(CURDIR)/output
 else
-# Other packages might also support Linux-style out of tree builds
-# with the O=<dir> syntax (E.G. BusyBox does). As make automatically
-# forwards command line variable definitions those packages get very
-# confused. Fix this by telling make to not do so.
-MAKEOVERRIDES :=
 # Strangely enough O is still passed to submakes with MAKEOVERRIDES
 # (with make 3.81 atleast), the only thing that changes is the output
 # of the origin function (command line -> environment).
@@ -155,6 +150,13 @@ else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
 BR_BUILDING = y
 endif
 
+# We call make recursively to build packages. The command-line overrides that
+# are passed to Buildroot don't apply to those package build systems. In
+# particular, we don't want to pass down the O=<dir> option for out-of-tree
+# builds, because the value specified on the command line will not be correct
+# for packages.
+MAKEOVERRIDES :=
+
 # Include some helper macros and variables
 include support/misc/utils.mk
 
-- 
2.9.3
