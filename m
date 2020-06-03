From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Jun 2020 23:14:06 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/bcm2835: add cap_sys_rawio
 capability support
In-Reply-To: <20200603103849.20415-3-ps.report@gmx.net>
References: <20200603103849.20415-1-ps.report@gmx.net>
 <20200603103849.20415-3-ps.report@gmx.net>
Message-ID: <20200603211406.GF13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-06-03 12:38 +0200, Peter Seiderer spake thusly:
> Add cap_sys_rawio capability support in case libcap is available.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - split of from original patch and fixed for
>     BCM2835_HAVE_LIBCAP/BCM2835_HAVE_LIBCAP2 typo
> ---
>  package/bcm2835/bcm2835.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
> index 2ef6d94b38..1cabd72e5d 100644
> --- a/package/bcm2835/bcm2835.mk
> +++ b/package/bcm2835/bcm2835.mk
> @@ -13,4 +13,10 @@ BCM2835_INSTALL_STAGING = YES
>  # disable doxygen doc generation
>  BCM2835_CONF_ENV = ac_cv_prog_DOXYGEN=/bin/true
>  
> +ifeq ($(BR2_PACKAGE_LIBCAP),y)
> +BCM2835_DEPENDENCIES = libcap
> +# workaround typo in src/bcm2835.c and use both defines
> +BCM2835_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DBCM2835_HAVE_LIBCAP -DBCM2835_HAVE_LIBCAP2"

As reported by Thomas, this is just a stupid bug in the code. It should
be fixed by sending upstream a patch.

(note: this is hilarious... not.)

Regards,
Yann E. MORIN.

> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.26.2
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
