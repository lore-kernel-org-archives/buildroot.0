From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Oct 2016 12:24:49 +0100
Subject: [Buildroot] [PATCH v3 8/9] lttng-babeltrace: add debug info
 support
In-Reply-To: <20161031074624.7576-9-eeppeliteloop@gmail.com>
References: <20161031074624.7576-1-eeppeliteloop@gmail.com>
 <20161031074624.7576-9-eeppeliteloop@gmail.com>
Message-ID: <20161031112449.GI3389@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe, All,

On 2016-10-31 03:46 -0400, Philippe Proulx spake thusly:
> Since Babeltrace 1.4, there is support for printing debug information
> along with compatible traces and event records. Babeltrace needs
> elfutils in this case. If elfutils can be built with the current
> configuration, the lttng-babeltrace package selects it and builds
> with support for debug information. Otherwise the menuconfig shows
> a comment which explains why debug information support cannot be
> built.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But then you do not enable debug info for the host variant. That's
because elfutils does not have a host variant. I'll send a patch
shortly.

Regards,
Yann E. MORIN.

> ---
> This is a new patch in v3.
> 
>  package/lttng-babeltrace/Config.in           | 17 +++++++++++++++++
>  package/lttng-babeltrace/lttng-babeltrace.mk |  7 +++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
> index 95b635d..55e2143 100644
> --- a/package/lttng-babeltrace/Config.in
> +++ b/package/lttng-babeltrace/Config.in
> @@ -27,6 +27,23 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
> 
>  	  http://diamon.org/babeltrace
> 
> +if BR2_PACKAGE_LTTNG_BABELTRACE
> +
> +config BR2_PACKAGE_LTTNG_BABELTRACE_DEBUG_INFO
> +	bool
> +	default y
> +	depends on !BR2_bfin # elfutils
> +	depends on !BR2_STATIC_LIBS # elfutils
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
> +	select BR2_PACKAGE_ELFUTILS
> +
> +comment "handling debug info in traces needs a glibc or uClibc toolchain w/ dynamic library"
> +	depends on !BR2_bfin # elfutils
> +	depends on BR2_STATIC_LIBS \
> +		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
> +
> +endif
> +
>  comment "lttng-babeltrace needs a toolchain w/ wchar, threads"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
> index 30c5f6e..260a8ee 100644
> --- a/package/lttng-babeltrace/lttng-babeltrace.mk
> +++ b/package/lttng-babeltrace/lttng-babeltrace.mk
> @@ -18,5 +18,12 @@ HOST_LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
>  # For 0001-configure.ac-remove-elfutils-version-test-for-Buildr.patch
>  LTTNG_BABELTRACE_AUTORECONF = YES
> 
> +ifeq ($(BR2_PACKAGE_LTTNG_BABELTRACE_DEBUG_INFO),y)
> +LTTNG_BABELTRACE_DEPENDENCIES += elfutils
> +LTTNG_BABELTRACE_CONF_OPTS += --enable-debug-info
> +else
> +LTTNG_BABELTRACE_CONF_OPTS += --disable-debug-info
> +endif
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> --
> 2.9.3
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
