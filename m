From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 Sep 2013 23:30:27 +0200
Subject: [Buildroot] [git commit] infra: introduce suitable-extractor helper
	function
Message-ID: <20130907061414.133F880474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8d89f051032a8835bdb77edec518e73170006c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to simplify determining the right extractor tool for a given
file type, this patch introduces a make function 'suitable-extractor'.
Its usage is $(call suitable-extractor,filename), and it returns the
path to the suitable extractor.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lsof/lsof.mk                     |    2 +-
 package/perl/perl.mk                     |    2 +-
 package/pkg-generic.mk                   |    4 +++-
 package/pkg-utils.mk                     |    2 ++
 package/tar/tar.mk                       |    2 +-
 toolchain/toolchain-external/ext-tool.mk |    6 +++---
 6 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index f1c9474..693bb91 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -41,7 +41,7 @@ endif
 
 # The .tar.bz2 contains another .tar, which contains the source code.
 define LSOF_EXTRACT_CMDS
-        $(INFLATE.bz2) $(DL_DIR)/$(LSOF_SOURCE) | \
+        $(call suitable-extractor,$(LSOF_SOURCE)) $(DL_DIR)/$(LSOF_SOURCE) | \
                 $(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
         $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -
 endef
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 25314f0..5ef0b24 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -30,7 +30,7 @@ endef
 PERL_POST_DOWNLOAD_HOOKS += PERL_CROSS_DOWNLOAD
 
 define PERL_CROSS_EXTRACT
-	$(INFLATE$(suffix $(PERL_CROSS_SOURCE))) $(DL_DIR)/$(PERL_CROSS_SOURCE) | \
+	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(DL_DIR)/$(PERL_CROSS_SOURCE) | \
 	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 2e2e66f..65ab8c6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -539,7 +539,9 @@ else ifeq ($$($(2)_SITE_METHOD),hg)
 DL_TOOLS_DEPENDENCIES += hg
 endif # SITE_METHOD
 
-DL_TOOLS_DEPENDENCIES += $(firstword $(INFLATE$(suffix $($(2)_SOURCE))))
+# $(firstword) is used here because the extractor can have arguments, like
+# ZCAT="gzip -d -c", and to check for the dependency we only want 'gzip'.
+DL_TOOLS_DEPENDENCIES += $(firstword $(call suitable-extractor,$($(2)_SOURCE)))
 
 endif # $(2)_KCONFIG_VAR
 endef # inner-generic-package
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 15db096..5930f2c 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -62,6 +62,8 @@ INFLATE.tbz2 = $(BZCAT)
 INFLATE.tgz  = $(ZCAT)
 INFLATE.xz   = $(XZCAT)
 INFLATE.tar  = cat
+# suitable-extractor(filename): returns extractor based on suffix
+suitable-extractor = $(INFLATE$(suffix $(1)))
 
 # MESSAGE Macro -- display a message in bold type
 MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 3ffeaf0..6198ffd 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -23,7 +23,7 @@ HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpio.gz
 define HOST_TAR_EXTRACT_CMDS
 	mkdir -p $(@D)
 	cd $(@D) && \
-		$(INFLATE.gz) $(DL_DIR)/$(HOST_TAR_SOURCE) | cpio -i
+		$(call suitable-extractor,$(HOST_TAR_SOURCE)) $(DL_DIR)/$(HOST_TAR_SOURCE) | cpio -i
 	mv $(@D)/tar-$(TAR_VERSION)/* $(@D)
 	rmdir $(@D)/tar-$(TAR_VERSION)
 endef
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index e92afbd..d5023cf 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -340,9 +340,9 @@ $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2):
 
 $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2)
 	mkdir -p $(@D)
-	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_1))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) | \
+	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE_1)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) | \
 		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
-	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_2))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2) | \
+	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE_2)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2) | \
 		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
 	$(Q)touch $@
 else
@@ -352,7 +352,7 @@ $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE):
 
 $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
 	mkdir -p $(@D)
-	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | \
+	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE)) $^ | \
 		$(TAR) $(TAR_STRIP_COMPONENTS)=1 --exclude='usr/lib/locale/*' -C $(@D) $(TAR_OPTIONS) -
 	$(TOOLCHAIN_EXTERNAL_FIXUP_CMDS)
 	$(Q)touch $@
