From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 23:22:02 +0200
Subject: [Buildroot] [PATCH v2 1/3] qt5: bump version to 5.5.0
In-Reply-To: <1436380555-13657-1-git-send-email-corjon.j@ecagroup.com>
References: <1436380555-13657-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20150719232202.67a5bc98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien Corjon,

On Wed,  8 Jul 2015 20:35:53 +0200, Julien Corjon wrote:
> QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES is no longer useful since eglfs does not
> depend on the device makespecs anymore. Instead, backends are autodetected by
> configure [1].
> 
> 0008-forkd-disable-eventfd-for-uclibc.patch disable missing eventfd in new Qt
> 3rd party forkd for uClibc toolchains.
> 
> Remove patches commited in Qt mainline and update pending one
> 
> [1] https://codereview.qt-project.org/#/c/107548/
> 
> Tested-by: Julien Corjon <corjon.j@ecagroup.com> Full compilation on ARM/uClibc
> Tested-by: Julien Corjon <corjon.j@ecagroup.com> Partialy compiled and tested
>   on i.MX6/linaro with OpenGL backend
> 
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>

I was about to apply this, but unfortunately, it breaks the build with
rpi-userland as the egl provider:

/home/test/outputs/qt5/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/interface/vcos/vcos_types.h:38:33: fatal error: vcos_platform_types.h: No such file or directory
 #include "vcos_platform_types.h"

I checked, and without your patches, the build works fine. The
defconfig I'm testing is:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.05-496-g85945aa.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
BR2_PACKAGE_QT5BASE_EGLFS=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5DECLARATIVE=y
BR2_PACKAGE_QT5MULTIMEDIA=y
BR2_PACKAGE_QT5QUICK1=y
BR2_PACKAGE_QT5SENSORS=y
BR2_PACKAGE_QT5SERIALPORT=y
BR2_PACKAGE_QT5SVG=y
BR2_PACKAGE_QJSON=y
BR2_PACKAGE_QUAZIP=y
BR2_PACKAGE_RPI_USERLAND=y

Maybe Bernd or Yann can help with this Raspberry Pi specific issue?

It's clearly a header path missing. It's probably caused by the
refactoring of how the platform-specific EGL stuff is handled in Qt5.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
