From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 26 Mar 2014 14:46:19 +0100
Subject: [Buildroot] libusb / udev support issue when using systemd and
 raspberrypi_defconfig
In-Reply-To: <CABGWzsQM1qyfQ8c7aMJ+ARU6RvQQxPRC=s1Uh3jBijJZQ-ADSQ@mail.gmail.com>
References: <CABGWzsQM1qyfQ8c7aMJ+ARU6RvQQxPRC=s1Uh3jBijJZQ-ADSQ@mail.gmail.com>
Message-ID: <20140326134616.GA24151@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric!

On Wed, Mar 26, 2014 at 09:45:17AM +0100, Eric Limpens wrote:
>    Hi,
>     I'ld like to use systemd as init system on a RaspberryPi. Following these
>    steps, libusb complains about the lack of udev support (missing libudev):
>    git clone git://git.busybox.net/buildroot
>    make raspberrypi_defconfig
>    make menuconfig
>     --> select glibc as C library
>     --> select systemd as init system
>     --> select package libusb
>    make
>    Is this a glitch with setting one of the BR2_PACKAGE_HAS_UDEV or
>    BR2_PACKAGE_PROVIDERS_UDEV variables?
I reproduced your bug. It is not a glitch with systemd being a provider for
the virtual package udev, but a linking issue.

If you look at output/build/libusb-1.0.18/config.log, you will see that the
configure script fails to detect libudev because of this:

 <...>/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libudev.so:  undefined reference to `__res_search'
 <...>/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libudev.so:  undefined reference to `__res_query'

These symbols are provided by libresolv.so. Since systemd 209, some
convenience libraries have been merged into libsystemd, which pulls this
-lresolv dependency.

See this `discussion
<http://lists.freedesktop.org/archives/systemd-devel/2014-March/017923.html>`_
on system-devel mailing list for more details, as well as this `Gentoo bug report
<https://bugs.gentoo.org/show_bug.cgi?id=504700>`_ for further details.

This issue is fixed in system 212, which has been released today! I will soon
post a patch to bump this package.

Best regards,
ELB
