From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 01 Dec 2016 22:21:39 -0000
Subject: [Buildroot] [git commit] Makefile: add missing targets to
	noconfig_targets and nobuild_targets
Message-ID: <20161201222136.CF06C7FB56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=472f0ae2dff7a912bebdb025f7dca0541ebc9769
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

currently some buildroot targets fails (list-defconfigs,
graph-build, etc), if there is an issue with configuration.
For example, enabling uboot package without providing custom
version name results in failing of various targets.

Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas: as suggested by Arnout, added printvars and savedefconfig to
nobuild_targets.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 6cf5f1c..eff814b 100644
--- a/Makefile
+++ b/Makefile
@@ -126,7 +126,8 @@ export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlo
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	print-version olddefconfig distclean
+	print-version olddefconfig distclean manual manual-html manual-split-html \
+	manual-pdf manual-text manual-epub
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
@@ -137,9 +138,12 @@ noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconf
 # We're building in two situations: when MAKECMDGOALS is empty
 # (default target is to build), or when MAKECMDGOALS contains
 # something else than one of the nobuild_targets.
-nobuild_targets := source source-check \
-	legal-info external-deps _external-deps \
-	clean distclean help
+nobuild_targets := source %-source source-check \
+	legal-info %-legal-info external-deps _external-deps \
+	clean distclean help show-targets graph-depends \
+	%-graph-depends %-show-depends %-show-version \
+	graph-build graph-size list-defconfigs \
+	savedefconfig printvars
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
