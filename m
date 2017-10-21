From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Oct 2017 16:50:23 +0200
Subject: [Buildroot] [PATCH v2 1/1] board: Add support for espressobin
	88f3720
In-Reply-To: <1506446150-4177-1-git-send-email-chevalliersebmax@gmail.com>
References: <1506290733-6042-1-git-send-email-chevalliersebmax@gmail.com>
 <1506446150-4177-1-git-send-email-chevalliersebmax@gmail.com>
Message-ID: <29ae3b00-71d0-80d1-3f2f-41fe829bce8e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Maxime,

On 26-09-17 19:15, Maxime Chevallier wrote:
> Add support for the Globalscale 'Espressobin' board based
> on Marvell Armada 3720.
> 
> This board has a dual Cortex-A53, 1GB DDR3, USBs, ethernets,
> and some GPIO ports. More informations on the vendor site :
> http://espressobin.net/tech-spec/
> 
> This config uses the mainline linux support for the board and
> the buildroot toolchain using glibc, since uclibc does not
> support aarch64.
> 
> Mainline device-tree does not include SDCard support yet, so USB
> is the preferred way to boot the image, using the default pre-flashed
> u-boot on SPI NOR.

 We discussed this a bit at the BR developer meeting, and came to the conclusion
that the current situation is not very useful. It is just a basic aarch64
defconfig with the appropriate dts. Unless there is bootloader support, there is
not a lot of use of making a defconfig.

 So, let's wait until 4.14 is out and we can have a real, full defconfig, OK?

> Signed-off-by: Maxime Chevallier <chevalliersebmax@gmail.com>
[snip]
> +Limitations
> +===========
> +
> +Since the buildroot support for the espressobin is based on mainline
> +linux, especially regarding device-tree, the current functionnalities
> +for espressobin are limited.
> +
> +Namely, the mainline device-tree does not include support for sdcards yet, which
> +means the kernel is not able to load a rootfs located on a SDCard.

 If it is *only* a matter of the dts, you can just supply the needed dts file in
board/globalscale/espressobin and use it with BR2_LINUX_KERNEL_CUSTOM_DTS_PATH.


> +# uClibc does not support aarch64 yet.
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y

 Really?

commit 00995e0e49fafc355fbf56d9b7810c1696a41b2f
Author: Waldemar Brodkorb <wbx@openadk.org>
Date:   Fri Feb 3 15:28:14 2017

    uclibc: allow to build aarch64 internal toolchain

    uClibc-ng from 1.0.22 and up supports aarch64 architecture.



 Regards,
 Arnout

> +
> +# Image generation
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/globalscale/espressobin/genimage.cfg"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
