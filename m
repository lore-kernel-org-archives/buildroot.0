From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 22 Oct 2017 15:45:41 +0530
Subject: [Buildroot] [PATCH v3 02/11] support/scripts: Add
	sunxi64-post-build.sh
In-Reply-To: <20171021230637.60959eed@windsurf>
References: <1508406333-27138-1-git-send-email-jagan@amarulasolutions.com>
 <1508406333-27138-3-git-send-email-jagan@amarulasolutions.com>
 <20171021230637.60959eed@windsurf>
Message-ID: <CAMty3ZCQSpztnqCa8=uZMB1LsF2zPq_OF5uUsagJ9Uv4Z8JUZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+ Andre

On 21-Oct-2017 11:06 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

Hello,

On Thu, 19 Oct 2017 11:45:24 +0200, Jagan Teki wrote:

> +# sunxi64-post-build script
> +#
> +# Allwinner A64/H5 firmware consists of three parts:
> +# 1) U-Boot's SPL
> +# 2) ARM Trusted Firmware (ATF)
> +# 3) U-Boot proper.
> +#
> +# The SPL will load both ATF and U-Boot proper along with the right
device
> +# tree blob (.dtb) and will pass execution to ATF (in EL3), which in
turn will
> +# drop into the U-Boot proper (in EL2).
> +#
> +# As the ATF binary will become part of the U-Boot image file, you will
need
> +# to build it first and export ATF variable to built U-Boot proper. Since
> +# buildroot not take of building ATF first and export the binary, this
post-build
> +# script build the u-boot.itb

Thanks for this explanation. However, I am not too happy with the
solution you propose. Indeed, the U-Boot build system already has all
the logic to produce the u-boot.itb, provided the BL31 environment
variable is defined.

I think the problem is that the ATF package currently only supports
the case where ATF embeds U-Boot (that is for example how it works on
the ARM Juno platform if I remember correctly
(configs/arm_juno_defconfig) or on Marvell platforms. This explains why
the arm-trusted-firmware package depends on uboot.

The sunxi scenario is different because it wants ATF to be built
*before* U-Boot, so basically the opposite.


This wasn't only the case with sunxi it's been the U-Boot FIT
behaviour..even rockchip do follow same build process.

Ideally FIT need input files to produce blob like dtb.

Added Andre he will give some more insight.

Jagan.


So I would propose:

 * An option in ATF to decide if it needs U-Boot to be built before or
   not.

 * An option in U-Boot to decide if it needs ATF to be built before or
   not.

 * An option in U-Boot to pass custom variable on the build command
   line so that we can pass the path to BL31. Or directly an option
   that will make uboot.mk pass BL31.

What do you think ?

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171022/5007afb0/attachment.html>
