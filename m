From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Dec 2013 10:48:11 +0100
Subject: [Buildroot] [PATCH 3/3] package/parted: add a host variant
In-Reply-To: <1891fdbc7ad11ce084f2be315871eb10573953b7.1386023329.git.yann.morin.1998@free.fr>
References: <cover.1386023329.git.yann.morin.1998@free.fr>
 <1891fdbc7ad11ce084f2be315871eb10573953b7.1386023329.git.yann.morin.1998@free.fr>
Message-ID: <20131206104811.49d81180@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon,  2 Dec 2013 23:29:57 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Usefull for for-build scripts to call parted, eg. to generate

Useful. See http://en.wiktionary.org/wiki/usefull.

> partition tables and such automatically.
> 
> Since the primary gaool is to use parted within scripts, we

goal

> do not need readline, so it is forcibly disabled.
> 

>  PARTED_DEPENDENCIES = readline util-linux lvm2
> +HOST_PARTED_DEPENDENCIES = host-util-linux host-lvm2

Do we really want the lvm2 dependency? It can be avoided by passing
--disable-device-mapper.

>  PARTED_INSTALL_STAGING = YES
>  PARTED_LICENSE = GPLv3+
>  PARTED_LICENSE_FILES = COPYING
>  
> +HOST_PARTED_CONF_OPT += --without-readline
> +
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

So maybe something like:

PARTED_DEPENDENCIES = util-linux

ifeq ($(BR2_PACKAGE_READLINE),y)
PARTED_DEPENDENCIES += readline
PARTED_CONF_OPT += --with-readline
else
PARTED_CONF_OPT += --without-readline
endif

ifeq ($(BR2_PACKAGE_LVM2),y)
PARTED_DEPENDENCIES += lvm2
PARTED_CONF_OPT += --enable-device-mapper
else
PARTED_CONF_OPT += --disable-device-mapper
endif

HOST_PARTED_DEPENDENCIES = host-util-linux
HOST_PARTED_CONF_OPT = \
	--without-readline \
	--disable-device-mapper

In the host variant of parted, lvm2 support is never enabled, as I
believe it's pretty unlikely that lvm2 support will be needed to
generate disk images. This would make PATCH 2/3 of your series
unnecessary, of course.

In the target variant, we automatically enable lvm2 and readline support
when available, which allows to build parted without lvm2 support when
not needed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
