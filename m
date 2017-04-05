From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 22:25:03 +0200
Subject: [Buildroot] [PATCH v2 1/2] syslinux: Builds with the target
 toolchain
In-Reply-To: <1491398930-6130-1-git-send-email-benoit.allard@greenbone.net>
References: <1491386987-6695-1-git-send-email-benoit.allard@greenbone.net>
 <1491398930-6130-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20170405222503.79f8e645@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Apr 2017 15:28:49 +0200, Beno?t Allard wrote:
> Until now, the host toolchain was used to build syslinux. syslinux does requires gnu-efi, and this is built using the target toolchain. Mixing different toolchains doesn't work well, so let's use the target toolchain for syslinux as well.
> 
> Well, almost, as syslinux also contains some utilities that have to run on the host. Those ones need to be built with the host toolchain.
> 
> This was tested using a buildroot's built x86_64 toolchain, and checked that some output binaries are 32-bits. It was tested as well if they actually boot on Hardware.
> 
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>

Unfortunately, this doesn't build for me: the prepcore tool is built
for the target, but executed on the host. I've intentionally tested
with a x86-64 musl toolchain, so that the C library of the target is
not the one of my host machine, which guarantees a target executable
will not run on my host machine. It fails with:

perl /home/thomas/projets/buildroot/output/build/syslinux-6.03/core/lstadjust.pl ldlinux.lsr ldlinux.sec ldlinux.lst
objcopy -O binary -S ldlinux.elf ldlinux.raw
/home/thomas/projets/buildroot/output/build/syslinux-6.03/bios/core/../lzo/prepcore ldlinux.raw ldlinux.bin
make[5]: /home/thomas/projets/buildroot/output/build/syslinux-6.03/bios/core/../lzo/prepcore: Command not found
/home/thomas/projets/buildroot/output/build/syslinux-6.03/core/Makefile:153: recipe for target 'ldlinux.bin' failed
make[5]: *** [ldlinux.bin] Error 127
rm ldlinux.o ldlinux.raw
/home/thomas/projets/buildroot/output/build/syslinux-6.03/Makefile:285: recipe for target 'core' failed
make[4]: *** [core] Error 2
/home/thomas/projets/buildroot/output/build/syslinux-6.03/Makefile:254: recipe for target 'bios' failed
make[3]: *** [bios] Error 2
Makefile:103: recipe for target 'bios' failed
make[2]: *** [bios] Error 2

To reproduce this issue, build the following configuration:

BR2_x86_64=y
BR2_x86_atom=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2017.02-744-g40962a0.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_SYSLINUX=y
BR2_TARGET_SYSLINUX_ISOLINUX=y
BR2_TARGET_SYSLINUX_PXELINUX=y
BR2_TARGET_SYSLINUX_MBR=y

Also, I've done a number of improvements to your patch, so if you could
restart from the version I was about to commit before seeing the issue,
it would be nice. I pushed it at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/commit/?h=syslinux-fix

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
