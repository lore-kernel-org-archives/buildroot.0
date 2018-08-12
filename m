From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 12 Aug 2018 18:26:18 +0200
Subject: [Buildroot] [PATCH 1/1] boost: thread needs atomic if GCC has
 bug 64735
In-Reply-To: <20180728225305.62561b58@windsurf>
References: <20180713173026.2389-1-fontaine.fabrice@gmail.com>
 <20180714230547.0677413c@windsurf> <20180728225305.62561b58@windsurf>
Message-ID: <CAPi7W822C9oS2gHoueaWfYAgyxUWw9UpFaqErDSO9H65BSwN1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2018-07-28 22:53 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello Fabrice,
>
> Have you had the chance to look into the below issue and questions ?
> boost is now the #1 failure reason in the autobuilders, so it is
> becoming important to fix it soon.
>
> Thanks!
>
> Thomas
>
> On Sat, 14 Jul 2018 23:05:47 +0200, Thomas Petazzoni wrote:
> > Hello Fabrice,
> >
> > On Fri, 13 Jul 2018 19:30:26 +0200, Fabrice Fontaine wrote:
> > > When gcc has bug 64735, lock-free atomic ints are not supported:
> > >  - lockfree boost::atomic_flag : no
> > >
> > > As a result, boost thread needs boost atomic:
> > > output/host/usr/bin/nios2-linux-readelf -d
> output/staging/usr/lib/libboost_thread.so
> > >
> > > Dynamic section at offset 0x2cee0 contains 32 entries:
> > >   Tag        Type                         Name/Value
> > >  0x00000001 (NEEDED)                     Shared library:
> [libboost_system.so.1.67.0]
> > >  0x00000001 (NEEDED)                     Shared library:
> [libboost_atomic.so.1.67.0]
> > >
> > > Fixes:
> > >  - http://autobuild.buildroot.net/results/5a7db292f1365f27e3269
> 5527701d5b827f60092
> > >  - http://autobuild.buildroot.net/results/413dff87f5329d3c51801
> 67a8711cdedea5dec67
> > >  - http://autobuild.buildroot.net/results/a7eb4cbcdbd9412c344f4
> 5336dec58c82e84dab9
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >
> > You'll probably find me annoying, but I'd like to have more details on
> > how this is related to BR2_TOOLCHAIN_HAS_GCC_BUG_64735.
> >
> > I looked into the Boost build system a bit, and here is what I
> > collected.
> >
> > In libs/thread/build/Jamfile.v2, there is the following snippet:
> >
> >         if ! [ configure.builds has_atomic_flag_lockfree
> >             : $(properties) : "lockfree boost::atomic_flag" ]  {
> >            result += <library>/boost/atomic//boost_atomic ;
> >         }
> >
> > So, the boost_atomic library gets added to the build if
> > has_atomic_flag_lockfree isn't set. This macro is set by this line in
> > the same file:
> >
> > exe has_atomic_flag_lockfree : ../build/has_atomic_flag_lockfree_test.cpp
> ;
> >
> > So presumably, it builds has_atomic_flag_lockfree_test.cpp, and
> > depending on that decides if atomic_flag_lockfree is available or not.
> > This ./libs/thread/build/has_atomic_flag_lockfree_test.cpp file
> contains:
> >
> >
> > #include "../../../boost/atomic.hpp"
> > #include "../../../boost/static_assert.hpp"
> >
> > int main(int argc, char *argv[])
> > {
> >   BOOST_STATIC_ASSERT(BOOST_ATOMIC_FLAG_LOCK_FREE);
> >   return 0;
> > }
> >
> > So basically, it tests if BOOST_ATOMIC_FLAG_LOCK_FREE is non-zero. And
> > then, things get crazy, because the definition of
> > BOOST_ATOMIC_FLAG_LOCK_FREE depends on lots of other macros.
>
I dig a little bit in boost code.
From my understanding, BOOST_ATOMIC_FLAG_LOCK_FREE is set to
BOOST_ATOMIC_INT8_LOCK_FREE (see boost/atomic/capabilities.hpp):

#ifndef BOOST_ATOMIC_BOOL_LOCK_FREE
// We store bools in 1-byte storage in all backends
#define BOOST_ATOMIC_BOOL_LOCK_FREE BOOST_ATOMIC_INT8_LOCK_FREE
#endif

#ifndef BOOST_ATOMIC_FLAG_LOCK_FREE
#define BOOST_ATOMIC_FLAG_LOCK_FREE BOOST_ATOMIC_BOOL_LOCK_FREE
#endif

Moreover, BOOST_ATOMIC_INT8_LOCK_FREE is set to 0 (disabled) by default.
boost defines this value to 2 (enabled) depending on the architecture /
compiler / os by including the correct caps_xxx file:

#if !defined(BOOST_ATOMIC_EMULATED)
#include BOOST_ATOMIC_DETAIL_BACKEND_HEADER(boost/atomic/detail/caps_)
#endif

The last file to check is boost/atomic/detail/platform.hpp.
boost will try to find if gcc supports atomic by checking if one of
_GCC_ATOMIC_xxx_LOCK_FREE is set to 2.
If this is not the case, it will try to find it depending on the
architecture (x86, arm, ppc, sparcv8plus, sparc_v9, etc ...).
Finally, it will check for __GCC_HAVE_SYNC_COMPARE_AND_SWAP_xxx.

However with the toolchain you provided below, __GCC_ATOMIC_xxx_LOCK_FREE
are all set to 1 (and not 2) and __GCC_HAVE_SYNC_COMPARE_AND_SWAP_xxx are
all undefined (see output of output/host/bin/nios2-linux-gcc -dM -E - <
/dev/null|sort).
As a result, boost does not define BOOST_ATOMIC_DETAIL_BACKEND and
libboost_atomic is selected.

So I don't know what is the right fix. It seems that
BR2_TOOLCHAIN_HAS_SYNC_4 is set to yes even if
__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 is not defined in gcc so I can't add a
dependency to it.

A quick and probably dirty fix would be to select boost atomic for nios2,
m68k, sparcv8 and any other architectures that are "unknown" to boost.
I would be happy to get your feedback.

>
> > But to me, there is no evidence that this is related to gcc bug 64735.
> >
> > To illustrate this, you can build the following defconfig. It uses a
> > gcc 8.x NIOS2 toolchain, which is not affected by
> > BR2_TOOLCHAIN_HAS_GCC_BUG_64735, and still libboost_thread implies
> > building libboost_atomic. Therefore, the problem is not related to
> > BR2_TOOLCHAIN_HAS_GCC_BUG_64735 :-/
> >
> > BR2_nios2=y
> > BR2_TOOLCHAIN_EXTERNAL=y
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> > BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> > BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/do
> wnloads/releases/toolchains/nios2/tarballs/nios2--glibc--ble
> eding-edge-2018.06-1.tar.bz2"
> > BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> > BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
> > BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> > BR2_TOOLCHAIN_EXTERNAL_CXX=y
> > BR2_INIT_NONE=y
> > BR2_SYSTEM_BIN_SH_NONE=y
> > # BR2_PACKAGE_BUSYBOX is not set
> > BR2_PACKAGE_BOOST=y
> > BR2_PACKAGE_BOOST_THREAD=y
> > # BR2_TARGET_ROOTFS_TAR is not set
> >
> > Best regads,
> >
> > Thomas
>
>
>
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180812/e0aaf48a/attachment.html>
