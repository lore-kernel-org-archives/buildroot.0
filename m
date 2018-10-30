From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 30 Oct 2018 14:35:08 +0530
Subject: [Buildroot] Queries/suggestions regarding patch series "grub2:
 add support for arm and aarch64"
In-Reply-To: <CAFA6WYP2bTxdkAKUem_O9GtPdt_hi4Hbg59XiWwEfNvLoc8ghQ@mail.gmail.com>
References: <CAFA6WYP2bTxdkAKUem_O9GtPdt_hi4Hbg59XiWwEfNvLoc8ghQ@mail.gmail.com>
Message-ID: <CAFA6WYMqv-ei1-1M4Y+D9k1iqhB1sVjvvvc=mhg_hAf86mJWVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gentle reminder.

On Tue, 23 Oct 2018 at 11:28, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Hello Erico,
>
> Firstly, apologies for not posting these comments on your patch-set
> [1] as I joined Buildroot ML yesterday only.
>
> I was recently exploring to test EFI boot using Buildroot on qemu
> aarch64 target. But currently GRUB support is missing for aarch64
> target in Buildroot. So I came across your patch-set. I have tested
> your patch-set on qemu/u-boot aarch64 target using efi. So I would say
> its:
>
> Tested-by: Sumit Garg <sumit.garg@linaro.org>
>
> However, I will suggest you to use PARTUUID for root path in grub.cfg
> as it will make it more generic and device independent as we could use
> either virtio, sata, usb or mmc. So I would propose a similar change
> as in [2].
>
> Apart from that, how do you think about adding qemu/u-boot target for
> aarch64 to Buildroot? As u-boot already have efi booting support using
> bootefi.
>
> [1] https://patchwork.ozlabs.org/project/buildroot/list/?submitter=46481
>
> [2] Change:
>
> diff --git a/board/aarch64-efi/genimage-efi.cfg
> b/board/aarch64-efi/genimage-efi.cfg
> index f93ab9d..4a38bfe 100644
> --- a/board/aarch64-efi/genimage-efi.cfg
> +++ b/board/aarch64-efi/genimage-efi.cfg
> @@ -16,6 +16,7 @@ image efi-part.vfat {
>  image disk.img {
>
>    hdimage {
> +    disk-signature = 0xDEEDBEEF
>    }
>
>    partition boot {
> diff --git a/board/aarch64-efi/grub.cfg b/board/aarch64-efi/grub.cfg
> index ab88da9..404670b 100644
> --- a/board/aarch64-efi/grub.cfg
> +++ b/board/aarch64-efi/grub.cfg
> @@ -2,5 +2,5 @@ set default="0"
>  set timeout="5"
>
>  menuentry "Buildroot" {
> -       linux /Image root=/dev/vda2 rootwait console=ttyAMA0
> +       linux /Image root=PARTUUID=deedbeef-02 rootwait console=ttyAMA0
>  }
>
> Regards,
> Sumit
