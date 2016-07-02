From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:24 +0200
Subject: [Buildroot] [PATCH 55/69] infra: remove auto derivation of host
	dependencies
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-56-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This feature consists in automatically deducing dependencies of a host
package from the dependencies of the target variant.

However, it causes some issues, and many host packages need different
dependencies than their target variants.

Now that host dependencies are explicitly set for all packages, we can
remove it.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-autotools.mk |  9 ---------
 package/pkg-cmake.mk     |  7 -------
 package/pkg-generic.mk   |  4 ----
 package/pkg-python.mk    | 15 ---------------
 package/pkg-rebar.mk     | 14 --------------
 package/pkg-virtual.mk   |  7 -------
 6 files changed, 56 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 502eeea6aa29..75e2df001f78 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -159,15 +159,6 @@ $(2)_INSTALL_OPTS                ?= install
 $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
 
-# This must be repeated from inner-generic-package, otherwise we get an empty
-# _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
-# and _GETTEXTIZE away from the non-host rule
-ifeq ($(4),host)
-$(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-libtool \
-				host-gettext host-skeleton host-toolchain $(1),\
-    $$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
-endif
-
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index bca360332b3c..6f0ecf9f726b 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -142,13 +142,6 @@ endef
 endif
 endif
 
-# This must be repeated from inner-generic-package, otherwise we only get
-# host-cmake in _DEPENDENCIES because of the following line
-ifeq ($(4),host)
-$(2)_DEPENDENCIES ?= $$(filter-out host-skeleton host-toolchain $(1),\
-	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
-endif
-
 $(2)_DEPENDENCIES += host-cmake
 
 #
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b712c3175ff0..299672c79d25 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -503,10 +503,6 @@ $(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)
 # dependency
 $(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES
 
-ifeq ($(4),host)
-$(2)_DEPENDENCIES ?= $$(filter-out host-skeleton host-toolchain $(1),\
-	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
-endif
 ifeq ($(4),target)
 ifneq ($(1),skeleton)
 $(2)_DEPENDENCIES += skeleton
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 9725d24f983f..38bc45ffa33f 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -138,21 +138,6 @@ else
 $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils' or 'setuptools'")
 endif
 
-# The below statement intends to calculate the dependencies of host
-# packages by derivating them from the dependencies of the
-# corresponding target package, after adding the 'host-' prefix in
-# front of the dependencies.
-#
-# However it must be repeated from inner-generic-package, as we need
-# to exclude the python, host-python and host-python-setuptools
-# packages, which are added below in the list of dependencies
-# depending on the package characteristics, and shouldn't be derived
-# automatically from the dependencies of the corresponding target
-# package.
-ifeq ($(4),host)
-$(2)_DEPENDENCIES ?= $$(filter-out host-python host-python3 host-python-setuptools host-skeleton host-toolchain $(1),$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
-endif
-
 # Target packages need both the python interpreter on the target (for
 # runtime) and the python interpreter on the host (for
 # compilation). However, host packages only need the python
diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index 44c6d6c8d23a..7605a64aded4 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -188,20 +188,6 @@ endif
 
 else # !target
 
-ifeq ($$($(2)_USE_AUTOCONF),YES)
-# This must be repeated from inner-autotools-package, otherwise we get
-# an empty _DEPENDENCIES if _AUTORECONF is YES or _USE_BUNDLED_REBAR
-# is NO.  Also filter the result of _AUTORECONF and _GETTEXTIZE away
-# from the non-host rule
-$(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-libtool \
-				host-gettext host-skeleton host-toolchain host-erlang-rebar $(1),\
-    $$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
-else
-# Same deal, if _USE_BUNDLED_REBAR is NO.
-$(2)_DEPENDENCIES ?= $$(filter-out  host-skeleton host-toolchain host-erlang-rebar $(1),\
-	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
-endif
-
 # Host packages need the erlang interpreter on the host
 $(2)_DEPENDENCIES += host-erlang
 
diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 244c1d042033..3fbe0a31daad 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -49,13 +49,6 @@ $(2)_SOURCE =
 # Fake a version string, so it looks nicer in the build log
 $(2)_VERSION = virtual
 
-# This must be repeated from inner-generic-package, otherwise we get an empty
-# _DEPENDENCIES
-ifeq ($(4),host)
-$(2)_DEPENDENCIES ?= $$(filter-out host-skeleton host-toolchain $(1),\
-	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
-endif
-
 # Add dependency against the provider
 $(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))
 
-- 
2.1.0
