From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 5 Jan 2015 21:08:37 +0100
Subject: [Buildroot] [PATCH 3/3] package/openocd: fix libftdi
	mis-detection
In-Reply-To: <20150103213931.4c6874fb@free-electrons.com>
References: <1420233568-10133-1-git-send-email-s.martin49@gmail.com>
 <1420233568-10133-3-git-send-email-s.martin49@gmail.com>
 <20150103213931.4c6874fb@free-electrons.com>
Message-ID: <CAHXCMML_UwBYPhjnbuKXiq+9G+xAm+8MAxL3r30QweuS6Xwirg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Jan 3, 2015 at 9:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Fri,  2 Jan 2015 22:19:28 +0100, Samuel Martin wrote:
>> By-pass failing ac_search_libs check when libftdi is enabled.
>>
>> Fixes:
>>   http://autobuild.buildroot.org/results/e90/e90b4d5ad79d99487f21c9d18581e8eba7034501/
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  package/openocd/openocd.mk | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
>> index ad1f95b..34a2bbd 100644
>> --- a/package/openocd/openocd.mk
>> +++ b/package/openocd/openocd.mk
>> @@ -8,7 +8,8 @@ OPENOCD_VERSION = 0.8.0
>>  OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
>>  OPENOCD_SITE = http://downloads.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)
>>
>> -OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
>> +OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
>> +     $(if $(BR2_PACKAGE_LIBFTDI),ac_cv_search_ftdi_new=yes)
>
> I don't really like this proposal. The test works just fine on
> ARM/shared library, and appears to fail only on Blackfin/FLAT. The
> config.log contains:
>
> configure:14862: checking for library containing ftdi_new
> configure:14893: /home/thomas/projets/buildroot/output/host/usr/bin/bfin-uclinux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -Wl,-elf2flt -static -std=gnu99 -I/home/tho
> mas/projets/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/include   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -elf2flt -static conftest.c  -L/home/thomas/projets/bu
> ildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib -lftdi -lusb   >&5
> /home/thomas/projets/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libusb.a(libusb_la-core.o): In function `_usb_detach_kernel_driver_np':
> core.c:(.text+0x96): undefined reference to `_libusb_detach_kernel_driver'
> /home/thomas/projets/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libusb.a(libusb_la-core.o): In function `_usb_get_driver_np':
> core.c:(.text+0xee): undefined reference to `_libusb_kernel_driver_active'
> /home/thomas/projets/buildroot/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libusb.a(libusb_la-core.o): In function `_usb_get_descriptor_by_endpoint':
> core.c:(.text+0x16a): undefined reference to `_libusb_control_transfer'
> [... more of such errors...]
>
> So, I'd prefer to see a solution that actually solves the missing
> undefined references, rather than working around this by passing
> ac_cv_search_ftdi_new. Or at least an explanation giving the details as
> to why passing ac_cv_search_ftdi_new is the appropriate solution for
> the problem.
>
> I'll mark your patch as Changes Requested. Can you submit an updated
> version with either more details, or a better solution?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Well, after further investigation, this error seems caused by the "_"
prefix prepended to each symbol on BlackFin.

When forcing the test result to pass the configuration, the full build succeeds.
<snip>
[...]
libtool: link: /home/system/src/tmp/br/abo/openocd-e90/host/usr/bin/bfin-uclinux-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-Wl,-elf2flt -static -std=gnu99 -Wall -Wstrict-prototypes
-Wformat-security -Wshadow -Wextra -Wno-unused-parameter
-Wbad-function-cast -Wcast-align -Wredundant-decls -elf2flt -static -o
openocd main.o  ./.libs/libopenocd.a
-L/home/system/src/tmp/br/abo/openocd-e90/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib
/home/system/src/tmp/br/abo/openocd-e90/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libftdi.a
/home/system/src/tmp/br/abo/openocd-e90/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libusb.a
/home/system/src/tmp/br/abo/openocd-e90/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libusb-1.0.a
../jimtcl/libjim.a -lm -pthread
</snip>

The most noticeable differences between the autotools check and the
build command are:
- the build command uses libtool, whereas the autotools check does not;
- the build command uses full path to libftdi.a and libusb.a (from the
staging tree), whereas the autotools check uses:
-L$(STAGING_DIR)/usr/lib -lftdi -lusb

Could this behavior result from some libtool trickery?


Note that, in such a case, we usually mark the package as not
available on bfin [1-2].
I think I'll do the same for openocd.


[1] http://git.buildroot.net/buildroot/commit/?id=b1cf2b21dd9e2283f9020e3a5ac9ac35f8855c1a
[2] http://git.buildroot.net/buildroot/commit/?id=7f5fec620101dba2e97a08d7e61640aa39a3c3f0


Regards,

-- 
Samuel
