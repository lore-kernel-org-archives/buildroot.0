From: lpdev at cordier.org <lpdev@cordier.org>
Date: Wed, 13 May 2020 22:05:08 +0200 (CEST)
Subject: [Buildroot] Adding post image hook
In-Reply-To: <20200511175027.71ed1d22@windsurf.home>
Message-ID: <ea-mime-5ebc52f4-7a9b-60b07d84@www-1.mailo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



De : Thomas Petazzoni <thomas.petazzoni@bootlin.com>
? : lpdev at cordier.org
Sujet : Re: [Buildroot] Adding post image hook
Date : 11/05/2020 17:50:27 Europe/Paris
Copie ? : buildroot at buildroot.org

Hello,

On Mon, 11 May 2020 16:35:10 +0200 (CEST)
lpdev at cordier.org wrote:

> I'm currently trying to improve my custom buildroot tree (that makes
> use of BR2_EXTERNAL), especially the final steps. For instance my
> external tree adds an extra steps through the
> BR2_ROOTFS_POST_IMAGE_SCRIPT to generate the firmware file. This step
> also retrieve the version of different softwares present in the final
> image.
> 
> However the post image script comes with a big limitation: we cannot
> take the advantage of reading variables defined in the Makefile.

You can actually do that, by running:

make VARS=<some-variable-name> printvars

from your post-image script.

If what you need to retrieve is the version of the different packages,
you can also run:

make show-info

from your post-image script, and parse the JSON output.



Thank you for the tip. However this method seems to be very slow because of the makefile parsing (takes between 5 to 10sec on my PC). I would not recommend that for retrieving values of a lot of variables.





> # Export some useful variable that can be used in other scripts
> export BR2_CUSTOM_BOARDNAME := $(call qstrip,$(BR2_CUSTOM_BOARDNAME))
> export BR2_CUSTOM_BOARDVERSION := $(shell git -C $(BR2_EXTERNAL_CUSTOM_PATH) describe --tags --dirty=-dev)
> 
> # Make an Firmware Update package.
> ifeq ($(BR2_CUSTOM_GENERATE_FIRMWARE),y)
> genfirmware: target-post-image
> @$(call MESSAGE,"Compressing the filesystem...")
> pigz -9 -c -n $(BINARIES_DIR)/rootfs.ext4 > $(BINARIES_DIR)/rootfs.ext4.gz
> 
> @$(call MESSAGE,"Generating UEFI partition for the bootloader...")
> $(EXTRA_ENV) ./support/scripts/genimage.sh -c $(BR2_EXTERNAL_CUSTOM_PATH)/board/cstick/genimage_uefi.cfg
> 
> @$(call MESSAGE,"Generating firmware version $(BR2_CUSTOM_BOARDVERSION) for board $(BR2_CUSTOM_BOARDNAME) ")
> (We can use bash script here with any makefile variables defined at this point, such as BR2_OPENCV_VERSION for instance)
> 
> # Override the default world target.
> .PHONY: world
> world: genfirmware
> endif

Otherwise, what you did here looks OK to me. It is a hack of course,
but BR2_EXTERNAL is designed to allow hacks :-)



Soooo cool, I just became an hacker then! :D Thank you for your time Thomas




Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200513/1a266df7/attachment.html>
