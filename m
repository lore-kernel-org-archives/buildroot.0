From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 5 Jan 2019 16:17:26 +0100
Subject: [Buildroot] [PATCH 1/1] Fix rasberry Pi 64bit firmware overlay
 inclusion
In-Reply-To: <4e7dafcb-f16e-6ec2-d38e-4e3cac164229@flatmax.org>
References: <20190103110036.14604-1-flatmax@flatmax.org>
 <20190104204653.04489413@gmx.net>
 <4e7dafcb-f16e-6ec2-d38e-4e3cac164229@flatmax.org>
Message-ID: <20190105161706.7cba4bbd@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Sat, 5 Jan 2019 10:08:04 +1100, Matt Flax <flatmax@flatmax.org> wrote:

> On 5/1/19 6:50 am, Peter Seiderer wrote:
> > Hello Max,
> >
> > On Thu,  3 Jan 2019 22:00:36 +1100, Matt Flax <flatmax@flatmax.org> wrote:
> >  
> >> This patch enables the inclusion of the Pi's overlays. Previously
> >> the overlays were not included in the genimage configuration.
> >> This patch ensures overlays are included in the sdcard (when
> >> enabled) by defaulting to the inclusion of an empty
> >> output/images/rpi-firmware/overlays directory in genimage cfg.
> >>
> >> The Pi's overlays are built with the following config
> >> variables:
> >> BR2_PACKAGE_RPI_FIRMWARE=y
> >> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
> >> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y
> >> BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> >> BR2_LINUX_KERNEL_IMAGE_NAME="Image"
> >> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image modules dtbs"
> >>
> >> After building, the dtbo files are present in the
> >> output/images/rpi-firmware/overlays directory but not added
> >> to the sdcard because they are missing from the genimage cfg
> >> file.  
> > Thanks for suggested patch, the reasoning for genimage-raspberrypi3-64.cfg not
> > containing a overlays entry is it is not needed for the raspberrypi3_64_defconfig
> > use case (mind the buildroot minimalistic defconfig approach) in contrast to the
> > raspberrypi3_defconfig where the overlay is needed for the pi3-miniuart-bt one...
> >
> > Adding a (maybe) empty overlays directory to the sdcard image would violate
> > the minimalistic approach...  
> 
> 
> With or without this patch, I see no viable way to update the device 
> tree. Is there a method ?

See e.g. configs/raspberrypi3_defconfig for a specialized case:

	BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"

> 
> What is a Raspberry Pi without a method to support the addons and hats ?

A minimalistic starting point for a minimal system, each add-on/hat
would surely need additional packages/software, each customized system
needs a customized configuration....

> 
> Do you have a method for supporting any of the various addons/hats which 
> would normally work with an overlay line added to /boot/config.txt ?
> 

Or take a look at  '[RFC] raspberrypi: post-image.sh arguments as config.txt properties ' [1]
for a more general approach... 

Regards,
Peter

[1] https://patchwork.ozlabs.org/patch/1007728/

> Matt
> 
> 
> > Regards,
> > Peter
> >
> > [Skipped CC to 'Matt Flax <flatmax@flatmax.org>' - mail server answers with 'mailbox unavailable']
> >  
> >> Signed-off-by: Matt Flax <flatmax@flatmax.org>
> >> ---
> >>   board/raspberrypi/genimage-raspberrypi3-64.cfg | 1 +
> >>   package/rpi-firmware/rpi-firmware.mk           | 4 ++++
> >>   2 files changed, 5 insertions(+)
> >>
> >> diff --git a/board/raspberrypi/genimage-raspberrypi3-64.cfg b/board/raspberrypi/genimage-raspberrypi3-64.cfg
> >> index 0d0ca750a7..af1d17cde7 100644
> >> --- a/board/raspberrypi/genimage-raspberrypi3-64.cfg
> >> +++ b/board/raspberrypi/genimage-raspberrypi3-64.cfg
> >> @@ -9,6 +9,7 @@ image boot.vfat {
> >>         "rpi-firmware/config.txt",
> >>         "rpi-firmware/fixup.dat",
> >>         "rpi-firmware/start.elf",
> >> +      "rpi-firmware/overlays",
> >>         "Image"
> >>       }
> >>     }
> >> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> >> index bb54904ae6..0df7b17cbd 100644
> >> --- a/package/rpi-firmware/rpi-firmware.mk
> >> +++ b/package/rpi-firmware/rpi-firmware.mk
> >> @@ -24,6 +24,10 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> >>   		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
> >>   	done
> >>   endef
> >> +else
> >> +define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> >> +		$(INSTALL) -d $(BINARIES_DIR)/rpi-firmware/overlays || exit 1;
> >> +endef
> >>   endif
> >>   
> >>   ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)  
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot  
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
