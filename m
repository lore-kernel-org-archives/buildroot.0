From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 23:45:48 +0200
Subject: [Buildroot] [PATCH] Reduce need for
 BR2_HOSTARCH_NEEDS_IA32_COMPILER
In-Reply-To: <536cdd7b.ATs+iKVatjmU5yNL%chris.lesiak@licor.com>
References: <536cdd7b.ATs+iKVatjmU5yNL%chris.lesiak@licor.com>
Message-ID: <20150422234548.2281a752@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Lesiak,

On Fri, 9 May 2014 08:51:55 -0500, Chris Lesiak wrote:
> Reduce need for BR2_HOSTARCH_NEEDS_IA32_COMPILER
> 
> When building grub and syslinux, the 32-bit host compiler is only
> needed when building for 64-bit target.  For 32-bit targets, the
> target compiler will work.
> 
> This change makes it less likely that a mulilib host is needed.
> 
> Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>

Sorry for the very late answer. Unfortunately, your patch doesn't work
properly with the following defconfig:

BR2_x86_pentium4=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2015.02.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_GRUB=y
BR2_TARGET_SYSLINUX=y

It fails during the syslinux build with:

/home/thomas/projets/buildroot/output/build/syslinux-6.03/bios/core/../lzo/prepcore ldlinux.raw ldlinux.bin
make[4]: /home/thomas/projets/buildroot/output/build/syslinux-6.03/bios/core/../lzo/prepcore: Command not found
/home/thomas/projets/buildroot/output/build/syslinux-6.03/core/Makefile:153: recipe for target 'ldlinux.bin' failed

This is because, using your patch, syslinux gets built with the target
compiler instead of the host compiler. While this generally works, it
doesn't work in the specific case of the prepcore program, which gets
built with the target compiler, but executed on the host. And since I'm
using a uClibc toolchain for the target, the resulting program cannot
run on my glibc based machine.

There is probably a way to adjust the syslinux build process to avoid
this, but I don't know if it's really worth the effort.

I've marked your patch as "Changes Requested". Do not hesitate to
repost an updated version that fixes this problem.

Thanks for your contribution,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
