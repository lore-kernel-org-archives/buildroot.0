From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Sep 2010 08:50:47 +0200
Subject: [Buildroot] [PATCH 1/8] Remove the spider feature
In-Reply-To: <cover.1284360382.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284360382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <07b2af1a45c5276125b54d64f839fdcd660d602d.1284360382.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Petazzoni <maxime.petazzoni@bulix.org>

In preparation for the re-work of the DOWNLOAD helper to support
multiple download methods and protocols, the spider feature used with
wget is removed for now until it is re-implemented on top of the new
download methods.

Signed-off-by: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                    |    7 +++----
 package/Makefile.package.in |   10 ----------
 package/mpfr/mpfr.mk        |    2 --
 3 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/Makefile b/Makefile
index 1ab446d..59a0e23 100644
--- a/Makefile
+++ b/Makefile
@@ -244,7 +244,7 @@ ifeq ($(ARCH),xtensa)
 ARCH:=$(ARCH)_$(call qstrip,$(BR2_xtensa_core_name))
 endif
 
-WGET:=$(call qstrip,$(BR2_WGET)) $(SPIDER) $(QUIET)
+WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
 SVN_CO:=$(call qstrip,$(BR2_SVN_CO)) $(QUIET)
 SVN_UP:=$(call qstrip,$(BR2_SVN_UP)) $(QUIET)
 BZR_CO:=$(call qstrip,$(BR2_BZR_CO)) $(QUIET)
@@ -437,11 +437,10 @@ endif
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 _source-check:
-	$(MAKE) $(EXTRAMAKEARGS) SPIDER=--spider source
+	@echo "TODO $@"
 
 external-deps:
-	@$(MAKE) -Bs BR2_WGET=$(TOPDIR)/toolchain/wget-show-external-deps.sh \
-		$(EXTRAMAKEARGS) SPIDER=--spider source
+	@echo "TODO $@"
 
 show-targets:
 	@echo $(TARGETS)
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index d76b791..ba0fd84 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -81,16 +81,11 @@ TERM_RESET := $(shell tput rmso)
 # $(call DOWNLOAD,$(FOO_SITE),$(FOO_SOURCE))
 ################################################################################
 
-# support make source-check/external-deps
-ifneq ($(SPIDER),)
-DOWNLOAD=$(WGET) -P $(DL_DIR) $(1)/$(2)
-else
 define DOWNLOAD
 	$(Q)test -e $(DL_DIR)/$(2) || \
 	for site in $(call qstrip,$(BR2_PRIMARY_SITE)) $(1) $(call qstrip,$(BR2_BACKUP_SITE)); \
 	do $(WGET) -P $(DL_DIR) $$site/$(2) && exit; done
 endef
-endif
 
 # Utility programs used to build packages
 TAR ?= tar
@@ -117,19 +112,14 @@ endef
 
 # Retrieve the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
-# support make source-check/external-deps
-ifeq ($(SPIDER),)
 # Only show the download message if it isn't already downloaded
 	$(Q)(test -e $(DL_DIR)/$($(PKG)_SOURCE) && \
 		(test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
 		$(call MESSAGE,"Downloading")
-endif
 	$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE))
 	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH)))
-ifeq ($(SPIDER),)
 	$(Q)mkdir -p $(@D)
 	$(Q)touch $@
-endif
 
 # Unpack the archive
 $(BUILD_DIR)/%/.stamp_extracted:
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index a7834dd..b7b80a5 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -21,10 +21,8 @@ MPFR_PATCH_SOURCE:=$(DL_DIR)/$(MPFR_PATCH_FILE)
 
 $(MPFR_PATCH_SOURCE):
 	$(call DOWNLOAD,$(MPFR_SITE),$(MPFR_PATCH))
-ifeq ($(SPIDER),) # this breaks source-check/external-deps
 	mv $(DL_DIR)/$(MPFR_PATCH) $@
 endif
-endif
 
 $(DL_DIR)/$(MPFR_SOURCE):
 	 $(call DOWNLOAD,$(MPFR_SITE),$(MPFR_SOURCE))
-- 
1.7.0.4
