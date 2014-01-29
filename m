From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Jan 2014 19:39:22 +0100
Subject: [Buildroot] [PATCH v4] Add gpm (general purpose mouse) server
 package
In-Reply-To: <1391019659-3784-1-git-send-email-julien.boibessot@free.fr>
References: <1391019659-3784-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20140129183922.GA3397@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2014-01-29 19:20 +0100, julien.boibessot at free.fr spake thusly:
> From: Julien Boibessot <julien.boibessot@armadeus.com>
> diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
> new file mode 100644
> index 0000000..01b30d4
> --- /dev/null
> +++ b/package/gpm/gpm.mk
> @@ -0,0 +1,52 @@
[--SNIP--]
> +# configure is missing but gpm seems not compatible with our autoreconf
> +# mechanism so we have to do it manually instead of using GPM_AUTORECONF = YES
> +define GPM_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
> +endef
> +
> +GPM_POST_PATCH_HOOKS += GPM_RUN_AUTOGEN
> +GPM_DEPENDENCIES += host-automake host-autoconf host-libtool

Nitpick: I prefer we "coalesce" the *_HOOKS lines directly below the
define, and add an empty line _fater_ the *_HOOKS (not before liek you
did), like:

    define GPM_RUN_AUTOGEN
        cd $(@D) && PATH=$(HOST_PATH) ./autogen.sh
    endef
    GPM_POST_PATCH_HOOKS += GPM_RUN_AUTOGEN

    GPM_DEPENDENCIES += host-automake host-autoconf host-libtool

It looks more natural to me, otherwise one has to train his eyes to spot
the _HOOKS line.

Besides, in your case, the _HOOKS line is directly tied to another
assignment, which makes it look like they belong to the same 'semantic'
block, so the brain (mine, at least!) automatically skips over it,
desparately looking for the _HOOKS line later in the file... Yes, I'm a
bizare guy, but yet... ;-)

> +ifeq ($(BR2_PACKAGE_GPM_INSTALL_TEST_TOOLS),)
> +define GPM_REMOVE_TEST_TOOLS_FROM_TARGET
> +	for tools in mev hltest mouse-test display-buttons \
> +			get-versions display-coords; do \
> +		rm -f $(TARGET_DIR)/usr/bin/$$tools ; \
> +	done
> +endef
> +

Ditto, remove this empty line

> +GPM_POST_INSTALL_TARGET_HOOKS += GPM_REMOVE_TEST_TOOLS_FROM_TARGET
> +endif
> +
> +define GPM_INSTALL_GPM_ROOT_CONF_ON_TARGET
> +	$(INSTALL) -m 0644 -D $(@D)/conf/gpm-root.conf $(TARGET_DIR)/etc/
> +endef
> +

Ditto again.

> +GPM_POST_INSTALL_TARGET_HOOKS += GPM_INSTALL_GPM_ROOT_CONF_ON_TARGET
> +
> +$(eval $(autotools-package))

Anyway, if Peter likes it that way, I won't object much! ;-)
So:
    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
