From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  1 Oct 2013 15:24:33 +0200
Subject: [Buildroot] [PATCH v6 1/5] package: add toolchain dependency to
	inner-generic-package
In-Reply-To: <1380633877-10702-1-git-send-email-fabio.porcedda@gmail.com>
References: <1380633877-10702-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1380633877-10702-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit makes the dependency from the target toolchain explicit.
This way we can buid from command line a package that use
innger-generic-package right after the configuration phase, example:

	make clean <package-name>

Also remove TARGETS_ALL because the only purpose was to add toolchain
dependency so it's superseded by this commit.

This is a step forward top-level parallel make.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile                 | 8 ++------
 package/pkg-autotools.mk | 3 ++-
 package/pkg-generic.mk   | 6 +++++-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 6b86541..c31995a 100644
--- a/Makefile
+++ b/Makefile
@@ -360,7 +360,6 @@ TARGETS+=target-post-image
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
-TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
 
 # host-* dependencies have to be handled specially, as those aren't
 # visible in Kconfig and hence not added to a variable like TARGETS.
@@ -383,9 +382,6 @@ HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
 		$(TARGETS) $(BASE_TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
 
-# all targets depend on the crosscompiler and it's prerequisites
-$(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
-
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
@@ -398,11 +394,11 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 toolchain: prepare dirs dependencies $(BASE_TARGETS)
 
-world: toolchain $(TARGETS_ALL)
+world: $(TARGETS)
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars \
-	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
+	$(BASE_TARGETS) $(TARGETS) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index b0eddde..aafa396 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -202,7 +202,8 @@ endef
 # This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
 # away from the non-host rule
-$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool $(1),\
+$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool \
+				host-toolchain $(1),\
     $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index bfc4dc1..d7efcd3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -307,7 +307,11 @@ endif
 $(2)_REDISTRIBUTE		?= YES
 
 
-$(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+$(2)_DEPENDENCIES ?= $(filter-out  host-toolchain $(1),\
+	$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+ifeq ($$($(2)_TYPE),target)
+$(2)_DEPENDENCIES += toolchain
+endif
 
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
-- 
1.8.4
