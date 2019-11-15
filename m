From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 23:26:48 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/gcnano-binaries: new package
In-Reply-To: <20191114085529.733-2-scooby22@web.de>
References: <20191114085529.733-1-scooby22@web.de>
 <20191114085529.733-2-scooby22@web.de>
Message-ID: <20191115232648.5780e79c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jens,

On Thu, 14 Nov 2019 09:55:28 +0100
Jens Kleintje <scooby22@web.de> wrote:

> New package which provides the driver and binary blob libraries for the
> STM32MP157 vivante gcnano gpu.
> The precompiled libaries depends on wayland and libdrm.
> 
> Signed-off-by: Jens Kleintje <scooby22@web.de>

Thanks for this new version, I have applied it to our next branch, but
after doing a number of changes. See below.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index cdd44be37c..9c39bbd41e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2536,3 +2536,6 @@ F:	package/tinc/
>  N:  Aussedat Louis <aussedat.louis@gmail.com>
>  F:	board/friendlyarm/nanopi-neo-plus2/
>  F:	configs/friendlyarm_nanopi_neo_plus2_defconfig
> +
> +N:	Jens Kleintje <scooby22@web.de>
> +F:	package/gcnano-binaries

Alphabetic ordering was not good. Yes, the entry of Aussedat Louis was
also not at the right place, but it has been fixed in the mean time.


> diff --git a/package/gcnano-binaries/Config.in b/package/gcnano-binaries/Config.in
> new file mode 100644
> index 0000000000..9cc9d149c0
> --- /dev/null
> +++ b/package/gcnano-binaries/Config.in
> @@ -0,0 +1,24 @@
> +comment "gcnano binaries  needs a Linux kernel to be built"

gcnano binaries -> gcnano-binaries. And there were two spaces before "needs"

> +	depends on !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_GCNANO_BINARIES
> +	bool "gcnano binaries"

	bool "gcnano-binaries"

> +	depends on BR2_arm
> +	depends on BR2_LINUX_KERNEL

You forgot a number of dependencies here:

 - glibc dependency, because the pre-built binary blobs will only work
   with glibc

 - threads, which is a dependency of libdrm and wayland, so we have to
   replicate it

 - dynamic libraries, because wayland has a !BR2_STATIC_LIBS dependency


> +
> +GCNANO_BINARIES_FILE_VERSION = 6.2.4.p4

I've improved this a bit with:

GCNANO_BINARIES_LIB_VERSION = 6.2.4
GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION).p4
GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION).p4-20190626

which I then use throughout the .mk file.


> +# The wayland-egl.pc and libwayland-egl.so are provided by the wayland package
> +define GCNANO_BINARIES_INSTALL
> +	rm -f $(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_FILE_VERSION)-20190626/usr/lib/pkgconfig/wayland-egl.pc
> +	rm -f $(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_FILE_VERSION)-20190626/usr/lib/libwayland-egl.so.1
> +	rm -f $(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_FILE_VERSION)-20190626/usr/lib/libwayland-egl.so
> +	cp -r $(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_FILE_VERSION)-20190626/usr/lib/* $(1)/usr/lib/
> +	cd $(1)/usr/lib; \
> +	ln -sf gbm_viv.6.2.4.multi.release.so gbm_viv.so; \
> +	ln -sf libEGL.6.2.4.multi.release.so libEGL.so; \
> +	ln -sf libEGL.so libEGL.so.1; \
> +	ln -sf libGAL.6.2.4.multi.release.so libGAL.so; \
> +	ln -sf libgbm.6.2.4.multi.release.so libgbm.so; \
> +	ln -sf libgbm.so libgbm.so.1; \
> +	ln -sf libGLESv1_CM.6.2.4.multi.release.so libGLESv1_CM.so; \
> +	ln -sf libGLESv2.6.2.4.multi.release.so libGLESv2.so; \
> +	ln -sf libGLESv2.so libGLESv2.so.2; \
> +	ln -sf libGLSLC.6.2.4.multi.release.so libGLSLC.so; \
> +	ln -sf libOpenVG.6.2.4.multi.release.so libOpenVG.so; \
> +	ln -sf libVSC.6.2.4.multi.release.so libVSC.so;
> +	cp -r $(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_FILE_VERSION)-20190626/usr/include/* $(1)/usr/include/
> +endef

This was over-complicated, and had a not great side effect: each
library was installed in two copies: a "release" copy, and a "debug"
copy. The symlinks point to the "release" copy, but the "debug" copy is
just there taking up storage space for no reason. Also, creating the
symlinks manually is not needed: they already exist in the package
"source code".

So I changed this to:

GCNANO_BINARIES_LIBRARIES = \
        gbm_viv libEGL libGAL libgbm libGLESv1_CM \
        libGLESv2 libGLSLC libOpenVG libVSC

GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)

define GCNANO_BINARIES_INSTALL
        $(foreach lib,$(GCNANO_BINARIES_LIBRARIES), \
                $(INSTALL) -D -m 0755 $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).$(GCNANO_BINARIES_LIB_VERSION).multi.release.so \
                        $(1)/usr/lib/$(lib).$(GCNANO_BINARIES_LIB_VERSION).multi.release.so ; \
                cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/lib/$(lib).so* $(1)/usr/lib
        )
        cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/usr/include/* $(1)/usr/include/
endef

which hopefully does the same thing, but in a slightly more compact
way, and avoid the library duplication.

Could you test if what I have committed to the next branch continues to
work for you ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
