From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Nov 2019 22:24:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/libftdi1: fix license
In-Reply-To: <20191124180157.32084-1-fontaine.fabrice@gmail.com>
References: <20191124180157.32084-1-fontaine.fabrice@gmail.com>
Message-ID: <20191124212454.GK32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-11-24 19:01 +0100, Fabrice Fontaine spake thusly:
> The GPL only applies to the C++ bindings, which are conditionally
> enabled with BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1.
> 
> The COPYING.LIB is indeed the LGPL-2.0, but the source file for
> libftdi1 states LGPL-2.1-only, see src/ftdi.c
> 
> The src/ftdi_stream.c also bears a notice of the MIT license, so the
> library itself is under both LGPL-2.1-only and MIT.

Oh... This is libftdi1... I was mislead when looking at the libftdi git
tree: it is the same tree for 0.x and 1.x, and the MIT-licensed file is
only present on the 1.x branch, not the legacy 0.x branch... Damn...

I'll push a fix to remove the MIT license from libftdi (not libftdi1, me
stupid).

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libftdi1/libftdi1.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
> index 014dd8401e..cce04ee5ca 100644
> --- a/package/libftdi1/libftdi1.mk
> +++ b/package/libftdi1/libftdi1.mk
> @@ -9,14 +9,16 @@ LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
>  LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download
>  LIBFTDI1_INSTALL_STAGING = YES
>  LIBFTDI1_DEPENDENCIES = libusb
> -LIBFTDI1_LICENSE = LGPL-2.0 (libftdi1), GPL-2.0 with exception (ftdipp1)

The GPL-2.0 also applies to the eeprom utility, see ftdi_eeprom/main.c

I've added it, and pushed to master. Thanks!

Regards,
Yann E. MORIN.

> -LIBFTDI1_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LIB
> +LIBFTDI1_LICENSE = LGPL-2.1 (libftdi1), MIT (libftdi1)
> +LIBFTDI1_LICENSE_FILES = LICENSE COPYING.LIB
>  LIBFTDI1_CONFIG_SCRIPTS = libftdi1-config
>  LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF
>  
>  ifeq ($(BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1),y)
>  LIBFTDI1_DEPENDENCIES += boost
>  LIBFTDI1_CONF_OPTS += -DFTDIPP=ON
> +LIBFTDI1_LICENSE += , GPL-2.0 with exception (ftdipp1)
> +LIBFTDI1_LICENSE_FILES += COPYING.GPL
>  else
>  LIBFTDI1_CONF_OPTS += -DFTDIPP=OFF
>  endif
> -- 
> 2.24.0
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
