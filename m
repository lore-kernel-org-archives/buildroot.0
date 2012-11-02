From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  2 Nov 2012 10:25:41 +0100
Subject: [Buildroot] [PATCH 2/2] legal-info: split _LICENSE and
	_REDISTRIBUTE constants
In-Reply-To: <1351848341-5905-1-git-send-email-luca@lucaceresoli.net>
References: <1351848341-5905-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1351848341-5905-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently packages can be described in two ways: proprietary (tarball not
saved, license not described in further detail), and others (tarball
saved, license described).

Split the logic to allow the license to be always described whether or not
the source code can be redistributed.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/pkg-generic.mk |   27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 993c8d3..2c8535c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -276,6 +276,15 @@ ifndef $(2)_LICENSE_FILES
  endif
 endif
 
+ifndef $(2)_REDISTRIBUTE
+ ifdef $(3)_REDISTRIBUTE
+  $(2)_REDISTRIBUTE = $($(3)_REDISTRIBUTE)
+ endif
+endif
+
+$(2)_REDISTRIBUTE		?= YES
+
+
 $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
 $(2)_INSTALL_STAGING		?= NO
@@ -444,29 +453,27 @@ $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
 endif
 
 # legal-info: declare dependencies and set values used later for the manifest
-ifneq ($$($(2)_LICENSE),PROPRIETARY)
+ifneq ($$($(2)_LICENSE_FILES),)
+$(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
+endif
+$(2)_MANIFEST_LICENSE_FILES ?= not saved
+
+ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifneq ($$($(2)_SITE_METHOD),local)
 ifneq ($$($(2)_SITE_METHOD),override)
 # Packages that have a tarball need it downloaded and extracted beforehand
 $(1)-legal-info: $(1)-extract $(REDIST_SOURCES_DIR)
 $(2)_MANIFEST_TARBALL = $$($(2)_SOURCE)
-ifneq ($$($(2)_LICENSE_FILES),)
-$(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
 endif
 endif
 endif
-endif
-# defaults for packages without tarball or license files
 $(2)_MANIFEST_TARBALL ?= not saved
-$(2)_MANIFEST_LICENSE_FILES ?= not saved
 
 # legal-info: produce legally relevant info.
 $(1)-legal-info:
 # Packages without a source are assumed to be part of Buildroot, skip them.
 ifneq ($(call qstrip,$$($(2)_SOURCE)),)
-ifeq ($$($(2)_LICENSE),PROPRIETARY)
-# Proprietary packages: nothing to save
-else ifeq ($$($(2)_SITE_METHOD),local)
+ifeq ($$($(2)_SITE_METHOD),local)
 # Packages without a tarball: don't save and warn
 	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
 else ifeq ($$($(2)_SITE_METHOD),override)
@@ -482,10 +489,12 @@ else
 		$(call legal-license-file,$$($(2)_RAWNAME),$$$${F},$$($(2)_DIR)/$$$${F}); \
 		done
 endif
+ifeq ($$($(2)_REDISTRIBUTE),YES)
 # Copy the source tarball (just hardlink if possible)
 	@cp -l $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR) 2>/dev/null || \
 	   cp $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR)
 endif
+endif
 	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL))
 endif # ifneq ($(call qstrip,$$($(2)_SOURCE)),)
 
-- 
1.7.9.5
