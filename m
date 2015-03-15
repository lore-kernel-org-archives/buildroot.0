From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 14:28:22 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-02-13
In-Reply-To: <20150215173009.GK32479@waldemar-brodkorb.de>
References: <20150214073013.E7748101008@stock.ovh.net>
 <20150214224243.47b77b67@free-electrons.com>
 <20150215173009.GK32479@waldemar-brodkorb.de>
Message-ID: <20150315142822.2e018813@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sun, 15 Feb 2015 18:30:10 +0100, Waldemar Brodkorb wrote:

> I just build a sh4 toolchain with uClibc 0.9.33.2. No issues.

[...]

> What is the exact problem?

I just tried again today, on Buildroot 2015.02 official, with the
following defconfig:

BR2_sh=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set

The toolchain build fails with:

if [ ! -e /opt/br-sh4-full-2015.02/usr/bin/sh4-buildroot-linux-uclibc-cc ]; then ln -snf sh4-buildroot-linux-uclibc-gcc /opt/br-sh4-full-2015.02/usr/bin/sh4-buildroot-linux-uclibc-cc; fi
if [ ! -e /opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/bin/cc ]; then ln -snf gcc /opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/bin/cc; fi
(cd /opt/br-sh4-full-2015.02/usr/bin; for i in sh4-buildroot-linux-uclibc-*; do ln -snf $i sh4-linux${i##sh4-buildroot-linux-uclibc}; done)
cp -dpf /opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/lib*/libgcc_s* /opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/sysroot/lib/
cp: cannot stat `/opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/lib*/libgcc_s*': No such file or directory
make: [/opt/toolchain-build/build/host-gcc-final-4.8.4/.stamp_host_installed] Error 1 (ignored)
cp -dpf /opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/lib*/libgcc_s* /opt/toolchain-build/target/lib/
cp: cannot stat `/opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/lib*/libgcc_s*': No such file or directory
make: [/opt/toolchain-build/build/host-gcc-final-4.8.4/.stamp_host_installed] Error 1 (ignored)
mkdir -p /opt/toolchain-build/target/usr/lib
for i in  libstdc++ ; do cp -dpf /opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/lib*/${i}.a /opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/sysroot/usr/lib/ ; done
cp: cannot stat `/opt/br-sh4-full-2015.02/usr/sh4-buildroot-linux-uclibc/lib*/libstdc++.a': No such file or directory
make: *** [/opt/toolchain-build/build/host-gcc-final-4.8.4/.stamp_host_installed] Error 1
make: Leaving directory `/home/test/toolchains/build/buildroot'

It's because libgcc_s is in a directory named after the multilib
variant, since sh4 toolchain builds are multilib, as far as I
understand.

Any idea?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
