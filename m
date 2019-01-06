From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 6 Jan 2019 19:31:34 +0100
Subject: [Buildroot] [PATCH 1/1] Fix rasberry Pi 64bit firmware overlay
 inclusion
In-Reply-To: <47fb1e6b-dcbe-72d0-d9f6-2c038c8b4dee@flatmax.org>
References: <20190103110036.14604-1-flatmax@flatmax.org>
 <20190104204653.04489413@gmx.net>
 <4e7dafcb-f16e-6ec2-d38e-4e3cac164229@flatmax.org>
 <20190105161706.7cba4bbd@gmx.net>
 <47fb1e6b-dcbe-72d0-d9f6-2c038c8b4dee@flatmax.org>
Message-ID: <20190106193121.325339ad@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Sun, 6 Jan 2019 12:11:44 +1100, Matt Flax <flatmax@flatmax.org> wrote:

> On 6/1/19 2:17 am, Peter Seiderer wrote:
> > Hello Matt,
> >
> > On Sat, 5 Jan 2019 10:08:04 +1100, Matt Flax <flatmax@flatmax.org> wrote:
> >  
> >> On 5/1/19 6:50 am, Peter Seiderer wrote:  
> >>> Hello Max,
> >>>
> >>> On Thu,  3 Jan 2019 22:00:36 +1100, Matt Flax <flatmax@flatmax.org> wrote:
> >>>     
> >>>> This patch enables the inclusion of the Pi's overlays. Previously
> >>>> the overlays were not included in the genimage configuration.
> >>>> This patch ensures overlays are included in the sdcard (when
> >>>> enabled) by defaulting to the inclusion of an empty
> >>>> output/images/rpi-firmware/overlays directory in genimage cfg.
> >>>>
> >>>> The Pi's overlays are built with the following config
> >>>> variables:
> >>>> BR2_PACKAGE_RPI_FIRMWARE=y
> >>>> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
> >>>> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y
> >>>> BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> >>>> BR2_LINUX_KERNEL_IMAGE_NAME="Image"
> >>>> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image modules dtbs"
> >>>>
> >>>> After building, the dtbo files are present in the
> >>>> output/images/rpi-firmware/overlays directory but not added
> >>>> to the sdcard because they are missing from the genimage cfg
> >>>> file.  
> >>> Thanks for suggested patch, the reasoning for genimage-raspberrypi3-64.cfg not
> >>> containing a overlays entry is it is not needed for the raspberrypi3_64_defconfig
> >>> use case (mind the buildroot minimalistic defconfig approach) in contrast to the
> >>> raspberrypi3_defconfig where the overlay is needed for the pi3-miniuart-bt one...
> >>>
> >>> Adding a (maybe) empty overlays directory to the sdcard image would violate
> >>> the minimalistic approach...  
> >>
> >> With or without this patch, I see no viable way to update the device
> >> tree. Is there a method ?  
> > See e.g. configs/raspberrypi3_defconfig for a specialized case:
> >
> > 	BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
> >  
> >> What is a Raspberry Pi without a method to support the addons and hats ?  
> > A minimalistic starting point for a minimal system, each add-on/hat
> > would surely need additional packages/software, each customized system
> > needs a customized configuration....
> >  
> >> Do you have a method for supporting any of the various addons/hats which
> >> would normally work with an overlay line added to /boot/config.txt ?
> >>  
> > Or take a look at  '[RFC] raspberrypi: post-image.sh arguments as config.txt properties ' [1]
> > for a more general approach...
> >
> > Regards,
> > Peter
> >
> > [1] https://patchwork.ozlabs.org/patch/1007728/  
> 
> 
> Thanks for the pointer. It is pretty clear that support for the RPi 
> requires a lot more work and blocking revisions doesn't really help. 

Don`t know what your mean by 'blocking revisions'?

> Despite adding post_script_args, there simply isn't any way to include 
> overlays in the current setup.

Your initial suggested patch shows the way to do it:

- enable BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y
- use a customized genimage config file with overlay directory enabled
- use a customized genimage config file pointing to a customized config.txt file

> 
> For example :
> 
> If I add the variable 
> BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
> 
> It will put the following into boot/config.txt :
> 
> dtoverlay=pi3-miniuart-bt
> 
> But - now here is the clincher - THERE IS NO WAY TO GET OVERLAYS INTO 
> THE BOOT PARTITION !
> 
> Can you please be more helpful ? I see specifically the following problems :
> 
> 1] Can you suggest a better method to include overlays in the sdcard? 
> during a build process ?

See above...

> 
> 2] For a 64 bit system, does overlay loading even work ? I tried to load 
> an overlay by putting dtoverlay into config.txt but it seemed to not 
> even be aware of its presence !

Should work the same way as 32 bit, but did not test it recently...how
do you determine 'not even be aware of its presence'?
 
> 
> 3] Because of 2] is there a particular place to put overlays rather then 
> boot/overlays ?

Not a buildroot specific question, more for a raspberry forum..., but
according to [2] the right place for the overlays is the boot partition
overlays directory...

Regards,
Peter

[2] https://www.raspberrypi.org/documentation/configuration/device-tree.md

> 
> 
> thanks
> 
> Matt
> 
> 
> 
> 
> >> Matt
> >>
> >>  
> >>> Regards,
> >>> Peter
> >>>
> >>> [Skipped CC to 'Matt Flax <flatmax@flatmax.org>' - mail server answers with 'mailbox unavailable']
> >>>     
> >>>> Signed-off-by: Matt Flax <flatmax@flatmax.org>
> >>>> ---
> >>>>    board/raspberrypi/genimage-raspberrypi3-64.cfg | 1 +
> >>>>    package/rpi-firmware/rpi-firmware.mk           | 4 ++++
> >>>>    2 files changed, 5 insertions(+)
> >>>>
> >>>> diff --git a/board/raspberrypi/genimage-raspberrypi3-64.cfg b/board/raspberrypi/genimage-raspberrypi3-64.cfg
> >>>> index 0d0ca750a7..af1d17cde7 100644
> >>>> --- a/board/raspberrypi/genimage-raspberrypi3-64.cfg
> >>>> +++ b/board/raspberrypi/genimage-raspberrypi3-64.cfg
> >>>> @@ -9,6 +9,7 @@ image boot.vfat {
> >>>>          "rpi-firmware/config.txt",
> >>>>          "rpi-firmware/fixup.dat",
> >>>>          "rpi-firmware/start.elf",
> >>>> +      "rpi-firmware/overlays",
> >>>>          "Image"
> >>>>        }
> >>>>      }
> >>>> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> >>>> index bb54904ae6..0df7b17cbd 100644
> >>>> --- a/package/rpi-firmware/rpi-firmware.mk
> >>>> +++ b/package/rpi-firmware/rpi-firmware.mk
> >>>> @@ -24,6 +24,10 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> >>>>    		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
> >>>>    	done
> >>>>    endef
> >>>> +else
> >>>> +define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> >>>> +		$(INSTALL) -d $(BINARIES_DIR)/rpi-firmware/overlays || exit 1;
> >>>> +endef
> >>>>    endif
> >>>>    
> >>>>    ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)  
> >>> _______________________________________________
> >>> buildroot mailing list
> >>> buildroot at busybox.net
> >>> http://lists.busybox.net/mailman/listinfo/buildroot  
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot  
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot  
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
