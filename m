From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 22:50:48 +0100
Subject: [Buildroot] [git commit] Makefile: remove BASE_TARGETS variable
Message-ID: <20140306215147.19DCA9BD3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf53e15d09056cc9b72fc0d92b2a22e0e26ba989
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because now the toolchain dependency is automatically added by the
package infrastructure the BASE_TARGETS variable is useless so just
remove it.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                            |   10 ++++------
 docs/manual/how-buildroot-works.txt |    9 ++++-----
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index ae868da..2b13917 100644
--- a/Makefile
+++ b/Makefile
@@ -301,9 +301,7 @@ GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
 #
 ################################################################################
 
-BASE_TARGETS = toolchain
-
-TARGETS:=
+TARGETS:= toolchain
 
 # silent mode requested?
 QUIET:=$(if $(findstring s,$(MAKEFLAGS)),-q)
@@ -412,7 +410,7 @@ endif
 
 include fs/common.mk
 
-TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
+TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 
 # host-* dependencies have to be handled specially, as those aren't
@@ -434,7 +432,7 @@ HOST_DEPS = $(sort $(foreach dep,\
 HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 
 TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
-		$(TARGETS) $(BASE_TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
+		$(TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
 
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
@@ -453,7 +451,7 @@ world: target-post-image
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars \
 	target-finalize target-post-image \
-	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ROOTFS) \
+	$(TARGETS) $(TARGETS_ROOTFS) \
 	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
diff --git a/docs/manual/how-buildroot-works.txt b/docs/manual/how-buildroot-works.txt
index 68ddd13..a96e45b 100644
--- a/docs/manual/how-buildroot-works.txt
+++ b/docs/manual/how-buildroot-works.txt
@@ -56,11 +56,10 @@ configuration is done):
   +stamps+, etc. in the output directory (+output/+ by default,
   another value can be specified using +O=+)
 
-* Generate all the targets listed in the +BASE_TARGETS+ variable. When
-  an internal toolchain is used, this means generating the
-  cross-compilation toolchain. When an external toolchain is used,
-  this means checking the features of the external toolchain and
-  importing it into the Buildroot environment.
+* Generate the toolchain target. When an internal toolchain is used, this
+  means generating the cross-compilation toolchain. When an external
+  toolchain is used, this means checking the features of the external
+  toolchain and importing it into the Buildroot environment.
 
 * Generate all the targets listed in the +TARGETS+ variable. This
   variable is filled by all the individual components'
