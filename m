From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 14:00:04 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/xmrig: new package
In-Reply-To: <20210523103047.595306-1-bernd.kuhls@t-online.de>
References: <20210523103047.595306-1-bernd.kuhls@t-online.de>
Message-ID: <20210524120004.GP3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-05-23 12:30 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
[--SNIP--]
> diff --git a/package/xmrig/Config.in b/package/xmrig/Config.in
> new file mode 100644
> index 0000000000..3007201610
> --- /dev/null
> +++ b/package/xmrig/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_XMRIG
> +	bool "xmrig"
> +	# archs officially supported by upstream
> +	depends on BR2_aarch64 || BR2_x86_64 || BR2_i386
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
> +	depends on BR2_USE_MMU # libuv

MMU is an architecture dependency, it moust come before toolchain
dependencies.

> +	depends on !BR2_STATIC_LIBS # libuv
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
> +	# xmrig needs fenv.h which is not provided by uclibc
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC
> +	select BR2_PACKAGE_LIBUV
> +	help
> +	  RandomX, CryptoNight, AstroBWT and Argon2 CPU/GPU miner.
> +
> +	  https://xmrig.com
> +
> +comment "xmrig needs a glibc or musl toolchain w/ NPTL, dynamic library"
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
> +	depends on BR2_aarch64 || BR2_x86_64 || BR2_i386
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4

Keep the same ordering in the comment depndencies as in the main option
dependencies.

[--SNIP--]
> diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
> new file mode 100644
> index 0000000000..aa36fcdf57
> --- /dev/null
> +++ b/package/xmrig/xmrig.mk
> @@ -0,0 +1,40 @@
[--SNIP--]
> +define XMRIG_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/xmrig$(if $(BR2_PACKAGE_OPENSSL),,-notls) \
> +		$(TARGET_DIR)/usr/bin/xmrig$(if $(BR2_PACKAGE_OPENSSL),,-notls)
> +endef

Why can't we use the default install commands?

Regards,
Yann E. MORIN.

> +
> +$(eval $(cmake-package))
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
