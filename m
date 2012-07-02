From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  3 Jul 2012 00:05:46 +0200
Subject: [Buildroot] [PATCH v3 1/5] pkg-infra: add host-xxx-package macro
Message-ID: <1341266746-15301-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Create host-generic-package, host-autotools-package and
host-cmake-package macros.  Such a macro is more intuitive to use than
the $(call ...,host) construct.  Also it speeds things up by having
one less $(call ...) evaluation.

Also includes documentation update, but not for buildroot.html.

This brings the time for 'make -qp' (which is used by bash-completion)
down from 1.85s to 1.35s on my laptop.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Note: this patch by itself breaks the build because the .mk files have
not been converted to the host-xxx-package scheme.

v3:
- Rename to host-xxx-package

v2:
- split infrastructure update and update of .mk files into separate
  patches.
- Simplified documentation (removed some irrelevant or wrong comments).

 docs/manual/adding-packages-autotargets.txt  |   10 ++++------
 docs/manual/adding-packages-cmaketargets.txt |    9 ++++-----
 docs/manual/adding-packages-gentargets.txt   |   25 +++++++++++--------------
 package/pkg-autotargets.mk                   |    9 ++-------
 package/pkg-cmaketargets.mk                  |    9 ++-------
 package/pkg-gentargets.mk                    |   11 +++--------
 support/scripts/pkg-stats                    |   12 ++++++------
 7 files changed, 32 insertions(+), 53 deletions(-)

diff --git a/docs/manual/adding-packages-autotargets.txt b/docs/manual/adding-packages-autotargets.txt
index 428a182..09a2e7c 100644
--- a/docs/manual/adding-packages-autotargets.txt
+++ b/docs/manual/adding-packages-autotargets.txt
@@ -23,7 +23,7 @@ package, with an example :
 11: LIBFOO_CONF_OPT = --enable-shared
 12: LIBFOO_DEPENDENCIES = libglib2 host-pkg-config
 13:
-14: $(eval $(call AUTOTARGETS))
+14: $(eval $(AUTOTARGETS))
 ------------------------
 
 On line 6, we declare the version of the package.
@@ -67,11 +67,9 @@ package to be built.
 ~~~~~~~~~~~~~~~~~~~~~~~
 
 The main macro of the autotools package infrastructure is
-+AUTOTARGETS+. It has the same number of arguments and the
-same semantic as the +GENTARGETS+ macro, which is the main
-macro of the generic package infrastructure. For autotools packages, the
-ability to have target and host packages is also available (and is
-actually widely used).
++AUTOTARGETS+. It is similar to the +GENTARGETS+ macro. The ability to
+have target and host packages is also available, with the
++host-autotools-package+ macro.
 
 Just like the generic infrastructure, the autotools infrastructure
 works by defining a number of variables before calling the
diff --git a/docs/manual/adding-packages-cmaketargets.txt b/docs/manual/adding-packages-cmaketargets.txt
index 3e400ec..a294042 100644
--- a/docs/manual/adding-packages-cmaketargets.txt
+++ b/docs/manual/adding-packages-cmaketargets.txt
@@ -23,7 +23,7 @@ with an example :
 11: LIBFOO_CONF_OPT = -DBUILD_DEMOS=ON
 12: LIBFOO_DEPENDENCIES = libglib2 host-pkg-config
 13:
-14: $(eval $(call CMAKETARGETS))
+14: $(eval $(CMAKETARGETS))
 ------------------------
 
 On line 6, we declare the version of the package.
@@ -66,10 +66,9 @@ package to be built.
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
 The main macro of the CMake package infrastructure is
-+CMAKETARGETS+. It has the same number of arguments and the same
-semantic as the +GENTARGETS+ macro, which is the main macro of the
-generic package infrastructure. For CMake packages, the ability to
-have target and host packages is also available.
++CMAKETARGETS+. It is similar to the +GENTARGETS+ macro. The ability to
+have target and host packages is also available, with the
++host-cmake-package+ macro.
 
 Just like the generic infrastructure, the CMake infrastructure works
 by defining a number of variables before calling the +CMAKETARGETS+
diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
index 84cf06b..b439968 100644
--- a/docs/manual/adding-packages-gentargets.txt
+++ b/docs/manual/adding-packages-gentargets.txt
@@ -46,7 +46,7 @@ system is based on hand-written Makefiles or shell scripts.
 32: 	/bin/foo  f  4755  0  0  -  -  -  -  -
 33: endef
 34:
-35: $(eval $(call GENTARGETS))
+35: $(eval $(GENTARGETS))
 --------------------------------
 
 The Makefile begins on line 6 to 8 with metadata information: the
@@ -92,19 +92,16 @@ Makefile code necessary to make your package working.
 +GENTARGETS+ Reference
 ~~~~~~~~~~~~~~~~~~~~~~
 
-The +GENTARGETS+ macro takes one optional argument. This argument can
-be used to tell if the package is a target package (cross-compiled for
-the target) or a host package (natively compiled for the host). If
-unspecified, it is assumed that it is a target package. See below for
-details.
-
-For a given package, in a single +.mk+ file, it is possible to call
-GENTARGETS twice, once to create the rules to generate a target
+There are two variants of the generic target. The +GENTARGETS+ macro is
+used for packages to be cross-compiled for the target.  The
++host-generic-package+ macro is used for host packages, natively compiled
+for the host.  It is possible to call both of them in a single +.mk+
+file: once to create the rules to generate a target
 package and once to create the rules to generate a host package:
 
 ----------------------
-$(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS))
+$(eval $(host-generic-package))
 ----------------------
 
 This might be useful if the compilation of the target package requires
@@ -115,12 +112,12 @@ some tools to be installed on the host. If the package name is
 variables of other packages, if they depend on +libfoo+ or
 +host-libfoo+.
 
-The call to the +GENTARGETS+ macro *must* be at the end of the +.mk+
-file, after all variable definitions.
+The call to the +GENTARGETS+ and/or +host-generic-package+ macro *must* be
+at the end of the +.mk+ file, after all variable definitions.
 
 For the target package, the +GENTARGETS+ uses the variables defined by
 the .mk file and prefixed by the uppercased package name:
-+LIBFOO_*+. For the host package, it uses the +HOST_LIBFOO_*+. For
++LIBFOO_*+. +host-generic-package+ uses the +HOST_LIBFOO_*+ variables. For
 'some' variables, if the +HOST_LIBFOO_+ prefixed variable doesn't
 exist, the package infrastructure uses the corresponding variable
 prefixed by +LIBFOO_+. This is done for variables that are likely to
diff --git a/package/pkg-autotargets.mk b/package/pkg-autotargets.mk
index c9887c2..4506272 100644
--- a/package/pkg-autotargets.mk
+++ b/package/pkg-autotargets.mk
@@ -305,10 +305,5 @@ endef
 # Argument 1 is "target" or "host"           [optional, default: "target"]
 ################################################################################
 
-define AUTOTARGETS
-ifeq ($(1),host)
-$(call AUTOTARGETS_INNER,$(1)-$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
-else
-$(call AUTOTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-endif
-endef
+AUTOTARGETS = $(call AUTOTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+host-autotools-package = $(call AUTOTARGETS_INNER,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
diff --git a/package/pkg-cmaketargets.mk b/package/pkg-cmaketargets.mk
index 371ab11..047b2f6 100644
--- a/package/pkg-cmaketargets.mk
+++ b/package/pkg-cmaketargets.mk
@@ -190,13 +190,8 @@ endef
 # Argument 1 is "target" or "host"           [optional, default: "target"]
 ################################################################################
 
-define CMAKETARGETS
-ifeq ($(1),host)
-$(call CMAKETARGETS_INNER,$(1)-$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
-else
-$(call CMAKETARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-endif
-endef
+CMAKETARGETS = $(call CMAKETARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+host-cmake-package = $(call CMAKETARGETS_INNER,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
 
 ################################################################################
 # Generation of the CMake toolchain file
diff --git a/package/pkg-gentargets.mk b/package/pkg-gentargets.mk
index 1c9b458..a69d7b3 100644
--- a/package/pkg-gentargets.mk
+++ b/package/pkg-gentargets.mk
@@ -443,14 +443,9 @@ endef # GENTARGETS_INNER
 # Argument 1 is "target" or "host"           [optional, default: "target"]
 ################################################################################
 
-define GENTARGETS
-ifeq ($(1),host)
-# In the case of host packages, turn the package name "pkg" into "host-pkg"
-$(call GENTARGETS_INNER,$(1)-$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
-else
 # In the case of target packages, keep the package name "pkg"
-$(call GENTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-endif
-endef
+GENTARGETS = $(call GENTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+# In the case of host packages, turn the package name "pkg" into "host-pkg"
+host-generic-package = $(call GENTARGETS_INNER,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
 
 # :mode=makefile:
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 06d9d0d..e7941bc 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -100,27 +100,27 @@ for i in $(find package/ -name '*.mk') ; do
     is_manual_target=0
     is_manual_host=0
 
-    if grep -E "\(call AUTOTARGETS,host\)" $i > /dev/null ; then
+    if grep -E "\(host-autotools-package\)" $i > /dev/null ; then
 	is_auto_host=1
     fi
 
-    if grep -E "\(call AUTOTARGETS\)" $i > /dev/null ; then
+    if grep -E "\(AUTOTARGETS\)" $i > /dev/null ; then
 	is_auto_target=1
     fi
 
-    if grep -E "\(call GENTARGETS,host\)" $i > /dev/null ; then
+    if grep -E "\(host-generic-package\)" $i > /dev/null ; then
 	is_pkg_host=1
     fi
 
-    if grep -E "\(call GENTARGETS\)" $i > /dev/null ; then
+    if grep -E "\(GENTARGETS\)" $i > /dev/null ; then
 	is_pkg_target=1
     fi
 
-    if grep -E "\(call CMAKETARGETS,host\)" $i > /dev/null ; then
+    if grep -E "\(host-cmake-package\)" $i > /dev/null ; then
 	is_cmake_host=1
     fi
 
-    if grep -E "\(call CMAKETARGETS\)" $i > /dev/null ; then
+    if grep -E "\(CMAKETARGETS\)" $i > /dev/null ; then
 	is_cmake_target=1
     fi
 
-- 
tg: (8f6fc94..) t/gentargets_host (depends on: master)
