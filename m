From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 4 May 2018 15:46:06 +0200
Subject: [Buildroot] [PATCH v3 1/5] arm-trusted-firmware: simplify
 release dir path
In-Reply-To: <20180504071424.GA7882@g751.home>
References: <1525364617-23633-1-git-send-email-luca@lucaceresoli.net>
 <1525364617-23633-2-git-send-email-luca@lucaceresoli.net>
 <20180504071424.GA7882@g751.home>
Message-ID: <23162528-4cf5-1c96-72ad-9fbae0dee698@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On 04/05/2018 09:14, Gary Bisson wrote:
> Hi Luca,
> 
> On Thu, May 03, 2018 at 06:23:33PM +0200, Luca Ceresoli wrote:
>> The path to the binary images is very long. Since we are about to make
>> a larger use of it, let's use a variable to make it somewhat shorter.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>
>> ---
>> Changes v2 -> v3: none.
>> Changes v1 -> v2: none.
>> ---
>>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
>> index 4bac916e3108..212bb5049f2b 100644
>> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
>> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
>> @@ -25,6 +25,7 @@ endif
>>  ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES = YES
>>  
>>  ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
>> +ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/release
>>  
>>  ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
>>  	CROSS_COMPILE="$(TARGET_CROSS)" \
>> @@ -82,7 +83,7 @@ define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
>>  endef
>>  
>>  define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
>> -	cp -dpf $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/release/*.bin $(BINARIES_DIR)/
>> +	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
> 
> Actually the release folder isn't always in that directory. For
> instance, the tegra platform requires another TARGET_SOC variable and
> the bin files are under
> build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/$(TARGET_SOC)/release/*.bin.
> https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/plat/nvidia-tegra.rst
> 
> Don't get me wrong, your patch doesn't break anything, I just wanted to
> inform you of that tegra case. My quick (and dirty) fix was to do a the
> following:
> find $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM) -name "*.bin" -exec cp -dpf {} $(BINARIES_DIR)/ \;

So if I understood correctly the current .mk file would not work for
tegra, both with and without my patch.

Also your 'find' solution cannot work from ARM_TRUSTED_FIRMWARE_IMG_DIR
as I defined it, because of the added '/release' dir.

> But if you want to have a generic ARM_TRUSTED_FIRMWARE_IMG_DIR I guess
> the solution is to have an optional ARM_TRUSTED_FIRMWARE_TARGET_SOC
> variable added to arm-trusted-firmware.mk.

Well, using 'find' would be a simpler trick without clobbering the
Config.in space. But then in patch 2 I use ARM_TRUSTED_FIRMWARE_IMG_DIR
in several places, and using plain 'find' there would introduce
additional problems.

Do you think there is a way to extract the TARGET_SOC value
automatically, in order to avoid yet another Config.in variable in ATF?
I'm afraid I'm not optimistic on this...

An alternative, under the assumption that only one *.bin file is
generated, is: find that file wherever it is, and use the path to it
everywhere to reference to it. Pseudocode (perhaps better done in pure
make):

  ARM_TRUSTED_FIRMWARE_IMG = $(dir $(shell \
    find $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM) -name "*.bin" | \
    head -n1))

This would avoid any additional variables and give us the path of the
binary. Do you think it could work?

-- 
Luca
