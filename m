From: D. Olsson <hi@senzilla.io>
Date: Tue, 05 Jan 2021 09:09:41 +0000
Subject: [Buildroot] [PATCH v3 09/11]
 configs/qemu_aarch64_virt_efi_defconfig: new config for QEMU Virt EFI
In-Reply-To: <20201230133037.GQ1680670@scaer>
References: <20201218202646.1060123-1-hi@senzilla.io>
 <20201218202646.1060123-10-hi@senzilla.io> <20201230133037.GQ1680670@scaer>
Message-ID: <fJaHU_6nSNOlurIr_gpcfKXwue6M9hKkVTOLIXFOY9__bCSjpm7Mky2HV-jaUvjvulumd74_OSZiNNKxtrREqczH3eUPHEoaYIYqL0m0WhY=@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

I will address the rest of your feedback for this series directly
in the next revision. But this email requires some more in-depth
explanation from me.

On Wednesday, December 30, 2020 2:30 PM,
Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> > +# Set up the kernel executable according to the UEFI standard.
> > +mkdir -p ${EFI_DIR}
> > +ln -sf ${BINARIES_DIR}/Image ${EFI_DIR}/bootaa64.efi
>
> So, if I understand correctly, ${EFI_DIR}/bootaa64.efi will be an
> absolute symlink to ${BINARIES_DIR}/Image, and then ${EFI_DIR} will be
> used to populate the VFAT image used as first partition.
>
> But two things:
>
> 1.  the symlinks target will be invalid at runtime, as it contains a
>     path on the build machine;
>
> 2.  VFAT can't handle symlinks anyway.
>
>     So, does genimage follow symlinks when it generates the VFAT image?

So genimage will follow the symlinks and create the appropriate files in the image. I felt it was cleaner and more robust to
create links rather than constantly copy and re-copy files on
every build.


> > +# The QEMU virt machine expects the BIOS flash device to be 64M.
> > +rm -rf ${BINARIES_DIR}/flash.bin
> > +dd if=${BINARIES_DIR}/bl1.bin of=${BINARIES_DIR}/flash.bin bs=4096 conv=notrunc
> > +dd if=${BINARIES_DIR}/fip.bin of=${BINARIES_DIR}/flash.bin seek=64 bs=4096 conv=notrunc
>
> You said "flash device [must] be 64M" but 644K is not 64M. Also, this
> just starts the dump at offset 644K, but does not guarantee theresulting file to be exactly 64M...

The inline comment is incorrect, thanks for catching!
I will fix in my next revision.


> cp "${BINARIES_DIR}/bl1.bin" "${BINARIES_DIR}/flash.bin"
> truncate -s $((64*4096)) "${BINARIES_DIR}/flash.bin"
> cat "${BINARIES_DIR}/fip.bin" >> "${BINARIES_DIR}/flash.bin"
>
>     truncate -s 64M "${BINARIES_DIR}/flash.bin"
>
>
> But yes, I can see here how using truncate is sub-optimal... Keeping
> some incantations of dd is acceptable here.

The offset for fip.bin needs to be exactly 64 bytes from the end of bl1.bin. So I think it's easier to use dd here instead of
cat/truncate.


> > -   output/host/bin/qemu-system-aarch64 \
> > -   -M virt,secure=on,gic-version=3 \
> > -   -cpu cortex-a57 \
> > -   -smp 4 \
> > -   -m 1024 \
> > -   -nographic \
> > -   -bios output/images/flash.bin \
> > -   -drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
> > -   -device virtio-blk-device,drive=hd0
>
> Mix of leading space and TAB s (use spaces only, please).

Will fix!


> > +# Filesystem / image
> > +BR2_TARGET_ROOTFS_EXT2=y
> > +BR2_TARGET_ROOTFS_EXT2_4=y
> > +BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
> > +# BR2_TARGET_ROOTFS_TAR is not set
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-virt-efi/post-image.sh support/scripts/genimage.sh"
>
> Ah, something I forgot to comment on on the other patches: the name
> 'post-image.sh' is a bit too generic. Please try to find a better name
> that explains what the script actually does, e.g.:
>
> board/qemu/aarch64-virt-efi/assemble-bios-flash-image
>
> (and no need to end the filename with '.sh')

Ok. Since it's not really BIOS in the strict sense I will simply
name the scripts "assemble-flash-images" since we assemble
multiple images, i.e. the EFI system partition and boot flash images.



Cheers

D. Olsson
PGP: 8204A8CD
