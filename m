From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 8 Jul 2015 14:33:36 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-06-28
In-Reply-To: <20150708142953.7c615412@free-electrons.com>
References: <20150629063017.4326F10013E@stock.ovh.net>
 <1436194278.3246.42.camel@synopsys.com>
 <20150706174356.6d6471c9@free-electrons.com>
 <1436357726.3043.10.camel@synopsys.com>
 <20150708142953.7c615412@free-electrons.com>
Message-ID: <1436366016.3043.22.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2015-07-08 at 14:29 +0200, Thomas Petazzoni wrote:
> I have changed
> http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config
> just yesterday. You're using the new version, I was using the previous
> version. Try again with this defconfig, and you will see the build
> succeed:
> 
> BR2_arm=y
> BR2_arm1176jzf_s=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2015.05.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_0=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_EMPTY=y

Ok I now see the difference.

[1] Toolchain that builds "empty" successfully is based on uClibc-0.9.33.2
which simply doesn't have "uClibc_posix_opt.h" where _POSIX_SEMAPHORES
is undefed in more recent versions of uClibc be it uClibc-ng or up to date uClibc
(tip of upstream uClibc's master branch in case of ARC).

See commit that happened 1 month after 0.9.33.2 was cut:
http://git.uclibc.org/uClibc/commit/libc/sysdeps/linux/common/bits/uClibc_posix_opt.h?id=2389017f787dd51e11e697c448071ec
dd217169a

In that commit "uClibc_posix_opt.h" was introduced and since then "empty"
won't built without threads.

Mystery solved? :)

-Alexey
