From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  3 Jul 2012 00:07:08 +0200
Subject: [Buildroot] [PATCH v3 3/5] Rename XXXTARGETS to xxx-package
In-Reply-To: <1341266746-15301-1-git-send-email-arnout@mind.be>
References: <1341266746-15301-1-git-send-email-arnout@mind.be>
Message-ID: <1341266828-17922-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the introduction of a specific macro for host targets, it was decided
to also make the names of the macros more intuitive: generic-package,
autotools-package and cmake-package.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Based on feedback by ThomasP and ThomasDS.

 docs/manual/adding-packages-autotargets.txt  |   12 ++++++------
 docs/manual/adding-packages-cmaketargets.txt |   12 ++++++------
 docs/manual/adding-packages-gentargets.txt   |   16 ++++++++--------
 package/pkg-autotargets.mk                   |   16 +++++++---------
 package/pkg-cmaketargets.mk                  |   16 +++++++---------
 package/pkg-gentargets.mk                    |   14 ++++++--------
 support/gnuconfig/README.buildroot           |    6 +++---
 support/scripts/pkg-stats                    |   12 ++++++------
 8 files changed, 49 insertions(+), 55 deletions(-)

diff --git a/docs/manual/adding-packages-autotargets.txt b/docs/manual/adding-packages-autotargets.txt
index 09a2e7c..f67cd06 100644
--- a/docs/manual/adding-packages-autotargets.txt
+++ b/docs/manual/adding-packages-autotargets.txt
@@ -3,7 +3,7 @@ Infrastructure for autotools-based packages
 
 [[autotargets-tutorial]]
 
-+AUTOTARGETS+ tutorial
++autotools-package+ tutorial
 ~~~~~~~~~~~~~~~~~~~~~~
 
 First, let's see how to write a +.mk+ file for an autotools-based
@@ -23,7 +23,7 @@ package, with an example :
 11: LIBFOO_CONF_OPT = --enable-shared
 12: LIBFOO_DEPENDENCIES = libglib2 host-pkg-config
 13:
-14: $(eval $(AUTOTARGETS))
+14: $(eval $(autotools-package))
 ------------------------
 
 On line 6, we declare the version of the package.
@@ -57,23 +57,23 @@ and building the package.
 On line 12, we declare our dependencies, so that they are built
 before the build process of our package starts.
 
-Finally, on line line 14, we invoke the +AUTOTARGETS+
+Finally, on line line 14, we invoke the +autotools-package+
 macro that generates all the Makefile rules that actually allows the
 package to be built.
 
 [[autotargets-reference]]
 
-+AUTOTARGETS+ reference
++autotools-package+ reference
 ~~~~~~~~~~~~~~~~~~~~~~~
 
 The main macro of the autotools package infrastructure is
-+AUTOTARGETS+. It is similar to the +GENTARGETS+ macro. The ability to
++autotools-package+. It is similar to the +generic-package+ macro. The ability to
 have target and host packages is also available, with the
 +host-autotools-package+ macro.
 
 Just like the generic infrastructure, the autotools infrastructure
 works by defining a number of variables before calling the
-+AUTOTARGETS+ macro.
++autotools-package+ macro.
 
 First, all the package metadata information variables that exist in the
 generic infrastructure also exist in the autotools infrastructure:
diff --git a/docs/manual/adding-packages-cmaketargets.txt b/docs/manual/adding-packages-cmaketargets.txt
index a294042..69acb00 100644
--- a/docs/manual/adding-packages-cmaketargets.txt
+++ b/docs/manual/adding-packages-cmaketargets.txt
@@ -3,7 +3,7 @@ Infrastructure for CMake-based packages
 
 [[cmaketargets-tutorial]]
 
-+CMAKETARGETS+ tutorial
++cmake-package+ tutorial
 ~~~~~~~~~~~~~~~~~~~~~~~
 
 First, let's see how to write a +.mk+ file for a CMake-based package,
@@ -23,7 +23,7 @@ with an example :
 11: LIBFOO_CONF_OPT = -DBUILD_DEMOS=ON
 12: LIBFOO_DEPENDENCIES = libglib2 host-pkg-config
 13:
-14: $(eval $(CMAKETARGETS))
+14: $(eval $(cmake-package))
 ------------------------
 
 On line 6, we declare the version of the package.
@@ -56,22 +56,22 @@ configuring the package.
 On line 12, we declare our dependencies, so that they are built
 before the build process of our package starts.
 
-Finally, on line line 14, we invoke the +CMAKETARGETS+
+Finally, on line line 14, we invoke the +cmake-package+
 macro that generates all the Makefile rules that actually allows the
 package to be built.
 
 [[cmaketargets-reference]]
 
-+CMAKETARGETS+ reference
++cmake-package+ reference
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
 The main macro of the CMake package infrastructure is
-+CMAKETARGETS+. It is similar to the +GENTARGETS+ macro. The ability to
++cmake-package+. It is similar to the +generic-package+ macro. The ability to
 have target and host packages is also available, with the
 +host-cmake-package+ macro.
 
 Just like the generic infrastructure, the CMake infrastructure works
-by defining a number of variables before calling the +CMAKETARGETS+
+by defining a number of variables before calling the +cmake-package+
 macro.
 
 First, all the package metadata information variables that exist in
diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
index b439968..dea3707 100644
--- a/docs/manual/adding-packages-gentargets.txt
+++ b/docs/manual/adding-packages-gentargets.txt
@@ -8,7 +8,7 @@ system is based on hand-written Makefiles or shell scripts.
 
 [[gentargets-tutorial]]
 
-+GENTARGETS+ Tutorial
++generic-package+ Tutorial
 ~~~~~~~~~~~~~~~~~~~~~
 
 ------------------------------
@@ -46,7 +46,7 @@ system is based on hand-written Makefiles or shell scripts.
 32: 	/bin/foo  f  4755  0  0  -  -  -  -  -
 33: endef
 34:
-35: $(eval $(GENTARGETS))
+35: $(eval $(generic-package))
 --------------------------------
 
 The Makefile begins on line 6 to 8 with metadata information: the
@@ -83,16 +83,16 @@ All these steps rely on the +$(@D)+ variable, which
 contains the directory where the source code of the package has been
 extracted.
 
-Finally, on line 35, we call the +GENTARGETS+ which
+Finally, on line 35, we call the +generic-package+ which
 generates, according to the variables defined previously, all the
 Makefile code necessary to make your package working.
 
 [[gentargets-reference]]
 
-+GENTARGETS+ Reference
++generic-package+ Reference
 ~~~~~~~~~~~~~~~~~~~~~~
 
-There are two variants of the generic target. The +GENTARGETS+ macro is
+There are two variants of the generic target. The +generic-package+ macro is
 used for packages to be cross-compiled for the target.  The
 +host-generic-package+ macro is used for host packages, natively compiled
 for the host.  It is possible to call both of them in a single +.mk+
@@ -100,7 +100,7 @@ file: once to create the rules to generate a target
 package and once to create the rules to generate a host package:
 
 ----------------------
-$(eval $(GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
 ----------------------
 
@@ -112,10 +112,10 @@ some tools to be installed on the host. If the package name is
 variables of other packages, if they depend on +libfoo+ or
 +host-libfoo+.
 
-The call to the +GENTARGETS+ and/or +host-generic-package+ macro *must* be
+The call to the +generic-package+ and/or +host-generic-package+ macro *must* be
 at the end of the +.mk+ file, after all variable definitions.
 
-For the target package, the +GENTARGETS+ uses the variables defined by
+For the target package, the +generic-package+ uses the variables defined by
 the .mk file and prefixed by the uppercased package name:
 +LIBFOO_*+. +host-generic-package+ uses the +HOST_LIBFOO_*+ variables. For
 'some' variables, if the +HOST_LIBFOO_+ prefixed variable doesn't
diff --git a/package/pkg-autotargets.mk b/package/pkg-autotargets.mk
index 4506272..a8d962d 100644
--- a/package/pkg-autotargets.mk
+++ b/package/pkg-autotargets.mk
@@ -37,7 +37,7 @@ define CONFIG_UPDATE
 endef
 
 ################################################################################
-# AUTOTARGETS_INNER -- defines how the configuration, compilation and
+# inner-autotools-package -- defines how the configuration, compilation and
 # installation of an autotools package should be done, implements a
 # few hooks to tune the build process for autotools specifities and
 # calls the generic package infrastructure to generate the necessary
@@ -52,7 +52,7 @@ endef
 #  argument 5 is the type (target or host)
 ################################################################################
 
-define AUTOTARGETS_INNER
+define inner-autotools-package
 
 # define package-specific variables to default values
 ifndef $(2)_SUBDIR
@@ -198,7 +198,7 @@ define AUTORECONF_HOOK
 	fi
 endef
 
-# This must be repeated from GENTARGETS_INNER, otherwise we get an empty
+# This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
 # away from the non-host rule
 $(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool,\
@@ -295,15 +295,13 @@ endif
 
 # Call the generic package infrastructure to generate the necessary
 # make targets
-$(call GENTARGETS_INNER,$(1),$(2),$(3),$(4),$(5))
+$(call inner-generic-package,$(1),$(2),$(3),$(4),$(5))
 
 endef
 
 ################################################################################
-# AUTOTARGETS -- the target generator macro for autotools packages
-#
-# Argument 1 is "target" or "host"           [optional, default: "target"]
+# autotools-package -- the target generator macro for autotools packages
 ################################################################################
 
-AUTOTARGETS = $(call AUTOTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-autotools-package = $(call AUTOTARGETS_INNER,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+autotools-package = $(call inner-autotools-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+host-autotools-package = $(call inner-autotools-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
diff --git a/package/pkg-cmaketargets.mk b/package/pkg-cmaketargets.mk
index 047b2f6..b4df773 100644
--- a/package/pkg-cmaketargets.mk
+++ b/package/pkg-cmaketargets.mk
@@ -21,7 +21,7 @@
 ################################################################################
 
 ################################################################################
-# CMAKETARGETS_INNER -- defines how the configuration, compilation and
+# inner-cmake-package -- defines how the configuration, compilation and
 # installation of a CMake package should be done, implements a few hooks to
 # tune the build process and calls the generic package infrastructure to
 # generate the necessary make targets
@@ -35,7 +35,7 @@
 #  argument 5 is the type (target or host)
 ################################################################################
 
-define CMAKETARGETS_INNER
+define inner-cmake-package
 
 # define package-specific variables to default values
 ifndef $(2)_SUBDIR
@@ -96,7 +96,7 @@ endef
 endif
 endif
 
-# This must be repeated from GENTARGETS_INNER, otherwise we only get
+# This must be repeated from inner-generic-package, otherwise we only get
 # host-cmake in _DEPENDENCIES because of the following line
 $(2)_DEPENDENCIES ?= $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES)))
 
@@ -180,18 +180,16 @@ endif
 
 # Call the generic package infrastructure to generate the necessary
 # make targets
-$(call GENTARGETS_INNER,$(1),$(2),$(3),$(4),$(5))
+$(call inner-generic-package,$(1),$(2),$(3),$(4),$(5))
 
 endef
 
 ################################################################################
-# CMAKETARGETS -- the target generator macro for CMake packages
-#
-# Argument 1 is "target" or "host"           [optional, default: "target"]
+# cmake-package -- the target generator macro for CMake packages
 ################################################################################
 
-CMAKETARGETS = $(call CMAKETARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-cmake-package = $(call CMAKETARGETS_INNER,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+cmake-package = $(call inner-cmake-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+host-cmake-package = $(call inner-cmake-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
 
 ################################################################################
 # Generation of the CMake toolchain file
diff --git a/package/pkg-gentargets.mk b/package/pkg-gentargets.mk
index a69d7b3..3af936c 100644
--- a/package/pkg-gentargets.mk
+++ b/package/pkg-gentargets.mk
@@ -157,7 +157,7 @@ $(BUILD_DIR)/%/.stamp_dircleaned:
 	rm -Rf $(@D)
 
 ################################################################################
-# GENTARGETS_INNER -- generates the make targets needed to build a
+# inner-generic-package -- generates the make targets needed to build a
 # generic package
 #
 #  argument 1 is the lowercase package name
@@ -169,7 +169,7 @@ $(BUILD_DIR)/%/.stamp_dircleaned:
 #  argument 5 is the type (target or host)
 ################################################################################
 
-define GENTARGETS_INNER
+define inner-generic-package
 
 # Define default values for various package-related variables, if not
 # already defined. For some variables (version, source, site and
@@ -435,17 +435,15 @@ endif # SITE_METHOD
 DL_TOOLS_DEPENDENCIES += $(firstword $(INFLATE$(suffix $($(2)_SOURCE))))
 
 endif # $(2)_KCONFIG_VAR
-endef # GENTARGETS_INNER
+endef # inner-generic-package
 
 ################################################################################
-# GENTARGETS -- the target generator macro for generic packages
-#
-# Argument 1 is "target" or "host"           [optional, default: "target"]
+# generic-package -- the target generator macro for generic packages
 ################################################################################
 
 # In the case of target packages, keep the package name "pkg"
-GENTARGETS = $(call GENTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+generic-package = $(call inner-generic-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
 # In the case of host packages, turn the package name "pkg" into "host-pkg"
-host-generic-package = $(call GENTARGETS_INNER,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+host-generic-package = $(call inner-generic-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
 
 # :mode=makefile:
diff --git a/support/gnuconfig/README.buildroot b/support/gnuconfig/README.buildroot
index d655d62..83a4e9c 100644
--- a/support/gnuconfig/README.buildroot
+++ b/support/gnuconfig/README.buildroot
@@ -1,12 +1,12 @@
 --- HOWTO ---
 If your package uses config.guess and/or config.sub, then it probably
 relies on the autotools as its build system. In this case, you should
-use the AUTOTARGETS infrastructure, which will take care of updating
+use the autotools-package infrastructure, which will take care of updating
 the config.guess and/or config.sub files appropriately. See the
-Buildroot documentation for details about the AUTOTARGETS
+Buildroot documentation for details about the autotools-package
 infrastructure.
 
-If for some reason your package does not use the AUTOTARGETS
+If for some reason your package does not use the autotools-package
 infrastructure, you can request the config.guess and/or config.sub
 files of your package to be updated by using:
 
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index e7941bc..ac5d8ec 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -52,9 +52,9 @@ tr.correct td {
 <td rowspan=\"2\">Id</td>
 <td rowspan=\"2\">Package</td>
 <td rowspan=\"2\">Patch count</td>
-<td colspan=\"2\" class=\"centered\">AUTOTARGETS</td>
-<td colspan=\"2\" class=\"centered\">GENTARGETS</td>
-<td colspan=\"2\" class=\"centered\">CMAKETARGETS</td>
+<td colspan=\"2\" class=\"centered\">autotools-package</td>
+<td colspan=\"2\" class=\"centered\">generic-package</td>
+<td colspan=\"2\" class=\"centered\">cmake-package</td>
 <td colspan=\"2\" class=\"centered\">manual</td>
 <td rowspan=\"2\" class=\"centered\">Actions</td>
 </tr>
@@ -104,7 +104,7 @@ for i in $(find package/ -name '*.mk') ; do
 	is_auto_host=1
     fi
 
-    if grep -E "\(AUTOTARGETS\)" $i > /dev/null ; then
+    if grep -E "\(autotools-package\)" $i > /dev/null ; then
 	is_auto_target=1
     fi
 
@@ -112,7 +112,7 @@ for i in $(find package/ -name '*.mk') ; do
 	is_pkg_host=1
     fi
 
-    if grep -E "\(GENTARGETS\)" $i > /dev/null ; then
+    if grep -E "\(generic-package\)" $i > /dev/null ; then
 	is_pkg_target=1
     fi
 
@@ -120,7 +120,7 @@ for i in $(find package/ -name '*.mk') ; do
 	is_cmake_host=1
     fi
 
-    if grep -E "\(CMAKETARGETS\)" $i > /dev/null ; then
+    if grep -E "\(cmake-package\)" $i > /dev/null ; then
 	is_cmake_target=1
     fi
 
-- 
tg: (3581834..) t/host-generic-package (depends on: t/gentargets_host_mk)
