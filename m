From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 May 2015 18:44:24 +0200
Subject: [Buildroot] [PATCH 1/1] flashrom: Bump to version 0.9.8
In-Reply-To: <1431188480-20889-1-git-send-email-florent.valette@gmail.com>
References: <1431188480-20889-1-git-send-email-florent.valette@gmail.com>
Message-ID: <20150509164424.GA4023@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Florent, All,

On 2015-05-09 18:21 +0200, Florent Valette spake thusly:
> Add libusb and libftdi depedencies because new flashrom version
> support usb-spi device such as pickit2 and ftdi usb-spi.
> 
> Signed-off-by: Florent Valette <florent.valette@gmail.com>
> ---
>  package/flashrom/Config.in   | 3 +++
>  package/flashrom/flashrom.mk | 4 ++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
> index 956500f..6ceacdf 100644
> --- a/package/flashrom/Config.in
> +++ b/package/flashrom/Config.in
> @@ -1,6 +1,9 @@
>  config BR2_PACKAGE_FLASHROM
>  	bool "flashrom"
>  	select BR2_PACKAGE_PCIUTILS
> +	select BR2_PACKAGE_LIBUSB
> +	select BR2_PACKAGE_LIBUSB_COMPAT
> +	select BR2_PACKAGE_LIBFTDI

You need to propagate the dependencies for libusb and libftdi:

    depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
    depends on BR2_ARCH_HAS_ATOMICS # libftdi

Also, we now also have libftdi1. Care to check if flashrom also supports
that version?

Regards,
Yann E. MORIN.

>  	# dmidecode is only a runtime dependency
>  	select BR2_PACKAGE_DMIDECODE
>  	depends on BR2_i386 || BR2_x86_64
> diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
> index 70bbe30..525470a 100644
> --- a/package/flashrom/flashrom.mk
> +++ b/package/flashrom/flashrom.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -FLASHROM_VERSION = 0.9.7
> +FLASHROM_VERSION = 0.9.8
>  FLASHROM_SOURCE = flashrom-$(FLASHROM_VERSION).tar.bz2
>  FLASHROM_SITE = http://download.flashrom.org/releases
> -FLASHROM_DEPENDENCIES = pciutils
> +FLASHROM_DEPENDENCIES = pciutils libusb libusb-compat libftdi
>  FLASHROM_LICENSE = GPLv2+
>  FLASHROM_LICENSE_FILES = COPYING
>  
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
