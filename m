From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 11:56:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/avrdude: fix build with kernel
 < 4.6
In-Reply-To: <20210314094641.166444-1-fontaine.fabrice@gmail.com>
References: <20210314094641.166444-1-fontaine.fabrice@gmail.com>
Message-ID: <20210314105627.GP2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-14 10:46 +0100, Fabrice Fontaine spake thusly:
> Disable linuxspi with kernel < 4.6 as linux/gpio.h is only available
> since
> https://github.com/torvalds/linux/commit/3c702e9987e261042a07e43460a8148be254412e
> 
> This build failure is raised since switch to upstream in commit
> 03fa36df7e6aca0f4a1c8ae2fe691c0cda6ddc7a
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/962a7fcff1e54a0550eafa0cbca780ba8bc8409e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/avrdude/avrdude.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
> index b6754684e1..e086fd1d97 100644
> --- a/package/avrdude/avrdude.mk
> +++ b/package/avrdude/avrdude.mk
> @@ -13,10 +13,16 @@ AVRDUDE_SUBDIR = avrdude
>  # Sources coming from svn, without generated configure and Makefile.in
>  # files.
>  AVRDUDE_AUTORECONF = YES
> -AVRDUDE_CONF_OPTS = --enable-linuxgpio --enable-linuxspi
> +AVRDUDE_CONF_OPTS = --enable-linuxgpio
>  AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
>  	host-flex host-bison
>  
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6),y)

The reason linuxspi was unconditionally enabled, was because it always
were when we were using the fork.

So, now that we may have to disable it, we need to tel the use that it
is not available.

So, I'va added a Kconfig option that drives wehther to enable or disable
SPI support, and a comment when it is not available.

Applied to master with that changed, thanks.

Regards,
Yann E. MORIN.

> +AVRDUDE_CONF_OPTS += --enable-linuxspi
> +else
> +AVRDUDE_CONF_OPTS += --disable-linuxspi
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
>  AVRDUDE_DEPENDENCIES += libftdi1
>  else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
> -- 
> 2.30.0
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
