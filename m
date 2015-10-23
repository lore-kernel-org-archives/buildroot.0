From: Volkov Viacheslav <sv99@inbox.ru>
Date: Fri, 23 Oct 2015 19:25:05 +0300
Subject: [Buildroot] [PATCH] br2-external support existing package
	customization
Message-ID: <1445617505-16026-1-git-send-email-sv99@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested on the pkg-generic.

BR2_PACKAGE_OVERLAY_DIR may be set as $(BR2_EXTERNAL)/package_overlay
  pkgname1
    pkgname1.mk
  pkgname2
    pkgname2.mk

Tested on the nginx package

nginx.mk
# Test overlay package
$(waning start overlay)
define NGINX_POST_PATCH_FIXUP
	git clone https:/github.com/arut/nginx-rtmp-module.git $(@D)/rtmp
endef
NGINX_CONF_OPT += --add-module=$(@D)/rtmp
$(warning NGINX_CONF_OPTS)

# -= analog
# _CONF_OPTS := $(filter-out option.$(_CONF_OPTS))
 
Signed-off-by: sv99 <sv99@inbox.ru>
---
 Config.in              |  5 +++++
 package/pkg-generic.mk |  4 ++++
 package/pkg-utils.mk   | 18 ++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/Config.in b/Config.in
index d795361..e1fcb6c 100644
--- a/Config.in
+++ b/Config.in
@@ -603,6 +603,11 @@ config BR2_GLOBAL_PATCH_DIR
 	  Otherwise, if the directory <global-patch-dir>/<packagename> exists,
 	  then all *.patch files in the directory will be applied.
 
+config BR2_PACKAGE_OVERLAY_DIR
+	string "package overlay directory"
+	help
+	  Dirictory with package overlay directory structure.
+
 menu "Advanced"
 
 config BR2_COMPILER_PARANOID_UNSAFE_PATH
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ffef4d3..0617f78 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -304,6 +304,7 @@ be selected at a time. Please fix your configuration)
 endif
 endef
 
+
 ################################################################################
 # inner-generic-package -- generates the make targets needed to build a
 # generic package
@@ -341,6 +342,8 @@ endef
 
 define inner-generic-package
 
+$(eval $(call package-overlay,$(call qstrip,$(BR2_PACKAGE_OVERLAY_DIR)),$(1)/$(1).mk))
+
 # Define default values for various package-related variables, if not
 # already defined. For some variables (version, source, site and
 # subdir), if they are undefined, we try to see if a variable without
@@ -895,6 +898,7 @@ endif
 endif # $(2)_KCONFIG_VAR
 endef # inner-generic-package
 
+
 ################################################################################
 # generic-package -- the target generator macro for generic packages
 ################################################################################
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 44bd2c9..310a8a7 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -150,3 +150,21 @@ define legal-license-file # pkg, filename, file-fullpath, {HOST|TARGET}
 	mkdir -p $(LICENSE_FILES_DIR_$(4))/$(1)/$(dir $(2)) && \
 	cp $(3) $(LICENSE_FILES_DIR_$(4))/$(1)/$(2)
 endef
+
+define newline
+
+
+endef
+
+newline-stub = __NEWLINE_STUB__
+
+# package-overlay -- load and eval makefile in place
+# example:
+#   $(eval $(call  package-overlay,$(call qstrip,$(BR2_PACKAGE_OVERLAY_DIR)),RELATIVE_PATH_TO_THE_FILE))
+define package-overlay
+ifneq ("$(1)","")
+ifneq ($$(wildcard $(1)/$(2)),)
+$$(eval $$(subst $$(newline-stub),$$(newline),$$(shell perl -p -e 's/\n/$$(newline-stub)/' $(1)/$(2))))
+endif
+endif
+endef
-- 
1.9.1
