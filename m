From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Jan 2012 16:11:34 +0100
Subject: [Buildroot] [RFC 01/15] legal-info: new target to echo basic
	per-package legal info
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1327849908-15588-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Makefile                    |    9 ++++++++-
 package/Makefile.package.in |    6 ++++++
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 912012f..507fd78 100644
--- a/Makefile
+++ b/Makefile
@@ -354,6 +354,11 @@ HOST_DEPS = $(sort $(foreach dep,\
 		$($(dep))))
 HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 
+TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
+		$(filter-out makedevs,\
+		$(patsubst host-%,%,\
+		$(TARGETS) $(BASE_TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
+
 # all targets depend on the crosscompiler and it's prerequisites
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
@@ -387,7 +392,7 @@ $(O)/toolchainfile.cmake:
 
 .PHONY: all world dirs clean distclean source outputmakefile \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
-	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
+	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
@@ -497,6 +502,8 @@ source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
 external-deps:
 	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
 
+legal-info: $(TARGETS_LEGAL_INFO)
+
 show-targets:
 	@echo $(TARGETS)
 
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index e57bfed..8e73f34 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -512,6 +512,8 @@ ifndef $(2)_SOURCE
  endif
 endif
 
+$(2)_LICENSE			?= unknown
+
 ifndef $(2)_PATCH
  ifdef $(3)_PATCH
   $(2)_PATCH = $($(3)_PATCH)
@@ -651,6 +653,9 @@ $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
 endif
 
+$(1)-legal-info:	$(1)-source
+			@echo -e "$(1)\t$$($(3)_VERSION)\t$$($(3)_LICENSE)"
+
 $(1)-show-depends:
 			@echo $$($(2)_DEPENDENCIES)
 
@@ -694,6 +699,7 @@ $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
+$$($(2)_TARGET_LEGAL_INFO):		PKG=$(2)
 $$($(2)_TARGET_UNINSTALL):		PKG=$(2)
 $$($(2)_TARGET_CLEAN):			PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
-- 
1.7.5.4
