From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 07:52:01 +0200
Subject: [Buildroot] [PATCH 02/12] package: enhance infrastructure to
	support source dir override
In-Reply-To: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fed6cc77c0e18aa06a3fc1e3b9bfd9db70b98d23.1311141087.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a variable <pkg>_OVERRIDE_SRCDIR is defined, then Buildroot will
no longer try to download, extract and patch the package. It will
simply use the value of this variable as the source directory for the
package. A symbolic link to this directory will be created, so that
for Buildroot, the package sources are still in
$(O)/build/pkg-version/.

This can be used to tell Buildroot that the sources for a given
package are inside some directory that you control, and which can be
versioned in Git/SVN, or handled in whichever way you want.

Note that Buildroot will still create its .stamp_* files and do the
build inside this source directory. While out-of-tree builds would
have been possible with AUTOTARGETS, it wouldn't work well in a
generic way for GENTARGETS packages. That's the reason why we've
choosen to keep an in-tree build solution.

Those <pkg>_OVERRIDE_SRCDIR variables will be defined by a local
makefile included by Buildroot, which will be handled in a later
commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |   55 +++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 2798868..c22c104 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -250,6 +250,28 @@ $(BUILD_DIR)/%/.stamp_extracted:
 	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
+# Set up symbolic link to the source directory if the
+# <pkg>_OVERRIDE_SRCDIR feature is used. Before creating the symlink,
+# we remove stale stamp files that could have been left from previous
+# Buildroot builds.
+$(BUILD_DIR)/%/.stamp_symlinked:
+	@$(call MESSAGE,"Symlinking to source dir $(SRCDIR)")
+	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
+	rm -f $(SRCDIR)/.stamp_*
+	ln -s $(SRCDIR) $(@D)
+	$(Q)touch $@
+
+# Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for symlinked
+# packages
+$(BUILD_DIR)/%/.stamp_symlink_sourced:
+ifeq ($(DL_MODE),SOURCE_CHECK)
+	test -d $(SRCDIR)
+else ifeq ($(DL_MODE),SHOW_EXTERNAL_DEPS)
+	echo "file://$(SRCDIR)"
+else
+	@true # Nothing to do to source a local package
+endif
+
 # Patch
 #
 # The RAWNAME variable is the lowercased package name, which allows to
@@ -380,6 +402,10 @@ $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
 $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
 
+ifneq ($$($(2)_OVERRIDE_SRCDIR),)
+$(2)_VERSION = custom
+endif
+
 ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $($(3)_SOURCE)
@@ -425,6 +451,8 @@ $(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
 $(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
+$(2)_TARGET_SYMLINK =		$$($(2)_DIR)/.stamp_symlinked
+$(2)_TARGET_SYMLINK_SOURCE =    $$($(2)_DIR)/.stamp_symlink_sourced
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
@@ -484,6 +512,13 @@ $(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
 $(1)-build:		$(1)-configure \
 			$$($(2)_TARGET_BUILD)
 
+ifeq ($$($(2)_OVERRIDE_SRCDIR),)
+# In the normal case (no package override), the sequence of steps is
+#  source, by downloading
+#  depends
+#  extract
+#  patch
+#  configure
 $(1)-configure:		$(1)-patch \
 			$$($(2)_TARGET_CONFIGURE)
 
@@ -494,11 +529,25 @@ $(1)-extract:		$(1)-depends \
 
 $(1)-depends:		$(1)-source $$($(2)_DEPENDENCIES)
 
+$(1)-source:		$$($(2)_TARGET_SOURCE)
+else
+# In the package override case, the sequence of steps
+#  source, by symlinking
+#  depends
+#  configure
+$(1)-configure:		$(1)-depends \
+			$$($(2)_TARGET_CONFIGURE)
+
+$(1)-depends:		$(1)-symlink $$($(2)_DEPENDENCIES)
+
+$(1)-symlink:		$$($(2)_TARGET_SYMLINK)
+
+$(1)-source:		$$($(2)_TARGET_SYMLINK_SOURCE)
+endif
+
 $(1)-show-depends:
 			@echo $$($(2)_DEPENDENCIES)
 
-$(1)-source:		$$($(2)_TARGET_SOURCE)
-
 $(1)-uninstall:		$(1)-configure $$($(2)_TARGET_UNINSTALL)
 
 $(1)-clean:		$(1)-uninstall \
@@ -514,6 +563,8 @@ $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
+$$($(2)_TARGET_SYMLINK):		SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
+$$($(2)_TARGET_SYMLINK_SOURCE):		SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
-- 
1.7.4.1
