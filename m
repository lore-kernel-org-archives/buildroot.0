From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 11:13:04 +0200
Subject: [Buildroot] [PATCH v4 1/4] qt5: bump version to 5.5.0
In-Reply-To: <1437468691-364-2-git-send-email-corjon.j@ecagroup.com>
References: <1436538022-18924-1-git-send-email-corjon.j@ecagroup.com>
 <1437468691-364-1-git-send-email-corjon.j@ecagroup.com>
 <1437468691-364-2-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20150721111304.28196bd2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien Corjon,

On Tue, 21 Jul 2015 10:51:28 +0200, Julien Corjon wrote:

> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -123,12 +123,10 @@ QT5BASE_CONFIGURE_OPTS += -eglfs
>  QT5BASE_DEPENDENCIES   += libegl
>  ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
>  QT5BASE_EXTRA_CFLAGS = -DENABLE_MX6_WORKAROUND

So here we use this QT5BASE_EXTRA_CFLAGS mechanism.

> -QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
> -	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp
>  endif
>  ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> -QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
> -	$(@D)/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
> +QT5BASE_CONFIGURE_OPTS += -I$(STAGING_DIR)/usr/include/interface/vcos/pthreads
> +QT5BASE_CONFIGURE_OPTS += -I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux

And here we pass -I directly to the configure script.

I'm wondering if there isn't some room for factorization here. Maybe
the -DENABLE_MX6_WORKAROUND could be passed as a configure option as
well:

$ ./configure --help

    -D <string> ........ Add an explicit define to the preprocessor.
    -I <string> ........ Add an explicit include path.
    -L <string> ........ Add an explicit library path.

Or we could pass the -I for the RaspberryPi stuff in
QT5BASE_EXTRA_CFLAGS.

But oh well, we probably need to get this some autobuilder testing, and
see what happens.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
