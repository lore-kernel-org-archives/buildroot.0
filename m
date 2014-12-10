From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Dec 2014 18:33:47 +0100
Subject: [Buildroot] [PATCH 1/1] util-linux: add an option to build host
 programs
In-Reply-To: <1418157998-3183-1-git-send-email-tbultel@free.fr>
References: <1418157998-3183-1-git-send-email-tbultel@free.fr>
Message-ID: <20141210173347.GA3926@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thierry, All,

On 2014-12-09 21:46 +0100, Thierry Bultel spake thusly:
> Signed-off-by: Thierry Bultel <tbultel@free.fr>

Thanks for this patch. We discussed it yesterday evening during the
Patchwork cleanup session, and we have a few comments about your patch,
see below...

> ---
>  package/util-linux/Config.in     |  5 +++++
>  package/util-linux/util-linux.mk | 12 ++++++++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index 07e1fbb..f913fef 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -12,6 +12,11 @@ config BR2_PACKAGE_UTIL_LINUX
>  
>  if BR2_PACKAGE_UTIL_LINUX
>  
> +config BR2_PACKAGE_UTIL_LINUX_HOST_PROGRAMS
> +	bool "all programs on host"
> +	help
> +	   Install all programs on the host

We already have an entry for that in the "Host utilities" sub-menu, for
which you can see the config option in:

    package/util-linux/Config.in.host

    config BR2_PACKAGE_HOST_UTIL_LINUX
        bool "host util-linux"
        [...]

The conclusion of the Patchwork cleanup session was:

  - packages needing the host util-linux libuuid should build-depend on
    host-util-linux via FOO_DEPENDENCIES;

  - packages that need the host util-linux programs (none so far),
    should kconfig-depend on BR2_PACKAGE_HOST_UTIL_LINUX with a "select"
    directive;

  - users who explicitly need host util-linux (libs or programs) should
    enable it in the Host utilities" sub-menu.

So, instead of adding a new config option, just use the existing one.

>  config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>  	depends on BR2_USE_MMU # fork
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index dc10193..8a91636 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -91,11 +91,19 @@ UTIL_LINUX_CONF_OPTS += \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write)
>  
>  # In the host version of util-linux, we so far only require libuuid,
> -# and none of the util-linux utilities, so we disable all of them.
> +# and none of the util-linux utilities, so we disable all of them, unless
> +# BR2_PACKAGE_UTIL_LINUX_HOST_PROGRAMS is set
> +
>  HOST_UTIL_LINUX_CONF_OPTS += \
>  	--enable-libuuid \
>  	--disable-libblkid --disable-libmount \
> -	--disable-all-programs --without-ncurses
> +	--without-ncurses
> +
> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_HOST_PROGRAMS),y)
> +HOST_UTIL_LINUX_CONF_OPTS += --disable-makeinstall-chown
> +else
> +HOST_UTIL_LINUX_CONF_OPTS += --disable-all-programs
> +endif

OK, but switch to using BR2_PACKAGE_HOST_UTIL_LINUX instead.

Care to resend this patch with the above addressed, please?

Thank you! :-)

Regards,
Yann E. MORIN.

>  # Avoid building the tools if they are disabled since we can't install on
>  # a per-directory basis.
> -- 
> 1.9.1
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
