From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 23:48:10 +0200
Subject: [Buildroot] [PATCH 1/4] package: enhance infrastructure to support
	source dir override
In-Reply-To: <cover.1305755245.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305755245.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c7659f95de05fab6acb0cc1b5e8772a80832fc33.1305755245.git.thomas.petazzoni@free-electrons.com>
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
build inside this source directory. Will out-of-tree builds would have
been possible with AUTOTARGETS, it wouldn't work well in a generic way
for GENTARGETS packages. That's the reason why we've choosen to keep
an in-tree build solution.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index bf4e1b4..1afc18d 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -250,6 +250,13 @@ $(BUILD_DIR)/%/.stamp_extracted:
 	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
+# Set up symbolic link to the source directory if the
+# <pkg>_OVERRIDE_SRCDIR feature is used.
+$(BUILD_DIR)/%/.stamp_symlinked:
+	@$(call MESSAGE,"Symlinking to source dir")
+	ln -s $(SRCDIR) $(@D)
+	$(Q)touch $@
+
 # Patch
 #
 # The NOHOSTPKG variable is the uppercased package name, without the
@@ -418,6 +425,7 @@ $(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
 $(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
+$(2)_TARGET_SYMLINK =		$$($(2)_DIR)/.stamp_symlinked
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
 $(2)_TARGET_EXTRACT =		$$($(2)_DIR)/.stamp_extracted
 $(2)_TARGET_SOURCE =		$$($(2)_DIR)/.stamp_downloaded
@@ -463,8 +471,15 @@ $(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
 $(1)-build:		$(1)-configure \
 			$$($(2)_TARGET_BUILD)
 
+ifeq ($($(2)_OVERRIDE_SRCDIR),)
 $(1)-configure:		$(1)-patch \
 			$$($(2)_TARGET_CONFIGURE)
+else
+$(1)-configure:		$(1)-symlink \
+			$$($(2)_TARGET_CONFIGURE)
+endif
+
+$(1)-symlink:		$$($(2)_TARGET_SYMLINK)
 
 $(1)-patch:		$(1)-extract $$($(2)_TARGET_PATCH)
 
@@ -492,6 +507,7 @@ $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
+$$($(2)_TARGET_SYMLINK):		SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			NOHOSTPKG=$(3)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
-- 
1.7.1
