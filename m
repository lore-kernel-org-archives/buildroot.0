From: Ludovic Guegan <ludovic.guegan@gmail.com>
Date: Tue,  2 Feb 2016 00:31:00 +0100
Subject: [Buildroot] [PATCH 3/8 RFC] package/pkg-generic.mk: allow custom
	extract directory
In-Reply-To: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
References: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
Message-ID: <1454369465-4804-4-git-send-email-ludovic.guegan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ludovic Guegan <ludovic.guegan@gmail.com>
---
 docs/manual/adding-packages-generic.txt |  3 +++
 package/pkg-generic.mk                  | 12 ++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index b7817e3..b7442a7 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -444,6 +444,9 @@ different steps of the build process.
   tarball with a non-standard organization, this variable allows to
   override the package infrastructure default behavior.
 
+* +LIBFOO_EXTRACT_DIR+ can be set to change the directory where the
+  package is extracted.
+
 * +LIBFOO_CONFIGURE_CMDS+ lists the actions to be performed to
   configure the package before its compilation.
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1e024d3..3051551 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -128,7 +128,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
 	@$(call step_start,extract)
 	@$(call MESSAGE,"Extracting")
 	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
-	$(Q)mkdir -p $(@D)
+	$(Q)mkdir -p $(@D) $($(PKG)_EXTRACT_DIR)
 	$($(PKG)_EXTRACT_CMDS)
 # some packages have messed up permissions inside
 	$(Q)chmod -R +rw $(@D)
@@ -396,6 +396,14 @@ $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
 $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
 
+ifndef $(2)_EXTRACT_DIR
+ ifdef $(3)_EXTRACT_DIR
+  $(2)_EXTRACT_DIR = $$($(3)_EXTRACT_DIR)
+ else
+  $(2)_EXTRACT_DIR ?= $$($(3)_DIR)
+ endif
+endif
+
 ifndef $(2)_SUBDIR
  ifdef $(3)_SUBDIR
   $(2)_SUBDIR = $$($(3)_SUBDIR)
@@ -525,7 +533,7 @@ $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 $(2)_EXTRACT_CMDS ?= \
 	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
 	$$(TAR) --strip-components=$$($(2)_STRIP_COMPONENTS) \
-		-C $$($(2)_DIR) \
+		-C $$($(2)_EXTRACT_DIR) \
 		$$(foreach x,$$($(2)_EXCLUDES),--exclude='$$(x)' ) \
 		$$(TAR_OPTIONS) -)
 
-- 
2.7.0
