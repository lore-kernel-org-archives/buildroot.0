From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Dec 2013 22:40:31 +0100
Subject: [Buildroot] [PATCH] pkg-infra: postpone packages rules to take
	BR2_EXTERNAL into account
Message-ID: <1387230031-11406-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

In some cases, packages defined in BR2_EXTERNAL may provide implementations
needed by virtual package, such as libegl/libgles/...

For now, the generation of packages' rules are done at the moment we call
any of the XXX-package macro. Since BR2_EXTERNAL is included after our
built-in packages, the virtual packages rules can not use any of the
definitions made in BR2_EXTERNAL.

For example, if a BR2_EXTERNAL package defines LIBEGL_DEPENDENCIES, it
is not use by libegl, and the build breaks since we explicitly check
libegl has correct dependencies.

To solve this issue, we store the variable rules in a variable rather
than evaluate them on the spot. When all packages definitions are done,
we evaluate that variable, which gives us a exhaustive set of rules, and
most importantly, dependencies for the virtual packages

Reported-by: David Corvoysier <david.corvoysier@orange.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: David Corvoysier <david.corvoysier@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>

---
Note: this is more of an RFC than an actual patch. I've tested it to solve
this particular issue, and graph-depends reports proper dependencies (eg.
when gst1-plugins-bad-eglgles is selected). Also, make show-targets reports
the correct list.
---
 Makefile                 | 4 ++++
 package/pkg-autotools.mk | 4 ++--
 package/pkg-cmake.mk     | 4 ++--
 package/pkg-generic.mk   | 4 ++--
 package/pkg-python.mk    | 4 ++--
 5 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 925c1d2..f3e7a9b 100644
--- a/Makefile
+++ b/Makefile
@@ -336,6 +336,8 @@ export BASE_DIR
 
 all: world
 
+ALL_PACKAGES_RULES :=
+
 # Include legacy before the other things, because package .mk files
 # may rely on it.
 ifneq ($(BR2_DEPRECATED),y)
@@ -366,6 +368,8 @@ include system/system.mk
 
 include $(BR2_EXTERNAL)/external.mk
 
+$(ALL_PACKAGES_RULES)
+
 TARGETS+=target-finalize
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index a66ecd4..b49a05f 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -275,5 +275,5 @@ endef
 # autotools-package -- the target generator macro for autotools packages
 ################################################################################
 
-autotools-package = $(call inner-autotools-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-autotools-package = $(call inner-autotools-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+autotools-package = ALL_PACKAGES_RULES += $(call inner-autotools-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+host-autotools-package = ALL_PACKAGES_RULES += $(call inner-autotools-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 463cd63..323b7a2 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -148,8 +148,8 @@ endef
 # cmake-package -- the target generator macro for CMake packages
 ################################################################################
 
-cmake-package = $(call inner-cmake-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-cmake-package = $(call inner-cmake-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+cmake-package = ALL_PACKAGES_RULES += $(call inner-cmake-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+host-cmake-package = ALL_PACKAGES_RULES += $(call inner-cmake-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
 
 ################################################################################
 # Generation of the CMake toolchain file
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 45b808a..eb8ebe1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -608,8 +608,8 @@ endef # inner-generic-package
 ################################################################################
 
 # In the case of target packages, keep the package name "pkg"
-generic-package = $(call inner-generic-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+generic-package = ALL_PACKAGES_RULES += $(call inner-generic-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
 # In the case of host packages, turn the package name "pkg" into "host-pkg"
-host-generic-package = $(call inner-generic-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+host-generic-package = ALL_PACKAGES_RULES += $(call inner-generic-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
 
 # :mode=makefile:
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 5f137d5..e502173 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -217,5 +217,5 @@ endef
 # python-package -- the target generator macro for Python packages
 ################################################################################
 
-python-package = $(call inner-python-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-python-package = $(call inner-python-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+python-package = ALL_PACKAGES_RULES += $(call inner-python-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+host-python-package = ALL_PACKAGES_RULES += $(call inner-python-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
-- 
1.8.1.2
