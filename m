From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  2 Oct 2011 02:28:13 +0200
Subject: [Buildroot] [PATCH 1/2] Support interrupted downloads
Message-ID: <1317515294-8699-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

When a download was interrupted, the partially downloaded file would
still remain and the next download would skip that file.  Now, we
download to a temporary directory DL_TMPDIR and move the file to the
correct place (atomically) once the download has finished.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I didn't test this for the bzr backend.
---
 Makefile                    |    6 +++---
 package/Makefile.package.in |   24 +++++++++++++++++-------
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 8525b7d..c502df7 100644
--- a/Makefile
+++ b/Makefile
@@ -359,7 +359,7 @@ HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
 dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(DL_TMPDIR)
 
 $(BASE_TARGETS): dirs $(O)/toolchainfile.cmake
 
@@ -390,7 +390,7 @@ $(O)/toolchainfile.cmake:
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
 	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(DL_TMPDIR)
 
 #############################################################
 #
@@ -398,7 +398,7 @@ $(O)/toolchainfile.cmake:
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR):
+$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(DL_TMPDIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 6f543cc..6f23989 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -103,6 +103,7 @@ DL_DIR=$(call qstrip,$(BR2_DL_DIR))
 ifeq ($(DL_DIR),)
 DL_DIR:=$(TOPDIR)/dl
 endif
+DL_TMPDIR=$(DL_DIR)/partial
 
 ################################################################################
 # The DOWNLOAD_{GIT,SVN,BZR,LOCALFILES} helpers are in charge of getting a
@@ -124,11 +125,13 @@ endif
 
 define DOWNLOAD_GIT
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	(pushd $(DL_DIR) > /dev/null && \
+	(pushd $(DL_TMPDIR) > /dev/null && \
+	rm -rf $($(PKG)_DL_DIR) && \
 	$(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
 	pushd $($(PKG)_BASE_NAME) > /dev/null && \
 	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
-		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
+		gzip -c > $(DL_TMPDIR)/$($(PKG)_SOURCE) && \
+	mv $(DL_TMPDIR)/$($(PKG)_SOURCE) $(DL_DIR)/$($(PKG)_SOURCE) && \
 	popd > /dev/null && \
 	rm -rf $($(PKG)_DL_DIR) && \
 	popd > /dev/null)
@@ -147,7 +150,8 @@ endef
 
 define DOWNLOAD_BZR
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	$(BZR) export $(DL_DIR)/$($(PKG)_SOURCE) $($(PKG)_SITE) -r $($(PKG)_DL_VERSION)
+	($(BZR) export $(DL_TMPDIR)/$($(PKG)_SOURCE) $($(PKG)_SITE) -r $($(PKG)_DL_VERSION) && \
+	mv $(DL_TMPDIR)/$($(PKG)_SOURCE) $(DL_DIR)/$($(PKG)_SOURCE)) 
 endef
 
 define SOURCE_CHECK_BZR
@@ -161,9 +165,11 @@ endef
 
 define DOWNLOAD_SVN
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	(pushd $(DL_DIR) > /dev/null && \
+	(pushd $(DL_TMPDIR) > /dev/null && \
+	rm -rf $($(PKG)_DL_DIR) && \
 	$(SVN) export -r $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_DL_DIR) && \
 	$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
+	mv $(DL_TMPDIR)/$($(PKG)_SOURCE) $(DL_DIR)/$($(PKG)_SOURCE) && \
 	rm -rf $($(PKG)_DL_DIR) && \
 	popd > /dev/null)
 endef
@@ -179,7 +185,9 @@ endef
 
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
-	$(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
+	($(RM) $(DL_TMPDIR)/$($(PKG)_SOURCE); \
+	$(WGET) -P $(DL_TMPDIR) $(call qstrip,$(1))/$(2) && \
+	mv $(DL_TMPDIR)/$($(PKG)_SOURCE) $(DL_DIR)/$($(PKG)_SOURCE)) 
 endef
 
 define SOURCE_CHECK_WGET
@@ -192,7 +200,9 @@ endef
 
 define DOWNLOAD_LOCALFILES
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-		$(LOCALFILES) $(call qstrip,$(subst file://,,$($(PKG)_SITE)))/$($(PKG)_SOURCE) $(DL_DIR)
+		($(RM) -r $(DL_TMPDIR)/$($(PKG)_SOURCE); \
+		$(LOCALFILES) $(call qstrip,$(subst file://,,$($(PKG)_SITE)))/$($(PKG)_SOURCE) $(DL_TMPDIR) && \
+		mv $(DL_TMPDIR)/$($(PKG)_SOURCE) $(DL_DIR)/$($(PKG)_SOURCE)) 
 endef
 
 define SOURCE_CHECK_LOCALFILES
@@ -433,7 +443,7 @@ else
 endif
 
 $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
-$(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
+$(2)_DL_DIR	=  $$(DL_TMPDIR)/$$($(2)_BASE_NAME)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
 
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
-- 
1.7.6.3
