From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 4 May 2018 09:14:24 +0200
Subject: [Buildroot] [PATCH v3 1/5] arm-trusted-firmware: simplify
 release dir path
In-Reply-To: <1525364617-23633-2-git-send-email-luca@lucaceresoli.net>
References: <1525364617-23633-1-git-send-email-luca@lucaceresoli.net>
 <1525364617-23633-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <20180504071424.GA7882@g751.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca,

On Thu, May 03, 2018 at 06:23:33PM +0200, Luca Ceresoli wrote:
> The path to the binary images is very long. Since we are about to make
> a larger use of it, let's use a variable to make it somewhat shorter.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Changes v2 -> v3: none.
> Changes v1 -> v2: none.
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 4bac916e3108..212bb5049f2b 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -25,6 +25,7 @@ endif
>  ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES = YES
>  
>  ARM_TRUSTED_FIRMWARE_PLATFORM = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM))
> +ARM_TRUSTED_FIRMWARE_IMG_DIR = $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/release
>  
>  ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
>  	CROSS_COMPILE="$(TARGET_CROSS)" \
> @@ -82,7 +83,7 @@ define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
>  endef
>  
>  define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
> -	cp -dpf $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/release/*.bin $(BINARIES_DIR)/
> +	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/

Actually the release folder isn't always in that directory. For
instance, the tegra platform requires another TARGET_SOC variable and
the bin files are under
build/$(ARM_TRUSTED_FIRMWARE_PLATFORM)/$(TARGET_SOC)/release/*.bin.
https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/plat/nvidia-tegra.rst

Don't get me wrong, your patch doesn't break anything, I just wanted to
inform you of that tegra case. My quick (and dirty) fix was to do a the
following:
find $(@D)/build/$(ARM_TRUSTED_FIRMWARE_PLATFORM) -name "*.bin" -exec cp -dpf {} $(BINARIES_DIR)/ \;

But if you want to have a generic ARM_TRUSTED_FIRMWARE_IMG_DIR I guess
the solution is to have an optional ARM_TRUSTED_FIRMWARE_TARGET_SOC
variable added to arm-trusted-firmware.mk.

Regards,
Gary
