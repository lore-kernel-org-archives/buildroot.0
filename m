From: Anders Darander <anders@chargestorm.se>
Date: Mon, 30 Mar 2015 07:03:34 +0200
Subject: [Buildroot] Beaglebone Black - Buildroot
In-Reply-To: <muid.95295e4e7c.00FFF1D896D3FF4482179DF8C27DEFAFA329F4C605@CT-SERVEUR.ctaq.local>
References: <muid.95295e4e7c.00FFF1D896D3FF4482179DF8C27DEFAFA329F4C605@CT-SERVEUR.ctaq.local>
Message-ID: <20150330050334.GA27821@ad.chargestorm.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin,

I'm adding the buildroot mailing list as CC, as the question is pretty
generic relating to buildroot and beaglebone.

* Martin Beaudet <martin.beaudet@intelia.com> [150329 00:30]:
> I'm trying to use Buildroot (Latest version) with the Beaglebone Black
> RevC. I need an image having a minimal footprint having (Qt5, nodejs,
> systemd, nano, some other packages).

Minimal... ;)

> As I'm planning using the Beaglebone with 4 similar projects, I think
> that Buildroot is a good candidate to help me in the
> automation/customization process of the output image.

Sure, buildroot should be a good candidate

> I successfully build an image but I'm not getting HDMI output.  By the
> way, I did try with the stock image and the HDMI is working on my LG
> 22'' and a also on my cape 7'', so it is not a hardware failure.

I've never tried the HDMI output myself, so I can't really comment on
this.

> I notice that you have made some patch to Buildroot so it is why I'm
> wondering if you can help me. Have you done something similar with
> good result ?

> Here is how I done it:

> $ make beaglebone_defconfig
> $ make menuconfig

> I add some missing package (ti-gfx, glibc, etc...) and I build the
> image using :

> $ make

> I then prepared the MicroSDCard :

> $ sudo mount /dev/sdf1 /media/boot
> $ sudo mount /dev/sdf2 /media/rootfs
> $ sudo cp MLO u-boot.img zImage uEnv.txt *.dtb /media/boot
> $ sudo dd if=rootfs.ext2 of=/dev/sdf2
> $ sudo umount /dev/sdf1
> $ sudo umount /dev/sdf2

> I insert the MicrosSDCard into the BeagleBone, hold the S2 button down
> and then wait until the beaglebone boot. Notice that I have an HDMI LG
> 24'' monitor connected to the beaglebone and also the console (FTDI)
> to my Windows computer (putty).

> The monitor remain always blank, the beaglebone do not output on the
> HDMI.

Have you added any application / configuration that actually should
output anything on the HDMI output?

The buildroot image is per default (unless it has changed recently,
which I doubt) headless only and serial console only. If the FB is
configured and started is something I've never checked myself.

> Someone on buildroot give me a patch to allow tilcdc to be selected in
> the kernel. I applied this patch. (Patch of
> tilcdc<http://repo.or.cz/w/buildroot-gz.git/patch/6312b9a5c5e37708042c0b24df8928ab74007ef9>).

This probably should be enough.

Though, please, double check that the configurations mentioned in
https://lists.yoctoproject.org/pipermail/meta-ti/2014-January/003995.html
actually are enabled and that the tda998x module is present and loaded.
Also double check the comment regarding the DTS.

> I rebuild the kernel :

> $ make linix-dirclean
> $ make kernel
> $ make

> Copy the new kernel (zImage) to the SDCard. But the same problem, no
> hdmi output.

> While looking to the dmesg, I notice this error :

> [    1.402202] tilcdc 4830e000.lcdc: no encoders/connectors found
> [    1.408337] tilcdc 4830e000.lcdc: failed to initialize mode setting

These errors are what prompts me to direct you to the email above.

> I also tried modifying the uEnv.txt and setting additional video
> parameters found on internet but same blank screen.

> I asked some help on the Beaglebone community but they simply tell me
> to not reinvent the wheel and use this procedure :
> https://eewiki.net/display/linuxonarm/BeagleBone+Black. This is
> interesting but I'm losing the ability to automate and customize (per
> project) my building image process.

I couldn't open that link, though I suspect they're directing you to use
Ubuntu or Debian based images... I'd agree with you, that that's not the
way to go for an embedded project.

> Then I begin to wonder if it would not be the ti-kernel repo point in
> BuildRoot that is too old ?

> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7f280334068b7c875ade51f8f3921ab311f0c824"

> This repo seem to be pointer on the 3.12 kernel. Maybe the problem is
> here ? Bad DTS or bad kernel configuration.... If I simply update this
> rep version to a 3.14, do I have any chance that it works without any
> other Buildroot modification ?

Ouch, I actually thought I had updated it to a 3.14 based kernel...
Though, according to the email I linked to above, it should work on 3.12
also.

I'd try to find some time to update to the lastes head from the
ti-linux-3.14.y branch of ti-linux-kernel.git. (This is the repo used in
the official TI BSP's).

> Or maybe change it to :

> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/RobertCNelson/bb-kernel.git"
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="???"

Personally, I've not used that repo at all, so I can't vouch for it.

> Or could it be a too old U-Boot ?

This shouldn't really matter.

Cheers,
Anders

-- They finally got King Midas, I hear.  Gild by association.
-- 
Anders Darander
ChargeStorm AB / eStorm 
