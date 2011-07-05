From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Jul 2011 21:53:56 +0200
Subject: [Buildroot] [PATCH 05/28] package: add infrastructure to install
	things in images/
In-Reply-To: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <33602d37e6e1d6e90cb573f5a440fe0f185df099.1309895466.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will allow the bootloader makefiles and the kernel makefile to
rely on the GENTARGETS infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |   20 +++++++++++++++++++-
 1 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 0a4c220..6126e6b 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -304,6 +304,13 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
+# Install to images dir
+$(BUILD_DIR)/%/.stamp_images_installed:
+	@$(call MESSAGE,'Installing to images directory')
+	$($(PKG)_INSTALL_IMAGES_CMDS)
+	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
+	$(Q)touch $@
+
 # Install to target dir
 $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call MESSAGE,"Installing to target")
@@ -408,12 +415,14 @@ endif
 
 $(2)_DEPENDENCIES		?=
 $(2)_INSTALL_STAGING		?= NO
+$(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
 $(2)_DIR_PREFIX			= $(if $(4),$(4),$(TOP_SRCDIR)/package)
 
 # define sub-target stamps
 $(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
 $(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
+$(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
 $(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
@@ -438,6 +447,7 @@ $(2)_POST_BUILD_HOOKS           ?=
 $(2)_POST_INSTALL_HOOKS         ?=
 $(2)_POST_INSTALL_STAGING_HOOKS ?=
 $(2)_POST_INSTALL_TARGET_HOOKS  ?=
+$(2)_POST_INSTALL_IMAGES_HOOKS  ?=
 
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
@@ -445,7 +455,7 @@ $(1):			$(1)-install
 ifeq ($$($(2)_TYPE),host)
 $(1)-install:	        $(1)-install-host
 else
-$(1)-install:		$(1)-install-staging $(1)-install-target
+$(1)-install:		$(1)-install-staging $(1)-install-target $(1)-install-images
 endif
 
 ifeq ($$($(2)_INSTALL_TARGET),YES)
@@ -462,6 +472,13 @@ else
 $(1)-install-staging:
 endif
 
+ifeq ($$($(2)_INSTALL_IMAGES),YES)
+$(1)-install-images:	$(1)-build \
+			$$($(2)_TARGET_INSTALL_IMAGES)
+else
+$(1)-install-images:
+endif
+
 $(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
 
 $(1)-build:		$(1)-configure \
@@ -493,6 +510,7 @@ $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 # uppercase package variable prefix
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
+$$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
-- 
1.7.4.1
