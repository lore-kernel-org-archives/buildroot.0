From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 22:08:51 +0200
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: use prebuilt
 BL33 images
In-Reply-To: <CAN5uoS-q5p6eLgO5GrgR6LWb2oxy6Crb7w_7RAPrG=FA9QEbwA@mail.gmail.com>
References: <1542900148-17204-1-git-send-email-etienne.carriere@linaro.org>
 <20181201201834.GA7451@speedy.hunter>
 <CAN5uoS-q5p6eLgO5GrgR6LWb2oxy6Crb7w_7RAPrG=FA9QEbwA@mail.gmail.com>
Message-ID: <20190803220851.01cef626@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Etienne,

Thanks for the very long time it took to get back to you.

On Mon, 3 Dec 2018 11:36:40 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Maybe I should start from the whole picture of my intentions (I tried
> to be short).
> 
> I would like to bring (at least ease) support for OP-TEE on ATF aware
> platforms in BR
> OP-TEE is a compliant BL32 image (secure OS) ATF is able to boot.
> This scheme covers arm64 platforms but also some 32bit arm platforms
> (since ATF v1.5), assuming OP-TEE support this platfrom.
> I have submitted patches to integrate OP-TEE components as BR packages
> [1], before I submit the changes in boot/arm-trusted_firmware to
> support this package.
> (in the end, I plan to submit a new Qemu/arm board that boots OP-TEE
> and a Linux OS through ATF + U-boot).
> 
> Assuming OP-TEE package ([1]) is merged in BR, I saw 2 options for BR
> to build ATF with OP-TEE support:
> 
> 1/ Hard code OP-TEE support in BR package ATF on the same model as
> U-Boot as BL33 support in ATF.
> => Config.mk defines a specific xxxx_OPTEE_AS_BL32.
> => arm-trusted-firmware.mk defines the expected binary image filename(s).  
> 
> 2/ Allow  ATF Config.mk & arm-trusted-firmware.mk to be more flexible
> for supporting alternate BL32 images, being OP-TEE or something else.
> One would set the build deps and BL32 image filename(s) from its board
> config, not from the BR ATF package.
> 
> The patch reviewed in this thread proposes scheme 2/ above applied to
> BL33 stage.
> It is true that all boards currently supported in BR that uses ATF
> with a BL33 stage do use U-Boot as BL33. There is currently not
> specific need for alternate BL33 packages.
> From the same perspective, when i will submit OP-TEE support, there
> will be no specific need for alternate BL32 outside OPTEE.
> 
> SO the question is: it interesting to allow a BR board config to
> define its BL32/BL33 stages or should these be tied to ATF config/make
> script in BR?
> 
> To be clear on my expectations: I do not formerly need such a flexible
> support. I currently only use U-boot as BL33 and OP-TEE as BL32 in my
> BR setup. I would understand that the scheme proposed here is
> rejected.

Thanks for the clearer explanation. It would have been great to have
exactly this explanation in the commit log in the first place!

The proposed scheme is not ideal because for example the custom
pre-built BL33 cannot be provided by another Buildroot package, as you
cannot express the dependency.

If all you're interested in is supporting OPTEE-OS, then I would
recommend just add explicit support for it as an optional BL32 in ATF,
without trying to be too flexible.

If however you really want something that is very flexible, to allow
both custom BL32 and BL33, then a possible solution is to create
virtual packages: atf-bl32 and atf-bl33. optee_os would be a provider
of atf-bl32, and U-Boot/Barebox could be providers of atf-bl33. This
also allows custom packages in BR2_EXTERNAL, that package some custom
BL32/BL33 to be providers of atf-bl32 or atf-bl33. This is of course
more complicated to implement. Perhaps it is wise to wait and see if
there really is a need for something like this.

In the mean time, if what you want is just OPTEE-OS as BL32, keep it
simple and add explicit handling for it in ATF.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
