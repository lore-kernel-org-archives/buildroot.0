From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:04:39 +0200
Subject: [Buildroot] [git commit] core: split variables definition related
	to in/out-of-tree build from O itself
Message-ID: <20161019211757.6B01F80DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b1b2c47ba2bc3f41797fb8c21229bb437e5879e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change uncorrolates the CONFIG_DIR and NEED_WRAPPER definition from
the presence of the O variable in the command line.

Now, the condition used to set these variables is the value of O itself.

This change is a preparatory work since the O definition will need to
be moved around when we will make Buildroot run with absolute canonical
paths for both its root directory and the output location.
This will be addressed in a follow-up patch.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index a860218..2c0ac23 100644
--- a/Makefile
+++ b/Makefile
@@ -109,10 +109,11 @@ endif
 # Include some helper macros and variables
 include support/misc/utils.mk
 
+# Set O variable if not already done on the command line;
+# or avoid confusing packages that can use the O=<dir> syntax for out-of-tree
+# build by preventing it from being forwarded to sub-make calls.
 ifneq ("$(origin O)", "command line")
 O := output
-CONFIG_DIR := $(TOPDIR)
-NEED_WRAPPER =
 else
 # other packages might also support Linux-style out of tree builds
 # with the O=<dir> syntax (E.G. BusyBox does). As make automatically
@@ -125,9 +126,16 @@ MAKEOVERRIDES =
 # Unfortunately some packages don't look at origin (E.G. uClibc 0.9.31+)
 # To really make O go away, we have to override it.
 override O := $(O)
-CONFIG_DIR := $(O)
 # we need to pass O= everywhere we call back into the toplevel makefile
 EXTRAMAKEARGS = O=$(O)
+endif
+
+# Set variables related to in-tree or out-of-tree build.
+ifeq ($(O),output)
+CONFIG_DIR := $(TOPDIR)
+NEED_WRAPPER =
+else
+CONFIG_DIR := $(O)
 NEED_WRAPPER = y
 endif
 
