From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 14 Jul 2015 20:27:45 +0200
Subject: [Buildroot] [PATCH] package: Introduce $(2)_INFRA_EXTRA_DEPENDENCIES
Message-ID: <1436898465-11711-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of repeating the filter-out function to remove the host-package
that we don't want as dependencies in each infra, handle it it
pkg-generic through a generic variable, which is specified by each
infra.

The $(2)_INFRA_EXTRA_DEPENDENCIES contains the specific host package
that we want to filter from the package's dependencies.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-autotools.mk | 12 ++++--------
 package/pkg-cmake.mk     |  7 -------
 package/pkg-generic.mk   |  3 ++-
 package/pkg-python.mk    | 17 +++--------------
 package/pkg-rebar.mk     | 16 +++++++---------
 package/pkg-virtual.mk   |  7 -------
 6 files changed, 16 insertions(+), 46 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index b630ec9..6235787 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -159,14 +159,10 @@ $(2)_INSTALL_OPTS                ?= install
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
+# Specifiy the packages that needs to be excluded and are specific to this
+# package infrastructure.
+$(2)_INFRA_EXTRA_DEPENDENCIES = host-automake host-autoconf host-libtool \
+	host-gettext
 
 #
 # Configure step. Only define it if not already defined by the package
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 574eccc..f2e66bc 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -143,13 +143,6 @@ endef
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
index d1d6711..2756593 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -405,7 +405,8 @@ $(2)_REDISTRIBUTE		?= YES
 $(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES
 
 ifeq ($(4),host)
-$(2)_DEPENDENCIES ?= $$(filter-out host-skeleton host-toolchain $(1),\
+$(2)_DEPENDENCIES ?= $$(filter-out \
+	host-skeleton host-toolchain $$($(2)_INFRA_EXTRA_DEPENDENCIES) $(1),\
 	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 endif
 ifeq ($(4),target)
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index b7a702d..6e3776a 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -138,20 +138,9 @@ else
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
+# Specifiy the packages that needs to be excluded and are specific to this
+# package infrastructure.
+$(2)_INFRA_EXTRA_DEPENDENCIES = host-python host-python3 host-python-setuptools
 
 # Target packages need both the python interpreter on the target (for
 # runtime) and the python interpreter on the host (for
diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index c727489..ef38f26 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -187,17 +187,15 @@ endif
 else # !target
 
 ifeq ($$($(2)_USE_AUTOCONF),YES)
-# This must be repeated from inner-autotools-package, otherwise we get
-# an empty _DEPENDENCIES if _AUTORECONF is YES or _USE_BUNDLED_REBAR
-# is NO.  Also filter the result of _AUTORECONF and _GETTEXTIZE away
-# from the non-host rule
-$(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-libtool \
-				host-gettext host-skeleton host-toolchain host-erlang-rebar $(1),\
-    $$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
+# Specifiy the packages that needs to be excluded and are specific to this
+# package infrastructure.
+# if _AUTORECONF is YES or _USE_BUNDLED_REBAR is NO.  Also filter the result of
+#_AUTORECONF and _GETTEXTIZE away from the non-host rule
+$(2)_INFRA_EXTRA_DEPENDENCIES = host-automake host-autoconf host-libtool \
+	host-gettext host-erlang-rebar
 else
 # Same deal, if _USE_BUNDLED_REBAR is NO.
-$(2)_DEPENDENCIES ?= $$(filter-out  host-skeleton host-toolchain host-erlang-rebar $(1),\
-	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
+$(2)_INFRA_EXTRA_DEPENDENCIES = host-erlang-rebar
 endif
 
 # Host packages need the erlang interpreter on the host
diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 9c68b51..cb919b0 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -47,13 +47,6 @@ $(2)_SOURCE =
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
2.1.4
