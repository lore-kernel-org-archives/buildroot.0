From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Aug 2016 22:40:33 +0200
Subject: [Buildroot] Remaining kmsxx build issue
In-Reply-To: <20160824185128.68a2fdef@free-electrons.com>
References: <20160819063024.55AF4101904@stock.ovh.net>
 <20160820000709.0ceef3cd@free-electrons.com>
 <20160819222925.GD6096@free.fr>
 <20160824185128.68a2fdef@free-electrons.com>
Message-ID: <20160824224033.2276f19b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 Aug 2016 18:51:28 +0200, Thomas Petazzoni wrote:

> > There is another type of issues for kmsxx:
> > 
> >     http://autobuild.buildroot.org/results/5e9/5e9963c1f11af40a6349da524fc128116a1d9e6e/build-end.log
> > 
> >     [ 81%] Linking CXX executable ../bin/fbtestpat
> >     /tmp/ccvhwy4u.ltrans0.ltrans.o: In function `main':
> >     <artificial>:(.text.startup+0xa4): undefined reference to `kms::ExtCPUFramebuffer::ExtCPUFramebuffer(unsigned int, unsigned int, kms::PixelFormat, unsigned char*, unsigned int)'
> >     <artificial>:(.text.startup+0xd4): undefined reference to `kms::draw_test_pattern(kms::IMappedFramebuffer&)'
> >     <artificial>:(.text.startup+0x10c): undefined reference to `kms::RGB::RGB(unsigned char, unsigned char, unsigned char)'
> >     <artificial>:(.text.startup+0x128): undefined reference to `kms::draw_text(kms::IMappedFramebuffer&, unsigned int, unsigned int, std::string const&, kms::RGB)'
> >     <artificial>:(.text.startup+0x188): undefined reference to `kms::ExtCPUFramebuffer::~ExtCPUFramebuffer()'
> >     <artificial>:(.text.startup+0x2a8): undefined reference to `kms::ExtCPUFramebuffer::~ExtCPUFramebuffer()'
> >     collect2: error: ld returned 1 exit status
> >     make[3]: *** [bin/fbtestpat] Error 1
> > 
> > And I was not able to reproduce it either... :-/  
> 
> This issue happened only once:
> 
> 	http://autobuild.buildroot.net/?reason=kmsxx-bd5f6471e619a6ba2987bc7f66ef78a531f94d6c
> 
> I've restarted the same build on the same machine, I'll see if it
> happens again.

I've been able to reproduce it on gcc20, and a reduced test case is:

BR2_arm=y
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2016.08-rc1-4-g07e8d1c.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_KMSXX=y

The exact same defconfig builds fine on my laptop.

On gcc20, I'm able to fix the build by disabling LTO support in the
kmsxx CMakeLists.txt file. I.e, I remove:

if (NOT ${U_CMAKE_BUILD_TYPE} MATCHES DEBUG)
    CHECK_CXX_COMPILER_FLAG("-flto" HAS_LTO_FLAG)

    if (HAS_LTO_FLAG)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
        set(CMAKE_AR gcc-ar)
        set(CMAKE_RANLIB gcc-ranlib)
    endif()
endif()

And then the build works.

While I could imagine some LTO-related bug, I cannot understand why
with the exact same toolchain/cross-compiler it builds on my laptop but
not on gcc20.

Completely weird.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
