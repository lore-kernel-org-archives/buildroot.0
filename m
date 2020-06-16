From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 16 Jun 2020 06:54:04 +0300
Subject: [Buildroot] [PATCH] package/ttyd: new package
In-Reply-To: <20200615183103.476615-1-b.bilas@grinn-global.com>
References: <20200615183103.476615-1-b.bilas@grinn-global.com>
Message-ID: <87y2onmzs3.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bartosz,

On Mon, Jun 15 2020, Bartosz Bilas wrote:
> ttyd is a simple command-line tool for sharing
> terminal over the web.
>
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---

[snip]

> diff --git a/package/ttyd/Config.in b/package/ttyd/Config.in
> new file mode 100644
> index 0000000000..83f27d9282
> --- /dev/null
> +++ b/package/ttyd/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_TTYD
> +	bool "ttyd"
> +	depends on !BR2_STATIC_LIBS # libuv
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
> +	depends on BR2_USE_MMU # libuv
> +	select BR2_PACKAGE_JSON_C
> +	select BR2_PACKAGE_LIBUV
> +	select BR2_PACKAGE_LIBWEBSOCKETS
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  ttyd is a simple command-line tool for sharing terminal
> +	  over the web.
> +
> +	  https://github.com/tsl0922/ttyd
> +
> +comment "ttyd needs a toolchain w/ NPTL, dynamic library"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
> +		|| BR2_USE_MMU || BR2_TOOLCHAIN_HAS_SYNC_4

This makes the comment always appear when BR2_USE_MMU is enabled, even
when ttyd is selectable. There should be a separate 'depends on
BR2_USE_MMU' to hide the comment when BR2_USE_MMU is not enabled.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
