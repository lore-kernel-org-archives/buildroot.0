From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 23:55:30 +0200
Subject: [Buildroot] Syslinux change breaks the build with old binutils
Message-ID: <20170701235530.00720756@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Beno?t,

In commit 6e432d5ecb46959f3c27dbbca48e41512bb40a70 ("syslinux: build
with the target toolchain"), you added one patch that adds the
--no-dynamic-linker option to the ld options. Unfortunately, it turns
out such an option doesn't exist in older toolchains, such as
toolchains based on binutils 2.24:

/home/thomas/projets/buildroot/output/host/usr/bin/i686-linux-ld: unrecognized option '--no-dynamic-linker'
/home/thomas/projets/buildroot/output/host/usr/bin/i686-linux-ld: use the --help option for usage information
/home/thomas/projets/buildroot/output/build/syslinux-6.03/core/Makefile:167: recipe for target 'ldlinux.elf' failed

You can reproduce the problem using this defconfig:

BR2_x86_pentium4=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2015.05-496-g85945aa.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
BR2_TARGET_SYSLINUX=y
BR2_TARGET_SYSLINUX_ISOLINUX=y
BR2_TARGET_SYSLINUX_EFI=y

This --no-dynamic-linker option is added by
boot/syslinux/0003-Fix-ldlinux.elf-Not-enough-room-for-program-headers-.patch,
which you added in commit 6e432d5ecb46959f3c27dbbca48e41512bb40a70.

However, interestingly, I am no longer able to reproduce the "Not
enough room for program headers", even with a modern toolchain. Is it
possible that the gnu-efi update has fixed the problem?

Could you investigate this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
