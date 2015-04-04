From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 19:44:15 +0200
Subject: [Buildroot] [PATCH] sh4: fix toolchain creation
In-Reply-To: <20150320182214.GA3086@waldemar-brodkorb.de>
References: <20150320182214.GA3086@waldemar-brodkorb.de>
Message-ID: <20150404194415.406fe195@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Fri, 20 Mar 2015 19:22:15 +0100, Waldemar Brodkorb wrote:
> The Linux kernel does force compile with -m4-nofpu, which is only
> available when building a multilib toolchain.
> The interesting part here is, that buildroot use --disable-multilib for
> gcc configure, but enables --with-multilib-list=m4,m4-nofpu in
> the default configuration for Qemu targeting r2d emulation.
> This results in a toolchain, which can be used for the kernel and
> for userland without creating a multilib toolchain with different
> kinds of libgcc version. In the multilib case there would be some
> subdirectories created like !m4 or m4-nofpu. As buildroot uses a
> short version of toolchain creation, a multilib enabled gcc build
> fails when creating libgcc.
> 
> So the best solution is to just keep multilib disabled, but always
> add --with-multilib-list=m4,m4-nofpu when sh4/sh4eb is choosen.
> 
> Tested with sh4 minimal toolchain build and qemu defconfig with
> gcc 4.8.x and uClibc.
> 
> To sum up, compiling gcc with disabled multilib, but with a mulitlib-list
> provides a working toolchain which can create sh4 nofpu code without trying to
> create a libgcc for every variant.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

It still doesn't build here. Maybe it worked for you because you did
not enable C++ support. Here is the defconfig I test:

BR2_sh=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="se7724"

It fails as follows:

(cd /home/test/outputs/sh4/host/usr/bin; for i in sh4-buildroot-linux-uclibc-*; do ln -snf $i sh4-linux${i##sh4-buildroot-linux-uclibc}; done)
cp -dpf /home/test/outputs/sh4/host/usr/sh4-buildroot-linux-uclibc/lib*/libgcc_s* /home/test/outputs/sh4/host/usr/sh4-buildroot-linux-uclibc/sysroot/lib/
cp: cannot stat `/home/test/outputs/sh4/host/usr/sh4-buildroot-linux-uclibc/lib*/libgcc_s*': No such file or directory
make[1]: [/home/test/outputs/sh4/build/host-gcc-final-4.8.4/.stamp_host_installed] Error 1 (ignored)
cp -dpf /home/test/outputs/sh4/host/usr/sh4-buildroot-linux-uclibc/lib*/libgcc_s* /home/test/outputs/sh4/target/lib/
cp: cannot stat `/home/test/outputs/sh4/host/usr/sh4-buildroot-linux-uclibc/lib*/libgcc_s*': No such file or directory
make[1]: [/home/test/outputs/sh4/build/host-gcc-final-4.8.4/.stamp_host_installed] Error 1 (ignored)
mkdir -p /home/test/outputs/sh4/target/usr/lib
for i in  libstdc++ ; do cp -dpf /home/test/outputs/sh4/host/usr/sh4-buildroot-linux-uclibc/lib*/${i}.a /home/test/outputs/sh4/host/usr/sh4-buildroot-linux-uclibc/sysroot/usr/lib/ ; done
cp: cannot stat `/home/test/outputs/sh4/host/usr/sh4-buildroot-linux-uclibc/lib*/libstdc++.a': No such file or directory
make[1]: *** [/home/test/outputs/sh4/build/host-gcc-final-4.8.4/.stamp_host_installed] Error 1
make: *** [_all] Error 2

Also, what about sh4a and sh4aeb ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
