From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 13 Dec 2017 18:04:04 +0000
Subject: [Buildroot] [PATCH] board: add support for ARC HS Development
 Kit (HSDK)
In-Reply-To: <20171213083421.327551f7@windsurf.png.is.keysight.com>
References: <20171207170628.2806-1-didin@synopsys.com>
 <20171213083421.327551f7@windsurf.png.is.keysight.com>
Message-ID: <1513188243.3598.20.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2017-12-13 at 08:34 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu,  7 Dec 2017 20:06:28 +0300, Evgeniy Didin wrote:
> > Synopsys DesignWare HSDK (which stands for ARC HS
> > Development Kit) is the latest and greatest development
> > platform that sports quad-core ARC HS38 in real silicon.
> > 
> > Most noticeable features of the board are:
> >  * Quad-core ARC HS38 CPU running at 1GHz
> >  * 4Gb of DDR
> >  * Built-in Vivante GPU (well supported via open source
> >    Etnaviv drivers)
> >  * Built-in Wi-Fi/Bluetooth module (RedPine RS-9113)
> 
> Nice. Do you send free boards ? :-)

If you guys are interested I'll try to make sure you'll get one.
Seriously. But it won't happen before later next year anyways :)

> >  board/synopsys/hsdk/genimage-hsdk.cfg | 26 +++++++++++++++++++++++++
> 
> genimage.cfg is enough as a name I'd say.

Ok.

> > +mkenvimage -s 0x4000 -o output/images/uboot.env ${BOARD_DIR}/uboot.env.txt
> 
> This can be done using BR2_TARGET_UBOOT_ENVIMAGE.

There's one caveat though.
On that board we use SD-card as a storage for uImage, rootfs and among other things
U-Boot environment. But compared to some ARM boards we keep it on the first FAT partiotion,
not just put as a raw blob on SD-card before filesystem starts.

This is perfectly possible with up-to-date U-Boot - everything is already thee, just
say that environment will be on FAT partition like that:
----------------------------->8----------------------
CONFIG_ENV_IS_IN_FAT=y                                                                                                                            
CONFIG_ENV_FAT_INTERFACE="mmc"                                                                                                                    
CONFIG_ENV_FAT_DEVICE_AND_PART="0:1"
----------------------------->8----------------------

And by default U-Boot will look for a file with name "uboot.env", see
http://git.denx.de/?p=u-boot.git;a=blob;f=env/Kconfig#l394

But in Buildroot for some reason "uboot-env.bin" is generated.

So what we may do here:
 1) We may switch to "uboot-env.bin" in our U-Boot.
 2) We may keep using post build script... or
 3) We may switch to more common U-Boot-wise "uboot.env" with:
----------------------------->8----------------------
diff --git a/board/altera/socrates_cyclone5/genimage.cfg b/board/altera/socrates_cyclone5/genimage.cfg
index 63fef8ba4764..04d30490cb4d 100644
--- a/board/altera/socrates_cyclone5/genimage.cfg
+++ b/board/altera/socrates_cyclone5/genimage.cfg
@@ -35,7 +35,7 @@ image sdcard.img {
 
        partition uboot-env {
                in-partition-table = "no"
-               image = "uboot-env.bin"
+               image = "uboot.env"
                offset = 17408 # 512 * 34 -> just after gpt
        }
 
diff --git a/board/altera/socrates_cyclone5/readme.txt b/board/altera/socrates_cyclone5/readme.txt
index 4e78feef11a5..2e34c3d31f85 100644
--- a/board/altera/socrates_cyclone5/readme.txt
+++ b/board/altera/socrates_cyclone5/readme.txt
@@ -30,7 +30,7 @@ Following files will be generated in output/images
 ??? u-boot-spl.bin.crc
 ??? u-boot.bin
 ??? u-boot.img
-??? uboot-env.bin
+??? uboot.env
 ??? uboot.img
 ??? zImage
 
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 2ae38e95d5af..d6fd3672aee0 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -378,7 +378,7 @@ menuconfig BR2_TARGET_UBOOT_ENVIMAGE
          Generate a valid binary environment image from a text file
          describing the key=value pairs of the environment.
 
-         The environment image will be called uboot-env.bin.
+         The environment image will be called uboot.env.
 
 if BR2_TARGET_UBOOT_ENVIMAGE
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 14a8cc949a33..aaecf4d466cf 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -246,7 +246,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
                        $(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
                        $(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
                        $(if $(filter BIG,$(BR2_ENDIAN)),-b) \
-                       -o $(BINARIES_DIR)/uboot-env.bin -)
+                       -o $(BINARIES_DIR)/uboot.env -)
        $(if $(BR2_TARGET_UBOOT_BOOT_SCRIPT),
                $(HOST_DIR)/bin/mkimage -C none -A $(MKIMAGE_ARCH) -T script \
                        -d $(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)) \
----------------------------->8----------------------

What do you think?

> > +
> > +genimage                           \
> > +        --rootpath "${TARGET_DIR}"     \
> > +        --tmppath "${GENIMAGE_TMP}"    \
> > +        --inputpath "${BINARIES_DIR}"  \
> > +        --outputpath "${BINARIES_DIR}" \
> > +        --config "${GENIMAGE_CFG}"
> 
> This should instead use the generic support/scripts/genimage.sh
> 
> > +tar czf output/images/sdcard.img.tar.gz --directory="./output/images"  sdcard.img
> 
> And this is not needed.

Well IMHO compression of the image makes sense because that way we may generate images
with larger FAT-partition without bumping size of the output image.

See we always allocate a bit more space for FAT partition (or it is applicable to any not-last
partiotion - not sure about that) compared to what we need just to make sure it's enough space for our
stuff. Moreover I'd like to have some more space so I may for example put 2 uImages side by side
and switch between them later on and do it all without re-formatting of the SD-card.

And given how large SD-cards these days are I'm fine with allocating even 100Mb for first FAT partiotion.
Now if we don't compress sdcard.img it will be of size 100+ Mb. But if we gzip it then we only have size
of real payload, i.e. ~6-7 Mb while keeping a lot of flexibility for image user.

Not to mention a case of sharing built images.

That said I'd rather prefer to either compress images by default (does it really hurt?)
or at least have it as an option.

> So basically, you can remove your post-image script, and point to
> support/scripts/genimage.sh directly.
> 
> Finally, add an entry in the DEVELOPERS file,

Is something like that OK?
------------------------->8----------------------------
diff --git a/DEVELOPERS b/DEVELOPERS
index 79e7202a8fcf..66b7a9e4d133 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -129,6 +129,7 @@ F:  package/wf111/
 
 N:     ARC Maintainers <arc-buildroot@synopsys.com>
 F:     arch/Config.in.arc
+F:     board/synopsys/
 
 N:     Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
 F:     package/axfsutils/
------------------------->8----------------------------

> and update
> the .gitlab-ci.yml file by running "make .gitlab-ci.yml" and committing
> the result.

Sure, we'll do that.

-Alexey
