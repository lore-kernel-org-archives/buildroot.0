From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 30 Nov 2018 10:53:28 +0100
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: use prebuilt
 BL33 images
In-Reply-To: <20181129230401.510c62a0@windsurf>
References: <1542900148-17204-1-git-send-email-etienne.carriere@linaro.org>
 <20181129230401.510c62a0@windsurf>
Message-ID: <CAN5uoS-vx__YfV5MMrO4B7D7zn7Rd_KyE5FNHLkeTTRJEp2Rpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 29 Nov 2018 at 23:04, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Etienne,
>
> On Thu, 22 Nov 2018 16:22:28 +0100, Etienne Carriere wrote:
> > This change allows one to build ATF with an externally built
> > BL33 image or with the U-boot as BL33 boot stage.
> >
> > This change introduces a new configuration directive for TF-A to
> > specify when BL33 stage is provided as a prebuilt image:
> > BR2_TARGET_ARM_TRUSTED_FIRMWARE_PREBUILT_BL33.
> >
> > If BR2_TARGET_ARM_TRUSTED_FIRMWARE_PREBUILT_BL33 is enabled, the
> > buildroot configuration shall specify the BL33 binary image location:
> > BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL33_IMAGE.
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > ---
> >  boot/arm-trusted-firmware/Config.in               | 22 +++++++++++++++++++++-
> >  boot/arm-trusted-firmware/arm-trusted-firmware.mk |  4 ++++
> >  2 files changed, 25 insertions(+), 1 deletion(-)
>
> Thanks for this contribution. Could you explain the use case/rationale
> for this change ? In which situation do you want to use prebuilt BL33
> images, as opposed to having another Buildroot package that builds (or
> downloads) them ?

Rational is to relax the BR arm-trusted-firmware (ATF) package
regarding support for alternate BL33 boot stages.
Current package supports only U-boot as ATF BL33 and using an
alternate boot stage mandates changes in boot Config.in and
arm-trusted-firmware.mk.

I understand that I did not setup this the right way as my proposal
does not implies BR is the build/install of the alternate boot stage.

Maybe I should discard BR2_TARGET_ARM_TRUSTED_FIRMWARE_PREBUILT_BL33
an introduce something like ..._BL33_PACKAGE
to specify the package BR shall build as a dependency for ATF  (i.e
"uboot" if BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y).
In this case ..._BL33_IMAGE would need to provide the BL33 binary
image file name that is expected from directory $(BINARIES), i.e
"u-boot.bin".

Or maybe discard this change and if another boot stage shall be
support, one need to propose specific changes in BR ATF for that BL33
boot stage.

Your though?

For info: I have a former change regarding BL32 (instead of BL33) I
have not yet pushed to the ML.
I wait for OP-TEE OS package to land [1] before proposing change in
ATF for OP-TEE as BL32 or an alternate BL32 with the same model as
this alternate BL33.

regards,
etienne

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
