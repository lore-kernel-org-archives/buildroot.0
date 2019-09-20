From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 19 Sep 2019 23:56:31 -0300
Subject: [Buildroot] [PATCH] configs/pc_x86_64_efi: add GPT partition
 table support.
In-Reply-To: <20190807135457.6201-1-alexandre.payen@smile.fr>
References: <20190807135457.6201-1-alexandre.payen@smile.fr>
Message-ID: <CAJ4jsae13_UpqaNtf6hsXXjjNPgrOXz1f7u+maENN7-4rWmAhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 7, 2019 at 10:55 AM Aalx <alexandre.payen@smile.fr> wrote:
>
> From: Alexandre PAYEN <alexandre.payen@smile.fr>
>
> Based on commit fee29b05bb7db25e37c8a5175ce00dc712554edf[1].
> It add the use of GPT partition table on pc_x86_64_efi.
> This commit removed the use of genimage and replace it with a shell
> script.
>
> Since version 11, genimage support GPT partition table.

This is great. That script was not something I was exactly proud of. :-)

> Tested in QEMU, not on a physical device.
>
> So:
> - revert commit fee29b05bb7db25e37c8a5175ce00dc712554edf[1]
> - add GPT support
> - tweak shell script to add the correct UUID in genimage config.
>
> [1]: https://git.buildroot.net/buildroot/commit/?id=fee29b05bb7db25e37c8a5175ce00dc712554edf
> [2]: https://git.buildroot.net/buildroot/commit/?id=79b8540d624ac4846ba341b1b9691eccacf0bc05
>
> Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
> Cc: Carlos Santos <casantos@datacom.com.br>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> I hope it's the proper way to do it.
> Actually, just adding `gpt = true` in the genimage-efi.cfg work also.
> But, doing so, the UUID will not be the same in grub bootloader and
> disk image ...
> ---
>  board/pc/genimage-efi.cfg       | 39 +++++++++++++++++++++
>  board/pc/grub-efi.cfg           |  6 ++++
>  board/pc/post-build.sh          | 14 ++++++--
>  board/pc/post-image-efi-gpt.sh  | 62 ---------------------------------
>  board/pc/post-image-efi.sh      |  6 ++++
>  configs/pc_x86_64_efi_defconfig |  5 ++-
>  6 files changed, 67 insertions(+), 65 deletions(-)
>  create mode 100644 board/pc/genimage-efi.cfg
>  create mode 100644 board/pc/grub-efi.cfg
>  delete mode 100755 board/pc/post-image-efi-gpt.sh
>  create mode 100755 board/pc/post-image-efi.sh
>
> diff --git a/board/pc/genimage-efi.cfg b/board/pc/genimage-efi.cfg
> new file mode 100644
> index 0000000000..6079178235
> --- /dev/null
> +++ b/board/pc/genimage-efi.cfg
> @@ -0,0 +1,39 @@
> +image efi-part.vfat {
> +  vfat {
> +    file startup.nsh {
> +      image = "efi-part/startup.nsh"
> +    }
> +    file EFI {
> +      image = "efi-part/EFI"
> +    }
> +    file bzImage {
> +      image = "bzImage"
> +    }
> +  }
> +  size = 16777216
> +}
> +
> +image disk.img {
> +
> +
> +  hdimage {
> +    gpt = true
> +  }
> +
> +  partition boot {
> +    image = "efi-part.vfat"
> +    partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
> +    offset = 32768
> +    size = 16777216
> +    bootable = true
> +  }
> +
> +  partition root {
> +    partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
> +    partition-uuid = UUID_TMP
> +    image = "rootfs.ext2"
> +    offset = 16809984
> +  }
> +
> +
> +}
> \ No newline at end of file
> diff --git a/board/pc/grub-efi.cfg b/board/pc/grub-efi.cfg
> new file mode 100644
> index 0000000000..bd44666404
> --- /dev/null
> +++ b/board/pc/grub-efi.cfg
> @@ -0,0 +1,6 @@
> +set default="0"
> +set timeout="5"
> +
> +menuentry "Buildroot" {
> + linux /bzImage root=PARTUUID=UUID_TMP rootwait console=tty1
> +}
> diff --git a/board/pc/post-build.sh b/board/pc/post-build.sh
> index b245cc00c6..425fccbe30 100755
> --- a/board/pc/post-build.sh
> +++ b/board/pc/post-build.sh
> @@ -4,7 +4,17 @@ set -e
>
>  BOARD_DIR=$(dirname "$0")
>
> -cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
> +# Detect boot strategy, EFI or BIOS
> +if [ -f "$BINARIES_DIR/efi-part/startup.nsh" ]; then
> +    cp -f "$BOARD_DIR/grub-efi.cfg" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
> +else
> +    cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
> +
> +    # Copy grub 1st stage to binaries, required for genimage
> +    cp -f "$HOST_DIR/lib/grub/i387-pc/boot.img" "$BINARIES_DIR"
> +fi
> +
> +#cp -f "$BOARD_DIR/grub-bios.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
>
>  # Copy grub 1st stage to binaries, required for genimage
> -cp -f "$HOST_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
> +#cp -f "$HOST_DIR/lib/grub/i386-pc/boot.img" "$BINARIES_DIR"
> diff --git a/board/pc/post-image-efi-gpt.sh b/board/pc/post-image-efi-gpt.sh
> deleted file mode 100755
> index d2acd8f852..0000000000
> --- a/board/pc/post-image-efi-gpt.sh
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -#!/bin/sh
> -
> -set -e
> -
> -cd ${BINARIES_DIR}
> -
> -# GPT partition type UUIDs
> -esp_type=c12a7328-f81f-11d2-ba4b-00a0c93ec93b
> -linux_type=44479540-f297-41b2-9af7-d131d5f0458a
> -
> -# Partition UUIDs
> -efi_part_uuid=$(uuidgen)
> -root_part_uuid=$(uuidgen)
> -
> -# Boot partition offset and size, in 512-byte sectors
> -efi_part_start=64
> -efi_part_size=32768
> -
> -# Rootfs partition offset and size, in 512-byte sectors
> -root_part_start=$(( efi_part_start + efi_part_size ))
> -root_part_size=$(( $(stat -c %s rootfs.ext2) / 512 ))
> -
> -first_lba=34
> -last_lba=$(( root_part_start + root_part_size ))
> -
> -# Disk image size in 512-byte sectors
> -image_size=$(( last_lba + first_lba ))
> -
> -cat > efi-part/EFI/BOOT/grub.cfg <<EOF
> -set default="0"
> -set timeout="5"
> -
> -menuentry "Buildroot" {
> -       linux /bzImage root=PARTUUID=$root_part_uuid rootwait console=tty1
> -}
> -EOF
> -
> -# Create EFI system partition
> -rm -f efi-part.vfat
> -dd if=/dev/zero of=efi-part.vfat bs=512 count=0 seek=$efi_part_size
> -mkdosfs  efi-part.vfat
> -mcopy -bsp -i efi-part.vfat efi-part/startup.nsh ::startup.nsh
> -mcopy -bsp -i efi-part.vfat efi-part/EFI ::EFI
> -mcopy -bsp -i efi-part.vfat bzImage ::bzImage
> -
> -rm -f disk.img
> -dd if=/dev/zero of=disk.img bs=512 count=0 seek=$image_size
> -
> -sfdisk disk.img <<EOF
> -label: gpt
> -label-id: $(uuidgen)
> -device: /dev/foobar0
> -unit: sectors
> -first-lba: $first_lba
> -last-lba: $last_lba
> -
> -/dev/foobar0p1 : start=$efi_part_start,  size=$efi_part_size,  type=$esp_type,   uuid=$efi_part_uuid,  name="efi-part.vfat"
> -/dev/foobar0p2 : start=$root_part_start, size=$root_part_size, type=$linux_type, uuid=$root_part_uuid, name="rootfs.ext2"
> -EOF
> -
> -dd if=efi-part.vfat of=disk.img bs=512 count=$efi_part_size seek=$efi_part_start conv=notrunc
> -dd if=rootfs.ext2   of=disk.img bs=512 count=$root_part_size seek=$root_part_start conv=notrunc
> diff --git a/board/pc/post-image-efi.sh b/board/pc/post-image-efi.sh
> new file mode 100755
> index 0000000000..5839219dd8
> --- /dev/null
> +++ b/board/pc/post-image-efi.sh
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +
> +UUID=`dumpe2fs test/images/rootfs.ext2 | grep UUID | cut -f 2 -d ':' | sed 's/ //g'`

No need to use grep, cut and sed, see below.

> +sed -i "s/UUID_TMP/$UUID/g" $BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg
> +sed "s/UUID_TMP/$UUID/g" $3 > $BINARIES_DIR/genimage-efi.cfg

No need to pass board/pc/genimage-efi.cfg as an argument to the script.

> +sh support/scripts/genimage.sh $2 $BINARIES_DIR/genimage-efi.cfg

genimage.sh is already an executable bash script. Using sh may cause
problems in the future.

After some polishing and passing trough shellcheck, it becomes:

---8<---
#!/bin/sh

# exit on any failure
set -e

UUID=$(dumpe2fs "$BINARIES_DIR/rootfs.ext2" 2>/dev/null | sed -n
's/^Filesystem UUID: *\(.*\)/\1/p')
sed -i "s/UUID_TMP/$UUID/g" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
sed "s/UUID_TMP/$UUID/g" board/pc/genimage-efi.cfg >
"$BINARIES_DIR/genimage-efi.cfg"
---8<---

> diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
> index 324de35dff..b6445bb5e4 100644
> --- a/configs/pc_x86_64_efi_defconfig
> +++ b/configs/pc_x86_64_efi_defconfig
> @@ -10,6 +10,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>
>  # Required tools to create bootable media
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_MTOOLS=y
>
>  # Bootloader
> @@ -21,7 +22,9 @@ BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi-gpt.sh"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-efi.cfg"

BR2_ROOTFS_POST_SCRIPT_ARGS is not necessary (see above)

>  # Linux headers same as kernel, a 4.18 series
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
> --
> 2.21.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Sorry for the terribly late review.

-- 
Carlos Santos <unixmania@gmail.com>
