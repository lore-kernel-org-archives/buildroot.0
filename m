From: Rahul Jain <Rahul.Jain@imgtec.com>
Date: Tue, 15 Nov 2016 16:33:20 +0530
Subject: [Buildroot] [PATCH v1] Makefile: add missing targets to
	noconfig_targets and nobuild_targets
Message-ID: <1479207800-26263-1-git-send-email-Rahul.Jain@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

currently some buildroot targets fails (list-defconfigs,
graph-build, etc), if there is an issue with configuration.
For example, enabling uboot package without providing custom
version name results in failing of various targets.

Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
---
 Makefile | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index a860218..5c3d1c7 100644
--- a/Makefile
+++ b/Makefile
@@ -86,7 +86,8 @@ export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlo
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
-	print-version olddefconfig distclean
+	print-version olddefconfig distclean manual manual-html manual-split-html \
+	manual-pdf manual-text manual-epub
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
@@ -97,9 +98,11 @@ noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconf
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
+	graph-build graph-size list-defconfigs
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
-- 
2.6.2
