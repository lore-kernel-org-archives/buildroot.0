From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Aug 2015 21:16:23 +0200
Subject: [Buildroot] [PATCH v1 1/2] pkg-utils: Define KCONFIG_ASSERT_OPT
 macro
In-Reply-To: <1439990076-10412-2-git-send-email-viktorin@rehivetech.com>
References: <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
 <1439990076-10412-2-git-send-email-viktorin@rehivetech.com>
Message-ID: <20150819191623.GB13372@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan, All,

On 2015-08-19 15:14 +0200, Jan Viktorin spake thusly:
> The macro can be used (eg. in packages) to assure that
> a certain option in the Linux/BusyBox/...'s .config is
> set to the given value.
> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  package/pkg-utils.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 44bd2c9..1e34864 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -63,6 +63,11 @@ define KCONFIG_DISABLE_OPT # (option, file)
>  	echo '# $(1) is not set' >> $(2)
>  endef
>  
> +define KCONFIG_ASSERT_OPT # (option, value, file)
> +	grep "\\<$(1)\\>=$(2)" $(3) > /dev/null \
> +		|| (echo "KCONFIG_ASSERT_OPT($(1),$(2),$(3)) has failed" >&2; exit 1)

This message is not really explicit. Also, the construct is dubious,
especially if the caller chains many calls separated with semi-colon,
like so:

    $(call KCONFIG_ASSERT_OPT,CONFIG_FOO,y,$(LINUX_DIR)/.config); \
    $(call KCONFIG_ASSERT_OPT,CONFIG_BAR,y,$(LINUX_DIR)/.config); \
    $(call KCONFIG_ASSERT_OPT,CONFIG_BUZ,y,$(LINUX_DIR)/.config)

The first two would not cause failure.

Also, this option can not check for unset options, and does not properly
quote the arguments which are passed to echo.

What about:

    define KCONFIG_ASSERT_OPT # (option, value, file)
        if ! grep -E "^$(1)=$(2)\$$" $(3) >/dev/null; then \
            printf "Error: option %s is not set to %s\n" '$(1)' '$(2)' '$(3}'; \
            exit 1; \
        fi
    endef # KCONFIG_ASSERT_OPT

That way:
  - the message is more explicit (I think),
  - it is possible to chain calls even with semi-colons,
  - arguments are properly quoted so the shell won't parse their
    content.

But no need to repsin for now, let the dust settle down for a moment. ;-)

Regards,
Yann E. MORIN.

> +endef
> +
>  # Helper functions to determine the name of a package and its
>  # directory from its makefile directory, using the $(MAKEFILE_LIST)
>  # variable provided by make. This is used by the *-package macros to
> -- 
> 2.5.0
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
