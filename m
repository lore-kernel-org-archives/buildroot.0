From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Nov 2014 19:02:04 +0100
Subject: [Buildroot] Need help getting started with X11
In-Reply-To: <CAEzGmjCgWSX0BGBsRFG-MVpbQ67r5Dkv4Mbhj6x6FQotgQxSdg@mail.gmail.com>
References: <CAEzGmjByqb2QB4+-QDOcJYDo6zvD+UpkG9kaNmBzBHKMFaGDJg@mail.gmail.com>
 <20141124210722.49239966@free-electrons.com>
 <CAEzGmjCgWSX0BGBsRFG-MVpbQ67r5Dkv4Mbhj6x6FQotgQxSdg@mail.gmail.com>
Message-ID: <20141125190204.2eaaff83@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lennart Ramberg,

On Tue, 25 Nov 2014 11:50:25 +0100, Lennart Ramberg wrote:

> At first all was well, at least the screen went black, X was visible in top
> and I could get out with Ctrl-c.
> So far so good.
> Then I recalled that I had not done 'make'.
> So I did make, but a bug(?) stopped further advancements.
> I don't know how to file a bug report, but maybe the below is of use (I
> figure next stable release is imminent).
> 
> Regards
> Lennart
> 
> First my new defconfig:
> 
> BR2_x86_i686=y
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> # BR2_TARGET_GENERIC_GETTY is not set
> BR2_ROOTFS_OVERLAY="board/eta/board1/rootfs-overlay/"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_DEFCONFIG="i386"
> BR2_LINUX_KERNEL_INSTALL_TARGET=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XSERVER_XORG_SERVER=y
> BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
> BR2_PACKAGE_XAPP_TWM=y
> BR2_PACKAGE_XAPP_XINIT=y
> BR2_PACKAGE_XAPP_XWD=y
> BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y
> BR2_PACKAGE_MCOOKIE=y
> BR2_PACKAGE_PYTHON=y
> BR2_PACKAGE_SQLITE=y
> BR2_PACKAGE_CAIRO=y
> BR2_PACKAGE_LIBCURL=y
> BR2_PACKAGE_NTP=y
> BR2_PACKAGE_OPENSSH=y
> BR2_PACKAGE_SUPERVISOR=y
> BR2_PACKAGE_NANO=y
> # BR2_PACKAGE_NANO_TINY is not set
> BR2_TARGET_ROOTFS_EXT2=y
> BR2_TARGET_ROOTFS_EXT2_BLOCKS=1000000
> BR2_TARGET_GRUB2=y
> 
> I had done a 'git pull' earlier today. Then, just now, a 'make' once before
> the below 'make':
> 
> lennart at lennart-Latitude-E6520 ~/buildroot $ make
> /usr/bin/make -j1  HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++"
> silentoldconfig
> make[1]: Entering directory `/home/lennart/buildroot'
> BR2_DEFCONFIG=''
> KCONFIG_AUTOCONFIG=/home/lennart/buildroot/output/build/buildroot-config/auto.conf
> KCONFIG_AUTOHEADER=/home/lennart/buildroot/output/build/buildroot-config/autoconf.h
> KCONFIG_TRISTATE=/home/lennart/buildroot/output/build/buildroot-config/tristate.config
> BR2_CONFIG=/home/lennart/buildroot/.config
> BR2_EXTERNAL=support/dummy-external
> /home/lennart/buildroot/output/build/buildroot-config/conf
> --silentoldconfig Config.in
> make[1]: Leaving directory `/home/lennart/buildroot'
> >>> eudev 1.9 Building
> PATH="/home/lennart/buildroot/output/host/bin:/home/lennart/buildroot/output/host/sbin:/home/lennart/buildroot/output/host/usr/bin:/home/lennart/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
> /usr/bin/make -j9  -C /home/lennart/buildroot/output/build/eudev-1.9/
> make[1]: Entering directory `/home/lennart/buildroot/output/build/eudev-1.9'
> /usr/bin/make  all-recursive
> make[2]: Entering directory `/home/lennart/buildroot/output/build/eudev-1.9'
> Making all in src
> make[3]: Entering directory
> `/home/lennart/buildroot/output/build/eudev-1.9/src'
> Making all in libudev
> make[4]: Entering directory
> `/home/lennart/buildroot/output/build/eudev-1.9/src/libudev'
> make[4]: Nothing to be done for `all'.
> make[4]: Leaving directory
> `/home/lennart/buildroot/output/build/eudev-1.9/src/libudev'
> Making all in udev
> make[4]: Entering directory
> `/home/lennart/buildroot/output/build/eudev-1.9/src/udev'
> /usr/bin/make  all-am
> make[5]: Entering directory
> `/home/lennart/buildroot/output/build/eudev-1.9/src/udev'
> make[5]: Nothing to be done for `all-am'.
> make[5]: Leaving directory
> `/home/lennart/buildroot/output/build/eudev-1.9/src/udev'
> make[4]: Leaving directory
> `/home/lennart/buildroot/output/build/eudev-1.9/src/udev'
> Making all in accelerometer
> make[4]: Entering directory
> `/home/lennart/buildroot/output/build/eudev-1.9/src/accelerometer'
> make[4]: Nothing to be done for `all'.
> make[4]: Leaving directory
> `/home/lennart/buildroot/output/build/eudev-1.9/src/accelerometer'
> Making all in ata_id
> make[4]: Entering directory
> `/home/lennart/buildroot/output/build/eudev-1.9/src/ata_id'
>   CC       ata_id.o
> ata_id.c:35:23: fatal error: scsi/scsi.h: No such file or directory
>  #include <scsi/scsi.h>
>                        ^
> compilation terminated.

This seems weird because <scsi/scsi.h> is part of the C library. Can
you do a full rebuild, i.e "make clean all", and see if you can
reproduce the problem.

Beware that when you update Buildroot or you make certain changes to
the configuration, you need to do a full rebuild. See
http://buildroot.org/downloads/manual/manual.html#full-rebuild for more
details.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
