From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 15 Nov 2019 08:36:08 +0100
Subject: [Buildroot] [PATCH 1/1] add pattern based copy for ATF as
 already used for u-boot. This add support for different platforms where the
 binaries have different extension
In-Reply-To: <1573738166-12850-1-git-send-email-michael.schenk@noser.com>
References: <1573738166-12850-1-git-send-email-michael.schenk@noser.com>
Message-ID: <CAGm1_kuu3vt=m7xsgk62mbF2VdXj2_Ki+Onzu5DuCBL6PX4niA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,

could you fix the patch title/commit log?

Title: add pattern based copy for ATF as already used for u-boot

Commit log: This adds support for different platforms where the
binaries have different extensions.


On Thu, Nov 14, 2019 at 4:02 PM Schenk Michael <michael.schenk@noser.com> wrote:
>
> Signed-off-by: Michael Schenk <michael.schenk@noser.com>
> ---
>  boot/arm-trusted-firmware/Config.in               | 7 +++++++
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 +++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index beb95fb..78c0301 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -135,4 +135,11 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG
>         help
>           Enable this option to build ATF with DEBUG=1.
>
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES
> +       string "Binary boot images"
> +       default "*.bin"
> +       help
> +         Names of generated image files that are installed in the
> +         output images/ directory.

Please precise the list type. Is it space separated or comma separated.

Regards,
Yegor

> +
>  endif
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index a7814e5..e528686 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -146,7 +146,9 @@ define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
>  endef
>
>  define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
> -       cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
> +       $(foreach f,$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES)), \
> +               cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/$(f) $(BINARIES_DIR)/
> +       )
>         $(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL)
>         $(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF)
>  endef
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
