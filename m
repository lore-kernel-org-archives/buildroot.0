From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 28 Oct 2014 14:33:39 +0100
Subject: [Buildroot] [PATCH 02/15] rebar package infrastructure: new
	infrastructure.
In-Reply-To: <1414503232-28314-1-git-send-email-johan.oudinet@gmail.com>
References: <1414503232-28314-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1414503232-28314-3-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ease the development of packages that use the erlang rebar tool as
their build system.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 docs/manual/adding-packages-rebar.txt | 157 +++++++++++++++++++++++
 docs/manual/adding-packages.txt       |   2 +
 package/Makefile.in                   |   1 +
 package/erlang-rebar/erlang-rebar.mk  |  20 +++
 package/pkg-rebar.mk                  | 229 ++++++++++++++++++++++++++++++++++
 support/scripts/erlang-ei-vsn         |  19 +++
 6 files changed, 428 insertions(+)
 create mode 100644 docs/manual/adding-packages-rebar.txt
 create mode 100644 package/erlang-rebar/erlang-rebar.mk
 create mode 100644 package/pkg-rebar.mk
 create mode 100755 support/scripts/erlang-ei-vsn

diff --git a/docs/manual/adding-packages-rebar.txt b/docs/manual/adding-packages-rebar.txt
new file mode 100644
index 0000000..c132a4a
--- /dev/null
+++ b/docs/manual/adding-packages-rebar.txt
@@ -0,0 +1,157 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+=== Infrastructure for rebar-based packages
+
+[[rebar-package-tutorial]]
+
+==== +rebar-package+ tutorial
+
+First, let's see how to write a +.mk+ file for a rebar-based package,
+with an example :
+
+------------------------------
+01: ################################################################################
+02: #
+03: # erlang-foobar
+04: #
+05: ################################################################################
+06:
+07: ERLANG_FOOBAR_VERSION = 1.0
+08: ERLANG_FOOBAR_SOURCE = erlang-foobar-$(ERLANG_FOOBAR_VERSION).tar.gz
+09: ERLANG_FOOBAR_SITE = http://www.foosoftware.org/download
+10: ERLANG_FOOBAR_INSTALL_STAGING = YES
+11: ERLANG_FOOBAR_CONF_OPTS = --enable-bar
+12: ERLANG_FOOBAR_DEPENDENCIES = host-libaaa libbbb
+13:
+14: $(eval $(rebar-package))
+--------------------------------
+
+On line 7, we declare the version of the package.
+
+On line 8 and 9, we declare the name of the tarball (xz-ed tarball recommended)
+and the location of the tarball on the Web. Buildroot will automatically
+download the tarball from this location.
+
+On line 10, we tell Buildroot to install the package to the staging
+directory. The staging directory, located in +output/staging/+
+is the directory where all the packages are installed, including their
+development files, etc. By default, packages are not installed to the
+staging directory, since usually, only libraries need to be installed in
+the staging directory: their development files are needed to compile
+other libraries or applications depending on them.
+
+On line 11, we tell Buildroot to pass a custom configure option, that
+will be passed to the +./configure+ script before configuring
+and building the package.
+
+On line 12, we declare our dependencies, so that they are built
+before the build process of our package starts.
+
+Finally, on line line 14, we invoke the +rebar-package+
+macro that generates all the Makefile rules that actually allows the
+package to be built.
+
+[[rebar-package-reference]]
+
+==== +rebar-package+ reference
+
+The main macro of the rebar package infrastructure is
++rebar-package+. It is similar to the +generic-package+ macro. The
+ability to have target and host packages is also available, with the
++host-rebar-package+ macro.
+
+Just like the generic infrastructure, the rebar infrastructure works
+by defining a number of variables before calling the +rebar-package+
+macro.
+
+First, all the package metadata information variables that exist in
+the generic infrastructure also exist in the rebar infrastructure:
++ERLANG_FOOBAR_VERSION+, +ERLANG_FOOBAR_SOURCE+,
++ERLANG_FOOBAR_PATCH+, +ERLANG_FOOBAR_SITE+,
++ERLANG_FOOBAR_SUBDIR+, +ERLANG_FOOBAR_DEPENDENCIES+,
++ERLANG_FOOBAR_INSTALL_STAGING+, +ERLANG_FOOBAR_INSTALL_TARGET+.
+
+Note that the rebar infrastructure does not expect a configure script,
+but does call such a script when it exists.  When a package uses both
+the Autotools and rebar, it should use the rebar infrastructure.  In
+this case however, the build commands do not call make, but only
++rebar compile+; this avoids triggering the download of dependencies
+(as most Makefile's do when combined with rebar).  Also, note that the
+install commands never call +make install+.  Instead, they install
+Erlang's application directories (ebin, priv, etc.)  into a proper
+location.  If this is not what you want, add custom hooks or override
+rebar commands (see below).
+
+A few additional variables, specific to the rebar infrastructure,
+can also be defined. Many of them are only useful in very specific
+cases, typical packages will therefore only use a few of them.
+
+* +ERLANG_FOOBAR_CONF_ENV+, to specify additional environment
+  variables to pass to the configure script. By default, empty.
+
+* +ERLANG_FOOBAR_CONF_OPTS+, to specify additional configure options
+  to pass to the configure script. By default, empty.
+
+* +ERLANG_FOOBAR_AUTORECONF+, tells whether the package should be
+  autoreconfigured or not (i.e. if the configure script and
+  Makefile.in files should be re-generated by re-running autoconf,
+  automake, libtool, etc.). Valid values are +YES+ and +NO+. By
+  default, the value is +NO+
+
+* +ERLANG_FOOBAR_AUTORECONF_ENV+, to specify additional environment
+  variables to pass to the 'autoreconf' program if
+  +ERLANG_FOOBAR_AUTORECONF=YES+. These are passed in the environment
+  of the 'autoreconf' command. By default, empty.
+
+* +ERLANG_FOOBAR_AUTORECONF_OPTS+ to specify additional options passed
+  to the 'autoreconf' program if +ERLANG_FOOBAR_AUTORECONF=YES+. By
+  default, empty.
+
+* +ERLANG_FOOBAR_REBAR_ENV+, to specify additional environment
+  variables to pass to rebar.  By default, the value sets a minimal
+  PATH that only includes +HOST_DIR/bin+, +HOST_DIR/usr/bin+, and
+  +/bin+.
+
+* +ERLANG_FOOBAR_REBAR_FLAGS+, to specify rebar flags. By default, the
+  value is +deps_dir=ERLANG_FOOBAR_REBAR_DEPS_DIR+.
+
+* +ERLANG_FOOBAR_REBAR_DEPS_DIR+, to specify where to look for the
+  package's dependencies.  By default, the value is
+  +output/build/erlang-rebar-deps/target+, or
+  +output/build/erlang-rebar-deps/host+ for host packages.  Note that
+  if the package installs to staging as well, the rebar infrastructure
+  then creates a symbolic link in this directory to
+  +ERLANG_FOOBAR_ERLANG_LIBDIR+ so other packages may use it as
+  a dependency.
+
+* +ERLANG_FOOBAR_ERLANG_LIBDIR+, to specify where to install the
+  Erlang application.  By default, the value is
+  +/usr/lib/erlang/lib/ERLANG_FOOBAR_ERLANG_APP-ERLANG_FOOBAR_VERSION+.
+
+* +ERLANG_FOOBAR_ERLANG_APP+, to specify the name of the Erlang
+  application to be installed.  This modifies where the application is
+  installed (e.g., +/usr/lib/erlang/lib/ERLANG_FOOBAR_ERLANG_APP-ERLANG_FOOBAR_VERSION+)
+  and the name of the symbolic link in +ERLANG_FOOBAR_REBAR_DEPS_DIR+,
+  if any (e.g., +output/build/erlang-rebar-deps/target/ERLANG_FOOBAR_ERLANG_APP+.
+  By default, the value is the lowercase package name stripped from
+  any +erlang-+ prefix, and with dashes converted to underscores.
+
+* +ERLANG_FOOBAR_ENV+, to specify additional environment variables to
+  pass both to the configure script and rebar.  By default, sets CC,
+  CFLAGS, LDFLAGS, ERL_COMPILER_OPTIONS, and ERL_EI_LIBDIR.
+
+With the rebar infrastructure, all the steps required to build
+and install the packages are already defined, and they generally work
+well for most rebar-based packages. However, when required, it is
+still possible to customize what is done in any particular step:
+
+* By adding a post-operation hook (after extract, patch, configure,
+  build or install). See xref:hooks[] for details.
+
+* By overriding one of the steps. For example, even if the rebar
+  infrastructure is used, if the package +.mk+ file defines its
+  own +ERLANG_FOOBAR_CONFIGURE_CMDS+ variable, it will be used
+  instead of the default rebar one. However, using this method
+  should be restricted to very specific cases. Do not use it in the
+  general case.
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index feb0d13..b8674f8 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -27,6 +27,8 @@ include::adding-packages-virtual.txt[]
 
 include::adding-packages-kconfig.txt[]
 
+include::adding-packages-rebar.txt[]
+
 include::adding-packages-asciidoc.txt[]
 
 include::adding-packages-hooks.txt[]
diff --git a/package/Makefile.in b/package/Makefile.in
index ff2ee2d..560ea8c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -406,3 +406,4 @@ include package/pkg-python.mk
 include package/pkg-virtual.mk
 include package/pkg-generic.mk
 include package/pkg-kconfig.mk
+include package/pkg-rebar.mk
diff --git a/package/erlang-rebar/erlang-rebar.mk b/package/erlang-rebar/erlang-rebar.mk
new file mode 100644
index 0000000..b3fcbf0
--- /dev/null
+++ b/package/erlang-rebar/erlang-rebar.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# erlang-rebar
+#
+################################################################################
+
+ERLANG_REBAR_VERSION = 2.5.1
+ERLANG_REBAR_SOURCE = $(ERLANG_REBAR_VERSION).tar.gz
+ERLANG_REBAR_SITE = https://github.com/rebar/rebar/archive
+ERLANG_REBAR_DEPENDENCIES = host-erlang
+
+define HOST_ERLANG_REBAR_BUILD_CMDS
+	cd $(@D) && PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:/bin $(MAKE)
+endef
+
+define HOST_ERLANG_REBAR_INSTALL_CMDS
+	$(INSTALL) -D $(@D)/rebar $(HOST_DIR)/usr/bin/rebar
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
new file mode 100644
index 0000000..7293fa6
--- /dev/null
+++ b/package/pkg-rebar.mk
@@ -0,0 +1,229 @@
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
+# Version of Erlang's erl_interface module.  One needs this to setup
+# proper linker flags when building Erlang modules written in C.
+#
+ERLANG_EI_VSN = $(shell support/scripts/erlang-ei-vsn)
+
+# Directories to store rebar dependencies in.
+#
+# These directories actually only contain symbolic links to Erlang
+# applications in either $(HOST_DIR) or $(STAGING_DIR).  One needs
+# them to avoid rebar complaining about missing dependencies, as this
+# infrastructure does NOT tell rebar to download dependencies during
+# the build stage.
+#
+REBAR_HOST_DEPS_DIR = $(BUILD_DIR)/erlang-rebar-deps/host
+REBAR_TARGET_DEPS_DIR = $(BUILD_DIR)/erlang-rebar-deps/target
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
+define install-erlang-directories
+	$$(INSTALL) --directory '$(1)$$($$(PKG)_ERLANG_LIBDIR)'
+	for dir in ebin priv $(2); do					\
+		if test -d "$$(@D)/$$$$dir"; then			\
+			cp -r	"$$(@D)/$$$$dir"			\
+				'$(1)$$($$(PKG)_ERLANG_LIBDIR)';	\
+		fi;							\
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
+#  argument 1 is $$(HOST_DIR) (for host packages) or
+#	      $$(STAGING_DIR) (for target packages).
+#
+define install-rebar-deps
+	$$(INSTALL) --directory '$$($$(PKG)_REBAR_DEPS_DIR)'
+	ln -f -s							\
+		'$(1)$$($$(PKG)_ERLANG_LIBDIR)'				\
+		'$$($$(PKG)_REBAR_DEPS_DIR)/$$($$(PKG)_ERLANG_APP)'
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
+$(2)_ERLANG_APP ?= $(subst -,_,$(call LOWERCASE,$(patsubst ERLANG_%,%,$(3))))
+$(2)_ERLANG_LIBDIR ?= \
+	/usr/lib/erlang/lib/$$($$(PKG)_ERLANG_APP)-$$($$(PKG)_VERSION)
+$(2)_ENV ?=								\
+	CC='$$($(call UPPERCASE,$(4))_CC)'				\
+	CFLAGS='$$($(call UPPERCASE,$(4))_CFLAGS)'			\
+	LDFLAGS='$$($(call UPPERCASE,$(4))_LDFLAGS)'			\
+	ERL_COMPILER_OPTIONS='{i, "$$($$(PKG)_REBAR_DEPS_DIR)"}'	\
+	ERL_EI_LIBDIR='$$($(call UPPERCASE,$(4))_DIR)/usr/lib/erlang/lib/erl_interface-$$(ERLANG_EI_VSN)/lib'
+
+$(2)_REBAR_DEPS_DIR ?= $$(REBAR_$(call UPPERCASE,$(4))_DEPS_DIR)
+$(2)_REBAR_FLAGS ?= deps_dir='$$($$(PKG)_REBAR_DEPS_DIR)'
+$(2)_REBAR_ENV ?= PATH='$$(HOST_DIR)/bin:$$(HOST_DIR)/usr/bin:/bin'
+
+ifndef $(2)_AUTORECONF
+ ifdef $(3)_AUTORECONF
+  $(2)_AUTORECONF = $$($(3)_AUTORECONF)
+ else
+  $(2)_AUTORECONF ?= NO
+ endif
+endif
+
+$(2)_INTERNAL_CONF_ENV =						\
+	CONFIG_SITE=/dev/null						\
+	PATH='$$(HOST_DIR)/bin:$$(HOST_DIR)/usr/bin:/bin:/usr/bin'	\
+	$$($$(PKG)_ENV)						\
+	$$($$(PKG)_CONF_ENV)
+
+ifeq ($(4),target)
+$(2)_INTERNAL_CONF_FLAGS =			\
+	--target=$$(GNU_TARGET_NAME)		\
+	--host=$$(GNU_TARGET_NAME)		\
+	--build=$$(GNU_HOST_NAME)		\
+	--prefix=/usr				\
+	--exec-prefix=/usr			\
+	--sysconfdir=/etc			\
+	--localstatedir=/var			\
+	--program-prefix=			\
+	$$(DISABLE_NLS)				\
+	$$(DISABLE_LARGEFILE)			\
+	$$(DISABLE_IPV6)			\
+	$$(ENABLE_DEBUG)			\
+	$$(SHARED_STATIC_LIBS_OPTS)		\
+	$$($$(PKG)_CONF_OPTS)
+else
+$(2)_INTERNAL_CONF_FLAGS =			\
+	--prefix='$$(HOST_DIR)/usr'		\
+	--sysconfdir='$$(HOST_DIR)/etc'		\
+	--localstatedir='$$(HOST_DIR)/var'	\
+	--enable-shared --disable-static	\
+	--disable-debug				\
+	$$($$(PKG)_CONF_OPTS)
+endif
+
+ifeq ($$($(2)_AUTORECONF),YES)
+$(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
+$(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
+endif
+
+ifndef $(2)_CONFIGURE_CMDS
+define $(2)_CONFIGURE_CMDS
+	if [ -f '$$(@D)/configure' ]; then				\
+		cd '$$(@D)' &&						\
+		rm -rf config.cache &&					\
+		$$($$(PKG)_INTERNAL_CONF_ENV)				\
+		./configure						\
+			--disable-gtk-doc				\
+			--disable-doc					\
+			--disable-docs					\
+			--disable-documentation				\
+			--with-xmlto=no					\
+			--with-fop=no					\
+			--disable-dependency-tracking			\
+			$$(QUIET) $$($$(PKG)_INTERNAL_CONF_FLAGS);	\
+	fi
+endef
+endif
+
+ifndef $(2)_BUILD_CMDS
+define $(2)_BUILD_CMDS
+	cd '$$(@D)' &&							\
+	if [ -f ./rebar ]; then						\
+		$$($$(PKG)_ENV)						\
+		$$($$(PKG)_REBAR_ENV)					\
+			./rebar $$($$(PKG)_REBAR_FLAGS) compile;	\
+	else								\
+		$$($$(PKG)_ENV)						\
+		$$($$(PKG)_REBAR_ENV)					\
+			rebar $$($$(PKG)_REBAR_FLAGS) compile;		\
+	fi
+endef
+endif
+
+ifeq ($(4),host) # Install host files.
+
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	$(call install-erlang-directories,$$(HOST_DIR),include)
+	$(call install-rebar-deps,$$(HOST_DIR))
+endef
+endif
+
+else # Install staging/target files.
+
+ifndef $(2)_INSTALL_STAGING_CMDS
+define $(2)_INSTALL_STAGING_CMDS
+	$(call install-erlang-directories,$$(STAGING_DIR),include)
+	$(call install-rebar-deps,$$(STAGING_DIR))
+endef
+endif
+
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	$(call install-erlang-directories,$$(TARGET_DIR))
+endef
+endif
+
+endif
+
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
+
+endef # inner-rebar-package
+
+rebar-package = $(call inner-rebar-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
+
+host-rebar-package = $(call inner-rebar-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
diff --git a/support/scripts/erlang-ei-vsn b/support/scripts/erlang-ei-vsn
new file mode 100755
index 0000000..cdab8e9
--- /dev/null
+++ b/support/scripts/erlang-ei-vsn
@@ -0,0 +1,19 @@
+#! /bin/sh
+# Extract and print the version of Erlang's erl_interface module.
+#
+# Exit non-zero and print nothing if Erlang has not been extracted in
+# output/build.
+
+S=[:space:]
+
+# Extract the BAR part from all lines matching "$2 = BAR" in file $1.
+get_make_variable() {
+    local file="$1" name="$2"
+
+    sed "s/^[$S]*$name[$S]*=[$S]*\\([^$S]*\\)[$S]*\$/\\1/; t; d" "$file"
+}
+
+ERLANG_VSN=$(get_make_variable package/erlang/erlang.mk ERLANG_VERSION)
+EI_VSN_FILE=output/build/erlang-$ERLANG_VSN/lib/erl_interface/vsn.mk
+
+[ -f "$EI_VSN_FILE" ] && get_make_variable "$EI_VSN_FILE" EI_VSN
-- 
2.1.0
