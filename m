From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jan 2015 21:39:31 +0100
Subject: [Buildroot] [PATCH 3/3] package/openocd: fix libftdi
 mis-detection
In-Reply-To: <1420233568-10133-3-git-send-email-s.martin49@gmail.com>
References: <1420233568-10133-1-git-send-email-s.martin49@gmail.com>
 <1420233568-10133-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20150103213931.4c6874fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri,  2 Jan 2015 22:19:28 +0100, Samuel Martin wrote:
> By-pass failing ac_search_libs check when libftdi is enabled.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/e90/e90b4d5ad79d99487f21c9d18581e8eba7034501/
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/openocd/openocd.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
> index ad1f95b..34a2bbd 100644
> --- a/package/openocd/openocd.mk
> +++ b/package/openocd/openocd.mk
> @@ -8,7 +8,8 @@ OPENOCD_VERSION = 0.8.0
>  OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
>  OPENOCD_SITE = http://downloads.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)
>  
> -OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
> +OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
> +	$(if $(BR2_PACKAGE_LIBFTDI),ac_cv_search_ftdi_new=yes)

I don't really like this proposal. The test works just fine on
ARM/shared library, and appears to fail only on Blackfin/FLAT. The
config.log contains:

configure:14862: checking for library containing ftdi_new
configure:14893: /home/thomas/projets/buildroot/output/host/usr/bin/bfin-uclinux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -Wl,-elf2flt -static -std=gnu99 -I/home/tho
mas/projets/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/include   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -elf2flt -static conftest.c  -L/home/thomas/projets/bu
ildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib -lftdi -lusb   >&5
/home/thomas/projets/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libusb.a(libusb_la-core.o): In function `_usb_detach_kernel_driver_np':
core.c:(.text+0x96): undefined reference to `_libusb_detach_kernel_driver'
/home/thomas/projets/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libusb.a(libusb_la-core.o): In function `_usb_get_driver_np':
core.c:(.text+0xee): undefined reference to `_libusb_kernel_driver_active'
/home/thomas/projets/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libusb.a(libusb_la-core.o): In function `_usb_get_descriptor_by_endpoint':
core.c:(.text+0x16a): undefined reference to `_libusb_control_transfer'
[... more of such errors...]

So, I'd prefer to see a solution that actually solves the missing
undefined references, rather than working around this by passing
ac_cv_search_ftdi_new. Or at least an explanation giving the details as
to why passing ac_cv_search_ftdi_new is the appropriate solution for
the problem.

I'll mark your patch as Changes Requested. Can you submit an updated
version with either more details, or a better solution?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
