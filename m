From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] infrastructure: remove support
	for old style hooks
Message-ID: <20100916113834.97EA08AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ae2be8dbc36293d8243baf2b13ad17a47738d6d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that all old-style hooks occurences have been converted to
new-style hooks, let's get rid of the code needed to support old-style
hooks from the package infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |   33 ++++++---------------------------
 1 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index d76b791..2c667df 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -297,7 +297,7 @@ $(2)_TARGET_UNINSTALL =		$$($(2)_DIR)/.stamp_uninstalled
 $(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
-# new-style hooks
+# post-steps hooks
 $(2)_POST_EXTRACT_HOOKS         ?=
 $(2)_POST_PATCH_HOOKS           ?=
 $(2)_POST_CONFIGURE_HOOKS       ?=
@@ -306,20 +306,13 @@ $(2)_POST_INSTALL_HOOKS         ?=
 $(2)_POST_INSTALL_STAGING_HOOKS ?=
 $(2)_POST_INSTALL_TARGET_HOOKS  ?=
 
-# old-style hooks
-$(2)_HOOK_POST_EXTRACT =	$$($(2)_DIR)/.stamp_hook_post_extract
-$(2)_HOOK_POST_CONFIGURE =	$$($(2)_DIR)/.stamp_hook_post_configure
-$(2)_HOOK_POST_BUILD =		$$($(2)_DIR)/.stamp_hook_post_build
-$(2)_HOOK_POST_INSTALL =	$$($(2)_DIR)/.stamp_hook_post_install
-
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
 
 ifeq ($$($(2)_TYPE),host)
-$(1)-install:	        $(1)-install-host $$($(2)_HOOK_POST_INSTALL)
+$(1)-install:	        $(1)-install-host
 else
-$(1)-install:		$(1)-install-staging $(1)-install-target \
-			$$($(2)_HOOK_POST_INSTALL)
+$(1)-install:		$(1)-install-staging $(1)-install-target
 endif
 
 ifeq ($$($(2)_INSTALL_TARGET),YES)
@@ -339,18 +332,15 @@ endif
 $(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
 
 $(1)-build:		$(1)-configure \
-			$$($(2)_TARGET_BUILD) \
-			$$($(2)_HOOK_POST_BUILD)
+			$$($(2)_TARGET_BUILD)
 
 $(1)-configure:		$(1)-patch \
-			$$($(2)_TARGET_CONFIGURE) \
-			$$($(2)_HOOK_POST_CONFIGURE)
+			$$($(2)_TARGET_CONFIGURE)
 
 $(1)-patch:		$(1)-extract $$($(2)_TARGET_PATCH)
 
 $(1)-extract:		$(1)-depends \
-			$$($(2)_TARGET_EXTRACT) \
-			$$($(2)_HOOK_POST_EXTRACT)
+			$$($(2)_TARGET_EXTRACT)
 
 $(1)-depends:		$(1)-source $$($(2)_DEPENDENCIES)
 
@@ -380,17 +370,6 @@ $$($(2)_TARGET_SOURCE):			PKG=$(2)
 $$($(2)_TARGET_UNINSTALL):		PKG=$(2)
 $$($(2)_TARGET_CLEAN):			PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
-$$($(2)_HOOK_POST_EXTRACT):		PKG=$(2)
-$$($(2)_HOOK_POST_CONFIGURE):		PKG=$(2)
-$$($(2)_HOOK_POST_BUILD):		PKG=$(2)
-$$($(2)_HOOK_POST_INSTALL):		PKG=$(2)
-
-# define hook targets
-# default hook behaviour: do nothing
-$$($(2)_HOOK_POST_EXTRACT):
-$$($(2)_HOOK_POST_CONFIGURE):
-$$($(2)_HOOK_POST_BUILD):
-$$($(2)_HOOK_POST_INSTALL):
 
 # add package to the general list of targets if requested by the buildroot
 # configuration
-- 
1.7.1
