From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2015 12:52:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsoil: new package
In-Reply-To: <1443468339-24028-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443468339-24028-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150930125219.767840c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Mon, 28 Sep 2015 21:25:39 +0200, Bernd Kuhls wrote:
> Needed for these new Kodi addons, to be included in upcoming 16.x-Jarvis
> version bump:
> 
> kodi-screensaver-asterwave
> kodi-screensaver-cpblobs
> kodi-screensaver-matrixtrails
> kodi-screensaver-planestate
> kodi-visualisation-fountain

So they start using a library that has seen its last release in 2008?
Interesting choice :)


> +-	gcc -shared -Wl,-soname,$(LIBNAME).so.$(MAJOR) -o $(LIBNAME).so.$(VERSION) $(OFILES)
> ++	$(CC) -shared -Wl,-soname,$(LIBNAME).so.$(MAJOR) -o $(LIBNAME).so.$(VERSION) $(OFILES) -lGL -lm

Looking at this line, I believe this package should "depends
on !BR2_STATIC_LIBS".

> diff --git a/package/libsoil/libsoil.mk b/package/libsoil/libsoil.mk
> new file mode 100644
> index 0000000..664f4e6
> --- /dev/null
> +++ b/package/libsoil/libsoil.mk
> @@ -0,0 +1,38 @@
> +################################################################################
> +#
> +# libsoil
> +#
> +################################################################################
> +
> +LIBSOIL_VERSION = 1.07~20080707
> +LIBSOIL_SOURCE = libsoil_$(LIBSOIL_VERSION).dfsg.orig.tar.gz
> +LIBSOIL_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/libs/libsoil

Any reason to not use the upstream site,
http://www.lonesock.net/files/soil.zip ?

> +LIBSOIL_INSTALL_STAGING = YES
> +LIBSOIL_DEPENDENCIES = libgl
> +LIBSOIL_LICENSE = Public Domain, MIT
> +LIBSOIL_LICENSE_FILES = src/stb_image_aug.c src/image_helper.c
> +
> +define LIBSOIL_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
> +		CC=$(TARGET_CC) \

Why do you pass CC=$(TARGET_CC) if you already pass
$(TARGET_CONFIGURE_OPTS) in the environment?

Also, please use $(TARGET_MAKE_ENV) in the environment.

> +		-f ../projects/makefile/alternate\ Makefile.txt \

Wow, they used a space in the name of the Makefile. Very interesting :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
