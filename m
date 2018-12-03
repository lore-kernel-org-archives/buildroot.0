From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon, 3 Dec 2018 11:36:40 +0100
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: use prebuilt
 BL33 images
In-Reply-To: <20181201201834.GA7451@speedy.hunter>
References: <1542900148-17204-1-git-send-email-etienne.carriere@linaro.org>
 <20181201201834.GA7451@speedy.hunter>
Message-ID: <CAN5uoS-q5p6eLgO5GrgR6LWb2oxy6Crb7w_7RAPrG=FA9QEbwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 1 Dec 2018 at 21:20, Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Hello Etienne,
>
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
>
> ...
>
> > --- a/boot/arm-trusted-firmware/Config.in
> > +++ b/boot/arm-trusted-firmware/Config.in
> > @@ -1,6 +1,6 @@
> >  config BR2_TARGET_ARM_TRUSTED_FIRMWARE
> >       bool "ARM Trusted Firmware (ATF)"
> > -     depends on BR2_aarch64 && BR2_TARGET_UBOOT
> > +     depends on BR2_aarch64
>
> Could you please clarify why do you want to get rid of this dependency ?
> IIUC so far all the arm64/atf boards supported by BR make use of U-Boot.
> If you plan to use this feature for a board with any other type of
> bootloader, then maybe it makes sense to add board config as well. In this
> case other developers will be able at least build-test this particular
> config swtich when testing their own ATF changes.
>

Hello Sergey,

Maybe I should start from the whole picture of my intentions (I tried
to be short).

I would like to bring (at least ease) support for OP-TEE on ATF aware
platforms in BR
OP-TEE is a compliant BL32 image (secure OS) ATF is able to boot.
This scheme covers arm64 platforms but also some 32bit arm platforms
(since ATF v1.5), assuming OP-TEE support this platfrom.
I have submitted patches to integrate OP-TEE components as BR packages
[1], before I submit the changes in boot/arm-trusted_firmware to
support this package.
(in the end, I plan to submit a new Qemu/arm board that boots OP-TEE
and a Linux OS through ATF + U-boot).

Assuming OP-TEE package ([1]) is merged in BR, I saw 2 options for BR
to build ATF with OP-TEE support:

1/ Hard code OP-TEE support in BR package ATF on the same model as
U-Boot as BL33 support in ATF.
=> Config.mk defines a specific xxxx_OPTEE_AS_BL32.
=> arm-trusted-firmware.mk defines the expected binary image filename(s).

2/ Allow  ATF Config.mk & arm-trusted-firmware.mk to be more flexible
for supporting alternate BL32 images, being OP-TEE or something else.
One would set the build deps and BL32 image filename(s) from its board
config, not from the BR ATF package.

The patch reviewed in this thread proposes scheme 2/ above applied to
BL33 stage.
It is true that all boards currently supported in BR that uses ATF
with a BL33 stage do use U-Boot as BL33. There is currently not
specific need for alternate BL33 packages.
From the same perspective, when i will submit OP-TEE support, there
will be no specific need for alternate BL32 outside OPTEE.

SO the question is: it interesting to allow a BR board config to
define its BL32/BL33 stages or should these be tied to ATF config/make
script in BR?

To be clear on my expectations: I do not formerly need such a flexible
support. I currently only use U-boot as BL33 and OP-TEE as BL32 in my
BR setup. I would understand that the scheme proposed here is
rejected.

Regards,
etienne

[1] http://lists.busybox.net/pipermail/buildroot/2018-November/236558.html


> Regards,
> Sergey
