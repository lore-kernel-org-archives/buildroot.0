From: Andreas Ziegler <br015@umbiko.net>
Date: Sat, 25 Jan 2020 13:20:37 +0100
Subject: [Buildroot] vmlinuz on x86_64
In-Reply-To: <fd9f65e5eb361ad58d81c793458662de@umbiko.net>
References: <mailman.11.1579867203.254328.buildroot@busybox.net>
 <fd9f65e5eb361ad58d81c793458662de@umbiko.net>
Message-ID: <42c0dbc09d265f1c22688a3efd135381@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Date: Fri, 24 Jan 2020 04:55:50 -0600 (CST)
> From: a <anushka.parashar@tesco.com>
> To: buildroot at busybox.net
> Subject: [Buildroot] vmlinuz on x86_64
> Message-ID: <1579863350359-0.post@n4.nabble.com>
> Content-Type: text/plain; charset=us-ascii
> 
> Hi!
> 
> I'm trying to boot my image using Grub2 on efi mode. I have:
> 1. bzImage
> 2. initrd
> 
> But I'm not able to boot it.

Hi a,

I do not use UEFI normally, because the hardware refuses to boot without 
attached monitor.

While testing UEFI setups, I was able to boot a Buildroot generated 
bzImage using an UEFI enabled device. In the kernel configuration within 
Buildroot, CONFIG_EFI,CONFIG_EFI_PARTITION, CONFIG_EFI_RUNTIME_MAP, 
CONFIG_EFI_RUNTIME_WRAPPERS, and CONFIG_EFI_VARS are enabled; probably 
only CONFIG_EFI is needed.

Steps to reproduce:

# sgdisk --zap-all /dev/sdX
# sgdisk --new=1:0:600000 --typecode=1:ef00 /dev/sdX
# sgdisk --new=2:600000:0 --typecode=2:8300 /dev/sdX
# mkfs.vfat -F32 -n GRUB2EFI /dev/sdX1
# mkfs.ext4 -L NABLA /dev/sdX2

# mount /dev/sdX1 /mnt
# mkdir -p /mnt/EFI/BOOT
# grub-mkimage -o /mnt/EFI/BOOT/bootx64.efi -p /efi/boot -O x86_64-efi  
part_gpt part_msdos cpio fat exfat ext2  boot linux loopback normal 
search search_fs_file search_fs_uuid search_label test serial terminal 
efi_gop efifwsetup
# cat << EOF > /mnt/EFI/BOOT/grub.cfg
# grub.cfg
set timeout=3
set color_highlight=black/light-gray

menuentry 'nabla' {
search --set=root --label NABLA --hint hd0,gpt2
linux /boot/bzImage quiet
}

menuentry 'nabla-debug' {
         search --set=root --label NABLA --hint hd0,gpt2
         linux /boot/bzImage debug ignore_loglevel
}
EOF

# mkdir -p /tmp/nabla && mount /dev/sdX1 /tmp/nabla
# mkdir /tmp/nabla/boot
# cp /tmp/bzImage /tmp/nabla/boot/
# sync && umount /dev/sdX?

If your system does not boot check the frame buffer configuration (UEFI 
boot seems to not support text based output), the CONFIG_EFI kconfig 
variable, the modules needed /configured for grub2, and the boot 
partition flags.

Kind regards,
Andreas
