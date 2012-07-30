From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 21:16:16 +0200
Subject: [Buildroot] [PATCHv4 0/6] Add some support for device tree
 kernels
In-Reply-To: <1343651569-6450-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1343651569-6450-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20120730211616.424941a8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 30 Jul 2012 14:32:43 +0200,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

> This is a refactoring of the previous basic device tree
> options available for microblaze.

I am fine with the general design, but it doesn't work: the
qemu_microblazeel_defconfig doesn't build.

I had to make some changes:

 *) Change the defconfig to limit the number of modifications compared
    to the previous versions (keep architecture, toolchain, etc.)
    properties.

 *) Create a special kconfig entry for the linux.bin image format
    (Microblaze specific). This format requires mkimage to generate
    linux.bin, so we need to select BR2_LINUX_KERNEL_UBOOT_IMAGE. It
    probably worked on your system because you have mkimage installed
    system-wide, but since it isn't part of our required dependencies,
    you shouldn't rely on it.

However, even with those fixes, building the DTB doesn't work.
Apparently, system.dts/system.dtb are kind of "reserved" names for
Microblaze (from a quick reading of arch/microblaze/boot/Makefile). I
have the following build error:

Kernel: arch/microblaze/boot/linux.bin is ready  (#1)
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  Building modules, stage 2.
  MODPOST 0 modules
PATH="/home/test/outputs/t/host/bin:/home/test/outputs/t/host/usr/bin:/home/test/outputs/t/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/games" PERLLIB="/home/test/outputs/t/host/usr/lib/perl" /usr/bin/make -j2 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=microblaze INSTALL_MOD_PATH=/home/test/outputs/t/target CROSS_COMPILE=" /home/test/outputs/t/host/usr/bin/microblazeel-unknown-linux-gnu-" DEPMOD=/home/test/outputs/t/host/usr/sbin/depmod -C /home/test/outputs/t/build/linux-3.3.7 system.dtb
make[2]: *** No rule to make target `system.dtb'.  Stop.
make[1]: *** [/home/test/outputs/t/build/linux-3.3.7/.stamp_built] Error 2
make: *** [all] Error 2

It would be good if you could fix this problem and resubmit. Please
base your new work using the following branch, which includes the two
changes I've mentioned above:

http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=device-tree-support

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
