From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Dec 2018 10:21:59 +0100
Subject: [Buildroot] [PATCH 1/2] package: pkg-autotools: Add option to
 run autogen.sh
In-Reply-To: <20181223223742.23710-2-vadim4j@gmail.com>
References: <20181223223742.23710-1-vadim4j@gmail.com>
 <20181223223742.23710-2-vadim4j@gmail.com>
Message-ID: <20181224092159.GA2703@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vadim., All

On 2018-12-24 00:37 +0200, Vadim Kochan spake thusly:
> Add $(PKG)_AUTOGEN variable which allows to execute autogen.sh script
> on pre-configure stage.

I'm not sure we want to have this in the infra. IIRC, we already spoke
about it in the past, more than once, and the conclusion had always been
that this was not demed useful.

First, we only have three autotools packages that need that. This is a
bit on the short lead to turn it into the infra.

Second, we don't want to make it easy to use autogen.sh. We prefer
developpers to use AUTORECONF=YES instead. Using autogen.sh should be
a last-resort option.

Thirdly, and lastly, not all packages have autogen.sh, some have it as
bootstrap.sh, for example Asterisk:
    http://git.asterisk.org/gitweb/?p=asterisk/asterisk.git;a=blob;f=bootstrap.sh

(Note that we don't need to call Asterisk's bootstrap.sh in Buildroot,
but that is just an example that such scripts are not always named
autogen.sh.)

So, my opinion is that we should not have it in the infra.

Regards,
Yann E. MORIN.

> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  docs/manual/adding-packages-autotools.txt |  4 ++++
>  package/pkg-autotools.mk                  | 20 ++++++++++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
> index a041d91eb6..105c038961 100644
> --- a/docs/manual/adding-packages-autotools.txt
> +++ b/docs/manual/adding-packages-autotools.txt
> @@ -159,6 +159,10 @@ cases, typical packages will therefore only use a few of them.
>    value is correct for most autotools packages, but it is still possible
>    to override it if needed.
>  
> +* +LIBFOO_AUTOGEN+, tells whether the autogen.sh script should be
> +  executed to generate 'configure' script. Valid values are +YES+ and +NO+.
> +  By default, the value is +NO+
> +
>  With the autotools infrastructure, all the steps required to build
>  and install the packages are already defined, and they generally work
>  well for most autotools-based packages. However, when required, it is
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 45de99356f..4f0f93d71c 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -103,6 +103,14 @@ define AUTORECONF_HOOK
>  	$(Q)cd $($(PKG)_SRCDIR) && $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
>  endef
>  
> +#
> +# Hook to call autogen.sh if needed
> +#
> +define AUTOGEN_HOOK
> +	@$(call MESSAGE,"Running autogen.sh")
> +	$(Q)cd $($(PKG)_SRCDIR) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +
>  ################################################################################
>  # inner-autotools-package -- defines how the configuration, compilation and
>  # installation of an autotools package should be done, implements a
> @@ -144,6 +152,14 @@ ifndef $(2)_AUTORECONF
>   endif
>  endif
>  
> +ifndef $(2)_AUTOGEN
> + ifdef $(3)_AUTOGEN
> +  $(2)_AUTOGEN = $$($(3)_AUTOGEN)
> + else
> +  $(2)_AUTOGEN ?= NO
> + endif
> +endif
> +
>  ifndef $(2)_GETTEXTIZE
>   ifdef $(3)_GETTEXTIZE
>    $(2)_GETTEXTIZE = $$($(3)_GETTEXTIZE)
> @@ -241,6 +257,10 @@ endif
>  
>  $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
>  
> +ifeq ($$($(2)_AUTOGEN),YES)
> +$(2)_PRE_CONFIGURE_HOOKS += AUTOGEN_HOOK
> +endif
> +
>  ifeq ($$($(2)_AUTORECONF),YES)
>  
>  # This has to come before autoreconf
> -- 
> 2.14.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
