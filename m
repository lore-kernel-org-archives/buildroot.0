From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Apr 2017 16:57:05 +0200
Subject: [Buildroot] [PATCHv2] mpir: fix build failure
In-Reply-To: <1492440040-1709-1-git-send-email-semenak94@mail.ru>
References: <1492440040-1709-1-git-send-email-semenak94@mail.ru>
Message-ID: <20170417145705.GC3441@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Semyon, All,

On 2017-04-17 17:40 +0300, Semyon Kolganov spake thusly:
> Signed-off-by: Semyon Kolganov <semenak94@mail.ru>

I forgot to state in my previous review, but: is this fixing autobuilder
failiures? If so, please include (a few) references to those failures,
like (assuming those are the failures you wanted to fix!):

    Fixes:
        http://autobuild.buildroot.org/results/df7/df7e532686303e8f975aefc82dafb9ee66c529c8/
        http://autobuild.buildroot.org/results/a9a/a9a1f0a23f8983410cf641d869ad0dcd543da677/
        [...]

I guess the committer can add this when applying; no need to respin.

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes between v1 and v2:
>  - removed unneeded depend on
>  - fixed build for powerpc
> ---
>  package/mpir/mpir.mk | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
> index 430d587..2a5807b 100644
> --- a/package/mpir/mpir.mk
> +++ b/package/mpir/mpir.mk
> @@ -12,4 +12,17 @@ MPIR_LICENSE_FILES = COPYING.LIB
>  MPIR_INSTALL_STAGING = YES
>  MPIR_DEPENDENCIES = gmp host-yasm
>  
> +ifeq ($(BR2_MIPS_NABI32),y)
> +MPIR_CONF_OPTS += ABI=n32
> +endif
> +
> +ifeq ($(BR2_MIPS_NABI64),y)
> +MPIR_CONF_OPTS += ABI=n64
> +endif
> +
> +ifeq ($(BR2_powerpc_CLASSIC),y)
> +MPIR_CONF_OPTS += ABI=mode64
> +export MPN_PATH=generic
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.7.4
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
