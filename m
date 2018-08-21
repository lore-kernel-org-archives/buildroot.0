From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 21 Aug 2018 22:48:27 +0200
Subject: [Buildroot] [PATCH v1] qt5base: fix double conversion for
 microblazeel/microblazebe
In-Reply-To: <20180821222802.012ef423@windsurf>
References: <20180821201617.20231-1-ps.report@gmx.net>
 <20180821222802.012ef423@windsurf>
Message-ID: <20180821224827.1cf71c6a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 21 Aug 2018 22:28:02 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Tue, 21 Aug 2018 22:16:17 +0200, Peter Seiderer wrote:
> > Fixes [1]:
> > 
> >   ../3rdparty/double-conversion/include/double-conversion/utils.h:81:2: error: #error Target architecture was not detected as supported by Double-Conversion.
> >   #error Target architecture was not detected as supported by Double-Conversion.
> > 
> > [1] http://autobuild.buildroot.net/results/489/4891d96f45c64c2e66fe819bd4175cc1d6243a93
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> 
> Thanks for working on this again. Can you submit your or1k and
> microblaze changes back to the upstream double-conversion project (and
> perhaps also Qt5) ?

Upstream done already, see https://github.com/google/double-conversion/issues/73
For Qt5 I would hope for an double-conversion update (or porting back the
future double-conversion upstream patch)...
> 
> > For microblazeel (using qemu_microblazeel_mmu_defconfig changed to musl
> > because the original uclibc resulted in 'mmap of a spare page failed!'
> > error message):  
> 
> This uClibc issue is something for Waldemar. I'm personally still a bit
> impressed by the magic of qemu user mode emulation.
> 
> > 	$ ./build_qemu_microblazeel_001/host/bin/microblazeel-buildroot-linux-musl-gcc -c main.c
> > 	$ ./build_qemu_microblazeel_001/host/bin/microblazeel-buildroot-linux-musl-gcc -c div.c
> > 	$ ./build_qemu_microblazeel_001/host/bin/microblazeel-buildroot-linux-musl-gcc -o main main.o div.o
> > 
> > Fix wrong staging absolute soft link to relative:
> > 	$ ls -l build_qemu_microblazeel_001/staging/lib/ld-musl-microblazeel.so.1
> > ../staging/lib/ld-musl-microblazeel.so.1 -> /lib/libc.so
> > 	$ rm build_qemu_microblazeel_001/staging/lib/ld-musl-microblazeel.so.1
> > 	$ ln -s libc.so build_qemu_microblazeel_001/staging/lib/ld-musl-microblazeel.so.1  
> 
> That's weird, I have a musl toolchain here (installed from an external
> toolchain), and its symlink is relative:
> 
> $ ls -l output/staging/lib/{ld-musl*,libc.so}
> lrwxrwxrwx 1 thomas thomas     14 Aug 21 22:14 output/staging/lib/ld-musl-armhf.so.1 -> ../lib/libc.so
> -rwxr-xr-x 1 thomas thomas 740772 Jun 26 00:08 output/staging/lib/libc.so

Double checked here (on buildroot git master b1db9038ddaf89c4abf69e17993eb13646da7e8d)
on 'openSUSE Tumbleweed-20180808':

	$ make clean
	$ make savedefconfig
	$ cat defconfig
BR2_microblazeel=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
BR2_SYSTEM_DHCP="eth0"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
BR2_LINUX_KERNEL_LINUX_BIN=y
BR2_TARGET_ROOTFS_INITRAMFS=y
# BR2_TARGET_ROOTFS_TAR is not set

	$ make
	$ ls -l staging/lib/{ld-musl*,libc.so}
lrwxrwxrwx 1 seiderer users      12 21. Aug 22:36 staging/lib/ld-musl-microblazeel.so.1 -> /lib/libc.so
-rwxr-xr-x 1 seiderer users 1096148 21. Aug 22:36 staging/lib/libc.so

Regards,
Peter

> 
> Applied to master. Thanks!
> 
> Thomas
