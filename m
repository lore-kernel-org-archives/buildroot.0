From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2014 22:45:13 +0100
Subject: [Buildroot] [pkg-perl infra V2 01/12] perl: new infrastructure
In-Reply-To: <1385037319-2456-1-git-send-email-francois.perrad@gadz.org>
References: <1385037319-2456-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140203214513.GC3264@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

Thank you for this contribution! :-)

Arnout and I are now doing a review of this series.  Sorry to come back
to you so late...

> perl: new infrastructure

Could you please add a bit more description about this new
infrastructure?
You are doing quite some complex changes, and some of them seem
unrelated
to actually adding the infrastructure.

For example it seems the PERLIB -> PERL5LIB could be split to a separate
patch.

On 2013-11-21 13:35 +0100, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Makefile.in          |   11 ++-
>  package/intltool/intltool.mk |    4 +-
>  package/pkg-perl.mk          |  220 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 229 insertions(+), 6 deletions(-)
>  create mode 100644 package/pkg-perl.mk
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 612f3c7..34ce1ec 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -206,6 +206,8 @@ HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
>  HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
>  	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
>  
> +HOST_PERL_ARCHNAME = $(shell perl -MConfig -e "print Config->{archname}")

This should use ':=', not '='. (Spawning a shell is really costly, so we
want to evaluate this variable only once.)

>  		AS="$(TARGET_AS)" \
> @@ -241,11 +243,11 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
>  		LDFLAGS="$(TARGET_LDFLAGS)" \
>  		FCFLAGS="$(TARGET_FCFLAGS)" \
>  		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> -		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
> +		PERL5LIB=$(HOST_DIR)/usr/lib/perl5/$(HOST_PERL_ARCHNAME):$(HOST_DIR)/usr/lib/perl5 \

Separate patch, please (not repeated for the following instances).

[--SNIP--]
> diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
> new file mode 100644
> index 0000000..893501c
> --- /dev/null
> +++ b/package/pkg-perl.mk
> @@ -0,0 +1,220 @@
> +################################################################################
> +# Perl package infrastructure
> +#
> +# This file implements an infrastructure that eases development of
> +# package .mk files for Perl packages.
> +#
> +# See the Buildroot documentation for details on the usage of this
> +# infrastructure
> +#
> +# In terms of implementation, this perl infrastructure requires
> +# the .mk file to only specify metadata informations about the
> +# package: name, version, download URL, etc.
> +#
> +# We still allow the package .mk file to override what the different
> +# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
> +# already defined, it is used as the list of commands to perform to
> +# build the package, instead of the default perl behaviour. The
> +# package can also define some post operation hooks.
> +#
> +################################################################################
> +
> +_PERL_ARCHNAME	= $(ARCH)-linux
> +
> +_HOST_PERL_ARCHNAME	= $(shell perl -MConfig -e "print Config->{archname}")
> +_HOST_PERL_INSTALL_BASE	= $$(HOST_DIR)/usr
> +_HOST_PERL5LIB		= $(_HOST_PERL_INSTALL_BASE)/lib/perl5/$(_HOST_PERL_ARCHNAME):$(_HOST_PERL_INSTALL_BASE)/lib/perl5

Did you have some search-and-replace issue here? Those variables are
prefixed with an underscore. If that was on purpose, can you explain
why?

Also, it seems you're repeating the HOST_PERL_INSTALL_BASE which is
computed above (maybe it really belongs here, in fact?)

> +################################################################################
> +# inner-perl-package -- defines how the configuration, compilation and
> +# installation of an autotools package should be done, implements a

s/autotools/perl/

> +# few hooks to tune the build process for autotools specifities and

Ditto.

> +# calls the generic package infrastructure to generate the necessary
> +# make targets
> +#
> +#  argument 1 is the lowercase package name
> +#  argument 2 is the uppercase package name, including an HOST_ prefix
> +#             for host packages
> +#  argument 3 is the uppercase package name, without the HOST_ prefix
> +#             for host packages
> +#  argument 4 is the package directory prefix
> +#  argument 5 is the type (target or host)
> +################################################################################
> +
> +define inner-perl-package
> +
> +$(2)_CONF_OPT			?=
> +$(2)_BUILD_OPT			?=
> +$(2)_INSTALL_OPT		?=
> +$(2)_INSTALL_TARGET_OPT		?=
> +$(2)_CLEAN_OPT			?=
> +
> +#
> +# Configure step. Only define it if not already defined by the package
> +# .mk file. And take care of the differences between host and target
> +# packages.
> +#
> +ifndef $(2)_CONFIGURE_CMDS
> +ifeq ($(5),target)
> +
> +# Configure package for target
> +define $(2)_CONFIGURE_CMDS
> +	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
> +		PERL5LIB=$(_HOST_PERL5LIB) \
> +		perl Build.PL \
> +			--config ar="$(TARGET_AR)" \
> +			--config full_ar="$(TARGET_AR)" \
> +			--config cc="$(TARGET_CC)" \
> +			--config ccflags="$(TARGET_CFLAGS)" \
> +			--config ld="$(TARGET_CC)" \
> +			--config lddlflags="-shared $(TARGET_LDFLAGS)" \
> +			--config ldflags="$(TARGET_LDFLAGS)" \
> +			--include_dirs $$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$(_PERL_ARCHNAME)/CORE \
> +			--destdir $$(TARGET_DIR) \

How is this going to play when/if we have to install a perl package to
staging/ as well as in target/ ? Is that never going to happen?

> +			--installdirs vendor \
> +			--install_path lib=/usr/lib/perl5/site_perl/$$(PERL_VERSION) \
> +			--install_path arch=/usr/lib/perl5/site_perl/$$(PERL_VERSION)/$(_PERL_ARCHNAME) \
> +			--install_path bin=/usr/bin \
> +			--install_path script=/usr/bin \
> +			--install_path bindoc=/usr/share/man/man1 \
> +			--install_path libdoc=/usr/share/man/man3 \
> +			$$($(2)_CONF_OPT); \
> +	else \
> +		PERL5LIB=$(_HOST_PERL5LIB) \
> +		PERL_AUTOINSTALL=--skipdeps \
> +		perl Makefile.PL \
> +			AR="$(TARGET_AR)" \
> +			FULL_AR="$(TARGET_AR)" \
> +			CC="$(TARGET_CC)" \
> +			CCFLAGS="$(TARGET_CFLAGS)" \
> +			LD="$(TARGET_CC)" \
> +			LDDLFLAGS="-shared $(TARGET_LDFLAGS)" \
> +			LDFLAGS="$(TARGET_LDFLAGS)" \
> +			DESTDIR=$$(TARGET_DIR) \

Ditto.

> +			INSTALLDIRS=vendor \
> +			INSTALLVENDORLIB=/usr/lib/perl5/site_perl/$$(PERL_VERSION) \
> +			INSTALLVENDORARCH=/usr/lib/perl5/site_perl/$$(PERL_VERSION)/$(_PERL_ARCHNAME) \
> +			INSTALLVENDORBIN=/usr/bin \
> +			INSTALLVENDORSCRIPT=/usr/bin \
> +			INSTALLVENDORMAN1DIR=/usr/share/man/man1 \
> +			INSTALLVENDORMAN3DIR=/usr/share/man/man3 \
> +			$$($(2)_CONF_OPT); \
> +	fi

Is this automatic detection based on Build.PL really bullet-proof?
If there is the slighest chance this is not guaranteed to be true, then
we would prefer to have an explicit package variable (like the python
infrastrucuture does for distutils vs. setup-tools), like
   PERLFOO_SETUP_TYPE = {Build.PL|Makefile.PL}

See the nightly-build of the manual:
    http://nightly.buildroot.org/#_infrastructure_for_python_packages

Also see the python infra:
    package/pkg-python.mk

[--SNIP--]
> +#
> +# Clean step. Only define it if not already defined by
> +# the package .mk file.
> +#
> +ifndef $(2)_CLEAN_CMDS
> +define $(2)_CLEAN_CMDS
> +	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
> +		PERL5LIB=$(_HOST_PERL5LIB) \
> +		perl Build $$($(2)_CLEAN_OPT) clean; \
> +	else \
> +		PERL5LIB=$(_HOST_PERL5LIB) \
> +		$(MAKE1) $$($(2)_CLEAN_OPT) clean; \
> +	fi
> +endef
> +endif

We removed the 'clean' targets some time ago (after you posted your
series), so no need to define them any more.

We'll continue the review tomorrow for the rest of the series.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
