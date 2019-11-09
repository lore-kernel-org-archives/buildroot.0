From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sat,  9 Nov 2019 19:55:12 +0100
Subject: [Buildroot] [PATCH v2 2/2] Include makefiles from GLOBAL_PATCH_DIR
In-Reply-To: <20191109185512.24139-1-jeremy.rosen@smile.fr>
References: <20191109185512.24139-1-jeremy.rosen@smile.fr>
Message-ID: <20191109185512.24139-3-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Including a file named <pkgname>.mk from the GLOBAL_PATCH_DIR allows a user
to tweak a package provided by buildroot to his own need.

* add a function to pkg-utils.mk to include makefiles from GLOBAL_PATCH_DIR
* modify all pkg-* to use it as their first action

Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/pkg-autotools.mk     |  1 +
 package/pkg-cmake.mk         |  1 +
 package/pkg-generic.mk       |  8 ++++++--
 package/pkg-golang.mk        |  1 +
 package/pkg-kconfig.mk       |  1 +
 package/pkg-kernel-module.mk |  1 +
 package/pkg-luarocks.mk      |  1 +
 package/pkg-meson.mk         |  1 +
 package/pkg-perl.mk          |  1 +
 package/pkg-python.mk        |  1 +
 package/pkg-rebar.mk         |  1 +
 package/pkg-utils.mk         | 19 +++++++++++++++++++
 package/pkg-virtual.mk       |  1 +
 package/pkg-waf.mk           |  1 +
 14 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index daa688dab6..b18ee4edf5 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -119,6 +119,7 @@ endef
 ################################################################################
 
 define inner-autotools-package
+$(call global-patchdir-include,$(1),$(2))
 
 ifndef $(2)_LIBTOOL_PATCH
  ifdef $(3)_LIBTOOL_PATCH
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 57bfea9be5..beb4af0b67 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -50,6 +50,7 @@ endif
 ################################################################################
 
 define inner-cmake-package
+$(call global-patchdir-include,$(1),$(2))
 
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPTS			?=
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 7d6fa08418..3de939f087 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -414,6 +414,10 @@ endef
 #   undesired behavior occurs with respect to these variables and functions.
 #
 ################################################################################
+define intermediate-generic-package
+$(call global-patchdir-include,$(1),$(2))
+$(call inner-generic-package,$(1),$(2),$(3),$(4)) 
+endef
 
 define inner-generic-package
 
@@ -1126,8 +1130,8 @@ endef # inner-generic-package
 ################################################################################
 
 # In the case of target packages, keep the package name "pkg"
-generic-package = $(call inner-generic-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
+generic-package = $(call intermediate-generic-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
 # In the case of host packages, turn the package name "pkg" into "host-pkg"
-host-generic-package = $(call inner-generic-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
+host-generic-package = $(call intermediate-generic-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
 
 # :mode=makefile:
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index e47de17aba..916645c52d 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -55,6 +55,7 @@ GO_HOST_ENV = \
 ################################################################################
 
 define inner-golang-package
+$(call global-patchdir-include,$(1),$(2))
 
 $(2)_WORKSPACE ?= _gopath
 
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 86d7c14fdb..5e06adaa0d 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -77,6 +77,7 @@ endef
 ################################################################################
 
 define inner-kconfig-package
+$(call global-patchdir-include,$(1),$(2))
 
 # Register the kconfig dependencies as regular dependencies, so that
 # they are also accounted for in the generated graphs.
diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
index fcd6b8bc29..b9e211aac1 100644
--- a/package/pkg-kernel-module.mk
+++ b/package/pkg-kernel-module.mk
@@ -43,6 +43,7 @@
 ################################################################################
 
 define inner-kernel-module
+$(call global-patchdir-include,$(1),$(2))
 
 # If the package is enabled, ensure the kernel will support modules
 ifeq ($$(BR2_PACKAGE_$(2)),y)
diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index 78d6c325f8..9a2b508532 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -32,6 +32,7 @@
 ################################################################################
 
 define inner-luarocks-package
+$(call global-patchdir-include,$(1),$(2))
 
 $(2)_BUILD_OPTS		?=
 $(2)_NAME_UPSTREAM	?= $(1)
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index e7eea2aa58..a6fe8ec71a 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -44,6 +44,7 @@ NINJA_OPTS	= $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
 ################################################################################
 
 define inner-meson-package
+$(call global-patchdir-include,$(1),$(2))
 
 $(2)_CONF_ENV		?=
 $(2)_CONF_OPTS		?=
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 1ecf31eff9..88cc00c5f6 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -38,6 +38,7 @@ PERL_RUN = PERL5LIB= PERL_USE_UNSAFE_INC=1 $(HOST_DIR)/bin/perl
 ################################################################################
 
 define inner-perl-package
+$(call global-patchdir-include,$(1),$(2))
 
 # Target packages need both the perl interpreter on the target (for
 # runtime) and the perl interpreter on the host (for
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index be1ce071df..26391e09ba 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -104,6 +104,7 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 ################################################################################
 
 define inner-python-package
+$(call global-patchdir-include,$(1),$(2))
 
 $(2)_ENV         ?=
 $(2)_BUILD_OPTS   ?=
diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index e4e3f3bb6c..282f7e600f 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -118,6 +118,7 @@ endef
 ################################################################################
 
 define inner-rebar-package
+$(call global-patchdir-include,$(1),$(2))
 
 # Extract just the raw package name, lowercase without the leading
 # erlang- or host- prefix, as this is used by rebar to find the
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index ebab55a0fd..16128b40a9 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -175,3 +175,22 @@ legal-deps = \
         $(filter-out $(if $(1:host-%=),host-%),\
             $(call non-virtual-deps,\
                 $($(call UPPERCASE,$(1))_FINAL_RECURSIVE_DEPENDENCIES))),$(p) [$($(call UPPERCASE,$(p))_LICENSE)])
+# Include a makefile from GLOBAL_PATCH_DIR
+# This follows the namind and directory layout of GLOBAL_PATCH_DIR
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including a HOST_ prefix
+#             for host packages
+define global-patchdir-include
+$(if $($(patsubst host-%,%,$(1))_EXTRA_PATCH_INCLUDED),,\
+$(foreach dir,$(addsuffix /$(patsubst host-%,%,$(1)),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))),\
+	$(if $(wildcard $(dir)/$($(2)_VERSION)/$(1).smk),\
+		include $(dir)/$($(2)_VERSION)/$(1).smk  \
+	,$(if $(wildcard $(dir)/$(1).smk),\
+		$(info avant $(pkgdir))
+		include $(dir)/$(1).smk \
+		$(info apres $(pkgdir))
+	))\
+)
+$(eval $(patsubst host-%,%,$(1))_EXTRA_PATCH_INCLUDED = true) \
+)
+endef
diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 05bd63eb18..c34834c884 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -33,6 +33,7 @@
 # so it is not evaluated now, but as part of the generated make code.
 
 define inner-virtual-package
+$(call global-patchdir-include,$(1),$(2))
 
 # Ensure the virtual package has an implementation defined.
 ifeq ($$(BR2_PACKAGE_HAS_$(2)),y)
diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index a32d5dab33..05bd90e463 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -35,6 +35,7 @@
 ################################################################################
 
 define inner-waf-package
+$(call global-patchdir-include,$(1),$(2))
 
 # We need host-python to run waf
 $(2)_DEPENDENCIES += host-python
-- 
2.24.0.rc1
