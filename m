From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Feb 2014 10:44:00 +0100
Subject: [Buildroot] [PATCH 1 of 5 v3] infra: remove redundant $(call) on
 pkgdir, pkgname, pkgparentdir
In-Reply-To: <patchbomb.1391593439@argentina>
References: <patchbomb.1391593439@argentina>
Message-ID: <eecd5a9725c930e0eaca.1391593440@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When calling make 'functions', the $(call) keyword is only needed if the
function takes arguments. For pkgdir, pkgname and pkgparentdir this is not
the case, so we can remove the call to make things more readable.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3: new patch

 package/pkg-autotools.mk |  4 ++--
 package/pkg-cmake.mk     |  4 ++--
 package/pkg-generic.mk   |  4 ++--
 package/pkg-luarocks.mk  |  2 +-
 package/pkg-python.mk    |  4 ++--
 package/pkg-utils.mk     |  4 ++--
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -275,5 +275,5 @@ endef
 # autotools-package -- the target generator macro for autotools packages
 ################################################################################
 
-autotools-package = $(call inner-autotools-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-autotools-package = $(call inner-autotools-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+autotools-package = $(call inner-autotools-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),target)
+host-autotools-package = $(call inner-autotools-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),host)
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -150,8 +150,8 @@ endef
 # cmake-package -- the target generator macro for CMake packages
 ################################################################################
 
-cmake-package = $(call inner-cmake-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-cmake-package = $(call inner-cmake-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+cmake-package = $(call inner-cmake-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),target)
+host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),host)
 
 ################################################################################
 # Generation of the CMake toolchain file
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -617,8 +617,8 @@ endef # inner-generic-package
 ################################################################################
 
 # In the case of target packages, keep the package name "pkg"
-generic-package = $(call inner-generic-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+generic-package = $(call inner-generic-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),target)
 # In the case of host packages, turn the package name "pkg" into "host-pkg"
-host-generic-package = $(call inner-generic-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+host-generic-package = $(call inner-generic-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),host)
 
 # :mode=makefile:
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -78,5 +78,5 @@ endef
 # luarocks-package -- the target generator macro for LuaRocks packages
 ################################################################################
 
-luarocks-package = $(call inner-luarocks-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+luarocks-package = $(call inner-luarocks-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),target)
 # host-luarocks-package not supported
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -220,5 +220,5 @@ endef
 # python-package -- the target generator macro for Python packages
 ################################################################################
 
-python-package = $(call inner-python-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
-host-python-package = $(call inner-python-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
+python-package = $(call inner-python-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),target)
+host-python-package = $(call inner-python-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),$(pkgparentdir),host)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -59,8 +59,8 @@ endef
 # pkgdir macro is carefully written to handle the case of the Linux
 # package, for which the package directory is an empty string.
 pkgdir       = $(dir $(lastword $(MAKEFILE_LIST)))
-pkgname      = $(lastword $(subst /, ,$(call pkgdir)))
-pkgparentdir = $(patsubst %$(call pkgname)/,%,$(call pkgdir))
+pkgname      = $(lastword $(subst /, ,$(pkgdir)))
+pkgparentdir = $(patsubst %$(pkgname)/,%,$(pkgdir))
 
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
