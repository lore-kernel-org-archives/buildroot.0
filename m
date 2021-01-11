From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Jan 2021 11:06:01 -0800
Subject: [Buildroot] [PATCH 1/2] boot/uboot: Introduce
 BR2_TARGET_UBOOT_NEEDS_OPENSBI
In-Reply-To: <1610355672-3008-2-git-send-email-bmeng.cn@gmail.com>
References: <1610355672-3008-1-git-send-email-bmeng.cn@gmail.com>
 <1610355672-3008-2-git-send-email-bmeng.cn@gmail.com>
Message-ID: <CAKmqyKOzp8=QgbY-ZwL9nQOxMFW2TdobWjabz8yQ7Q1204XF9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 11, 2021 at 1:01 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Some RISC-V platforms (such as SiFive HiFive Unleashed) encapsulate
> the OpenSBI firmware image inside U-Boot.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  boot/uboot/Config.in | 10 ++++++++++
>  boot/uboot/uboot.mk  |  5 +++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index e4a0f48..b18216a 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -229,6 +229,16 @@ config BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF
>
>  endchoice
>
> +config BR2_TARGET_UBOOT_NEEDS_OPENSBI
> +       bool "U-Boot needs OpenSBI"
> +       depends on BR2_TARGET_OPENSBI
> +       help
> +         Some RISC-V platforms (such as SiFive HiFive Unleashed)
> +         encapsulate the OpenSBI firmware image inside U-Boot.
> +         This option makes sure OpenSBI gets built prior to U-Boot,
> +         and that the OpenSBI variable pointing to OpenSBI binary,
> +         is passed during the Buildroot build.
> +
>  menu "U-Boot binary format"
>
>  config BR2_TARGET_UBOOT_FORMAT_AIS
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index a29d71f..d92000f 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -163,6 +163,11 @@ UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
>  endif
>  endif
>
> +ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
> +UBOOT_DEPENDENCIES += opensbi
> +UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
> +endif
> +
>  ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
>  UBOOT_DEPENDENCIES += host-dtc
>  endif
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
