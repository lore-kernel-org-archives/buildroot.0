From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 14:14:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/hwloc: add optional
 dependencies to udev, libxml2, ncurses & numactl
In-Reply-To: <20210523094346.118963-1-bernd.kuhls@t-online.de>
References: <20210523094346.118963-1-bernd.kuhls@t-online.de>
Message-ID: <20210523121432.GU3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-05-23 11:43 +0200, Bernd Kuhls spake thusly:
> udev:
> https://github.com/open-mpi/hwloc/blob/master/config/hwloc.m4#L626
> 
> libxml2:
> https://github.com/open-mpi/hwloc/blob/master/config/hwloc.m4#L1273
> 
> ncurses:
> https://github.com/open-mpi/hwloc/blob/master/config/hwloc_internal.m4#L340
> 
> numactl:
> https://github.com/open-mpi/hwloc/blob/master/config/hwloc_internal.m4#L419
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/hwloc/hwloc.mk | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
> index 77a25a1775..8a08ab89c8 100644
> --- a/package/hwloc/hwloc.mk
> +++ b/package/hwloc/hwloc.mk
> @@ -27,6 +27,13 @@ HWLOC_CONF_OPTS = \
>  	--disable-libxml2 \

You forgot to drop this ^^^ ...

>  	--disable-doxygen
>  
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +HWLOC_CONF_OPTS += --enable-libudev
> +HWLOC_DEPENDENCIES += udev
> +else
> +HWLOC_CONF_OPTS += --disable-libudev
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBPCIACCESS),y)
>  HWLOC_CONF_OPTS += --enable-pci
>  HWLOC_DEPENDENCIES += libpciaccess
> @@ -34,4 +41,19 @@ else
>  HWLOC_CONF_OPTS += --disable-pci
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBXML2),y)
> +HWLOC_CONF_OPTS += --enable-libxml2
> +HWLOC_DEPENDENCIES += libxml2
> +else
> +HWLOC_CONF_OPTS += --disable-libxml2
> +endif

... now that it is an optional dependency.

Since this fixes dependencies: applied to master with the above fixed,
thanks.

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_PACKAGE_NCURSES),y)
> +HWLOC_DEPENDENCIES += ncurses
> +endif
> +
> +ifeq ($(BR2_PACKAGE_NUMACTL),y)
> +HWLOC_DEPENDENCIES += numactl
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.29.2
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
