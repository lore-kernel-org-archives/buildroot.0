From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 06 Jun 2014 22:12:57 +0200
Subject: [Buildroot] [PATCH 1 of 7 v3] infra: consistently use double dollar
 signs inside inner-xxx-targets
In-Reply-To: <patchbomb.1402085576@localhost>
References: <patchbomb.1402085576@localhost>
Message-ID: <b1861ead49778767b075.1402085577@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The inner-xxx-targets in the buildroot package infrastructures are
evaluated using $(eval) which causes variable references to be a bit
different than in regular make code. As we want most references to be
expanded only at the time of the $(eval) we should not use standard
references $(VAR) but rather use double dollar signs $$(VAR). This includes
function references like $(call), $(subst), etc. The only exception is the
reference to pkgdir/pkgname and numbered variables, which are parameters to
the inner block: $(1), $(2), etc.

This patch introduces consistent usage of double-dollar signs throughout the
different inner-xxx-targets blocks.

In some cases, this would potentially cause circular references, in
particular when the value of HOST_FOO_VAR would be obtained from the
corresponding FOO_VAR if HOST_FOO_VAR is not defined. In these cases, a test
is added to check for a host package (the only case where such constructions
are relevant; these are not circular).

Benefits of these changes are:
- behavior of variables is now again as expected. For example, setting
  $(2)_VERSION = virtual in pkg-virtual.mk will effectively work, while
  originally it would cause very odd results.

- The output of 'make printvars' is now much more useful. This target shows
  the value of all variables, and the expression that led to that value.
  However, if the expression was coming from an inner-xxx-targets block, and
  was using single dollar signs, it would show in printvars as
    VAR = value (value)
  while if double dollar signs are used, it would effectively look like
    VAR = value (actual expression)
  as is intended.
  This improvement is for example effective for FOO_DL_VERSION, FOO_RAWNAME,
  FOO_SITE_METHOD and FOO_MAKE.

The correctness of this patch has been verified using 'make printvars',
'make manual' and 'make legal-info' before and after applying this patch,
and comparing the output.

Insight-provided-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3: (rebase + implement comments from Arnout)
- add comment to manual.mk and fs/common.mk
- replace the $(origin) stuff with if ($(4),host) instead
- revert changes to outer targets
- remove comment in legal info ('double dollar signs are really needed
  here because...')
- revert changes to caseconvert-helper

v2:
- extend change to manual, fs/common and caseconvert-helper (Yann)
- increase consistency by also changing $(Q) in $$(Q) and the UPPERCASE
  calls in the xxx-targets (outer) block. (Yann)

 docs/manual/manual.mk    |  21 +++++----
 fs/common.mk             |  16 ++++---
 package/pkg-autotools.mk |  30 ++++++++------
 package/pkg-cmake.mk     |  28 +++++++------
 package/pkg-generic.mk   |  89 +++++++++++++++++++++----------------------
 package/pkg-luarocks.mk  |  10 ++--
 package/pkg-perl.mk      |  44 ++++++++++----------
 package/pkg-python.mk    |  30 +++++++------
 package/pkg-virtual.mk   |  12 +++--
 9 files changed, 147 insertions(+), 133 deletions(-)

Note: the 'make -qp' suggestion by Arnout produced a lot of output due to
the fact that the variables are now no longer expanded early. For printvars
I could easily work around this by patching it to only print the value, not
the rule, and then comparing. For 'make -qp' it is not possible. I did not
take on the task of comparing these files of 500k lines, but am trusting the
output of printvars along with the comparison of legal-info and manual
output.

diff -r 39292611ec34 -r b1861ead4977 docs/manual/manual.mk
--- a/docs/manual/manual.mk	Thu Jun 05 10:38:01 2014 -0500
+++ b/docs/manual/manual.mk	Thu May 08 21:53:48 2014 +0200
@@ -33,8 +33,8 @@
 	fi
 
 ################################################################################
-# GENDOC -- generates the make targets needed to build a specific type of
-#           asciidoc documentation.
+# GENDOC_INNER -- generates the make targets needed to build a specific type of
+#                 asciidoc documentation.
 #
 #  argument 1 is the name of the document and must be a subdirectory of docs/;
 #             the top-level asciidoc file must have the same name
@@ -45,6 +45,9 @@
 #  argument 6 (optional) are extra arguments for a2x
 #
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
+#
+# Since this function will be called from within an $(eval ...)
+# all variable references except the arguments must be $$-quoted.
 ################################################################################
 define GENDOC_INNER
 $(1): $(1)-$(3)
@@ -54,16 +57,16 @@
 manual-check-dependencies-$(3):
 
 $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
-			   $$($(call UPPERCASE,$(1))_SOURCES) \
+			   $$($$(call UPPERCASE,$(1))_SOURCES) \
 			   manual-check-dependencies \
 			   manual-check-dependencies-$(3) \
 			   manual-update-lists
-	$(Q)$(call MESSAGE,"Generating $(5) $(1)...")
-	$(Q)mkdir -p $$(@D)/.build
-	$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
-	$(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
+	$$(Q)$$(call MESSAGE,"Generating $(5) $(1)...")
+	$$(Q)mkdir -p $$(@D)/.build
+	$$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
+	$$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
 	        -D $$(@D) $$(@D)/.build/$(1).txt
-	-$(Q)rm -rf $$(@D)/.build
+	-$$(Q)rm -rf $$(@D)/.build
 endef
 
 ################################################################################
@@ -82,7 +85,7 @@
 $(call GENDOC_INNER,$(1),epub,epub,epub,ePUB)
 clean: $(1)-clean
 $(1)-clean:
-	$(Q)$(RM) -rf $(O)/docs/$(1)
+	$$(Q)$$(RM) -rf $$(O)/docs/$(1)
 .PHONY: $(1) $(1)-clean manual-update-lists
 endef
 
diff -r 39292611ec34 -r b1861ead4977 fs/common.mk
--- a/fs/common.mk	Thu Jun 05 10:38:01 2014 -0500
+++ b/fs/common.mk	Thu May 08 21:53:48 2014 +0200
@@ -35,11 +35,13 @@
 USERS_TABLE = $(BUILD_DIR)/_users_table.txt
 ROOTFS_USERS_TABLES = $(call qstrip,$(BR2_ROOTFS_USERS_TABLES))
 
+# Since this function will be called from within an $(eval ...)
+# all variable references except the arguments must be $$-quoted.
 define ROOTFS_TARGET_INTERNAL
 
 # extra deps
 ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs \
-	$(if $(PACKAGES_USERS),host-mkpasswd)
+	$$(if $$(PACKAGES_USERS),host-mkpasswd)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 ROOTFS_$(2)_COMPRESS_EXT = .gz
@@ -69,7 +71,7 @@
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
 	rm -f $$(FAKEROOT_SCRIPT)
 	rm -f $$(TARGET_DIR_WARNING_FILE)
-	rm -f $(USERS_TABLE)
+	rm -f $$(USERS_TABLE)
 	echo "chown -R 0:0 $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 ifneq ($$(ROOTFS_DEVICE_TABLES),)
 	cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
@@ -80,14 +82,14 @@
 	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 endif
 ifneq ($$(ROOTFS_USERS_TABLES),)
-	cat $$(ROOTFS_USERS_TABLES) >> $(USERS_TABLE)
+	cat $$(ROOTFS_USERS_TABLES) >> $$(USERS_TABLE)
 endif
-	printf '$(subst $(sep),\n,$(PACKAGES_USERS))' >> $(USERS_TABLE)
-	PATH=$(BR_PATH) $(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
+	printf '$$(subst $$(sep),\n,$$(PACKAGES_USERS))' >> $$(USERS_TABLE)
+	PATH=$$(BR_PATH) $$(TOPDIR)/support/scripts/mkusers $$(USERS_TABLE) $$(TARGET_DIR) >> $$(FAKEROOT_SCRIPT)
 	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
-	PATH=$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
-	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
+	PATH=$$(BR_PATH) $$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
+	$$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $$(TARGET_DIR_WARNING_FILE)
 	- at rm -f $$(FAKEROOT_SCRIPT) $$(FULL_DEVICE_TABLE)
 ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
 	PATH=$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
diff -r 39292611ec34 -r b1861ead4977 package/pkg-autotools.mk
--- a/package/pkg-autotools.mk	Thu Jun 05 10:38:01 2014 -0500
+++ b/package/pkg-autotools.mk	Thu May 08 21:53:48 2014 +0200
@@ -65,7 +65,7 @@
 
 ifndef $(2)_LIBTOOL_PATCH
  ifdef $(3)_LIBTOOL_PATCH
-  $(2)_LIBTOOL_PATCH = $($(3)_LIBTOOL_PATCH)
+  $(2)_LIBTOOL_PATCH = $$($(3)_LIBTOOL_PATCH)
  else
   $(2)_LIBTOOL_PATCH ?= YES
  endif
@@ -73,25 +73,28 @@
 
 ifndef $(2)_MAKE
  ifdef $(3)_MAKE
-  $(2)_MAKE = $($(3)_MAKE)
+  $(2)_MAKE = $$($(3)_MAKE)
  else
-  $(2)_MAKE ?= $(MAKE)
+  $(2)_MAKE ?= $$(MAKE)
  endif
 endif
 
 ifndef $(2)_AUTORECONF
  ifdef $(3)_AUTORECONF
-  $(2)_AUTORECONF = $($(3)_AUTORECONF)
+  $(2)_AUTORECONF = $$($(3)_AUTORECONF)
  else
   $(2)_AUTORECONF ?= NO
  endif
 endif
 
+ifeq ($(4),host)
+ $(2)_AUTORECONF_OPT ?= $$($(3)_AUTORECONF_OPT)
+endif
+
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPT			?=
-$(2)_AUTORECONF_OPT		?= $($(3)_AUTORECONF_OPT)
 $(2)_INSTALL_OPT                ?= install
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
@@ -175,7 +178,7 @@
 #
 define LIBTOOL_PATCH_HOOK
 	@$$(call MESSAGE,"Patching libtool")
-	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES" \
+	$$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES" \
 		-a "$$($$(PKG)_AUTORECONF)" != "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
 			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
@@ -201,8 +204,8 @@
 #
 define AUTORECONF_HOOK
 	@$$(call MESSAGE,"Autoreconfiguring")
-	$(Q)cd $$($$(PKG)_SRCDIR) && $(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
-	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
+	$$(Q)cd $$($$(PKG)_SRCDIR) && $$(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
+	$$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
 			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
 			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
@@ -220,10 +223,11 @@
 # This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
 # away from the non-host rule
-$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool \
+ifeq ($(4),host)
+$(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-libtool \
 				host-toolchain $(1),\
-    $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
-
+    $$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
+endif
 
 ifeq ($$($(2)_AUTORECONF),YES)
 $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
@@ -263,9 +267,9 @@
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
-	for i in $$$$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
+	for i in $$$$(find $$(STAGING_DIR)/usr/lib* -name "*.la"); do \
 		cp -f $$$$i $$$$i~; \
-		$$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
+		$$(SED) "s:\(['= ]\)/usr:\\1$$(STAGING_DIR)/usr:g" $$$$i; \
 	done
 endef
 endif
diff -r 39292611ec34 -r b1861ead4977 package/pkg-cmake.mk
--- a/package/pkg-cmake.mk	Thu Jun 05 10:38:01 2014 -0500
+++ b/package/pkg-cmake.mk	Thu May 08 21:53:48 2014 +0200
@@ -38,14 +38,14 @@
 
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
-$(2)_MAKE			?= $(MAKE)
+$(2)_MAKE			?= $$(MAKE)
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPT			?=
 $(2)_INSTALL_HOST_OPT		?= install
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR) install
 
-$(2)_SRCDIR			= $$($(2)_DIR)/$($(2)_SUBDIR)
+$(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
 $(2)_BUILDDIR			= $$($(2)_SRCDIR)
 
 #
@@ -60,15 +60,15 @@
 define $(2)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
-	PATH=$(BR_PATH) \
-	$$($$(PKG)_CONF_ENV) $(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+	PATH=$$(BR_PATH) \
+	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
-		-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release) \
+		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
 		-DCMAKE_INSTALL_PREFIX="/usr" \
 		-DCMAKE_COLOR_MAKEFILE=OFF \
 		-DBUILD_TESTING=OFF \
-		-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \
-		-DUSE_CCACHE=$(if $(BR2_CCACHE),ON,OFF) \
+		-DBUILD_SHARED_LIBS=$$(if $$(BR2_PREFER_STATIC_LIB),OFF,ON) \
+		-DUSE_CCACHE=$$(if $$(BR2_CCACHE),ON,OFF) \
 		$$($$(PKG)_CONF_OPT) \
 	)
 endef
@@ -78,15 +78,15 @@
 define $(2)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
-	PATH=$(BR_PATH) \
-	$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
+	PATH=$$(BR_PATH) \
+	$$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" \
 		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" \
 		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
-		-DUSE_CCACHE=$(if $(BR2_CCACHE),ON,OFF) \
+		-DUSE_CCACHE=$$(if $$(BR2_CCACHE),ON,OFF) \
 		-DBUILD_TESTING=OFF \
 		$$($$(PKG)_CONF_OPT) \
 	)
@@ -96,7 +96,9 @@
 
 # This must be repeated from inner-generic-package, otherwise we only get
 # host-cmake in _DEPENDENCIES because of the following line
-$(2)_DEPENDENCIES ?= $(filter-out host-toolchain $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+ifeq ($(4),host)
+$(2)_DEPENDENCIES ?= $$(filter-out host-toolchain $(1),$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
+endif
 
 $(2)_DEPENDENCIES += host-cmake
 
@@ -107,11 +109,11 @@
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 else
 define $(2)_BUILD_CMDS
-	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 endif
@@ -122,7 +124,7 @@
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_HOST_OPT) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_HOST_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 
@@ -132,7 +134,7 @@
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 
@@ -142,7 +144,7 @@
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) $$($$(PKG)_INSTALL_TARGET_OPT) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 
diff -r 39292611ec34 -r b1861ead4977 package/pkg-generic.mk
--- a/package/pkg-generic.mk	Thu Jun 05 10:38:01 2014 -0500
+++ b/package/pkg-generic.mk	Thu May 08 21:53:48 2014 +0200
@@ -282,7 +282,7 @@
 
 $(2)_TYPE                       =  $(4)
 $(2)_NAME			=  $(1)
-$(2)_RAWNAME			=  $(patsubst host-%,%,$(1))
+$(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
 
 # Keep the package version that may contain forward slashes in the _DL_VERSION
 # variable, then replace all forward slashes ('/') by underscores ('_') to
@@ -291,15 +291,15 @@
 # version control system branch or tag, for example remotes/origin/1_10_stable.
 ifndef $(2)_VERSION
  ifdef $(3)_VERSION
-  $(2)_DL_VERSION = $($(3)_VERSION)
-  $(2)_VERSION = $(subst /,_,$($(3)_VERSION))
+  $(2)_DL_VERSION = $$($(3)_VERSION)
+  $(2)_VERSION := $$(subst /,_,$$($(3)_VERSION))
  else
   $(2)_VERSION = undefined
   $(2)_DL_VERSION = undefined
  endif
 else
-  $(2)_DL_VERSION = $($(2)_VERSION)
-  $(2)_VERSION = $(subst /,_,$($(2)_VERSION))
+  $(2)_DL_VERSION = $$($(2)_VERSION)
+  $(2)_VERSION := $$(subst /,_,$$($(2)_VERSION))
 endif
 
 $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
@@ -323,7 +323,7 @@
 
 ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
-  $(2)_SOURCE = $($(3)_SOURCE)
+  $(2)_SOURCE = $$($(3)_SOURCE)
  else
   $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
  endif
@@ -331,22 +331,22 @@
 
 ifndef $(2)_PATCH
  ifdef $(3)_PATCH
-  $(2)_PATCH = $($(3)_PATCH)
+  $(2)_PATCH = $$($(3)_PATCH)
  endif
 endif
 
 ifndef $(2)_SITE
  ifdef $(3)_SITE
-  $(2)_SITE = $($(3)_SITE)
+  $(2)_SITE = $$($(3)_SITE)
  endif
 endif
 
 ifndef $(2)_SITE_METHOD
  ifdef $(3)_SITE_METHOD
-  $(2)_SITE_METHOD = $($(3)_SITE_METHOD)
+  $(2)_SITE_METHOD = $$($(3)_SITE_METHOD)
  else
 	# Try automatic detection using the scheme part of the URI
-	$(2)_SITE_METHOD = $(call geturischeme,$($(2)_SITE))
+	$(2)_SITE_METHOD = $$(call geturischeme,$$($(2)_SITE))
  endif
 endif
 
@@ -358,7 +358,7 @@
 
 ifndef $(2)_LICENSE
  ifdef $(3)_LICENSE
-  $(2)_LICENSE = $($(3)_LICENSE)
+  $(2)_LICENSE = $$($(3)_LICENSE)
  endif
 endif
 
@@ -366,13 +366,13 @@
 
 ifndef $(2)_LICENSE_FILES
  ifdef $(3)_LICENSE_FILES
-  $(2)_LICENSE_FILES = $($(3)_LICENSE_FILES)
+  $(2)_LICENSE_FILES = $$($(3)_LICENSE_FILES)
  endif
 endif
 
 ifndef $(2)_REDISTRIBUTE
  ifdef $(3)_REDISTRIBUTE
-  $(2)_REDISTRIBUTE = $($(3)_REDISTRIBUTE)
+  $(2)_REDISTRIBUTE = $$($(3)_REDISTRIBUTE)
  endif
 endif
 
@@ -383,8 +383,10 @@
 # dependency
 $(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES
 
-$(2)_DEPENDENCIES ?= $(filter-out  host-toolchain $(1),\
-	$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+ifeq ($(4),host)
+$(2)_DEPENDENCIES ?= $$(filter-out  host-toolchain $(1),\
+	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
+endif
 ifeq ($(4),target)
 ifeq ($$($(2)_ADD_TOOLCHAIN_DEPENDENCY),YES)
 $(2)_DEPENDENCIES += toolchain
@@ -411,8 +413,8 @@
 
 # default extract command
 $(2)_EXTRACT_CMDS ?= \
-	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $(DL_DIR)/$$($(2)_SOURCE) | \
-	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
+	$$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE))) $$(DL_DIR)/$$($(2)_SOURCE) | \
+	$$(TAR) $$(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $$(TAR_OPTIONS) -)
 
 # pre/post-steps hooks
 $(2)_PRE_DOWNLOAD_HOOKS         ?=
@@ -486,7 +488,7 @@
 $$($(2)_TARGET_CONFIGURE):	| $$($(2)_DEPENDENCIES)
 
 $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
-ifeq ($(filter $(1),$(DEPENDENCIES_HOST_PREREQ)),)
+ifeq ($$(filter $(1),$$(DEPENDENCIES_HOST_PREREQ)),)
 $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
 endif
 
@@ -529,11 +531,11 @@
 			@echo $$($(2)_DEPENDENCIES)
 
 $(1)-graph-depends:
-			@$(INSTALL) -d $(O)/graphs
-			@cd "$(CONFIG_DIR)"; \
-			$(TOPDIR)/support/scripts/graph-depends -p $(1) $(BR2_GRAPH_DEPS_OPTS) \
-			|tee $(O)/graphs/$$(@).dot \
-			|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$$(@).$(BR_GRAPH_OUT)
+			@$$(INSTALL) -d $$(O)/graphs
+			@cd "$$(CONFIG_DIR)"; \
+			$$(TOPDIR)/support/scripts/graph-depends -p $(1) $$(BR2_GRAPH_DEPS_OPTS) \
+			|tee $$(O)/graphs/$$(@).dot \
+			|dot -T$$(BR_GRAPH_OUT) -o $$(O)/graphs/$$(@).$$(BR_GRAPH_OUT)
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
@@ -567,7 +569,7 @@
 $$($(2)_TARGET_RSYNC_SOURCE):		SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC_SOURCE):		PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-$$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
+$$($(2)_TARGET_PATCH):			RAWNAME=$$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
@@ -578,9 +580,9 @@
 # kernel case, the bootloaders case, and the normal packages case.
 ifeq ($(1),linux)
 $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
-else ifneq ($(filter boot/%,$(pkgdir)),)
+else ifneq ($$(filter boot/%,$(pkgdir)),)
 $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
-else ifneq ($(filter toolchain/%,$(pkgdir)),)
+else ifneq ($$(filter toolchain/%,$(pkgdir)),)
 $(2)_KCONFIG_VAR = BR2_$(2)
 else
 $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
@@ -596,7 +598,7 @@
 ifneq ($$($(2)_SITE_METHOD),local)
 ifneq ($$($(2)_SITE_METHOD),override)
 # Packages that have a tarball need it downloaded and extracted beforehand
-$(1)-legal-info: $(1)-extract $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(4)))
+$(1)-legal-info: $(1)-extract $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
 $(2)_MANIFEST_TARBALL = $$($(2)_SOURCE)
 endif
 endif
@@ -606,40 +608,37 @@
 # legal-info: produce legally relevant info.
 $(1)-legal-info:
 # Packages without a source are assumed to be part of Buildroot, skip them.
-	$(foreach hook,$($(2)_PRE_LEGAL_INFO_HOOKS),$(call $(hook))$(sep))
-ifneq ($(call qstrip,$$($(2)_SOURCE)),)
+	$$(foreach hook,$$($(2)_PRE_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
+ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 
 ifeq ($$($(2)_SITE_METHOD),local)
 # Packages without a tarball: don't save and warn
-	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
+	@$$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
 
 else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
-	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),override)
+	@$$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),override)
 
 else
 # Other packages
 
 # Save license files if defined
-ifeq ($(call qstrip,$$($(2)_LICENSE_FILES)),)
-	@$(call legal-license-nofiles,$$($(2)_RAWNAME),$(call UPPERCASE,$(4)))
-	@$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
+ifeq ($$(call qstrip,$$($(2)_LICENSE_FILES)),)
+	@$$(call legal-license-nofiles,$$($(2)_RAWNAME),$$(call UPPERCASE,$(4)))
+	@$$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
 else
-# Double dollar signs are really needed here, to catch host packages
-# without explicit HOST_FOO_LICENSE_FILES assignment, also in case they
-# have multiple license files.
-	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F),$(call UPPERCASE,$(4)))$$(sep))
+	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
 endif # license files
 
 ifeq ($$($(2)_REDISTRIBUTE),YES)
 # Copy the source tarball (just hardlink if possible)
-	@cp -l $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(4))) 2>/dev/null || \
-	   cp $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(4)))
+	@cp -l $$(DL_DIR)/$$($(2)_SOURCE) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) 2>/dev/null || \
+	   cp $$(DL_DIR)/$$($(2)_SOURCE) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
 endif # redistribute
 
 endif # other packages
-	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$(call UPPERCASE,$(4)))
-endif # ifneq ($(call qstrip,$$($(2)_SOURCE)),)
-	$(foreach hook,$($(2)_POST_LEGAL_INFO_HOOKS),$(call $(hook))$(sep))
+	@$$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL),$$(call UPPERCASE,$(4)))
+endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
+	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
 
 # add package to the general list of targets if requested by the buildroot
 # configuration
@@ -682,8 +681,8 @@
 # ZCAT="gzip -d -c", and to check for the dependency we only want 'gzip'.
 # Do not add xzcat to the list of required dependencies, as it gets built
 # automatically if it isn't found.
-ifneq ($(call suitable-extractor,$($(2)_SOURCE)),$(XZCAT))
-DL_TOOLS_DEPENDENCIES += $(firstword $(call suitable-extractor,$($(2)_SOURCE)))
+ifneq ($$(call suitable-extractor,$$($(2)_SOURCE)),$$(XZCAT))
+DL_TOOLS_DEPENDENCIES += $$(firstword $$(call suitable-extractor,$$($(2)_SOURCE)))
 endif
 
 endif # $(2)_KCONFIG_VAR
diff -r 39292611ec34 -r b1861ead4977 package/pkg-luarocks.mk
--- a/package/pkg-luarocks.mk	Thu Jun 05 10:38:01 2014 -0500
+++ b/package/pkg-luarocks.mk	Thu May 08 21:53:48 2014 +0200
@@ -34,10 +34,10 @@
 define inner-luarocks-package
 
 $(2)_BUILD_OPT		?=
-$(2)_SUBDIR		?= $(1)-$(shell echo "$($(3)_VERSION)" | sed -e "s/-[0-9]$$//")
-$(2)_ROCKSPEC		?= $(1)-$($(3)_VERSION).rockspec
-$(2)_SOURCE		?= $(1)-$($(3)_VERSION).src.rock
-$(2)_SITE		?= $(call qstrip,$(BR2_LUAROCKS_MIRROR))
+$(2)_SUBDIR		?= $(1)-$$(shell echo "$$($(3)_VERSION)" | sed -e "s/-[0-9]$$$$//")
+$(2)_ROCKSPEC		?= $(1)-$$($(3)_VERSION).rockspec
+$(2)_SOURCE		?= $(1)-$$($(3)_VERSION).src.rock
+$(2)_SITE		?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
 
 # Since we do not support host-luarocks-package, we know this is
 # a target package, and can just add the required dependencies
@@ -49,7 +49,7 @@
 ifndef $(2)_EXTRACT_CMDS
 define $(2)_EXTRACT_CMDS
 	cd $$($(2)_DIR)/.. && \
-	 $$(LUAROCKS_RUN) unpack --force $(DL_DIR)/$$($(2)_SOURCE)
+	 $$(LUAROCKS_RUN) unpack --force $$(DL_DIR)/$$($(2)_SOURCE)
 endef
 endif
 
diff -r 39292611ec34 -r b1861ead4977 package/pkg-perl.mk
--- a/package/pkg-perl.mk	Thu Jun 05 10:38:01 2014 -0500
+++ b/package/pkg-perl.mk	Thu May 08 21:53:48 2014 +0200
@@ -51,18 +51,18 @@
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
 		PERL_MM_USE_DEFAULT=1 \
 		perl Build.PL \
-			--config ar="$(TARGET_AR)" \
-			--config full_ar="$(TARGET_AR)" \
-			--config cc="$(TARGET_CC)" \
-			--config ccflags="$(TARGET_CFLAGS)" \
-			--config ld="$(TARGET_CC)" \
-			--config lddlflags="-shared $(TARGET_LDFLAGS)" \
-			--config ldflags="$(TARGET_LDFLAGS)" \
-			--include_dirs $$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE \
+			--config ar="$$(TARGET_AR)" \
+			--config full_ar="$$(TARGET_AR)" \
+			--config cc="$$(TARGET_CC)" \
+			--config ccflags="$$(TARGET_CFLAGS)" \
+			--config ld="$$(TARGET_CC)" \
+			--config lddlflags="-shared $$(TARGET_LDFLAGS)" \
+			--config ldflags="$$(TARGET_LDFLAGS)" \
+			--include_dirs $$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$$(PERL_ARCHNAME)/CORE \
 			--destdir $$(TARGET_DIR) \
 			--installdirs vendor \
 			--install_path lib=/usr/lib/perl5/site_perl/$$(PERL_VERSION) \
-			--install_path arch=/usr/lib/perl5/site_perl/$$(PERL_VERSION)/$(PERL_ARCHNAME) \
+			--install_path arch=/usr/lib/perl5/site_perl/$$(PERL_VERSION)/$$(PERL_ARCHNAME) \
 			--install_path bin=/usr/bin \
 			--install_path script=/usr/bin \
 			--install_path bindoc=/usr/share/man/man1 \
@@ -72,17 +72,17 @@
 		PERL_MM_USE_DEFAULT=1 \
 		PERL_AUTOINSTALL=--skipdeps \
 		perl Makefile.PL \
-			AR="$(TARGET_AR)" \
-			FULL_AR="$(TARGET_AR)" \
-			CC="$(TARGET_CC)" \
-			CCFLAGS="$(TARGET_CFLAGS)" \
-			LD="$(TARGET_CC)" \
-			LDDLFLAGS="-shared $(TARGET_LDFLAGS)" \
-			LDFLAGS="$(TARGET_LDFLAGS)" \
+			AR="$$(TARGET_AR)" \
+			FULL_AR="$$(TARGET_AR)" \
+			CC="$$(TARGET_CC)" \
+			CCFLAGS="$$(TARGET_CFLAGS)" \
+			LD="$$(TARGET_CC)" \
+			LDDLFLAGS="-shared $$(TARGET_LDFLAGS)" \
+			LDFLAGS="$$(TARGET_LDFLAGS)" \
 			DESTDIR=$$(TARGET_DIR) \
 			INSTALLDIRS=vendor \
 			INSTALLVENDORLIB=/usr/lib/perl5/site_perl/$$(PERL_VERSION) \
-			INSTALLVENDORARCH=/usr/lib/perl5/site_perl/$$(PERL_VERSION)/$(PERL_ARCHNAME) \
+			INSTALLVENDORARCH=/usr/lib/perl5/site_perl/$$(PERL_VERSION)/$$(PERL_ARCHNAME) \
 			INSTALLVENDORBIN=/usr/bin \
 			INSTALLVENDORSCRIPT=/usr/bin \
 			INSTALLVENDORMAN1DIR=/usr/share/man/man1 \
@@ -125,8 +125,8 @@
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
 		perl Build $$($(2)_BUILD_OPT) build; \
 	else \
-		$(MAKE1) \
-			PERL_INC=$$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE \
+		$$(MAKE1) \
+			PERL_INC=$$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$$(PERL_ARCHNAME)/CORE \
 			$$($(2)_BUILD_OPT) pure_all; \
 	fi
 endef
@@ -137,7 +137,7 @@
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
 		perl Build $$($(2)_BUILD_OPT) build; \
 	else \
-		$(MAKE1) $$($(2)_BUILD_OPT) pure_all; \
+		$$(MAKE1) $$($(2)_BUILD_OPT) pure_all; \
 	fi
 endef
 endif
@@ -152,7 +152,7 @@
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
 		perl Build $$($(2)_INSTALL_TARGET_OPT) install; \
 	else \
-		$(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
+		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
 	fi
 endef
 endif
@@ -166,7 +166,7 @@
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
 		perl Build $$($(2)_INSTALL_TARGET_OPT) install; \
 	else \
-		$(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
+		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
 	fi
 endef
 endif
diff -r 39292611ec34 -r b1861ead4977 package/pkg-python.mk
--- a/package/pkg-python.mk	Thu Jun 05 10:38:01 2014 -0500
+++ b/package/pkg-python.mk	Thu May 08 21:53:48 2014 +0200
@@ -82,7 +82,7 @@
 
 define inner-python-package
 
-$(2)_SRCDIR	= $$($(2)_DIR)/$($(2)_SUBDIR)
+$(2)_SRCDIR	= $$($(2)_DIR)/$$($(2)_SUBDIR)
 $(2)_BUILDDIR	= $$($(2)_SRCDIR)
 
 $(2)_ENV         ?=
@@ -91,7 +91,7 @@
 
 ifndef $(2)_SETUP_TYPE
  ifdef $(3)_SETUP_TYPE
-  $(2)_SETUP_TYPE = $($(3)_SETUP_TYPE)
+  $(2)_SETUP_TYPE = $$($(3)_SETUP_TYPE)
  else
   $$(error "$(2)_SETUP_TYPE must be set")
  endif
@@ -138,7 +138,9 @@
 # depending on the package characteristics, and shouldn't be derived
 # automatically from the dependencies of the corresponding target
 # package.
-$(2)_DEPENDENCIES ?= $(filter-out host-python host-python3 host-python-setuptools host-toolchain $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+ifeq ($(4),host)
+$(2)_DEPENDENCIES ?= $$(filter-out host-python host-python3 host-python-setuptools host-toolchain $(1),$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
+endif
 
 # Target packages need both the python interpreter on the target (for
 # runtime) and the python interpreter on the host (for
@@ -155,19 +157,19 @@
 #   - otherwise, we depend on the one requested by *_NEEDS_HOST_PYTHON.
 #
 ifeq ($(4),target)
-$(2)_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python)
+$(2)_DEPENDENCIES += $$(if $$(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python)
 else
-ifeq ($($(2)_NEEDS_HOST_PYTHON),)
-$(2)_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
+ifeq ($$($(2)_NEEDS_HOST_PYTHON),)
+$(2)_DEPENDENCIES += $$(if $$(BR2_PACKAGE_PYTHON3),host-python3,host-python)
 else
-ifeq ($($(2)_NEEDS_HOST_PYTHON),python2)
+ifeq ($$($(2)_NEEDS_HOST_PYTHON),python2)
 $(2)_DEPENDENCIES += host-python
-else ifeq ($($(2)_NEEDS_HOST_PYTHON),python3)
+else ifeq ($$($(2)_NEEDS_HOST_PYTHON),python3)
 $(2)_DEPENDENCIES += host-python3
 else
-$$(error Incorrect value '$($(2)_NEEDS_HOST_PYTHON)' for $(2)_NEEDS_HOST_PYTHON)
+$$(error Incorrect value '$$($(2)_NEEDS_HOST_PYTHON)' for $(2)_NEEDS_HOST_PYTHON)
 endif
-endif # ($($(2)_NEEDS_HOST_PYTHON),)
+endif # ($$($(2)_NEEDS_HOST_PYTHON),)
 endif # ($(4),target)
 
 # Setuptools based packages will need host-python-setuptools (both
@@ -196,12 +198,12 @@
 #   - otherwise, we use the one requested by *_NEEDS_HOST_PYTHON.
 #
 ifeq ($(4),target)
-$(2)_PYTHON_INTERPRETER = $(HOST_DIR)/usr/bin/python
+$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/usr/bin/python
 else
-ifeq ($($(2)_NEEDS_HOST_PYTHON),)
-$(2)_PYTHON_INTERPRETER = $(HOST_DIR)/usr/bin/python
+ifeq ($$($(2)_NEEDS_HOST_PYTHON),)
+$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/usr/bin/python
 else
-$(2)_PYTHON_INTERPRETER = $(HOST_DIR)/usr/bin/$($(2)_NEEDS_HOST_PYTHON)
+$(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/usr/bin/$$($(2)_NEEDS_HOST_PYTHON)
 endif
 endif
 
diff -r 39292611ec34 -r b1861ead4977 package/pkg-virtual.mk
--- a/package/pkg-virtual.mk	Thu Jun 05 10:38:01 2014 -0500
+++ b/package/pkg-virtual.mk	Thu May 08 21:53:48 2014 +0200
@@ -35,8 +35,8 @@
 define inner-virtual-package
 
 # Ensure the virtual package has an implementation defined.
-ifeq ($(BR2_PACKAGE_HAS_$(2)),y)
-ifeq ($(call qstrip,$(BR2_PACKAGE_PROVIDES_$(2))),)
+ifeq ($$(BR2_PACKAGE_HAS_$(2)),y)
+ifeq ($$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2))),)
 $$(error No implementation selected for virtual package $(1). Configuration error)
 endif
 endif
@@ -50,11 +50,13 @@
 
 # This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES
-$(2)_DEPENDENCIES ?= $(filter-out host-toolchain $(1),\
-	$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+ifeq ($(4),host)
+$(2)_DEPENDENCIES ?= $$(filter-out host-toolchain $(1),\
+	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
+endif
 
 # Add dependency against the provider
-$(2)_DEPENDENCIES += $(call qstrip,$(BR2_PACKAGE_PROVIDES_$(2)))
+$(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))
 
 # Call the generic package infrastructure to generate the necessary
 # make targets
