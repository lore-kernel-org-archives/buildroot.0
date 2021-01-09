From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2021 22:40:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/apcupsd: fix reverse dependency
 for libusb
In-Reply-To: <20210109133708.1832131-1-bernd.kuhls@t-online.de>
References: <20210109133708.1832131-1-bernd.kuhls@t-online.de>
Message-ID: <20210109214008.GD3044608@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-01-09 14:37 +0100, Bernd Kuhls spake thusly:
> Commit
> https://git.buildroot.net/buildroot/commit/?id=8a26801c9fad1c7749200e22e9dfdeaeeb65f76e
> added a dependency to gcc >= 4.9 for libusb but forgot to propagate
> the reverse dependency to BR2_PACKAGE_APCUPSD_USB.

Yup, it only propagated to BR2_PACKAGE_APCUPSD_MODBUS_USB and missed
BR2_PACKAGE_APCUPSD_USB.

> Fixes:
> http://autobuild.buildroot.net/results/f34/f348fe8e5530970a14589ca878810a3bdaf98f67/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/apcupsd/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/apcupsd/Config.in b/package/apcupsd/Config.in
> index f87f6a8b55..2a00d43d67 100644
> --- a/package/apcupsd/Config.in
> +++ b/package/apcupsd/Config.in
> @@ -57,13 +57,15 @@ config BR2_PACKAGE_APCUPSD_SNMP
>  config BR2_PACKAGE_APCUPSD_USB
>  	bool "usb"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
>  	select BR2_PACKAGE_LIBUSB
>  	select BR2_PACKAGE_LIBUSB_COMPAT
>  	help
>  	  Compile USB UPS code
>  
> -comment "usb support needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +comment "usb support needs a toolchain w/ threads, gcc >= 4.9"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  
>  endif
>  
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
