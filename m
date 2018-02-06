From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Tue, 6 Feb 2018 13:59:23 +0100
Subject: [Buildroot] [PATCH v2 1/1] core: rename FOO_BASE_NAME to
 FOO_BASENAME to avoid clashes
Message-ID: <20180206125923.GB20598@australia.be.alcatel-lucent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


In current Buildroot, clashes occur between the variables _NAME and
_BASE_NAME for two packages called foo and foo-base, i.e.

Package foo:
FOO_NAME = foo
FOO_BASE_NAME = foo-1.2.3

Package foo-base:
FOO_BASE_NAME = foo-base
FOO_BASE_BASE_NAME = foo-base-4.5.6

where variable FOO_BASE_NAME is clashing between these two packages.
Specific cases where this clash is already existing are:
- alljoyn-base
- alljoyn-tcl-base
- perl-xml-sax-base

The problem is generic and can occur for a number of variables in Buildroot.
A non-exhaustive list:
    <pkg>_BASE and <pkg>_BASE_NAME
    <pkg>_BASE_NAME and <pkg>_RAW_BASE_NAME
    <pkg>_DIR and <pkg>_DL_DIR
    <pkg>_VERSION and <pkg>_DL_VERSION
    <pkg>_SOURCE and <pkg>_TARGET_SOURCE
    <pkg>_INSTALL_IMAGES and <pkg>_TARGET_INSTALL_IMAGES  (same for _STAGING and _TARGET)
    <pkg>_LICENSE_FILES and <pkg>_MANIFEST_LICENSE_FILES
    <pkg>_DEPENDENCIES and <pkg>_FINAL_DEPENDENCIES

One solution is to use another separator than '_' to separate the
package name from the rest of the variable name. For example, a double
underscore:
FOO__NAME
FOO__BASE_NAME
FOO_BASE__NAME
FOO_BASE__BASE_NAME

However, making that change for only this case means that the variable
naming is no longer consistent. And making the change for all variables has
a large impact, also on certain user scripts.

For now, keep it simple, and rename FOO_BASE_NAME into FOO_BASENAME, so that
the variables become:
FOO_NAME
FOO_BASENAME
FOO_BASE_NAME
FOO_BASE_BASENAME

For consistency, also adapt FOO_RAW_BASE_NAME. Since FOO_RAW_BASENAME would
still pose a conflict with a package called 'foo-raw', take the opportunity
to rename it into FOO_BASENAME_RAW instead, which does not pose a conflict
as we have no variable called FOO_RAW.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/pkg-download.mk | 10 +++++-----
 package/pkg-generic.mk  | 14 +++++++-------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 3712b9ccc6..6f15deba28 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -79,7 +79,7 @@ define DOWNLOAD_GIT
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
-		$($(PKG)_RAW_BASE_NAME) \
+		$($(PKG)_BASENAME_RAW) \
 		$($(PKG)_DL_OPTS)
 endef
 
@@ -90,7 +90,7 @@ define DOWNLOAD_BZR
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
-		$($(PKG)_RAW_BASE_NAME) \
+		$($(PKG)_BASENAME_RAW) \
 		$($(PKG)_DL_OPTS)
 endef
 
@@ -102,7 +102,7 @@ define DOWNLOAD_CVS
 		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
 		$($(PKG)_DL_VERSION) \
 		$($(PKG)_RAWNAME) \
-		$($(PKG)_RAW_BASE_NAME) \
+		$($(PKG)_BASENAME_RAW) \
 		$($(PKG)_DL_OPTS)
 endef
 
@@ -113,7 +113,7 @@ define DOWNLOAD_SVN
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
-		$($(PKG)_RAW_BASE_NAME) \
+		$($(PKG)_BASENAME_RAW) \
 		$($(PKG)_DL_OPTS)
 endef
 
@@ -137,7 +137,7 @@ define DOWNLOAD_HG
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
-		$($(PKG)_RAW_BASE_NAME) \
+		$($(PKG)_BASENAME_RAW) \
 		$($(PKG)_DL_OPTS)
 endef
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a2a12e7b56..97c580541d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -452,10 +452,10 @@ ifdef $(3)_OVERRIDE_SRCDIR
   $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
 endif
 
-$(2)_BASE_NAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
-$(2)_RAW_BASE_NAME = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
+$(2)_BASENAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
+$(2)_BASENAME_RAW = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
 $(2)_DL_DIR	=  $$(DL_DIR)
-$(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
+$(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASENAME)
 
 ifndef $(2)_SUBDIR
  ifdef $(3)_SUBDIR
@@ -484,7 +484,7 @@ ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
  else ifdef $(2)_VERSION
-  $(2)_SOURCE			?= $$($(2)_RAW_BASE_NAME).tar.gz
+  $(2)_SOURCE			?= $$($(2)_BASENAME_RAW).tar.gz
  endif
 endif
 
@@ -558,7 +558,7 @@ endif
 
 $(2)_REDISTRIBUTE		?= YES
 
-$(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_RAW_BASE_NAME)
+$(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_BASENAME_RAW)
 
 # When a target package is a toolchain dependency set this variable to
 # 'NO' so the 'toolchain' dependency is not added to prevent a circular
@@ -864,9 +864,9 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 # is that the license still applies to the files distributed as part
 # of the rootfs, even if the sources are not themselves redistributed.
 ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
-	$(Q)$$(call legal-warning-pkg,$$($(2)_RAW_BASE_NAME),cannot save license ($(2)_LICENSE_FILES not defined))
+	$(Q)$$(call legal-warning-pkg,$$($(2)_BASENAME_RAW),cannot save license ($(2)_LICENSE_FILES not defined))
 else
-	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_RAW_BASE_NAME),$$($(2)_PKGDIR),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
+	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_PKGDIR),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
 endif # license files
 
 ifeq ($$($(2)_SITE_METHOD),local)
-- 
2.13.6
