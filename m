From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2021 21:51:17 +0100
Subject: [Buildroot] [PATCH 6/6] package/mrouted: menuconfig support for
 enabling rsrr support
In-Reply-To: <20210123103155.2599311-7-troglobit@gmail.com>
References: <20210123103155.2599311-1-troglobit@gmail.com>
 <20210123103155.2599311-7-troglobit@gmail.com>
Message-ID: <20210123205117.GC926565@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-01-23 11:31 +0100, Joachim Wiberg spake thusly:
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/mrouted/Config.in  | 12 ++++++++++++
>  package/mrouted/mrouted.mk |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
> index 95b4fb3825..30d32a4310 100644
> --- a/package/mrouted/Config.in
> +++ b/package/mrouted/Config.in
> @@ -11,3 +11,15 @@ config BR2_PACKAGE_MROUTED
>  	  Note: at least two interfaces with MULTICAST flag is requried.
>  
>  	  http://github.com/troglobit/mrouted
> +
> +if BR2_PACKAGE_MROUTED
> +
> +config BR2_PACKAGE_MROUTED_RSRR
> +	bool "enable RSRR for RSVP"
> +	help
> +	  Routing Support for Resource Reservation, currently used by RSVP.
> +	  This is an EXPERIMENTAL feature.
> +
> +	  For details, see http://tools.ietf.org/html/draft-ietf-rsvp-routing-02

I've fixed some minor coding style issue:

    $ make check-pacakge
    [...]
    package/mrouted/Config.in:20: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/mrouted/Config.in:23: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    [...]

> +endif
> diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
> index 558efa946e..74e4a0e97e 100644
> --- a/package/mrouted/mrouted.mk
> +++ b/package/mrouted/mrouted.mk
> @@ -11,7 +11,7 @@ MROUTED_DEPENDENCIES = host-bison
>  MROUTED_LICENSE = BSD-3-Clause
>  MROUTED_LICENSE_FILES = LICENSE
>  MROUTED_CONF_OPTS = --prefix=/usr --sysconfdir=/etc --localstatedir=/var
> -MROUTED_CONF_OPTS += --enable-rsrr
> +MROUTED_CONF_OPTS += $(if $(BR2_PACKAGE_MROUTED_RSRR),--enable-rsrr,--disable-rsrr)

I've switched to using the more traditional ifeq-else-endif block.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  MROUTED_CPE_ID_VENDOR = troglobit
>  
>  define MROUTED_INSTALL_INIT_SYSV
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
