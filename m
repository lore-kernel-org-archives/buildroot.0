From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 29 Sep 2007 02:25:30 +0300
Subject: [Buildroot] PATCH [1/2] try2: make Makefile.autotools.in not to
 use	hardcoded x11r7 name when patching
In-Reply-To: <20070928203604.GW20951@aon.at>
References: <46FD70EC.2010104@promwad.com> <20070928203604.GW20951@aon.at>
Message-ID: <46FD8D6A.40605@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> What about renaming them to DIR_OFFSET or DIR_PREFIX instead of
> NAME_PREFIX to make it more obvious that those are ment to be dirs.
> 

See below.

> 
> This may be obvious from the context, but is @D guaranteed to exist?
> 

Not sure - need take a look.

2nd try, introducing DIR_PREFIX:

Index: package/Makefile.autotools.in
===================================================================
--- package/Makefile.autotools.in	(revision 20098)
+++ package/Makefile.autotools.in	(working copy)
@@ -58,6 +58,8 @@
 # FOO_SUBDIR [default empty]
 #	relative path in the package source from which to run configure and
 #	make
+# FOO_DIR_PREFIX [default empty]
+#	relative path to package *.mk file and corresponding patches
 #
 ## The following variables contain hook target names
 ## by default they do nothing, they can be overriden in package makefiles
@@ -151,25 +153,15 @@
 	$(call MESSAGE,"Patching")
 	$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
 	$(Q)(\
-	if test -d package/$($(PKG)_NAME) ; then \
-	  if test "$(wildcard package/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
-	    toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1 ; \
+	if test -d $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) ; then \
+	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
+	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1 ; \
 	  else \
-	    toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME) $($(PKG)_NAME)\*.patch || exit 1 ; \
-	    if test -d package/$($(PKG)_NAME)/$(NAMEVER) ; then \
-	      toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME)/$(NAMEVER) \*.patch || exit 1 ; \
+	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) $($(PKG)_NAME)\*.patch || exit 1 ; \
+	    if test -d package/$($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER) ; then \
+	      toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER) \*.patch || exit 1 ; \
 	    fi; \
 	  fi; \
-	else \
-	  echo "This must be wrong. Why do you need to special-case _any_ package here? Skipping until this is resolved properly."; \
-	  if false && test "$(wildcard package/x11r7/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
-	    toolchain/patch-kernel.sh $(@D) package/x11r7/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1 ; \
-	  else \
-	    toolchain/patch-kernel.sh $(@D) package/x11r7/$($(PKG)_NAME) $($(PKG)_NAME)\*.patch || exit 1 ; \
-	    if test -d package/x11r7/$($(PKG)_NAME)/$(NAMEVER) ; then \
-	      toolchain/patch-kernel.sh $(@D) package/x11r7/$($(PKG)_NAME)/$(NAMEVER) \*.patch || exit 1 ; \
-	    fi; \
-	  fi; \
 	fi; \
 	)
 ifeq ($(strip $(BR2_UPDATE_CONFIG)),y)
@@ -258,15 +250,17 @@
 ################################################################################
 # AUTOTARGETS -- the target generator macro; define a set of human-readable
 # make targets, stamps, and default per-package variables.
-# Argument 1 is the (lowercase) package name.
+# Argument 1 is the package dir prefix.
+# Argument 2 is the (lowercase) package name.
 ################################################################################

 define AUTOTARGETS
-$(call AUTOTARGETS_INNER,$(1),$(call UPPERCASE,$(1)))
+$(call AUTOTARGETS_INNER,$(2),$(call UPPERCASE,$(2)),$(1))
 endef

 # AUTOTARGETS_INNER -- does the job for AUTOTARGETS; argument 1 is the
-# lowercase package name, argument 2 the uppercase package name
+# lowercase package name, argument 2 the uppercase package name,
+# argument 3 the package dir prefix
 define AUTOTARGETS_INNER

 # define package-specific variables to default values
@@ -290,6 +284,7 @@
 $(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
 $(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
 $(2)_SUBDIR			?=
+$(2)_DIR_PREFIX			=$(3)


 # define sub-target stamps


--
Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
