From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 15 Mar 2015 22:36:45 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-02-13
In-Reply-To: <20150315142822.2e018813@free-electrons.com>
References: <20150214073013.E7748101008@stock.ovh.net>
 <20150214224243.47b77b67@free-electrons.com>
 <20150215173009.GK32479@waldemar-brodkorb.de>
 <20150315142822.2e018813@free-electrons.com>
Message-ID: <20150315213644.GC28815@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Dear Waldemar Brodkorb,
> 
> On Sun, 15 Feb 2015 18:30:10 +0100, Waldemar Brodkorb wrote:
> 
> > I just build a sh4 toolchain with uClibc 0.9.33.2. No issues.
> 
> [...]
> 
> > What is the exact problem?
> 
> I just tried again today, on Buildroot 2015.02 official, with the
> following defconfig:
> 
> BR2_sh=y
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_INIT_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> The toolchain build fails with:
> if [ ! -e /opt/br-sh4-full-2015.02/usr/bin/sh4-buildroot-linux-uclibc-cc ]; then ln -snf sh4-buildroot-linux-uclibc-gcc /opt/br-sh4-full-2015.02/usr/bin/sh4-buildroot-linux-uclibc-cc; fi
> if [ ! -e /opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/bin/cc ]; then ln -snf gcc /opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/bin/cc; fi
> (cd /opt/br-sh4-full-2015.02/usr/bin; for i in sh4-buildroot-linux-uclibc-*; do ln -snf $i sh4-linux${i##sh4-buildroot-linux-uclibc}; done)
> cp -dpf /opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/lib*/libgcc_s* /opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/sysroot/lib/
> cp: cannot stat `/opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/lib*/libgcc_s*': No such file or directory
> make: [/opt/toolchain-build/build/host-gcc-final-4.8.4/.stamp_host_installed] Error 1 (ignored)
> cp -dpf /opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/lib*/libgcc_s* /opt/toolchain-build/target/lib/
> cp: cannot stat `/opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/lib*/libgcc_s*': No such file or directory
> make: [/opt/toolchain-build/build/host-gcc-final-4.8.4/.stamp_host_installed] Error 1 (ignored)
> mkdir -p /opt/toolchain-build/target/usr/lib
> for i in  libstdc++ ; do cp -dpf /opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/lib*/${i}.a /opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/sysroot/usr/lib/ ; done
> cp: cannot stat `/opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/lib*/libstdc++.a': No such file or directory
> make: *** [/opt/toolchain-build/build/host-gcc-final-4.8.4/.stamp_host_installed] Error 1
> make: Leaving directory `/home/test/toolchains/build/buildroot'
> 
> It's because libgcc_s is in a directory named after the multilib
> variant, since sh4 toolchain builds are multilib, as far as I
> understand.
> 
> Any idea?

If you want to create a sh4 toolchain, which is usable to compile a
Linux Kernel you need to enable multilib support so that the
toolchain can be used to compile fpu/non-fpu code.
If you use make qemu_sh4_r2d_defconfig, then following option is
enabled:
BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
This works fine and the result boots up fine in Qemu.

Your defconfig does not generate a multilib toolchain.
The compiler still generates
br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/lib/!m4/libgcc_s.so
which is not matched by your globbing in
package/gcc/gcc-final/gcc-final.mk ->
$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s*

The sh4 stuff was already discussed last year by you:
http://lists.busybox.net/pipermail/buildroot/2014-March/091385.html

The patch will work fine.

I think defaulting to multilib toolchain for sh4 would be a good
thing. We do not need the nofpu libgcc on the target.

best regards
 Waldemar
