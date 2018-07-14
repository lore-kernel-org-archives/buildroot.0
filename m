From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Jul 2018 23:05:47 +0200
Subject: [Buildroot] [PATCH 1/1] boost: thread needs atomic if GCC has
 bug 64735
In-Reply-To: <20180713173026.2389-1-fontaine.fabrice@gmail.com>
References: <20180713173026.2389-1-fontaine.fabrice@gmail.com>
Message-ID: <20180714230547.0677413c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 13 Jul 2018 19:30:26 +0200, Fabrice Fontaine wrote:
> When gcc has bug 64735, lock-free atomic ints are not supported:
>  - lockfree boost::atomic_flag : no
> 
> As a result, boost thread needs boost atomic:
> output/host/usr/bin/nios2-linux-readelf -d output/staging/usr/lib/libboost_thread.so
> 
> Dynamic section at offset 0x2cee0 contains 32 entries:
>   Tag        Type                         Name/Value
>  0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]
>  0x00000001 (NEEDED)                     Shared library: [libboost_atomic.so.1.67.0]
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/5a7db292f1365f27e32695527701d5b827f60092
>  - http://autobuild.buildroot.net/results/413dff87f5329d3c5180167a8711cdedea5dec67
>  - http://autobuild.buildroot.net/results/a7eb4cbcdbd9412c344f45336dec58c82e84dab9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

You'll probably find me annoying, but I'd like to have more details on
how this is related to BR2_TOOLCHAIN_HAS_GCC_BUG_64735.

I looked into the Boost build system a bit, and here is what I
collected.

In libs/thread/build/Jamfile.v2, there is the following snippet:

        if ! [ configure.builds has_atomic_flag_lockfree 
            : $(properties) : "lockfree boost::atomic_flag" ]  { 
           result += <library>/boost/atomic//boost_atomic ; 
        } 

So, the boost_atomic library gets added to the build if
has_atomic_flag_lockfree isn't set. This macro is set by this line in
the same file:

exe has_atomic_flag_lockfree : ../build/has_atomic_flag_lockfree_test.cpp ;

So presumably, it builds has_atomic_flag_lockfree_test.cpp, and
depending on that decides if atomic_flag_lockfree is available or not.
This ./libs/thread/build/has_atomic_flag_lockfree_test.cpp file contains:


#include "../../../boost/atomic.hpp"
#include "../../../boost/static_assert.hpp"

int main(int argc, char *argv[])
{
  BOOST_STATIC_ASSERT(BOOST_ATOMIC_FLAG_LOCK_FREE);
  return 0;
}

So basically, it tests if BOOST_ATOMIC_FLAG_LOCK_FREE is non-zero. And
then, things get crazy, because the definition of
BOOST_ATOMIC_FLAG_LOCK_FREE depends on lots of other macros.

But to me, there is no evidence that this is related to gcc bug 64735.

To illustrate this, you can build the following defconfig. It uses a
gcc 8.x NIOS2 toolchain, which is not affected by
BR2_TOOLCHAIN_HAS_GCC_BUG_64735, and still libboost_thread implies
building libboost_atomic. Therefore, the problem is not related to
BR2_TOOLCHAIN_HAS_GCC_BUG_64735 :-/

BR2_nios2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/nios2/tarballs/nios2--glibc--bleeding-edge-2018.06-1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_THREAD=y
# BR2_TARGET_ROOTFS_TAR is not set

Best regads,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
