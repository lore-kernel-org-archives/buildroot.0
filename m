From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 21:28:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: patch ping to link
 against libm
In-Reply-To: <20160216190329.GO14809@waldemar-brodkorb.de>
References: <1455541206-18200-1-git-send-email-martin@barkynet.com>
 <20160215231703.2052c7e0@free-electrons.com>
 <20160216190329.GO14809@waldemar-brodkorb.de>
Message-ID: <20160216212804.7a56f3a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Feb 2016 20:03:29 +0100, Waldemar Brodkorb wrote:

> The root of the problem is rather simple. When you use math library
> functions you are required to link libm explicitely. I think for
> historical reasons. For musl this is no issue as everything is
> included in libc.so. In uClibc world you have the choice and could simply
> build a system without any math library. 
> GNU libc seems to have weak aliases for finitef even in libc.so:
> nm output/build/glibc-2.22/build/libc.so|grep finitef                                                                                                      
> 0002ba9c W finitef
> 0002ba9c T __finitef
> 0002ba9c t __GI___finitef
> 
> So linking with GNU libc does not fail for iputils even without -lm.
> 
> Not sure, I cannot find every libm function, but some. tgamma or
> exp10 is not referenced in libc.so.
> 
> May be Mike can explain the Glibc behaviour?
> 
> The finite macros where added here:
> http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/include/math.h?id=21902b578e96fd6b85b9bcda8a0e929fc844ec51
> So 1.0.10 is the first release containing this BSD specific
> functions in a usable way.
> 
> I think BR2_*DEBUG* option is not related to this error.

OK, but how do you explain that:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.11-rc1-71-g90d1299.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_IPUTILS=y
# BR2_TARGET_ROOTFS_TAR is not set

Builds just fine (and uses uClibc 1.0.9) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
