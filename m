From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Thu, 20 May 2021 12:57:18 +0000
Subject: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: use
 tested bootloader version
In-Reply-To: <2bc574ee-4d0e-ce24-dcdd-ad1c3d50e9c2@grenoble.cnrs.fr>
References: <2bc574ee-4d0e-ce24-dcdd-ad1c3d50e9c2@grenoble.cnrs.fr>
Message-ID: <c1a0f379-c03a-5ef6-2ea4-2d6e7aca5eae@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5/19/21 10:43 PM, Edgar Bonet wrote:
> The new branch "4.x" of at91bootstrap has dropped the contrib directory,
> which holds the defconfigs used by the Acmesystems Acqua A5 boards. We
> then cannot use the latest at91bootstrap anymore.

Hello Edgar,

Your board is A5-based, I believe sama5d3 ?
In this case, the at91bootstrap4 can be used to boot your board.
What you have to do, is to create a custom defconfig for your board, to 
select sama5d3, your required external RAM memory, and everything else 
you may need. All the code is in place in this bootstrap. You can select 
whichever console output you like... etc.
After you make a complete custom defconfig, you can name it something 
like acmesystems... defconfig and then you can send us a patch through 
our github interface, and we will have the defconfig inside the 
'configs' directory like all the other boards.
The goal of at91bootstrap4 is to make it so highly customizable, that 
you do not really need an extra 'contrib board', just you should add a 
new defconfig and select everything you like.
There is however a slight chance that there is something missing, like a 
very specific board quirk. In this case, we have a collection of board 
quirks inside at91bootstrap4, and you can select one, or implement your 
own in a separate patch, and we will review it.

So if you plan to move to at91bootstrap4, you are welcome to do so.
You can also stay on at91bootstrap3, which will still be available 
indefinitely, just that we won't develop new things for it. We will 
still take and apply patches if you send us fixes.

Eugen

> 
> As commit e009816c67fc1335a9b2da8687b55c5ff6aa27cf introduced support
> for at91bootstrap 4.x in the "next" branch, it had to work around this
> by pinning these defconfigs to the "latest 3.x" version.
> 
> Avoid this and any future incompatibility problems by explicitly
> requesting a tested version of at91bootstrap.
> 
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> ---
>   configs/acmesystems_acqua_a5_256mb_defconfig | 2 ++
>   configs/acmesystems_acqua_a5_512mb_defconfig | 2 ++
>   2 files changed, 4 insertions(+)
> 
> Note: I made the patch against master, hopping it's the right branch. I
> realize this will cause a conflict when "next" will be merged into
> master. Should I submit the patch against next instead?
> 
> diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
> index 810c3c9782..6c4d1e5b50 100644
> --- a/configs/acmesystems_acqua_a5_256mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_256mb_defconfig
> @@ -17,6 +17,8 @@ BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_AT91BOOTSTRAP3=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.2)/at91bootstrap-v3.10.2.tar.gz"
>   BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-256m"
>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
> diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
> index 11a7e795e0..96989382ff 100644
> --- a/configs/acmesystems_acqua_a5_512mb_defconfig
> +++ b/configs/acmesystems_acqua_a5_512mb_defconfig
> @@ -17,6 +17,8 @@ BR2_TARGET_ROOTFS_EXT2=y
>   BR2_TARGET_ROOTFS_EXT2_4=y
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_AT91BOOTSTRAP3=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
> +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.2)/at91bootstrap-v3.10.2.tar.gz"
>   BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="acqua-512m"
>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
> --
> 2.25.1
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
