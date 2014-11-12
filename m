From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2014 01:25:56 +0100
Subject: [Buildroot] [PATCH 10/24 v3] package/pkg-rebar: new infrastructure
In-Reply-To: <cover.1415751395.git.yann.morin.1998@free.fr>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
Message-ID: <960738a75e3f2d2cd7f8084ae144339cdf782185.1415751395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Johan Oudinet <johan.oudinet@gmail.com>

Ease the development of packages that use the erlang rebar tool as
their build system.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[yann.morin.1998 at free.fr: split the patch into semantically separated
patches; large rewrites of the rest]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v2 -> v3:
  - introduce two new options: ERLANG_FOO_CONFIGURE to use the autotools
    infra (YES) or the generic infra (NO/empty) and ERLANG_FOO_HAS_REBAR
    to use the package's rebar (YES) or our own (NO/empty)
  - remove the duplicated code from the autotools infra
  - largely re-organise the code and variables definitions
  - move the EI_VSN setting into the elrnag package
  - remove the script used to compute EI_VSN, as it is no longer needed
  - split host-rebar to its own patch
  - add some comments
---
 package/Makefile.in  |   1 +
 package/pkg-rebar.mk | 195 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 196 insertions(+)
 create mode 100644 package/pkg-rebar.mk

diff --git a/package/Makefile.in b/package/Makefile.in
index df39afd..077851c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -407,3 +407,4 @@ include package/pkg-python.mk
 include package/pkg-virtual.mk
 include package/pkg-generic.mk
 include package/pkg-kconfig.mk
+include package/pkg-rebar.mk
diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
new file mode 100644
index 0000000..0358cc1
--- /dev/null
+++ b/package/pkg-rebar.mk
@@ -0,0 +1,195 @@
+################################################################################
+# rebar package infrastructure
+#
+# This file implements an infrastructure that eases development of
+# package .mk files for rebar packages.  It should be used for all
+# packages that use rebar as their build system.
+#
+# In terms of implementation, this rebar infrastructure requires the
+# .mk file to only specify metadata information about the package:
+# name, version, download URL, etc.
+#
+# We still allow the package .mk file to override what the different
+# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
+# already defined, it is used as the list of commands to perform to
+# build the package, instead of the default rebar behaviour. The
+# package can also define some post operation hooks.
+#
+################################################################################
+
+# Directories to store rebar dependencies in.
+#
+# These directories actually only contain symbolic links to Erlang
+# applications in either $(HOST_DIR) or $(STAGING_DIR).  One needs
+# them to avoid rebar complaining about missing dependencies, as this
+# infrastructure does NOT tell rebar to download dependencies during
+# the build stage.
+#
+REBAR_HOST_DEPS_DIR = $(HOST_DIR)/usr/share/rebar/deps
+REBAR_TARGET_DEPS_DIR = $(STAGING_DIR)/usr/share/rebar/deps
+
+################################################################################
+# Helper functions
+################################################################################
+
+# Install an Erlang application from $(@D).
+#
+# i.e., define a recipe that installs the "ebin priv $(2)" directories
+# from $(@D) to $(1)$($(PKG)_ERLANG_LIBDIR).
+#
+#  argument 1 should typically be $(HOST_DIR), $(TARGET_DIR),
+#	      or $(STAGING_DIR).
+#  argument 2 is typically empty when installing in $(TARGET_DIR) and
+#             "include" when installing in $(HOST_DIR) or
+#             $(STAGING_DIR).
+#
+# Note: calling this function must be done with $$(call ...) because it
+# expands package-related variables.
+#
+define install-erlang-directories
+	$(INSTALL) -d $(1)/$($(PKG)_ERLANG_LIBDIR)
+	for dir in ebin priv $(2); do                                   \
+		if test -d $(@D)/$$dir; then                            \
+			cp -r $(@D)/$$dir $(1)$($(PKG)_ERLANG_LIBDIR);  \
+		fi;                                                     \
+	done
+endef
+
+# Setup a symbolic link in rebar's deps_dir to the actual location
+# where an Erlang application is installed.
+#
+# i.e., define a recipe that creates a symbolic link
+# from $($(PKG)_REBAR_DEPS_DIR)/$($(PKG)_ERLANG_APP)
+# to $(1)$($(PKG)_ERLANG_LIBDIR).
+#
+# One typically uses this to setup symbolic links from
+# $(BUILD_DIR)/rebar-deps/<HOST_OR_TARGET>/<ERLANG_APP> to the
+# appropriate application directory in $(HOST_DIR) or $(STAGING_DIR).
+# This avoids rebar complaining about missing dependencies, as this
+# infrastructure does NOT tell rebar to download dependencies during
+# the build stage.
+#
+# Therefore,
+#  argument 1 is $(HOST_DIR) (for host packages) or
+#	      $(STAGING_DIR) (for target packages).
+#
+# Note: calling this function must be done with $$(call ...) because it
+# expands package-related variables.
+#
+define install-rebar-deps
+	$(INSTALL) -d $($(PKG)_REBAR_DEPS_DIR)
+	ln -f -s $(1)/$($(PKG)_ERLANG_LIBDIR) \
+		$($(PKG)_REBAR_DEPS_DIR)/$($(PKG)_ERLANG_APP)
+endef
+
+################################################################################
+# inner-rebar-package -- defines how the configuration, compilation
+# and installation of a rebar package should be done, implements a few
+# hooks to tune the build process according to rebar specifities, and
+# calls the generic package infrastructure to generate the necessary
+# make targets.
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including a HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the type (target or host)
+#
+################################################################################
+
+define inner-rebar-package
+
+# Extract just the raw package name, lowercase without the leading
+# erlang- or host- prefix, as this is used by rebar to find the
+# dependencies a package specifies.
+#
+$(2)_ERLANG_APP = $(subst -,_,$(call LOWERCASE,$(patsubst ERLANG_%,%,$(3))))
+
+# Path where to store the package's libs, relative to either $(HOST_DIR)
+# for host packages, or $(STAGING_DIR) for target packages.
+#
+$(2)_ERLANG_LIBDIR = \
+	/usr/lib/erlang/lib/$$($$(PKG)_ERLANG_APP)-$$($$(PKG)_VERSION)
+
+# Whether to use the generic rebar or the package's rebar
+#
+ifeq ($$($(2)_HAS_REBAR),YES)
+$(2)_REBAR = ./rebar
+else
+$(2)_REBAR = rebar
+endif
+
+
+# Define the build and install commands
+#
+ifeq ($(4),target)
+
+ifeq ($$($(2)_CONFIGURE),YES)
+$(2)_CONF_ENV += \
+	ERL_COMPILER_OPTIONS='{i, "$$(REBAR_TARGET_DEPS_DIR)"}' \
+	ERL_EI_LIBDIR=$$(TARGET_DIR)/usr/lib/erlang/lib/erl_interface-$$(ERLANG_EI_VSN)/lib
+endif
+
+ifndef $(2)_BUILD_CMDS
+define $(2)_BUILD_CMDS
+	cd '$$(@D)'; \
+	$$($$(PKG)_ENV) $$($$(PKG)_REBAR) deps_dir=$$(REBAR_TARGET_DEPS_DIR) compile
+endef
+endif
+
+# We need to double-$ the 'call' because it wants to expand
+# package-related variables
+ifndef $(2)_INSTALL_STAGING_CMDS
+define $(2)_INSTALL_STAGING_CMDS
+	$$(call install-erlang-directories,$$(STAGING_DIR),include)
+	$$(call install-rebar-deps,$$(STAGING_DIR))
+endef
+endif
+
+# We need to double-$ the 'call' because it wants to expand
+# package-related variables
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	$$(call install-erlang-directories,$$(TARGET_DIR))
+endef
+endif
+
+else # !target
+
+ifeq ($$($(2)_CONFIGURE),YES)
+$(2)_CONF_ENV += \
+	ERL_COMPILER_OPTIONS='{i, "$$(REBAR_HOST_DEPS_DIR)"}' \
+	ERL_EI_LIBDIR=$$(HOST_DIR)/usr/lib/erlang/lib/erl_interface-$$(ERLANG_EI_VSN)/lib
+endif
+
+ifndef $(2)_BUILD_CMDS
+define $(2)_BUILD_CMDS
+	cd '$$(@D)'; \
+	$$($$(PKG)_ENV) $$($$(PKG)_REBAR) deps_dir=$$(REBAR_HOST_DEPS_DIR) compile
+endef
+endif
+
+# We need to double-$ the 'call' because it wants to expand
+# package-related variables
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	$$(call install-erlang-directories,$$(HOST_DIR),include)
+	$$(call install-rebar-deps,$$(HOST_DIR))
+endef
+endif
+
+endif # !target
+
+# The package sub-infra to use
+#
+ifeq ($$($(2)_CONFIGURE),YES)
+$(call inner-autotools-package,$(1),$(2),$(3),$(4))
+else
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
+endif
+
+endef # inner-rebar-package
+
+rebar-package = $(call inner-rebar-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
+host-rebar-package = $(call inner-rebar-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
-- 
1.9.1
