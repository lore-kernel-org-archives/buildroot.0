From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu,  6 Mar 2014 10:42:27 +0100
Subject: [Buildroot] [PATCH v2 2/4] Makefile: remove BASE_TARGETS variable
In-Reply-To: <1394098949-31981-1-git-send-email-fabio.porcedda@gmail.com>
References: <1394098949-31981-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1394098949-31981-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because now the toolchain dependency is automatically added by the
package infrastructure the BASE_TARGETS variable is useless so just
remove it.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile                            | 10 ++++------
 docs/manual/how-buildroot-works.txt |  9 ++++-----
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 6eb9743..665865b 100644
--- a/Makefile
+++ b/Makefile
@@ -300,9 +300,7 @@ GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
 #
 ################################################################################
 
-BASE_TARGETS = toolchain
-
-TARGETS:=
+TARGETS:= toolchain
 
 # silent mode requested?
 QUIET:=$(if $(findstring s,$(MAKEFLAGS)),-q)
@@ -411,7 +409,7 @@ endif
 
 include fs/common.mk
 
-TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
+TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 
 # host-* dependencies have to be handled specially, as those aren't
@@ -433,7 +431,7 @@ HOST_DEPS = $(sort $(foreach dep,\
 HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 
 TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
-		$(TARGETS) $(BASE_TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
+		$(TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
 
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
@@ -452,7 +450,7 @@ world: target-post-image
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
-- 
1.8.3.2
