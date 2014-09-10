From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Sep 2014 22:18:59 +0200
Subject: [Buildroot] [PATCH V3 2/4] avrdude: Depend on elfutils instead
 of libelf to get the libelf library
In-Reply-To: <1409228494-19492-3-git-send-email-gregory.clement@free-electrons.com>
References: <1409228494-19492-1-git-send-email-gregory.clement@free-electrons.com>
 <1409228494-19492-3-git-send-email-gregory.clement@free-electrons.com>
Message-ID: <20140910201859.GG23947@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gregory, All,

On 2014-08-28 14:21 +0200, Gregory CLEMENT spake thusly:
> The elfutils package provides a more recent version of the libelf, so
> let's use it. It will allow to remove the libelf package and to avoid
> conflicts with two packages providing the same library.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/avrdude/Config.in  | 6 +++++-
>  package/avrdude/avrdude.mk | 2 +-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/avrdude/Config.in b/package/avrdude/Config.in
> index 8eac014..9a9b3fb 100644
> --- a/package/avrdude/Config.in
> +++ b/package/avrdude/Config.in
> @@ -1,10 +1,14 @@
>  config BR2_PACKAGE_AVRDUDE
>  	bool "avrdude"
> -	select BR2_PACKAGE_LIBELF
> +	select BR2_PACKAGE_ELFUTILS
>  	select BR2_PACKAGE_LIBUSB
>  	select BR2_PACKAGE_LIBUSB_COMPAT
>  	select BR2_PACKAGE_NCURSES
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_LARGEFILE # elfutils
> +	depends on BR2_USE_WCHAR # elfutils
> +	depends on !BR2_avr32 # elfutils

At first, I was very surprised that an AVR-related package would be
unavaivlable for avr32. But that's not incoherent, in fact: this can be
used on the target to program an AVR (not avr32!) device.

That it does not work on avr32 is a pity, though... :-(

Anyway, acked.

Regards,
Yann E. MORIN.

> +	depends on !BR2_bfin # elfutils
>  	help
>  	  avrdude is a programmer for Atmel AVR microcontrollers
>  	  this package provides a version with new linuxspi driver
> diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
> index 7876c1d..03d6490 100644
> --- a/package/avrdude/avrdude.mk
> +++ b/package/avrdude/avrdude.mk
> @@ -12,7 +12,7 @@ AVRDUDE_SUBDIR = avrdude
>  # Sources coming from git, without generated configure and Makefile.in
>  # files.
>  AVRDUDE_AUTORECONF = YES
> -AVRDUDE_DEPENDENCIES = libelf libusb libusb-compat ncurses \
> +AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
>  	host-flex host-bison
>  AVRDUDE_LICENSE = GPLv2+
>  AVRDUDE_LICENSE_FILES = avrdude/COPYING
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
