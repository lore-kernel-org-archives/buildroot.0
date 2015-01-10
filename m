From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jan 2015 20:00:05 +0100
Subject: [Buildroot] [PATCH v5 1/1] glmark2: new package
References: <1416661540-9669-1-git-send-email-bernd.kuhls@t-online.de>
 <20141207222234.GK10809@free.fr>
Message-ID: <XnsA41ECB77718BBberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed to Thomas]

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:20141207222234.GK10809 at free.fr:

>> +GLMARK2_DEPENDENCIES = host-pkgconf jpeg libpng mesa3d
> 
> Although this is currently correct because we really require mesa3d, I
> think it would be better to handle it with the virtual packages:
> 
>     GLMARK2_DEPENDENCIES += \
>         $(if $(BR2_PACKAGE_HAS_LIBEGL),libegl) \
>         $(if $(BR2_PACKAGE_HAS_LIBGLES),libgles) \
>         $(if $(BR2_PACKAGE_HAS_LIBGL),libgl)

Hi,

this leads to a problem when more than one provider for a virtual package is 
selected, Thomas send me this defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2
_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/b
r-arm-full-2014.11.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17=y
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_GLMARK2=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_RPI_USERLAND=y

This is the configure error message:
Checking for 'egl'                       : yes
Checking for 'glesv2'                    : yes
Checking for 'libdrm'                    : not found
The configuration failed

Compilation of glmark2 fails because it uses rpi-userland as libegl/gles 
provider instead of mesa3d, mesa3d is not compiled at all :(

I will send an updated patch for glmark2 to fix its dependencies.

Regards, Bernd
