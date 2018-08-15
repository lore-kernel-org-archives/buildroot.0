From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 00:12:08 +0200
Subject: [Buildroot] [PATCH v2,1/2] boost: locale needs thread with icu
In-Reply-To: <20180814203420.10964-1-fontaine.fabrice@gmail.com>
References: <20180814203420.10964-1-fontaine.fabrice@gmail.com>
Message-ID: <20180816001208.2952668f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Aug 2018 22:34:19 +0200, Fabrice Fontaine wrote:
> output/host/usr/bin/nios2-linux-readelf -d output/staging/usr/lib/libboost_locale.so
> 
> Dynamic section at offset 0x125ec0 contains 36 entries:
>   Tag        Type                         Name/Value
>  0x00000001 (NEEDED)                     Shared library: [libboost_chrono.so.1.67.0]
>  0x00000001 (NEEDED)                     Shared library: [libboost_thread.so.1.67.0]
>  0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]
>  0x00000001 (NEEDED)                     Shared library: [librt.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libicudata.so.60]
>  0x00000001 (NEEDED)                     Shared library: [libicui18n.so.60]
>  0x00000001 (NEEDED)                     Shared library: [libicuuc.so.60]
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/57838f7cd84f37b66ab7007deaea847af8f54b72
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I have applied both patches to master, but I think we still do have a
bunch of issues to resolve.

Issue 1
=======

First of all, ICU support is not always detected by Boost. For example,
the following glibc-based defconfig builds boost_locale with ICU
support:

BR2_arm=y
BR2_cortex_a8=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_LOCALE=y
BR2_PACKAGE_ICU=y
# BR2_TARGET_ROOTFS_TAR is not set

We have:

    - icu                      : yes

And libboost_locale.so is indeed linked with libicu.

However, the following uclibc-based defconfig builds boost_locale
without ICU, even though ICU is enabled and built before boost:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2018.05.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_LOCALE=y
BR2_PACKAGE_ICU=y
# BR2_TARGET_ROOTFS_TAR is not set

We have:

    - icu                      : no
    - icu (lib64)              : no

If I understand correctly, it tries to detect if ICU is available by
building the program libs/locale/build/has_icu_test.cpp. With the glibc
toolchain:

$ ./host/bin/arm-linux-gnueabihf-g++ -o foo build/boost-1.67.0/libs/locale/build/has_icu_test.cpp -licui18n -licuuc -licudata
$

I.e, it builds fine. With the uClibc toolchain:

$ ./host/bin/arm-linux-g++ -o foo build/boost-1.67.0/libs/locale/build/has_icu_test.cpp -licui18n -licuuc -licudata
... lots and lots of errors about char16_t ...

Issue 2
=======

This is a rather minor issue, but if ICU is available, Boost doesn't
need iconv support to build boost_locale. So probably, we need to change:

	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

into:

	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE && !BR2_PACKAGE_ICU

(and boost.mk to be adjusted accordingly)

Issue 3
=======

In your PATCH 2/2, you remove a lot of select on the chrono module.
Indeed, for example, boost_locale is linked against boost_chrono, but
the Jamfile of boost_locale doesn't describe this dependency, and it's
just because boost_locale -> boost_thread -> boost_chrono that
boost_locale gets linked against boost_chrono.

So I grepped the Boost source code to see which Boost modules directly
use chrono:

find . -name 'Jamfile*' | xargs grep "library.*chrono"

So indeed the log, type erasure, and wave modules don't use chrono
directly. However, the coroutine module does use chrono directly:

./libs/coroutine/performance/asymmetric/segmented/Jamfile.v2:      <library>/boost/chrono//boost_chrono
./libs/coroutine/performance/asymmetric/Jamfile.v2:      <library>/boost/chrono//boost_chrono
./libs/coroutine/performance/symmetric/segmented/Jamfile.v2:      <library>/boost/chrono//boost_chrono
./libs/coroutine/performance/symmetric/Jamfile.v2:      <library>/boost/chrono//boost_chrono

So perhaps BR2_PACKAGE_BOOST_COROUTINE should continue to select
BR2_PACKAGE_BOOST_CHRONO ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
