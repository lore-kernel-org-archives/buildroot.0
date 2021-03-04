From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Mar 2021 20:13:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/libminiupnpc: add CPE variables
In-Reply-To: <20210304113039.1235899-1-fontaine.fabrice@gmail.com>
References: <20210304113039.1235899-1-fontaine.fabrice@gmail.com>
Message-ID: <20210304191340.GN2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-04 12:30 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:miniupnp_project:miniupnpc is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aminiupnp_project%3Aminiupnpc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libminiupnpc/libminiupnpc.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
> index 50b3c6604c..d22b873428 100644
> --- a/package/libminiupnpc/libminiupnpc.mk
> +++ b/package/libminiupnpc/libminiupnpc.mk
> @@ -4,11 +4,15 @@
>  #
>  ################################################################################
>  
> -LIBMINIUPNPC_VERSION = 2.1.20201016
> +LIBMINIUPNPC_VERSION = $(LIBMINIUPNPC_CPE_ID_VERSION).$(LIBMINIUPNPC_CPE_ID_UPDATE)
>  LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
>  LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
>  LIBMINIUPNPC_INSTALL_STAGING = YES
>  LIBMINIUPNPC_LICENSE = BSD-3-Clause
>  LIBMINIUPNPC_LICENSE_FILES = LICENSE
> +LIBMINIUPNPC_CPE_ID_VENDOR = miniupnp_project
> +LIBMINIUPNPC_CPE_ID_PRODUCT = miniupnpc
> +LIBMINIUPNPC_CPE_ID_VERSION = 2.1
> +LIBMINIUPNPC_CPE_ID_UPDATE = 20201016

I thoght it would be more logicial to split _VERSION into its base
constituents, the traditional major/minor, and use that to define the
CPE variables, not the other way around:

    LIBMINIUPNPC_VERSION_MAJOR = 2.1
    LIBMINIUPNPC_VERSION_MINOR = 20201016
    LIBMINIUPNPC_VERSION = $(LIBMINIUPNPC_VERSION_MAJOR).$(LIBMINIUPNPC_VERSION_MINOR)
    LIBMINIUPNPC_CPE_ID_VERSION = $(LIBMINIUPNPC_VERSION_MAJOR)
    LIBMINIUPNPC_CPE_ID_UPDATE = $(LIBMINIUPNPC_VERSION_MINOR)

So I've done that and applied to master, thanks.

Note: I also applied all your other pending CPE-related patches too. As
usual, too any to individually reply to (and I am way lazier than Peter.
;-) )

Regards,
Yann E. MORIN.

>  
>  $(eval $(cmake-package))
> -- 
> 2.30.0
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
