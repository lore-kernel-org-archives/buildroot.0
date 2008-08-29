From: laird at uclibc.org <laird@uclibc.org>
Date: Fri, 29 Aug 2008 05:04:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080829120427.321033C839@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-08-29 05:04:26 -0700 (Fri, 29 Aug 2008)
New Revision: 23282

Log:
Makefile.autotools.in: Add extra POST_HOOK targets

It is not possible currently in Makefile.autotools.in packages 
to do something extra after an extract or configure. 
This may be useful for example 
extract libxml2-2.6.32 
POST_EXTRACT = remove some .rej files that are in offical release
patch (not fail because of remaining .rej files)
configure

I think this is useful improvement 
(necessary for Makefile.autotools.in packages)

Daniel Laird


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-08-29 08:37:07 UTC (rev 23281)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-08-29 12:04:26 UTC (rev 23282)
@@ -64,6 +64,7 @@
 ## The following variables contain hook target names
 ## by default they do nothing, they can be overriden in package makefiles
 #
+# FOO_HOOK_POST_EXTRACT, FOO_HOOK_POST_CONFIGURE,
 # FOO_HOOK_POST_BUILD, FOO_HOOK_POST_INSTALL
 #
 ## The following variables contain targets that can be overriden
@@ -314,6 +315,8 @@
 $(2)_TARGET_CLEAN =		$$($(2)_DIR)/.stamp_cleaned
 $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 
+$(2)_HOOK_POST_EXTRACT =	$$($(2)_DIR)/.stamp_hook_post_extract
+$(2)_HOOK_POST_CONFIGURE =	$$($(2)_DIR)/.stamp_hook_post_configure
 $(2)_HOOK_POST_BUILD =		$$($(2)_DIR)/.stamp_hook_post_build
 $(2)_HOOK_POST_INSTALL =	$$($(2)_DIR)/.stamp_hook_post_install
 
@@ -338,7 +341,9 @@
 			$$($(2)_TARGET_BUILD) \
 			$$($(2)_HOOK_POST_BUILD)
 
-$(1)-configure:		$(1)-autoreconf $$($(2)_TARGET_CONFIGURE)
+$(1)-configure:		$(1)-autoreconf \
+			$$($(2)_TARGET_CONFIGURE) \
+			$$($(2)_HOOK_POST_CONFIGURE)
 
 ifeq ($$($(2)_AUTORECONF),YES)
 $(1)-autoreconf:	$(1)-patch $$($(2)_TARGET_AUTORECONF)
@@ -349,7 +354,9 @@
 
 $(1)-patch:		$(1)-extract $$($(2)_TARGET_PATCH)
 
-$(1)-extract:		$(1)-depends $$($(2)_TARGET_EXTRACT)
+$(1)-extract:		$(1)-depends \
+			$$($(2)_TARGET_EXTRACT) \
+			$$($(2)_HOOK_POST_EXTRACT)
 
 $(1)-depends:		$(1)-source $$($(2)_DEPENDENCIES)
 
@@ -375,11 +382,15 @@
 $$($(2)_TARGET_UNINSTALL):		PKG=$(2)
 $$($(2)_TARGET_CLEAN):			PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
+$$($(2)_HOOK_POST_EXTRACT):		PKG=$(2)
+$$($(2)_HOOK_POST_CONFIGURE):	PKG=$(2)
 $$($(2)_HOOK_POST_BUILD):		PKG=$(2)
 $$($(2)_HOOK_POST_INSTALL):		PKG=$(2)
 
 # define hook targets
 # default hook behaviour: do nothing
+$$($(2)_HOOK_POST_EXTRACT):
+$$($(2)_HOOK_POST_CONFIGURE):
 $$($(2)_HOOK_POST_BUILD):
 $$($(2)_HOOK_POST_INSTALL):
 
