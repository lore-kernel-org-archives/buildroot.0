From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Jan 2013 11:48:34 +0100
Subject: [Buildroot] designing a firmware update mechanism
In-Reply-To: <1358460573.32266.63.camel@genx>
References: <1358460573.32266.63.camel@genx>
Message-ID: <50FBCB82.9060507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/17/13 23:09, John Stile wrote:
> I use buildroot for an embedded project, which has an atmel arm
> processor, at91BootStrap on NOR to call uboot (and the reset of the
> system) on NAND.
>
> I am trying to devise a brick-safe strategy to update the systems once
> created, but I'm making this up as I go for a lack of better ideas.
>
> So far I am trying to split NAND in redundant halves (each with a copy
> of uboot + uboot-env + kernel + roofs), and modify at91bootstrap to
> choose which uboot to load, based on something inside the uboot-env
> areas.

  Do you really need U-Boot itself to be upgradeable? If not, you can put 
U-Boot and its environment in NOR. That gives you U-Boot scripting to 
choose an appropriate kernel+rootfs, it allows you to use a bootcounter 
to fall back on the other kernel when it is resetting all the time (due 
to watchdog), it allows you to detect failed upgrades (CRC check fails), 
it allows you to put everything in UBI volumes (if you need the wear 
levelling and bit scrubbing), etc.

> Will I need to compile 2 versions of uboot, differing only in where to
> look for the uboot-env, or is there another way?  If so, is there a way
> to do this within buildroot, or does uboot need to become an external
> project from my buildroot setup?

  As Peter wrote, you don't need to (but then you have to hack U-Boot). 
If you do want to build two versions of U-Boot, it's not that hard:

make BR2_TARGET_UBOOT_BOARDNAME=myboard_p1 uboot
mv output/images/u-boot.img output/images/u-boot.myboard_p1.img
make BR2_TARGET_UBOOT_BOARDNAME=myboard_p2 uboot
mv output/images/u-boot.img output/images/u-boot.myboard_p2.img


> Could anyone share a firmware update strategy for a project that uses
> buildroot, at91bootstrap, and uboot, or is that outside the scope of
> this list?
>
> I have not found any built-in mechanisms to handle updates.

  I started on a project that collects the best practices of firmware 
updates, but I haven't made much progress up to now :-(

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
