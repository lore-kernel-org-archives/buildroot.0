From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Nov 2011 23:18:50 +0100
Subject: [Buildroot] [git commit] dependencies: check core dependencies
	before anything else
Message-ID: <20111117225823.E569B8F5C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4932c8a7cc94277b3d53cecd935f725b91cfa9fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the dependencies target (that runs dependencies.sh) depends on
DEPENDENCIES_HOST_PREREQ. This means that the dependencies listed in
DEPENDENCIES_HOST_PREREQ (currently host-sstrip if sstrip is selected) are
built *before* the dependencies.sh script is run.

As a result, if e.g. there is no gcc compiler present on the build system, the
dependencies in DEPENDENCIES_HOST_PREREQ will fail to build, and buildroot
will fail non-gracefully.

This patch makes sure that the DEPENDENCIES_HOST_PREREQ are checked *after* the
dependencies.sh script, so that any problem in the build system is reported in
a clean way by dependencies.sh.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/dependencies/dependencies.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/toolchain/dependencies/dependencies.mk b/toolchain/dependencies/dependencies.mk
index 6eac05d..24d6666 100644
--- a/toolchain/dependencies/dependencies.mk
+++ b/toolchain/dependencies/dependencies.mk
@@ -16,12 +16,14 @@ DL_TOOLS = \
 	$(findstring git,$(DL_TOOLS_DEPENDENCIES)) \
 	$(findstring bzr,$(DL_TOOLS_DEPENDENCIES))
 
-dependencies: $(DEPENDENCIES_HOST_PREREQ)
+core-dependencies:
 	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
 		CONFIG_FILE="$(CONFIG_DIR)/.config" \
 		DL_TOOLS="$(DL_TOOLS)" \
 		$(TOPDIR)/toolchain/dependencies/dependencies.sh
 
+dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
+
 dependencies-source:
 
 dependencies-clean:
@@ -35,5 +37,5 @@ dependencies-dirclean:
 # Toplevel Makefile options
 #
 #############################################################
-.PHONY: dependencies
+.PHONY: dependencies core-dependencies
 
