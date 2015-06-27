From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Jun 2015 12:39:32 +0200
Subject: [Buildroot] [PATCH 3/4] toolchain: introduce
 BR2_TOOLCHAIN_HAS_RESOLVER
In-Reply-To: <1435340002-20396-4-git-send-email-guido@vanguardiasur.com.ar>
References: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
 <1435340002-20396-4-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150627103932.GD3565@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guido, All,

On 2015-06-26 14:33 -0300, Guido Mart?nez spake thusly:
> Add a Kconfig option specifying if the toolchain supports name resolving
> (or at least has stubs for it) so we can disable packages that depend on
> that (or they would fail to link). For now, only disable the 'nslookup'
> tool from BusyBox if there's no resolver support.
> 
> For now, every toolchain supports name resolving.

I'm a bit skeptical about this change.

Let's see:
  - adds a new 'select' for all existing external pre-configured
    toolchains;

  - misses the cases for internal toolchain and exterdnal custom
    toolchains;

  - disables nslookup in busybox when resolver is mising;

  - misses the fixing the bind package which can install nslookup, too.

So, I find this is a bit of noise for a relatively infrequent setup. And
you're missing quite a few cases.

I'd rather we disable nslookup from our default busybox configuration.

(Note: the bind case is not a problem for you, because it already
depends on MMU which Cortex-M3 do not have, so bind is inherently
protected from such limited toolchains.)

> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  package/busybox/busybox.mk             |  3 +++
>  toolchain/Config.in                    |  3 +++
>  toolchain/toolchain-external/Config.in | 29 +++++++++++++++++++++++++++++
>  3 files changed, 35 insertions(+)
> 
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 090e174..f4e086e 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -156,6 +156,9 @@ endif
>  # full-blown versions of apps installed by other packages with sym/hard links.
>  define BUSYBOX_NOCLOBBER_INSTALL
>  	$(SED) 's/^noclobber="0"$$/noclobber="1"/' $(@D)/applets/install.sh
> +	$(if $(BR2_TOOLCHAIN_HAS_RESOLVER),,
> +		$(call KCONFIG_DISABLE_OPT,CONFIG_NSLOOKUP,$(@D)/.config)
> +	)

This hunk should go into its own macro, and used in
BUSYBOX_KCONFIG_FIXUP_CMDS, below, like so:

    ifeq ($(BR2_TOOLCHAIN_HAS_RESOLVER),)
    define BUSYBOX_UNSET_NSLOOKUP
        $(call KCONFIG_DISABLE_OPT,CONFIG_NSLOOKUP,$(@D)/.config)
    endef
    endif

    define BUSYBOX_KCONFIG_FIXUP_CMDS
        [existing calls]
        $(BUSYBOX_UNSET_NSLOOKUP)
    endef

But I'd really prefer we just ditch nslookup from our default busybox
configuration, to avoid all this noise.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
