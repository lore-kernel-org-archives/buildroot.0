From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 10 Nov 2011 20:31:51 +0100
Subject: [Buildroot] [PATCH 1 of 5 RFC] dependencies: check core
 dependencies before anything else
In-Reply-To: <patchbomb.1320911665@devws108>
References: <patchbomb.1320911665@devws108>
Message-ID: <268352ac0f111e4fdf72.1320911666@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
 toolchain/dependencies/dependencies.mk |  6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/toolchain/dependencies/dependencies.mk b/toolchain/dependencies/dependencies.mk
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
 
