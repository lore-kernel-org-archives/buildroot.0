From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Nov 2014 15:55:46 +0100
Subject: [Buildroot] [PATCH v2 02/15] package/pkg-rebar.mk: new
	infrastructure.
In-Reply-To: <20141110233154.GG22119@free.fr>
References: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
 <1415366931-6870-3-git-send-email-johan.oudinet@gmail.com>
 <20141110233154.GG22119@free.fr>
Message-ID: <54622372.7000700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/14 00:31, Yann E. MORIN wrote:
> Johan, Thomas, All,
> 
> Thomas, there is a question for you later in the mail, just search for
> your first name. ;-)
> 
> On 2014-11-07 14:28 +0100, Johan Oudinet spake thusly:
>> Ease the development of packages that use the erlang rebar tool as
>> their build system.
> 
> This patch is huge. You should split it into three different patches:
>   - add the host-rebar package
>   - add the new pkg-rebar infra 
>   - add the manual part

 +1 to that!

 The addition of the erlang-ei-vsn script + variable could also be a separate patch.

> 
> I won't review the manual part for now, and will concentrate on the
> package infra.
> 
>> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
>> ---
>>  docs/manual/adding-packages-rebar.txt | 157 +++++++++++++++++++++++
>>  docs/manual/adding-packages.txt       |   2 +
>>  package/Makefile.in                   |   1 +
>>  package/erlang-rebar/erlang-rebar.mk  |  20 +++
>>  package/pkg-rebar.mk                  | 229 ++++++++++++++++++++++++++++++++++
>>  support/scripts/erlang-ei-vsn         |  19 +++
>>  6 files changed, 428 insertions(+)
>>  create mode 100644 docs/manual/adding-packages-rebar.txt
>>  create mode 100644 package/erlang-rebar/erlang-rebar.mk
>>  create mode 100644 package/pkg-rebar.mk
>>  create mode 100755 support/scripts/erlang-ei-vsn
> [--SNIP--]
>> diff --git a/package/erlang-rebar/erlang-rebar.mk b/package/erlang-rebar/erlang-rebar.mk
>> new file mode 100644
>> index 0000000..917114b
>> --- /dev/null
>> +++ b/package/erlang-rebar/erlang-rebar.mk
>> @@ -0,0 +1,20 @@
>> +################################################################################
>> +#
>> +# erlang-rebar
> 
> For other pkg infras, we prefix the language type for packages that
> actually use that infra (e.g. PYTHON_FOO_SOURCE for a Python package,
> but we do not prefix the Python package itself, like: PYTHON_PYTHON_SOURCE)

 Err, we do exactly the same for python-setuptools, so how is this different?

 You could say that the package infrastructure should be named pkg-erlang
instead of pkg-rebar, but I don't think so. The situation is a bit similar to
qmake - qmake is the canonical build tool for Qt packages, but if we would have
qmake infrastructure, it would be called pkg-qmake and not pkg-qt.

 So I vote for erlang-rebar and pkg-rebar, exactly as it is now.

> 
> So, I think 'rebar' should just be 'rebar'.
> 
>> +#
>> +################################################################################
>> +
>> +ERLANG_REBAR_VERSION = 2.5.1
>> +ERLANG_REBAR_SOURCE = $(ERLANG_REBAR_VERSION).tar.gz
>> +ERLANG_REBAR_SITE = https://github.com/rebar/rebar/archive
> 
> Hmm... The Erlang folks really can't do anything like the others...
> 
> There are two ways to get packages from github:
>   - the github helper in Buildroot
>   - the direct 'released' tarballs
> 
> So, rebar does do releases on GitHub. Except what they release is not
> the source code, but the actual generated rebar executable. Sigh...

 Err, when I download https://github.com/rebar/rebar/archive/2.5.1.tar.gz I get
exactly the same files as what is in the 2.5.1 tag, I don't get any executable...

> 
> So, in your case, you have no choice, but to use the github helper, as
> described in the manual:
>     http://nightly.buildroot.org/#_tips_and_tricks
> 
>     REBAR_SITE = $(call github,rebar,rebar,$(REBAR_VERSION))
> 
>> +ERLANG_REBAR_DEPENDENCIES = host-erlang

 If there would be a target rebar package, it would depend on target erlang,
right? So this should be either

HOST_ERLANG_REBAR_DEPENDENCIES = host-erlang

or

ERLANG_REBAR_DEPENDENCIES = erlang


> 
> Also, missing REBAR_LICENSE and REBAR_LICENSE_FILES.
> 
> (Hint: you also need to document ERLANG_FOOBAR_LICENSE and
> ERLANG_FOOBAR_LICENSE_FILES in the manual.)
> 
>> +define HOST_ERLANG_REBAR_BUILD_CMDS
>> +	cd $(@D) && $(HOST_MAKE_ENV) $(MAKE)
>> +endef
>> +
>> +define HOST_ERLANG_REBAR_INSTALL_CMDS
>> +	$(INSTALL) -D $(@D)/rebar $(HOST_DIR)/usr/bin/rebar
>> +endef
>> +
>> +$(eval $(host-generic-package))
>> diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
>> new file mode 100644
>> index 0000000..9dbd42d
>> --- /dev/null
>> +++ b/package/pkg-rebar.mk
>> @@ -0,0 +1,229 @@
>> +################################################################################
>> +# rebar package infrastructure
>> +#
>> +# This file implements an infrastructure that eases development of
>> +# package .mk files for rebar packages.  It should be used for all
>> +# packages that use rebar as their build system.
>> +#
>> +# In terms of implementation, this rebar infrastructure requires the
>> +# .mk file to only specify metadata information about the package:
>> +# name, version, download URL, etc.
>> +#
>> +# We still allow the package .mk file to override what the different
>> +# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
>> +# already defined, it is used as the list of commands to perform to
>> +# build the package, instead of the default rebar behaviour. The
>> +# package can also define some post operation hooks.
>> +#
>> +################################################################################
>> +
>> +# Version of Erlang's erl_interface module.  One needs this to setup
>> +# proper linker flags when building Erlang modules written in C.
>> +#
>> +ERLANG_EI_VSN = $(shell support/scripts/erlang-ei-vsn)
> 
> See at the end my comments about that variable: it should be set from
> the erlang.mk (or so I think).

 +1

> 
>> +# Directories to store rebar dependencies in.
>> +#
>> +# These directories actually only contain symbolic links to Erlang
>> +# applications in either $(HOST_DIR) or $(STAGING_DIR).  One needs
>> +# them to avoid rebar complaining about missing dependencies, as this
>> +# infrastructure does NOT tell rebar to download dependencies during

 ... as this infrastructure tells rebar NOT to download dependencies ...

>> +# the build stage.
>> +#
>> +REBAR_HOST_DEPS_DIR = $(BUILD_DIR)/erlang-rebar-deps/host
>> +REBAR_TARGET_DEPS_DIR = $(BUILD_DIR)/erlang-rebar-deps/target
> 
> Well, I would prefer those directories not be stored in the build dir,
> but somewhere like:
>     $(HOST_DIR)/usr/share/rebar/deps-host
>     $(HOST_DIR)/usr/share/rebar/deps-target

 +1, but I'd say

$(HOST_DIR)/usr/share/rebar/deps
$(STAGING_DIR)/usr/share/rebar/deps


 Note on the naming: even though the package is called erlang-rebar for
buildroot, anything it installs will just be rebar (without erlang-) because
that's how upstream identifies itself.

> 
> We do not have a location for that kind of information for now in
> Buildroot. I believe it belongs somewhere into $(HOST_DIR), but I would
> accept to be contradicted on that one.

 I agree with Yann. Subdirectories of $(BUILD_DIR) should always be
<pkg>-<version>. There are very few exceptions (e.g. build-time.log) but they
should stay exceptions.


> 
>> +################################################################################
>> +# Helper functions
>> +################################################################################
>> +
>> +# Install an Erlang application from $(@D).
>> +#
>> +# i.e., define a recipe that installs the "ebin priv $(2)" directories
>> +# from $(@D) to $(1)$($(PKG)_ERLANG_LIBDIR).
>> +#
>> +#  argument 1 should typically be $(HOST_DIR), $(TARGET_DIR),
>> +#	      or $(STAGING_DIR).
>> +#  argument 2 is typically empty when installing in $(TARGET_DIR) and
>> +#             "include" when installing in $(HOST_DIR) or
>> +#             $(STAGING_DIR).
>> +#
>> +define install-erlang-directories
>> +	$$(INSTALL) --directory '$(1)$$($$(PKG)_ERLANG_LIBDIR)'

 We generally use -d instead of --directory.

 We generally don't quote the paths. I'm not sure if we should, but we generally
don't.

>> +	for dir in ebin priv $(2); do					\
>> +		if test -d "$$(@D)/$$$$dir"; then			\
>> +			cp -r	"$$(@D)/$$$$dir"			\
>> +				'$(1)$$($$(PKG)_ERLANG_LIBDIR)';	\
>> +		fi;							\
>> +	done
>> +endef

 Ah, double-$ mess :-)

 The double-$ is needed only because it is called from inner-rebar-package,
which means that this function cannot be called from custom package commands.
That's not very nice.

 Fortunately, the solution is very simple: use single $ here, and put a double $
at the $$(call install-erlang-directories,...) site.

 (Of course I haven't tested this, so YMMV.)

 Same for all other functions defined below
.

>> +
>> +# Setup a symbolic link in rebar's deps_dir to the actual location
>> +# where an Erlang application is installed.
>> +#
>> +# i.e., define a recipe that creates a symbolic link
>> +# from $($(PKG)_REBAR_DEPS_DIR)/$($(PKG)_ERLANG_APP)
>> +# to $(1)$($(PKG)_ERLANG_LIBDIR).
>> +#
>> +# One typically uses this to setup symbolic links from
>> +# $(BUILD_DIR)/rebar-deps/<HOST_OR_TARGET>/<ERLANG_APP> to the
>> +# appropriate application directory in $(HOST_DIR) or $(STAGING_DIR).
>> +# This avoids rebar complaining about missing dependencies, as this
>> +# infrastructure does NOT tell rebar to download dependencies during
>> +# the build stage.
>> +#
>> +# Therefore,
>> +#  argument 1 is $$(HOST_DIR) (for host packages) or
>> +#	      $$(STAGING_DIR) (for target packages).
>> +#
>> +define install-rebar-deps
>> +	$$(INSTALL) --directory '$$($$(PKG)_REBAR_DEPS_DIR)'
>> +	ln -f -s							\
>> +		'$(1)$$($$(PKG)_ERLANG_LIBDIR)'				\
>> +		'$$($$(PKG)_REBAR_DEPS_DIR)/$$($$(PKG)_ERLANG_APP)'
>> +endef
>> +
>> +################################################################################
>> +# inner-rebar-package -- defines how the configuration, compilation
>> +# and installation of a rebar package should be done, implements a few
>> +# hooks to tune the build process according to rebar specifities, and

 specificities

>> +# calls the generic package infrastructure to generate the necessary
>> +# make targets.
>> +#
>> +#  argument 1 is the lowercase package name
>> +#  argument 2 is the uppercase package name, including a HOST_ prefix
>> +#             for host packages
>> +#  argument 3 is the uppercase package name, without the HOST_ prefix
>> +#             for host packages
>> +#  argument 4 is the type (target or host)
>> +#
>> +################################################################################
>> +
>> +define inner-rebar-package
>> +
>> +$(2)_ERLANG_APP ?= $(subst -,_,$(call LOWERCASE,$(patsubst ERLANG_%,%,$(3))))

 It would make more sense to me to do

$(subst -,_,$(patsubst erlang-%,%,$(patsubst host-%,%,$(1))))


>> +$(2)_ERLANG_LIBDIR ?= \
>> +	/usr/lib/erlang/lib/$$($$(PKG)_ERLANG_APP)-$$($$(PKG)_VERSION)

 Does it make sense to make this configurable? I.e., wouldn't it be better to
just expand this in the two places where it's used? It would certainly be
clearer that way.

>> +$(2)_ENV ?=								\
>> +	CC='$$($(call UPPERCASE,$(4))_CC)'				\
>> +	CFLAGS='$$($(call UPPERCASE,$(4))_CFLAGS)'			\
>> +	LDFLAGS='$$($(call UPPERCASE,$(4))_LDFLAGS)'			\

 I don't like this way of distinguishing host and target very much. It avoids
code duplication, but it's a lot harder to read. So I'd prefer

ifeq ($(4),host)
$(2)_ENV ?= \
	CC='$$(TARGET_CC)' \
	CFLAGS='$$(TARGET_CFLAGS)' \
	...

 Also, it would be nice to cater for custom CFLAGS, i.e.

	CFLAGS='$$(TARGET_CFLAGS) $$($$(PKG)_CFLAGS)'

>> +	ERL_COMPILER_OPTIONS='{i, "$$($$(PKG)_REBAR_DEPS_DIR)"}'	\
>> +	ERL_EI_LIBDIR='$$($(call UPPERCASE,$(4))_DIR)/usr/lib/erlang/lib/erl_interface-$$(ERLANG_EI_VSN)/lib'
>> +
>> +$(2)_REBAR_DEPS_DIR ?= $$(REBAR_$(call UPPERCASE,$(4))_DEPS_DIR)
>> +$(2)_REBAR_FLAGS ?= deps_dir='$$($$(PKG)_REBAR_DEPS_DIR)'
>> +$(2)_REBAR_ENV ?= PATH='$$(BR_PATH)'
>> +
>> +ifndef $(2)_AUTORECONF
>> + ifdef $(3)_AUTORECONF
>> +  $(2)_AUTORECONF = $$($(3)_AUTORECONF)
>> + else
>> +  $(2)_AUTORECONF ?= NO
>> + endif
>> +endif

 Fortunately Yann already did a review and explains things below, otherwise I'd
have big question marks about this one. Something that surprises the casual
reader should really carry an explanatory comment.

>> +
>> +$(2)_INTERNAL_CONF_ENV =			\
>> +	CONFIG_SITE=/dev/null			\
>> +	PATH='$$(BR_PATH)'			\
>> +	$$($$(PKG)_ENV)				\
>> +	$$($$(PKG)_CONF_ENV)
>> +
>> +ifeq ($(4),target)
>> +$(2)_INTERNAL_CONF_FLAGS =			\
>> +	--target=$$(GNU_TARGET_NAME)		\
>> +	--host=$$(GNU_TARGET_NAME)		\
>> +	--build=$$(GNU_HOST_NAME)		\
>> +	--prefix=/usr				\
>> +	--exec-prefix=/usr			\
>> +	--sysconfdir=/etc			\
>> +	--localstatedir=/var			\
>> +	--program-prefix=			\
>> +	$$(DISABLE_NLS)				\
>> +	$$(DISABLE_LARGEFILE)			\
>> +	$$(DISABLE_IPV6)			\
>> +	$$(ENABLE_DEBUG)			\
>> +	$$(SHARED_STATIC_LIBS_OPTS)		\
>> +	$$($$(PKG)_CONF_OPTS)
>> +else
>> +$(2)_INTERNAL_CONF_FLAGS =			\
>> +	--prefix='$$(HOST_DIR)/usr'		\
>> +	--sysconfdir='$$(HOST_DIR)/etc'		\
>> +	--localstatedir='$$(HOST_DIR)/var'	\
>> +	--enable-shared --disable-static	\
>> +	--disable-debug				\
>> +	$$($$(PKG)_CONF_OPTS)
>> +endif
>> +
>> +ifeq ($$($(2)_AUTORECONF),YES)
>> +$(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
>> +$(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
>> +endif
>> +
>> +ifndef $(2)_CONFIGURE_CMDS
>> +define $(2)_CONFIGURE_CMDS
>> +	if [ -f '$$(@D)/configure' ]; then				\
>> +		cd '$$(@D)' &&						\
>> +		rm -rf config.cache &&					\
>> +		$$($$(PKG)_INTERNAL_CONF_ENV)				\
>> +		./configure						\
>> +			--disable-gtk-doc				\
>> +			--disable-doc					\
>> +			--disable-docs					\
>> +			--disable-documentation				\
>> +			--with-xmlto=no					\
>> +			--with-fop=no					\
>> +			--disable-dependency-tracking			\
>> +			$$(QUIET) $$($$(PKG)_INTERNAL_CONF_FLAGS);	\
>> +	fi
>> +endef
>> +endif
> 
> Hmm... It looks like you're borrowing a lot from pkg-autotools. I do not
> like this duplication, especially in the pkg infras, since fixing
> something would imply hunting down all over the place...
> 
> What if you would call to inner-autotools-package instead of calling to
> inner-generic-package ?
> 
> The only problem is that pkg-autotools always calls ./configure, while
> in the rebar case, you only want to call it conditionally.
> 
> Except the only Erlang package that has a ./configure is ejabberd
> itself, and you're introducing complexity for just one package.
> 
> And ejabberd is not even a complete autotools package: it only uses
> autoconf (via configure.ac) but not automake (no Makefile.am).
> 
> And you need to autoreconf ejabberd because:
>   - you get it from the git tree. There is a release tarball, though:
>       http://www.process-one.net/downloads/ejabberd/14.07/ejabberd-14.07.tgz

 That's of course definitely a good idea, but it should still be _possible_ to
use a git version.

> 
>   - you do not want to run the version check in patch
>     0004-disable-version-check.patch, but you could well use the
>     configure switch --disable-erlang-version-check
> 
>     The only problem I could foresee is that it tries to run the target
>     Erlang compiler, right? If so, just patch the configure script
>     directly (ugly, but that's better than trying to get complexity in
>     the rebar infra just for this sucker^Wsingle package. ;-)
> 
> So, in the end, just make it a generic package (like you did here), do
> not provide any _CONFIGURE_CMDS, and delegate to ejabberd the
> responsibility to provide its own EJABBERD_CONFIGURE_CMDS
> 
> Hmmm... Looking further, it seems a few others (all from ProcessOne?)
> also uses ./configure . What about adding a new variable, like:
> 
>     ERLANG_FOO_CONFIGURE = YES
> 
> which would tell whether running configure is needed?

 I have the feeling we'll need a rebar-package and rebar-autotools-package.

 But starting with FOO_CONFIGURE isn't a bad idea either.


> 
> I'd like input from Thomas P. on all the above, because we get into
> really tricky-icky stuff... Thomas?
> 
> And by the way, since ejabberd is using the rebar infra, then maybe it
> makes sense to call that package erlang-ejabberd? I know it sounds
> strange, but that what's you did for all other rebar-using packages, so
> I don't see why this would be different for that one.

 No, the convention is that library-type packages should be called
<language>-<package>, while program-type packages should be called just
<package> (and should select the programming language rather than depending on it).

> 
>> +ifndef $(2)_BUILD_CMDS
>> +define $(2)_BUILD_CMDS
>> +	cd '$$(@D)' &&							\
>> +	if [ -f ./rebar ]; then						\
>> +		$$($$(PKG)_ENV)						\
>> +		$$($$(PKG)_REBAR_ENV)					\
>> +			./rebar $$($$(PKG)_REBAR_FLAGS) compile;	\
>> +	else								\
>> +		$$($$(PKG)_ENV)						\
>> +		$$($$(PKG)_REBAR_ENV)					\
>> +			rebar $$($$(PKG)_REBAR_FLAGS) compile;		\
>> +	fi
>> +endef
>> +endif
> 
> Hmm... Do we want to trust the package's own rebar? Shouldn't we always
> use our own version of rebar instead?
> 
> What would be the reason to 'trust' the package's rebar more than our?

 Because the package's rebar may be more up-to-date or may be modified. As long
as we don't apply cross-compilation patches to our rebar, there is no reason to
prefer that one.

 Ideally, however, the package should only depend on host-rebar if it will
actually use it. It's not a showstopper for me, just a preference.

 Also, I have a slight preference for the buildroot package to specify which one
should be used rather than autodiscovering it. But again, not a showstopper for me.

> 
>> +
>> +ifeq ($(4),host) # Install host files.
>> +
>> +ifndef $(2)_INSTALL_CMDS
>> +define $(2)_INSTALL_CMDS
>> +	$(call install-erlang-directories,$$(HOST_DIR),include)

 Personally, I'd find it slightly more readable to put all the directories here
(ebin priv include) rather than automagically installing ebin and priv.


 I'm running out of time so I have to stop my review here...

 Regards,
 Arnout

>> +	$(call install-rebar-deps,$$(HOST_DIR))
>> +endef
>> +endif
>> +
>> +else # Install staging/target files.
>> +
>> +ifndef $(2)_INSTALL_STAGING_CMDS
>> +define $(2)_INSTALL_STAGING_CMDS
>> +	$(call install-erlang-directories,$$(STAGING_DIR),include)
>> +	$(call install-rebar-deps,$$(STAGING_DIR))
>> +endef
>> +endif
>> +
>> +ifndef $(2)_INSTALL_TARGET_CMDS
>> +define $(2)_INSTALL_TARGET_CMDS
>> +	$(call install-erlang-directories,$$(TARGET_DIR))
>> +endef
>> +endif
>> +
>> +endif
>> +
>> +$(call inner-generic-package,$(1),$(2),$(3),$(4))
>> +
>> +endef # inner-rebar-package
>> +
>> +rebar-package = $(call inner-rebar-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
>> +
>> +host-rebar-package = $(call inner-rebar-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
> 
> No empty lines between the target and host variants.
> 
>> diff --git a/support/scripts/erlang-ei-vsn b/support/scripts/erlang-ei-vsn
>> new file mode 100755
>> index 0000000..cdab8e9
>> --- /dev/null
>> +++ b/support/scripts/erlang-ei-vsn
>> @@ -0,0 +1,19 @@
>> +#! /bin/sh
>> +# Extract and print the version of Erlang's erl_interface module.
>> +#
>> +# Exit non-zero and print nothing if Erlang has not been extracted in
>> +# output/build.
>> +
>> +S=[:space:]
>> +
>> +# Extract the BAR part from all lines matching "$2 = BAR" in file $1.
>> +get_make_variable() {
>> +    local file="$1" name="$2"
>> +
>> +    sed "s/^[$S]*$name[$S]*=[$S]*\\([^$S]*\\)[$S]*\$/\\1/; t; d" "$file"
>> +}
>> +
>> +ERLANG_VSN=$(get_make_variable package/erlang/erlang.mk ERLANG_VERSION)
>> +EI_VSN_FILE=output/build/erlang-$ERLANG_VSN/lib/erl_interface/vsn.mk
> 
> That does not work for out-of-tree builds. You should use something
> like:
>     EI_VSN_FILE="${O}/build/erlang-$ERLANG_VSN/lib/erl_interface/vsn.mk"
> 
> However, rather than poke in the erlang sources, could you modify our
> erlang.mk and add a post-install hook that just extract this value and
> installs it in (for example) $(HOST_DIR)/usr/share/erlang/EI_VSN .
> 
> But if you have ERLANG_EI_VSN set from the erlang.mk package itself, you
> do not need to have that script.
> 
>> +[ -f "$EI_VSN_FILE" ] && get_make_variable "$EI_VSN_FILE" EI_VSN
> 
> OK, I'm definitely not done reviewing that series. ;-)
> 
> But it looks very, *very* promising! :-)
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
