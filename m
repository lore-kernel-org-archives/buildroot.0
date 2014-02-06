From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 6 Feb 2014 14:41:34 +0100
Subject: [Buildroot] [UNSURE]Re: [pkg-perl infra V4 2/9] pkg-perl: new
	infrastructure
In-Reply-To: <52F335B5.5040306@mind.be>
References: <1391608380-23240-1-git-send-email-francois.perrad@gadz.org>
 <1391608380-23240-3-git-send-email-francois.perrad@gadz.org>
 <52F335B5.5040306@mind.be>
Message-ID: <CAB0FRssEwGdBi5SXZ+QhoscQxcDgy5-kg9O4yONvP8Z7KOLXqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-02-06 8:11 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>  Hi Francois,
>
>  Someone (Yann?) suggested to call this infrastructure "cpan" rather than
> "perl", similar like how it's done for luarocks. What do you think about
> that?
>
>  Actually, now I have looked at the patch again, I can see the answer:
> there is nothing CPAN-specific about this patch (except for the
> definition of the mirror variable), it can just as well be used for
> packages downloaded from somewhere else or local packages.
>

I agree with you, Arnout.
It is a "perl" infrastructure.

> On 05/02/14 14:52, Francois Perrad wrote:
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>>  Config.in           |   10 +++
>>  package/Makefile.in |    4 +-
>>  package/pkg-perl.mk |  198 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 211 insertions(+), 1 deletion(-)
>>  create mode 100644 package/pkg-perl.mk
>>
>> diff --git a/Config.in b/Config.in
>> index 7ec7c2a..678fe8d 100644
>> --- a/Config.in
>> +++ b/Config.in
>> @@ -225,6 +225,16 @@ config BR2_LUAROCKS_MIRROR
>>
>>         See http://luarocks.org
>>
>> +config BR2_CPAN_MIRROR
>> +     string "CPAN mirror"
>> +     default "http://search.cpan.org/CPAN"
>> +     help
>> +       CPAN has multiple software mirrors scattered around the world.
>> +       This option allows you to select a mirror.
>> +
>> +       The list of mirrors is available at:
>> +       http://search.cpan.org/mirror
>> +
>
>  Side-track: like BR2_DL_DIR, these mirror variables should really be
> overridden by the environment, because they are a kind of local
> configuration. I mean, if I prefer to use a particular mirror, I want
> that one for all my configurations. Conversely, if I pass my defconfig to
> someone in Australia, they'll want to use a different mirror.
>
>>  endmenu
>>
>>  config BR2_JLEVEL
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index d0b1cfd..41f73cb 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -206,7 +206,8 @@ HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
>>  HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
>>       sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
>>
>> -HOST_PERL5LIB = $(HOST_DIR)/usr/lib/perl
>> +HOST_PERL_ARCHNAME := $(shell perl -MConfig -e "print Config->{archname}")
>> +HOST_PERL5LIB = $(HOST_DIR)/usr/lib/perl5/$(HOST_PERL_ARCHNAME):$(HOST_DIR)/usr/lib/perl5
>
>  This change has no direct bearing on the cpan infrastructure.

Package using host-perl-package infrastructure, installs module in
$(HOST_DIR)/usr/lib/perl5.
The host perl finds these modules with a PERL5LIB which refers this new path.

>
>  Also, I see the following in my $(HOST_DIR)/usr/lib:
>
> $ ls host/usr/lib/perl*
> host/usr/lib/perl:
> XML/  auto/  perllocal.pod
>
> host/usr/lib/perl5:
> ExtUtils/  x86_64-linux-gnu-thread-multi/
>
>  So I guess $(HOST_DIR)/usr/lib/perl should also be in there?
>
>
>>  TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
>>               AR="$(TARGET_AR)" \
>> @@ -376,4 +377,5 @@ include package/pkg-autotools.mk
>>  include package/pkg-cmake.mk
>>  include package/pkg-luarocks.mk
>>  include package/pkg-python.mk
>> +include package/pkg-perl.mk
>>  include package/pkg-generic.mk
>> diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
>> new file mode 100644
>> index 0000000..a049bce
>> --- /dev/null
>> +++ b/package/pkg-perl.mk
>> @@ -0,0 +1,198 @@
>> +################################################################################
>> +# Perl package infrastructure
>> +#
>> +# This file implements an infrastructure that eases development of
>> +# package .mk files for Perl packages.
>> +#
>> +# See the Buildroot documentation for details on the usage of this
>> +# infrastructure
>> +#
>> +# In terms of implementation, this perl infrastructure requires
>> +# the .mk file to only specify metadata informations about the
>
>  s/informations/information/
>
>> +# package: name, version, download URL, etc.
>> +#
>> +# We still allow the package .mk file to override what the different
>> +# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
>> +# already defined, it is used as the list of commands to perform to
>> +# build the package, instead of the default perl behaviour. The
>> +# package can also define some post operation hooks.
>
>  Side-track: I wonder about the usefulness of these comments. They
> duplicate the documentation in the manual, which risks inconsistency.
> Would anybody ever look at the comments in pkg-*.mk to learn about using
> the package infrastructure?
>
>> +#
>> +################################################################################
>> +
>> +PKG_PERL_ARCHNAME    = $(ARCH)-linux
>> +
>> +################################################################################
>> +# inner-perl-package -- defines how the configuration, compilation and
>> +# installation of a perl package should be done, implements a
>> +# few hooks to tune the build process for perl specifities and
>> +# calls the generic package infrastructure to generate the necessary
>> +# make targets
>> +#
>> +#  argument 1 is the lowercase package name
>> +#  argument 2 is the uppercase package name, including an HOST_ prefix
>> +#             for host packages
>> +#  argument 3 is the uppercase package name, without the HOST_ prefix
>> +#             for host packages
>> +#  argument 4 is the type (target or host)
>> +################################################################################
>> +
>> +define inner-perl-package
>> +
>> +$(2)_CONF_OPT                        ?=
>> +$(2)_BUILD_OPT                       ?=
>> +$(2)_INSTALL_OPT             ?=
>> +$(2)_INSTALL_TARGET_OPT              ?=
>
>  Something funky with the alignment of these. Perhaps better to just
> remove them, they're useless anyway.
>
>> +
>> +#
>> +# Configure step. Only define it if not already defined by the package
>> +# .mk file. And take care of the differences between host and target
>> +# packages.
>> +#
>> +ifndef $(2)_CONFIGURE_CMDS
>> +ifeq ($(4),target)
>> +
>> +# Configure package for target
>> +define $(2)_CONFIGURE_CMDS
>> +     cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
>> +             PERL5LIB=$(HOST_PERL5LIB) \
>> +             perl Build.PL \
>> +                     --config ar="$(TARGET_AR)" \
>> +                     --config full_ar="$(TARGET_AR)" \
>> +                     --config cc="$(TARGET_CC)" \
>> +                     --config ccflags="$(TARGET_CFLAGS)" \
>> +                     --config ld="$(TARGET_CC)" \
>> +                     --config lddlflags="-shared $(TARGET_LDFLAGS)" \
>> +                     --config ldflags="$(TARGET_LDFLAGS)" \
>> +                     --include_dirs $$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$(PKG_PERL_ARCHNAME)/CORE \
>> +                     --destdir $$(TARGET_DIR) \
>> +                     --installdirs vendor \
>> +                     --install_path lib=/usr/lib/perl5/site_perl/$$(PERL_VERSION) \
>> +                     --install_path arch=/usr/lib/perl5/site_perl/$$(PERL_VERSION)/$(PKG_PERL_ARCHNAME) \
>
>  Why install in site_perl and not directly in the perl directories?
> That's a bit like /usr/local, isn't it?

The Perl policy segregates the core modules and the additionnal ones.
 - core modules in /usr/lib/perl5
 - CPAN modules in /usr/lib/perl5/site_perl
By default, the target perl knows and uses these 2 paths.

Fran?ois

>
>  Actually, wouldn't setting installdirs to core make most of these redundant?
>
>
>> +                     --install_path bin=/usr/bin \
>> +                     --install_path script=/usr/bin \
>> +                     --install_path bindoc=/usr/share/man/man1 \
>> +                     --install_path libdoc=/usr/share/man/man3 \
>
>  Since we don't want documentation on target, is there a way to define
> this so that documentation is thrown away immediately? And is there an
> option to avoid building documentation?
>
>> +                     $$($(2)_CONF_OPT); \
>> +     else \
>> +             PERL5LIB=$(HOST_PERL5LIB) \
>> +             PERL_AUTOINSTALL=--skipdeps \
>> +             perl Makefile.PL \
>> +                     AR="$(TARGET_AR)" \
>> +                     FULL_AR="$(TARGET_AR)" \
>> +                     CC="$(TARGET_CC)" \
>> +                     CCFLAGS="$(TARGET_CFLAGS)" \
>> +                     LD="$(TARGET_CC)" \
>> +                     LDDLFLAGS="-shared $(TARGET_LDFLAGS)" \
>> +                     LDFLAGS="$(TARGET_LDFLAGS)" \
>> +                     DESTDIR=$$(TARGET_DIR) \
>> +                     INSTALLDIRS=vendor \
>> +                     INSTALLVENDORLIB=/usr/lib/perl5/site_perl/$$(PERL_VERSION) \
>> +                     INSTALLVENDORARCH=/usr/lib/perl5/site_perl/$$(PERL_VERSION)/$(PKG_PERL_ARCHNAME) \
>> +                     INSTALLVENDORBIN=/usr/bin \
>> +                     INSTALLVENDORSCRIPT=/usr/bin \
>> +                     INSTALLVENDORMAN1DIR=/usr/share/man/man1 \
>> +                     INSTALLVENDORMAN3DIR=/usr/share/man/man3 \
>> +                     $$($(2)_CONF_OPT); \
>> +     fi
>> +endef
>> +else
>> +
>> +# Configure package for host
>> +define $(2)_CONFIGURE_CMDS
>> +     cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
>> +             PERL5LIB=$(HOST_PERL5LIB) \
>> +             perl Build.PL \
>> +                     --install_base $$(HOST_DIR)/usr \
>> +                     --installdirs vendor \
>> +                     $$($(2)_CONF_OPT); \
>> +     else \
>> +             PERL5LIB=$(HOST_PERL5LIB) \
>> +             PERL_AUTOINSTALL=--skipdeps \
>> +             perl Makefile.PL \
>> +                     INSTALL_BASE=$$(HOST_DIR)/usr \
>> +                     INSTALLDIRS=vendor \
>> +                     $$($(2)_CONF_OPT); \
>> +     fi
>> +endef
>> +endif
>> +endif
>> +
>> +#
>> +# Build step. Only define it if not already defined by the package .mk
>> +# file. And take care of the differences between host and target
>> +# packages.
>> +#
>> +ifndef $(2)_BUILD_CMDS
>> +ifeq ($(4),target)
>> +
>> +# Build package for target
>> +define $(2)_BUILD_CMDS
>> +     cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
>> +             PERL5LIB=$(HOST_PERL5LIB) \
>> +             perl Build $$($(2)_BUILD_OPT) build; \
>> +     else \
>> +             PERL5LIB=$(HOST_PERL5LIB) \
>> +             $(MAKE1) \
>> +                     PERL_INC=$$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$(PKG_PERL_ARCHNAME)/CORE \
>
>  How come you don't need this in the configure step?
>
>
>  Regards,
>  Arnout
>
>> +                     $$($(2)_BUILD_OPT) pure_all; \
>> +     fi
>> +endef
>> +else
>> +
>> +# Build package for host
>> +define $(2)_BUILD_CMDS
>> +     cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
>> +             PERL5LIB=$(HOST_PERL5LIB) \
>> +             perl Build $$($(2)_BUILD_OPT) build; \
>> +     else \
>> +             PERL5LIB=$(HOST_PERL5LIB) \
>> +             $(MAKE1) $$($(2)_BUILD_OPT) pure_all; \
>> +     fi
>> +endef
>> +endif
>> +endif
>> +
>> +#
>> +# Host installation step. Only define it if not already defined by the
>> +# package .mk file.
>> +#
>> +ifndef $(2)_INSTALL_CMDS
>> +define $(2)_INSTALL_CMDS
>> +     cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
>> +             PERL5LIB=$(HOST_PERL5LIB) \
>> +             perl Build $$($(2)_INSTALL_TARGET_OPT) install; \
>> +     else \
>> +             PERL5LIB=$(HOST_PERL5LIB) \
>> +             $(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
>> +     fi
>> +endef
>> +endif
>> +
>> +#
>> +# Target installation step. Only define it if not already defined by
>> +# the package .mk file.
>> +#
>> +ifndef $(2)_INSTALL_TARGET_CMDS
>> +define $(2)_INSTALL_TARGET_CMDS
>> +     cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
>> +             PERL5LIB=$(HOST_PERL5LIB) \
>> +             perl Build $$($(2)_INSTALL_TARGET_OPT) install; \
>> +     else \
>> +             PERL5LIB=$(HOST_PERL5LIB) \
>> +             $(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
>> +     fi
>> +endef
>> +endif
>> +
>> +# Call the generic package infrastructure to generate the necessary
>> +# make targets
>> +$(call inner-generic-package,$(1),$(2),$(3),$(4))
>> +
>> +endef
>> +
>> +################################################################################
>> +# perl-package -- the target generator macro for Perl packages
>> +################################################################################
>> +
>> +perl-package = $(call inner-perl-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
>> +host-perl-package = $(call inner-perl-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
