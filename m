From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 16 Mar 2019 18:04:09 +0100
Subject: [Buildroot] [PATCH 2/3] package/ascii-invaders: new package
In-Reply-To: <20190223205657.18394-3-huth@tuxfamily.org>
References: <20190223205657.18394-1-huth@tuxfamily.org>
 <20190223205657.18394-3-huth@tuxfamily.org>
Message-ID: <CAKcgs2w=ZH+f1XME62D9E+d=o9Pi4vq6_WR_EvtQmoPzwHLDKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,


Le sam. 23 f?vr. 2019 ? 21:57, Thomas Huth <huth@tuxfamily.org> a ?crit :
>
> An ASCII-art game like Space Invaders using ncurses.
>
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  package/Config.in                          |  1 +
>  package/ascii-invaders/Config.in           |  5 +++++
>  package/ascii-invaders/ascii-invaders.hash |  2 ++
>  package/ascii-invaders/ascii-invaders.mk   | 23 ++++++++++++++++++++++
Please also add an entry in the DEVELOPERS file for this package.

>  4 files changed, 31 insertions(+)
>  create mode 100644 package/ascii-invaders/Config.in
>  create mode 100644 package/ascii-invaders/ascii-invaders.hash
>  create mode 100644 package/ascii-invaders/ascii-invaders.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 490cbdb216..16789fcd7c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -239,6 +239,7 @@ comment "Themes"
>  endmenu
>
>  menu "Games"
> +       source "package/ascii-invaders/Config.in"
>         source "package/chocolate-doom/Config.in"
>         source "package/doom-wad/Config.in"
>         source "package/flare-engine/Config.in"
> diff --git a/package/ascii-invaders/Config.in b/package/ascii-invaders/Config.in
> new file mode 100644
> index 0000000000..e68d48bed0
> --- /dev/null
> +++ b/package/ascii-invaders/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_ASCII_INVADERS
> +       bool "ascii_invaders"
> +       select BR2_PACKAGE_NCURSES
> +       help
> +         An ASCII-art game like Space Invaders using ncurses.
Please add the upstream URL as part of the package help text.


> diff --git a/package/ascii-invaders/ascii-invaders.hash b/package/ascii-invaders/ascii-invaders.hash
> new file mode 100644
> index 0000000000..6c98401c36
> --- /dev/null
> +++ b/package/ascii-invaders/ascii-invaders.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha512 326708ffc2c277e04575920c58f6a267e0bf46f8d2a3dbca9b5c317fb01006d4f673ab35f92f292549cc52dbee4400a84c85478eb81b9bd7703689a705547bc7  v1.0.1.tar.gz
Please add the hash value for the license file.

> diff --git a/package/ascii-invaders/ascii-invaders.mk b/package/ascii-invaders/ascii-invaders.mk
> new file mode 100644
> index 0000000000..cb5aeaff27
> --- /dev/null
> +++ b/package/ascii-invaders/ascii-invaders.mk
> @@ -0,0 +1,23 @@
> +##############################################################################
This should be 80 hashes

> +#
> +# ASCII-Invaders
> +#
> +##############################################################################
Same here. 80 hashes.
Please run the following command to fix the formatting issues:
./utils/check-package package/ascii-invaders/*

> +
> +ASCII_INVADERS_VERSION = 1.0.1
> +ASCII_INVADERS_SOURCE = v$(ASCII_INVADERS_VERSION).tar.gz
> +ASCII_INVADERS_SITE = https://github.com/macdice/ascii-invaders/archive
> +ASCII_INVADERS_INSTALL_TARGET = YES
Default value, not required.

> +ASCII_INVADERS_DEPENDENCIES = ncurses
> +ASCII_INVADERS_LICENSE = GPL-2.0+
> +ASCII_INVADERS_LICENSE_FILES = LICENSE
> +
> +define ASCII_INVADERS_BUILD_CMDS
> +       (cd $(@D) ; $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D))
The cd $(@D) is not needed here.

> +endef
> +
> +define ASCII_INVADERS_INSTALL_TARGET_CMDS
> +       $(INSTALL) -D -m 0755 $(@D)/ascii_invaders $(TARGET_DIR)/usr/bin
It should be $(INSTALL) -D -m 0755 $(@D)/ascii_invaders
$(TARGET_DIR)/usr/bin/ascii_invaders

> +endef
> +
> +$(eval $(generic-package))
> --
> 2.17.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Please refer to the "How to test your package" section of Buildroot
user manual to verify that it can build at least in the 6 default
build configurations.

thanks!
Gilles.
