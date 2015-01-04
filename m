From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 22:23:07 +0100
Subject: [Buildroot] [PATCH v4 03/17] package/pkg-rebar: new
 infrastructure
In-Reply-To: <1418135662-773-4-git-send-email-johan.oudinet@gmail.com>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <1418135662-773-4-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150104222307.009f6e73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Tue,  9 Dec 2014 15:34:08 +0100, Johan Oudinet wrote:

> diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
> new file mode 100644
> index 0000000..c9b15c0
> --- /dev/null
> +++ b/package/pkg-rebar.mk
> @@ -0,0 +1,210 @@
> +################################################################################
> +# rebar package infrastructure
> +#
> +# This file implements an infrastructure that eases development of
> +# package .mk files for rebar packages.  It should be used for all
> +# packages that use rebar as their build system.
> +#
> +# In terms of implementation, this rebar infrastructure requires the
> +# .mk file to only specify metadata information about the package:
> +# name, version, download URL, etc.
> +#
> +# We still allow the package .mk file to override what the different
> +# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
> +# already defined, it is used as the list of commands to perform to
> +# build the package, instead of the default rebar behaviour. The
> +# package can also define some post operation hooks.

Maybe we should mention "Erlang" somewhere in this description.

> +#
> +################################################################################
> +
> +# Directories to store rebar dependencies in.
> +#
> +# These directories actually only contain symbolic links to Erlang
> +# applications in either $(HOST_DIR) or $(STAGING_DIR).  One needs
> +# them to avoid rebar complaining about missing dependencies, as this
> +# infrastructure does NOT tell rebar to download dependencies during
> +# the build stage.

I would rephrase that:

"this infrastructure tells rebar to NOT download dependencies during
the build stage".

> +# Setup a symbolic link in rebar's deps_dir to the actual location
> +# where an Erlang application is installed.
> +#
> +# i.e., define a recipe that creates a symbolic link
> +# from $($(PKG)_REBAR_DEPS_DIR)/$($(PKG)_ERLANG_APP)
> +# to $(1)$($(PKG)_ERLANG_LIBDIR).
> +#
> +# One typically uses this to setup symbolic links from
> +# $(BUILD_DIR)/rebar-deps/<HOST_OR_TARGET>/<ERLANG_APP> to the
> +# appropriate application directory in $(HOST_DIR) or $(STAGING_DIR).
> +# This avoids rebar complaining about missing dependencies, as this
> +# infrastructure does NOT tell rebar to download dependencies during
> +# the build stage.

Ditto. "this infrastructure tells rebar to NOT download dependencies
during the build stage".

> +################################################################################
> +# inner-rebar-package -- defines how the configuration, compilation
> +# and installation of a rebar package should be done, implements a few
> +# hooks to tune the build process according to rebar specifities, and
> +# calls the generic package infrastructure to generate the necessary
> +# make targets.
> +#
> +#  argument 1 is the lowercase package name
> +#  argument 2 is the uppercase package name, including a HOST_ prefix
> +#             for host packages
> +#  argument 3 is the uppercase package name, without the HOST_ prefix
> +#             for host packages
> +#  argument 4 is the type (target or host)
> +#
> +################################################################################
> +
> +define inner-rebar-package
> +
> +# Extract just the raw package name, lowercase without the leading
> +# erlang- or host- prefix, as this is used by rebar to find the
> +# dependencies a package specifies.
> +#
> +$(2)_ERLANG_APP = $(subst -,_,$(call LOWERCASE,$(patsubst ERLANG_%,%,$(3))))

I think the comment doesn't line up any more with what is done exactly:
we're working on the uppercase version, which never has HOST_, and
doesn't have erlang- but ERLANG_. Too bad that LOWERCASE replaces _ by
-, and that then you have replace again - by _.

Would it be clearer to actually use $(1) ?

$(2)_ERLANG_APP = $(subst -,_,$(patsubst erlang-%,%,$(patsubst host-%,%,$(1))

Not sure that's really better.

> +# Path where to store the package's libs, relative to either $(HOST_DIR)
> +# for host packages, or $(STAGING_DIR) for target packages.
> +#
> +$(2)_ERLANG_LIBDIR = \
> +	/usr/lib/erlang/lib/$$($$(PKG)_ERLANG_APP)-$$($$(PKG)_VERSION)
> +
> +# Whether to use the generic rebar or the package's rebar
> +#
> +ifeq ($$($(2)_HAS_REBAR),YES)
> +$(2)_REBAR = ./rebar
> +else
> +$(2)_REBAR = rebar
> +endif

It's not clear what $(2)_HAS_REBAR is useful for, and this variable is
not documented in PATCH 04/17.

> +# Define the build and install commands
> +#
> +ifeq ($(4),target)
> +
> +ifeq ($$($(2)_CONFIGURE),YES)

What is $(2)_CONFIGURE exactly? It is not documented in PATCH 04/17.

> +$(2)_CONF_ENV += \
> +	ERL_COMPILER_OPTIONS='{i, "$$(REBAR_TARGET_DEPS_DIR)"}' \
> +	ERL_EI_LIBDIR=$$(STAGING_DIR)/usr/lib/erlang/lib/erl_interface-$$(ERLANG_EI_VSN)/lib
> +endif
> +
> +ifndef $(2)_BUILD_CMDS
> +define $(2)_BUILD_CMDS
> +	cd '$$(@D)'; \

Any reason for the simple quotes here? Also, other package infrastructures do:

	(cd $$($$(PKG)_SRCDIR) && \
	  ....)

Which allows to use the <foo>_SUBDIR mechanism when needed.

> +	CC='$$(TARGET_CC)' \
> +	CFLAGS='$$(TARGET_CFLAGS)' \
> +	LDFLAGS='$$(TARGET_LDFLAGS)' \

Why simple quotes? We use double quotes everywhere in Buildroot. I
guess you look at using $$(TARGET_CONFIGURE_OPTS) instead?

> +	ERL_COMPILER_OPTIONS='{i, "$$(REBAR_TARGET_DEPS_DIR)"}' \
> +	ERL_EI_LIBDIR=$$(STAGING_DIR)/usr/lib/erlang/lib/erl_interface-$$(ERLANG_EI_VSN)/lib \

This is duplicated from the CONFIGURE == YES case above, which defines
$(2)_CONF_ENV. Maybe this can be factorized somehow?

> +	$$(TARGET_MAKE_ENV) \
> +	$$($$(PKG)_ENV) $$($$(PKG)_REBAR) deps_dir=$$(REBAR_TARGET_DEPS_DIR) compile

Maybe $$(PKG)_ENV should be named $$(PKG)_REBAR_ENV, to be more
explicit, and in line with $$(PKG)_CONF_ENV that you use above, and
that we use in the autotools infra?

> +ifeq ($$($(2)_CONFIGURE),YES)
> +$(2)_CONF_ENV += \
> +	ERL_COMPILER_OPTIONS='{i, "$$(REBAR_HOST_DEPS_DIR)"}' \
> +	ERL_EI_LIBDIR=$$(HOST_DIR)/usr/lib/erlang/lib/erl_interface-$$(ERLANG_EI_VSN)/lib
> +endif
> +
> +ifndef $(2)_BUILD_CMDS
> +define $(2)_BUILD_CMDS
> +	cd '$$(@D)'; \
> +	CC='$$(HOST_CC)' \
> +	CFLAGS='$$(HOST_CFLAGS)' \
> +	LDFLAGS='$$(HOST_LDFLAGS)' \
> +	ERL_COMPILER_OPTIONS='{i, "$$(REBAR_HOST_DEPS_DIR)"}' \
> +	ERL_EI_LIBDIR=$$(HOST_DIR)/usr/lib/erlang/lib/erl_interface-$$(ERLANG_EI_VSN)/lib \
> +	$$(HOST_MAKE_ENV) \
> +	$$($$(PKG)_ENV) $$($$(PKG)_REBAR) deps_dir=$$(REBAR_HOST_DEPS_DIR) compile

Same comments as for the target variant.

> +endef
> +endif
> +
> +# We need to double-$ the 'call' because it wants to expand
> +# package-related variables
> +ifndef $(2)_INSTALL_CMDS
> +define $(2)_INSTALL_CMDS
> +	$$(call install-erlang-directories,$$(HOST_DIR),include)
> +	$$(call install-rebar-deps,$$(HOST_DIR),HOST)
> +endef
> +endif
> +
> +endif # !target
> +
> +# The package sub-infra to use
> +#
> +ifeq ($$($(2)_CONFIGURE),YES)
> +$(call inner-autotools-package,$(1),$(2),$(3),$(4))
> +else
> +$(call inner-generic-package,$(1),$(2),$(3),$(4))
> +endif

Wow, this is funky :-) A package infra that inherits from either one
infra or the other! And two-level inheritance in the case of
generic-package -> autotools-package -> rebar-package.

All in all, despite the minor questions/comments above, it looks pretty
good. Care to work to resolve those issues and post an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
