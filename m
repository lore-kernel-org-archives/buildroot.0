From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Aug 2015 11:12:23 +0200
Subject: [Buildroot] [PATCH] systemd: Bump version and change hosting
In-Reply-To: <1438541814-20602-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1438541814-20602-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150803111223.3eaa373b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun,  2 Aug 2015 20:56:54 +0200, Maxime Hadjinlian wrote:
> systemd seems to do its release using their github repository up from
> the 221 version.
> 
> Since they use the auto generated release, we can't have a hash file.
> 
> Remove the patch about 'ln --relative', coreutils's version is 8.23.4 on all
> recent (starting from stable included) Debian so it as good a time as
> any to discard this patch.

Well, that patch was added in April 2014, so not such a long time ago,
and the commit log was saying:

    Systemd build system now uses the `--relative` option from `ln(1)`.
    This option was added to GNU coreutils 8.16, which is not widely
    deployed yet by GNU/Linux distributions (not available in Debian Wheezy
    for example).

We recently committed some patches to make Buildroot work on RHEL 5.x,
so it would be a bit strange to do this and one hand, and remove this
systemd patch to support old distros on the other hand.

Why are you removing the patch? The code has changed so much that
porting it to v224 is complicated?

> -SYSTEMD_VERSION = 221
> -SYSTEMD_SITE = http://www.freedesktop.org/software/systemd
> -SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
> +SYSTEMD_VERSION = 224
> +SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = LGPLv2.1+, GPLv2+ (udev), Public Domain (few source files, see README)
>  SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
>  SYSTEMD_INSTALL_STAGING = YES
> @@ -18,7 +17,6 @@ SYSTEMD_DEPENDENCIES = \
>  	host-gperf
>  
>  SYSTEMD_PROVIDES = udev
> -SYSTEMD_AUTORECONF = YES
>  
>  # Make sure that systemd will always be built after busybox so that we have
>  # a consistent init setup between two builds
> @@ -51,6 +49,11 @@ SYSTEMD_CONF_ENV = \
>  	CFLAGS="$(SYSTEMD_CFLAGS)" \
>  	ac_cv_path_KMOD=/usr/bin/kmod
>  
> +define SYSTEMD_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +SYSTEMD_PRE_CONFIGURE_HOOKS += SYSTEMD_RUN_AUTOGEN

This is wrong because since you remove <pkg>_AUTORECONF = YES, you no
longer depend on host-autoconf, host-automake and host-libtool.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
