From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Jan 2014 19:50:14 +0100
Subject: [Buildroot] [PATCH v2] Add gpm (general purpose mouse) server
 package
In-Reply-To: <1390927293-7310-1-git-send-email-julien.boibessot@free.fr>
References: <1390927293-7310-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20140128185013.GD3466@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2014-01-28 17:41 +0100, julien.boibessot at free.fr spake thusly:
> From: Julien Boibessot <julien.boibessot@armadeus.com>
> 
> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
[--SNIP--]
> diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
> new file mode 100644
> index 0000000..2b81e4b
> --- /dev/null
> +++ b/package/gpm/gpm.mk
> @@ -0,0 +1,50 @@
> +###############################################################################
> +#
> +# gpm
> +#
> +###############################################################################
> +
> +GPM_VERSION = 1.20.7
> +GPM_SOURCE = gpm-$(GPM_VERSION).tar.bz2
> +GPM_SITE = http://www.nico.schottelius.org/software/gpm/archives/
> +GPM_LICENSE = GPLv2+
> +GPM_LICENSE_FILES = COPYING
> +GPM_INSTALL_STAGING = YES
> +
> +# if not already installed in staging dir, gpm Makefile may fail to find some
> +# of the headers needed to generate build dependancies, the first time it is

-> dependencies

> +# built. CPPFLAGS is used to pass the right include PATH to dependancy rules.

-> lower-case 'path' (it's not about the PATH environment variable).
-> dependency

> +GPM_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -I$(@D)/src/headers/"
> +
> +# gpm and ncurses have a circular dependancy. As gpm function GPM_Wgetch() 

-> dependency

Yes. I have been beaten by this in the past. Sigh... :-/

> +# (requiring ncurses) is not recommanded for use by ncurses people themself and

-> recommended
-> themselves

> +# as it's better to have gpm support in ncurses that the contrary, we force gpm
> +# to not look after ncurses explicitly.
> +# http://invisible-island.net/ncurses/ncurses.faq.html#using_gpm_lib

Oh, good to know! :-)

> +GPM_CONF_OPT = --without-curses
> +
> +# To generate missing configure:
> +define GPM_AUTOGEN_CALL
> +	cd $(@D); ./autogen.sh
> +endef
> +GPM_PRE_CONFIGURE_HOOKS += GPM_AUTOGEN_CALL

I'd prefer we only generate the configure.ac file, and call our
autoreconf:

    GPM_VERSION = 1.20.7
    GPM_SOURCE = gpm-$(GPM_VERSION).tar.bz2
    GPM_HOME = http://www.nico.schottelius.org/software/gpm/
    GPM_SITE = $(GPM_HOME)/archives
    define GPM_GENERATE_CONFIGURE_AC
    	(printf "AC_INIT([gpm],[%s],[%s])\n" "$(GPM_VERSION)" "$(GPM_HOME)";  \
         printf "releasedate=%s\n" $(shell grep '^[[:digit:]]' $(@D)doc/changelog | head -n1 | cut -d: -f2)
         printf "release=%s\n" "$(GPM_VERSION)"
         cat $(@D)/configure.ac.footer
        ) >$(@D)/configure.ac
    endef
    GPM_POST_PATCH_HOOKS += GPM_GENERATE_CONFIGURE_AC
    GPM_AUTORECONF = YES

> +
> +define GPM_REMOVE_TEST_TOOLS_FROM_TARGET
> +	for tools in mev hltest mouse-test display-buttons \
> +			get-versions display-coords; do \
> +		rm -f $(TARGET_DIR)/usr/bin/$$tools ; \
> +	done
> +endef

We usually piut the function definition in the corresponding ifeq-block,
the one below for gpm:

> +ifeq ($(BR2_PACKAGE_GPM_INSTALL_TEST_TOOLS),)
> +GPM_POST_INSTALL_TARGET_HOOKS += GPM_REMOVE_TEST_TOOLS_FROM_TARGET
> +endif

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
