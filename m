From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 29 Sep 2007 00:23:56 +0300
Subject: [Buildroot] PATCH [1/2] make Makefile.autotools.in not to use
 hardcoded x11r7 name when patching
Message-ID: <46FD70EC.2010104@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

Here are two patches addressing hardcoded x11r7 in Makefile.autotools.in:
The first patch removes "if test -d package/x11r7/$($(PKG)_NAME)/$(NAMEVER)" and
adds optional additional parameter ($(PKG)_NAME_PREFIX) when calling AUTOTARGETS
for example:
$(eval $(call AUTOTARGETS,xutil_util-macros,x11r7))

---------

Index: package/Makefile.autotools.in
===================================================================
--- package/Makefile.autotools.in	(revision 20086)
+++ package/Makefile.autotools.in	(working copy)
@@ -58,6 +58,9 @@
 # FOO_SUBDIR [default empty]
 #	relative path in the package source from which to run configure and
 #	make
+# FOO_NAME_PREFIX [default empty]
+#	relative path from packages directory to package *.mk file and
+#	corresponding patches
 #
 ## The following variables contain hook target names
 ## by default they do nothing, they can be overriden in package makefiles
@@ -151,25 +154,15 @@
 	$(call MESSAGE,"Patching")
 	$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
 	$(Q)(\
-	if test -d package/$($(PKG)_NAME) ; then \
-	  if test "$(wildcard package/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
-	    toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1 ; \
+	if test -d package/$($(PKG)_NAME_PREFIX)/$($(PKG)_NAME) ; then \
+	  if test "$(wildcard package/$($(PKG)_NAME_PREFIX)/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
+	    toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME_PREFIX)/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1 ; \
 	  else \
-	    toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME) $($(PKG)_NAME)\*.patch || exit 1 ; \
-	    if test -d package/$($(PKG)_NAME)/$(NAMEVER) ; then \
-	      toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME)/$(NAMEVER) \*.patch || exit 1 ; \
+	    toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME_PREFIX)/$($(PKG)_NAME) $($(PKG)_NAME)\*.patch || exit 1 ; \
+	    if test -d package/$($(PKG)_NAME_PREFIX)/$($(PKG)_NAME)/$(NAMEVER) ; then \
+	      toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME_PREFIX)/$($(PKG)_NAME)/$(NAMEVER) \*.patch || exit 1 ; \
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
@@ -259,10 +252,11 @@
 # AUTOTARGETS -- the target generator macro; define a set of human-readable
 # make targets, stamps, and default per-package variables.
 # Argument 1 is the (lowercase) package name.
+# Argument 2 is the optional package prefix name.
 ################################################################################

 define AUTOTARGETS
-$(call AUTOTARGETS_INNER,$(1),$(call UPPERCASE,$(1)))
+$(call AUTOTARGETS_INNER,$(1),$(call UPPERCASE,$(1)),$(2))
 endef

 # AUTOTARGETS_INNER -- does the job for AUTOTARGETS; argument 1 is the
@@ -290,6 +284,7 @@
 $(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
 $(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
 $(2)_SUBDIR			?=
+$(2)_NAME_PREFIX		=$(3)


 # define sub-target stamps

---------------------

Best regards,
Ivan

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
