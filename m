From: Nathaniel Roach <nroach44@nroach44.id.au>
Date: Wed, 5 Feb 2020 20:08:40 +0800
Subject: [Buildroot] [PATCH 1/2] package/liboping: remove -Werror build
 flag
In-Reply-To: <87a75z1im0.fsf@dell.be.48ers.dk>
References: <20200124143609.14313-1-nroach44@gmail.com>
 <CAPi7W81yAtkC3xJPL++Lb-ZP=5yja0KRy00t3ALdp2Q4EGFv6g@mail.gmail.com>
 <cfe054c8-2874-de9a-a604-763b3157e4d3@nroach44.id.au>
 <CAPi7W80DpRDJJ04Mg6rb+4yoRLVdGbw7tyk0+J4xrDAtzz3h=g@mail.gmail.com>
 <87a75z1im0.fsf@dell.be.48ers.dk>
Message-ID: <8d3d1c41-23cb-6514-d823-cddcf2a0a2c6@nroach44.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Peter, Fabrice,

On 4/2/20 5:11 am, Peter Korsgaard wrote:
>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
> Hi,
>
>   >> > Can you be more specific on the build failure? For example, by
>   >> > providing a link on autobuilder?
>   >> > Otherwise, I would prefer an upstreamable solution such as adding a
>   >> > --disable-werror option or adding a patch that fixes the issue.
>   >> > There is a pending PR on a truncation error on upstream github:
>   >> > https://github.com/octo/liboping/pull/50.
>   >> > Is it related to your build failure? In this case, I would suggest to
>   >> > retrieve this commit.
>   >>
>   >> The error is detailed in the Gentoo bug linked above, and this was their
>   >> fix for it. There is one single build failure on the autobuilders, and
>   >> it's got the same error:
>   >> http://autobuild.buildroot.org/?reason=liboping-1.10.0
>   > This error was raised in December 5th 2018 and has been fixed by
>   > retrieving an upstream commit instead of disabling -Werror (see
>   > https://patchwork.ozlabs.org/patch/1009066).
>   > There was no more autobuilder failures after this patch was applied.
>   > So this is strange that you still get a failure on your local machine.
>   > Are you using the master branch or one of the official release (fix
>   > was committed to 2018.08.x and 2018.11.x releases)?
>
> Any comments on that? In the mean time I have marked the patch as not
> applicable in patchwork.
>
I'm working off origin/master. When using the following defconfig:

BR2_x86_64=y
BR2_x86_core2=y
BR2_DL_DIR="<snip>"
BR2_OPTIMIZE_3=y
BR2_PIC_PIE=y
BR2_SSP_REGULAR=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_GLIBC_UTILS=y
BR2_BINUTILS_VERSION_2_33_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
BR2_GCC_ENABLE_LTO=y
BR2_GCC_ENABLE_GRAPHITE=y
BR2_TARGET_GENERIC_PASSWD_SHA512=y
BR2_INIT_SYSTEMD=y
BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES=y
BR2_SYSTEM_BIN_SH_BASH=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_ENABLE_LOCALE_WHITELIST="C en_US en_AU"
BR2_GENERATE_LOCALE="C en_AU"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="<snip>"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_LIBOPING=y


The build will fail with:

 >>> liboping 1.10.0 Building
PATH="/srv/data/build/buildroot/buildroot-git/output/host/bin:/srv/data/build/buildroot/buildroot-git/output/host/sbin:/usr/lib/ccache:/home/nroach44/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games" 
/usr/bin/make -j13? -C 
/srv/data/build/buildroot/buildroot-git/output/build/liboping-1.10.0/
make[1]: Entering directory 
'/srv/data/build/buildroot/buildroot-git/output/build/liboping-1.10.0'
Making all in src
make[2]: Entering directory 
'/srv/data/build/buildroot/buildroot-git/output/build/liboping-1.10.0/src'
/usr/bin/make? all-recursive
make[3]: Entering directory 
'/srv/data/build/buildroot/buildroot-git/output/build/liboping-1.10.0/src'
Making all in mans
make[4]: Entering directory 
'/srv/data/build/buildroot/buildroot-git/output/build/liboping-1.10.0/src/mans'
make[4]: Nothing to be done for 'all'.
make[4]: Leaving directory 
'/srv/data/build/buildroot/buildroot-git/output/build/liboping-1.10.0/src/mans'
make[4]: Entering directory 
'/srv/data/build/buildroot/buildroot-git/output/build/liboping-1.10.0/src'
/bin/bash ../libtool? --tag=CC?? --mode=compile 
/srv/data/build/buildroot/buildroot-git/output/host/bin/x86_64-buildroot-linux-gnu-gcc 
-DHAVE_CONFIG_H -I.?? -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -Wall -Werror -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64? -O3?? -c -o 
liboping_la-liboping.lo `test -f 'liboping.c' || echo './'`liboping.c
libtool: compile: 
/srv/data/build/buildroot/buildroot-git/output/host/bin/x86_64-buildroot-linux-gnu-gcc 
-DHAVE_CONFIG_H -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 -Wall -Werror -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O3 -c liboping.c -fPIC 
-DPIC -o .libs/liboping_la-liboping.o
liboping.c: In function 'ping_set_ttl':
liboping.c:207:9: error: '%s' directive output may be truncated writing 
up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
 ??? "%s: %s", function, message);
 ???????? ^~
liboping.c:829:6:
 ????? sstrerror (ret, errbuf, sizeof (errbuf)));
 ????? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into 
a destination of size 256
 ? snprintf (obj->errmsg, sizeof (obj->errmsg),
 ? ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ??? "%s: %s", function, message);
 ??? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c:207:9: error: '%s' directive output may be truncated writing 
up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
 ??? "%s: %s", function, message);
 ???????? ^~
liboping.c:842:6:
 ????? sstrerror (ret, errbuf, sizeof (errbuf)));
 ????? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into 
a destination of size 256
 ? snprintf (obj->errmsg, sizeof (obj->errmsg),
 ? ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ??? "%s: %s", function, message);
 ??? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c: In function 'ping_set_qos':
liboping.c:207:9: error: '%s' directive output may be truncated writing 
up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
 ??? "%s: %s", function, message);
 ???????? ^~
liboping.c:869:6:
 ????? sstrerror (ret, errbuf, sizeof (errbuf)));
 ????? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into 
a destination of size 256
 ? snprintf (obj->errmsg, sizeof (obj->errmsg),
 ? ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ??? "%s: %s", function, message);
 ??? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c:207:9: error: '%s' directive output may be truncated writing 
up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
 ??? "%s: %s", function, message);
 ???????? ^~
liboping.c:885:6:
 ????? sstrerror (ret, errbuf, sizeof (errbuf)));
 ????? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into 
a destination of size 256
 ? snprintf (obj->errmsg, sizeof (obj->errmsg),
 ? ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ??? "%s: %s", function, message);
 ??? ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[4]: *** [Makefile:582: liboping_la-liboping.lo] Error 1
make[4]: Leaving directory 
'/srv/data/build/buildroot/buildroot-git/output/build/liboping-1.10.0/src'
make[3]: *** [Makefile:645: all-recursive] Error 1
make[3]: Leaving directory 
'/srv/data/build/buildroot/buildroot-git/output/build/liboping-1.10.0/src'
make[2]: *** [Makefile:419: all] Error 2
make[2]: Leaving directory 
'/srv/data/build/buildroot/buildroot-git/output/build/liboping-1.10.0/src'
make[1]: *** [Makefile:382: all-recursive] Error 1
make[1]: Leaving directory 
'/srv/data/build/buildroot/buildroot-git/output/build/liboping-1.10.0'
make: *** [package/pkg-generic.mk:260: 
/srv/data/build/buildroot/buildroot-git/output/build/liboping-1.10.0/.stamp_built] 
Error 2


I'm building on Debian 10. When I turn SSP to none, it will build fine.
