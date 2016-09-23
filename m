From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 08:08:54 +0200
Subject: [Buildroot] [git commit] package/linux-tools: don't register each
	tools twice
Message-ID: <20160923060905.6F02181ECE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0476e950eed3ec011db30b515223b457fe0d534b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because each tool's individual .mk files is included from the top-level
Makefile and we also include them from linux-tools.mk, they get
registered twice, and thus built twice, and thus installed twice.

We did include them from linux-tools.mk to guarantee they would be
included early and each tool had a chance to register itself before we
were to construct the build and install hooks.

However, the ordering is _currently_ guaranteed, in the C locale by the
files names, which we anyway sort using make's $(sort) function, which
always sorts in the C locale.

Beware if we are to ever rename those files in the future...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-tools/linux-tools.mk | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index dada172..7fa8d19 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -10,6 +10,16 @@
 #
 # So, all tools refer to $(LINUX_DIR) instead of $(@D).
 
+# Note: we need individual tools .mk files to be included *before* this one
+# to guarantee that each tool has a chance to register itself before we build
+# the list of build and install hooks, below.
+#
+# This is currently guaranteed by the naming of each file:
+# - they get included by the top-level Makefile, with $(sort $(wildcard ...))
+# - make's $(sort) function will aways sort in the C locale
+# - the files names correctly sort out in the C locale so that each tool's
+#   .mk file is included before this one.
+
 # We only need the kernel to be extracted, not actually built
 LINUX_TOOLS_PATCH_DEPENDENCIES = linux
 
@@ -17,18 +27,6 @@ LINUX_TOOLS_PATCH_DEPENDENCIES = linux
 # may install shared libraries and headers (e.g. cpupower).
 LINUX_TOOLS_INSTALL_STAGING = YES
 
-# Include all our tools definitions.
-#
-# Note: our package infrastructure uses the full-path of the last-scanned
-# Makefile to determine what package we're currently defining, using the
-# last directory component in the path. As such, including other Makefile,
-# like below, before we call one of the *-package macro is usally not
-# working.
-# However, since the files we include here are in the same directory as
-# the current Makefile, we are OK. But this is a hard requirement: files
-# included here *must* be in the same directory!
-include $(sort $(wildcard package/linux-tools/linux-tool-*.mk))
-
 LINUX_TOOLS_DEPENDENCIES += $(foreach tool,$(LINUX_TOOLS),\
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
 		$($(call UPPERCASE,$(tool))_DEPENDENCIES)))
