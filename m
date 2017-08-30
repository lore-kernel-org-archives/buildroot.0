From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:29:46 +0200
Subject: [Buildroot] [PATCH next 1/2] lirc-tools: remove useless
 libusb-compat dependnecy
In-Reply-To: <c21debe1fe36162b182803d45b5e6b0ab4ff575d.1503898456.git.baruch@tkos.co.il>
References: <c21debe1fe36162b182803d45b5e6b0ab4ff575d.1503898456.git.baruch@tkos.co.il>
Message-ID: <20170830222946.5ad6f28b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Aug 2017 08:34:15 +0300, Baruch Siach wrote:
> The only plugin that uses libusb/libusb-compat is the ftdi plugin. This
> plugin needs libftdi1 that already depends on libusb in Buildroot. So in
> practice libusb-compat is never actually used; we can safely remove it.
> The libusb dependency is implicit in the libftdi1 optional dependency.

Are you sure ?

From the configure.ac script:

AC_CHECK_HEADERS([usb.h libusb-1.0/libusb.h libusb.h])
AC_CHECK_LIB([usb],[usb_get_string],[usb_libs="-lusb"],,)
AM_CONDITIONAL([BUILD_USB],[test x$usb_libs != x])
AC_CHECK_LIB([usb-1.0],[libusb_lock_events],[usb_libs="$usb_libs -lusb-1.0"],,)

In addition, I do see a number of plugins linked with libusb-0.1:

$ readelf -d output/target/usr/lib/lirc/plugins/* | grep libusb-0.1
 0x00000001 (NEEDED)                     Shared library: [libusb-0.1.so.4]
 0x00000001 (NEEDED)                     Shared library: [libusb-0.1.so.4]
 0x00000001 (NEEDED)                     Shared library: [libusb-0.1.so.4]
 0x00000001 (NEEDED)                     Shared library: [libusb-0.1.so.4]
 0x00000001 (NEEDED)                     Shared library: [libusb-0.1.so.4]

Am I missing something ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
