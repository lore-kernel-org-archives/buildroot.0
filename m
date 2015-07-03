From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jul 2015 09:39:18 +0200
Subject: [Buildroot] [PATCH 1/1] qt5: bump version to 5.5.0
In-Reply-To: <d9e13733-fe52-48db-8c21-dd519b338d51@MAIL-SINTERS-01.sinters-int.fr>
References: <d9e13733-fe52-48db-8c21-dd519b338d51@MAIL-SINTERS-01.sinters-int.fr>
Message-ID: <20150703093918.4d26fb87@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien,

Thanks for this contribution!

On Fri, 3 Jul 2015 07:20:53 +0000, Julien CORJON wrote:
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
> Update all hashes
> Remove QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES
>   See https://codereview.qt-project.org/#/c/107548/
> Copy new EglDeviceIntegrationLibrary
> Remove merged patches
>   qt5base/0002-logging-Check-if-uClibc-has-backtrace-support.patch
>     merged https://codereview.qt-project.org/#/c/102628/
>   qt5base/0006-configure-fix-gold-linker-support-detection.patch
>     merged https://codereview.qt-project.org/#/c/106318/
>   qt5base/0007-configure-add-psql_config-option.patch
>     merged https://codereview.qt-project.org/#/c/107027/
>   qt5connectivity/0001-Fix-build-with-no-c-11.patch
>     merged https://codereview.qt-project.org/#/c/104254/
>   qt5connectivity/0002-bluez_data_p.h-Add-missing-include-byteswap.h.patch
>     replaced by https://codereview.qt-project.org/#/c/106263/ 
> Update patch with pending commit
>   qt5base/0005-no-gold-linker-for-host-build.patch    
>     replaced with recently merged patch https://codereview.qt-project.org/#/c/113563/ 
> New patch
>   qt5base/0008-forkd-disable-eventfd-for-uclibc.patch     
>     Disable missing eventfd in forkd for uClibc toolchains
> Tests
>   Full compiled : ARM/uClibc
>   Partialy compiled and tested on i.MX6/linaro with OpenGL backend

All this should go before the "---", it is important to have this info
as part of the commit log.

Also, please use git send-email to send your patch. Your patch has been
modified by your e-mail client. If your company doesn't provide you
with the right tools to do your work, then blame your company and use a
personal e-mail address instead to send the patches.

See http://patchwork.ozlabs.org/patch/490931/ to have a look at your
patch, you'll see that it's pretty broken.

Also, your 3 patches don't appear in the same thread, probably also due
to how you send them. Please use git send-email, once again.

> diff --git a/package/qt5/qt5base/0008-forkd-disable-eventfd-for-uclibc.patch b/package/qt5/qt5base/0008-forkd-disable-eventfd-for-uclibc.patch
> new file mode 100644
> index 0000000..058ef34
> --- /dev/null
> +++ b/package/qt5/qt5base/0008-forkd-disable-eventfd-for-uclibc.patch
> @@ -0,0 +1,19 @@
> +Disable eventfd in forkd for uClibc < 0.9.33 toolchains

It's actually <=, not <.


> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index e2db5d1..eb6b883 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -117,12 +117,6 @@ QT5BASE_CONFIGURE_OPTS += -eglfs
>  QT5BASE_DEPENDENCIES   += libegl
>  ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
>  QT5BASE_EXTRA_CFLAGS = -DENABLE_MX6_WORKAROUND
> -QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
> -	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp
> -endif
> -ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> -QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
> -	$(@D)/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp

So QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES is no longer useful? How does it
work now to enable the code specific to a given platform?

> +QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglDeviceIntegration

I see there is this new thing, but how does it now if you're doing
i.MX6, Raspberry Pi or whatever?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
