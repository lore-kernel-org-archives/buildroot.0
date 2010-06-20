From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 20 Jun 2010 08:34:57 -0500
Subject: [Buildroot] Storing board configuration ?
In-Reply-To: <000c01cb1079$ed7276a0$c85763e0$@pauljones.id.au>
References: <20100620143535.38416ef6@surf>
	<000c01cb1079$ed7276a0$c85763e0$@pauljones.id.au>
Message-ID: <201006200834.59189.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun June 20 2010, Paul Jones wrote:
> > -----Original Message-----
> > From: buildroot-bounces at busybox.net [mailto:buildroot-
> > bounces at busybox.net] On Behalf Of Thomas Petazzoni
> > Sent: Sunday, 20 June 2010 10:36 PM
> > To: buildroot at busybox.net
> > Subject: [Buildroot] Storing board configuration ?
> > 
> > Hello,
> > 
> > The work on cleaning up the target/ directory has been making some
> > progress lately: bootloaders-cleanup has been merged, linux-cleanup has
> > been through a first review phase and Dmytro Milinevskyy has contributed
> > the cleanup of the filesystem skeleton.
> > 
> > The last big part is the "board support", i.e what allows to configure
> Buildroot
> > to build a system for a particular hardware board, without the user having
> to
> > worry about kernel/bootloader/toolchain details.
> > 
> > Instead of having configuration details defined in makefiles in
> target/device,
> > I'd like to use defconfigs instead.
> > 
> > However, defconfigs are not perfect : they are large and they get
> out-dated
> > pretty quickly because they must store the value of *every* existing
> option.
> > 
> > For that reason, I'm wondering whether we should limit the defconfigs to
> the
> > important options for a particular board and remove all other option
> values.
> > This would leave ~30 lines to a human-written defconfig instead of ~1000
> > lines of automatically-generated defconfigs.
> > 
> > A "mini-defconfig" could look like :
> > 
> > ==========================================================
> > ============
> > # General
> > BR2_HAVE_DOT_CONFIG=y
> > BR2_arm=y
> > BR2_arm926t=y
> > BR2_ARM_EABI=y
> > BR2_PROJECT="at91sam9263ek"
> > BR2_HOSTNAME="AT91SAM9263EK"
> > 
> > # Root filesystem
> > BR2_TARGET_ROOTFS_JFFS2=y
> > BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
> > BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x800
> > BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
> > BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
> > BR2_TARGET_ROOTFS_JFFS2_PAD=y
> > BR2_TARGET_ROOTFS_JFFS2_PADSIZE=0x02000000
> > BR2_TARGET_ROOTFS_JFFS2_LE=y
> > 
> > # Boot
> > BR2_TARGET_UBOOT=y
> > BR2_TARGET_UBOOT_BOARDNAME="at91sam9263ek"
> > BR2_TARGET_UBOOT_2009_01=y
> > BR2_TARGET_AT91BOOTSTRAP=y
> > BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9263ek"
> > BR2_TARGET_AT91BOOT_DATAFLASHCARD=y
> > BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT=y
> > BR2_AT91BOOTSTRAP_JUMP_ADDR="0x23F00000"
> > 
> > # Kernel
> > BR2_LINUX_KERNEL=y
> > BR2_LINUX_KERNEL_2_6_34=y
> > BR2_LINUX_KERNEL_USE_DEFCONFIG=y
> > BR2_LINUX_KERNEL_DEFCONFIG="at91sam9263ek"
> > ==========================================================
> > ============
> > 
> > But if we do that, we would have to modify the main Makefile so that when
> > an user does "make foobar_defconfig", configs/foobar_defconfig is used
> > and for all options non-specified in the defconfig, the default options
> would
> > be choosen. So something like :
> > 
> > %_defconfig: $(TOPDIR)/configs/%_defconfig
> >         cp $^ .config
> >         @yes "" | $(MAKE) oldconfig
> > 
> > What do you think about this ?
> 
> Sounds good to me - I actually had the same idea the other day, but I don't
> know enough to do anything about it.
> 

Already been done, see Aboriginal Linux build system which uses mini-configs
and for the scripts to handle them.  Previously known as Firmware Linux.
http://aboriginal.impactlinux.com/

Mike

> 
> 
> Paul.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
