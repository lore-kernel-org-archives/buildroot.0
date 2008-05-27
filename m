From: Wayne Keenan <wayne.keenan@gmail.com>
Date: Tue, 27 May 2008 18:20:24 +0100
Subject: [Buildroot] Anyone try simulating their
	Buildroot-createdfilesystem image in QEMU?
In-Reply-To: <326f33790805270933p6bcaea06v308438711ee2936@mail.gmail.com>
References: <326f33790805231205j302081b1oec193841dac80e0c@mail.gmail.com>
	<483AC264.6080500@tirsdagsklubben.nu>
	<270858e90805260907qe8164c2i47a230009c949191@mail.gmail.com>
	<483AEA55.5030603@tirsdagsklubben.nu>
	<270858e90805261022i40f298e7md5315975a4900267@mail.gmail.com>
	<326f33790805261313i5eb510c7g32caca585182692@mail.gmail.com>
	<003f01c8bf80$9f642a40$6614a8c0@softalap>
	<326f33790805270933p6bcaea06v308438711ee2936@mail.gmail.com>
Message-ID: <270858e90805271020m9d95bf4kdbdce6dfaa745053@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, May 27, 2008 at 5:33 PM, Arun Reddy <reddyac@gmail.com> wrote:

> I got a question for all you guys using these different methods. Did you
> enable RAM disk support in your kernel and initramfs in the buildroot
> menuconfig? That is, are you using an initial ramdisk to make use of the
> -initrd option in QEMU?
>
I do not, my kenrel args are:

noinitrd root=/dev/nfs
nfsroot=10.111.111.254:/nfs/share/arm,rw,rsize=32768,wsize=32768,hard,intr,tcp,nolock,nfsvers=3,timeo=100

ip=10.111.111.10::10.111.111.254:255.255.255.0:arm.qemu.lan:eth0


>
>
> On Mon, May 26, 2008 at 3:34 PM, <softa@ttechgroup.com> wrote:
>
>>  Hi All,
>>
>> I Think that the simplest way is to use the loopback device ... here is my
>> working scripts (i post them only for hints, they are ok for me, but are not
>> so clear):
>>
>> <code>
>> #!/bin/sh
>> #
>>
>> # set number of blocks for this image
>> BLOCKS=125000
>>
>> # set the geometry
>> HEADS=4
>> SECTORS=32
>> CYLINDERS=$((${BLOCKS} / $((${HEADS} * ${SECTORS}))))
>>
>> # input tar-red filesystem
>> INFS=rootfs.i586.tar
>>
>> # outputfile
>> OUT=rootfs.loop
>> OUTIMG=${OUT}.img
>> OUTVMDK=${OUT}.vmdk
>>
>> # mount point is!
>> MNTDIR=/mnt/hd
>>
>> # lilo is
>> LILO=./lilo.static
>> # lilo boot parameters
>> LILO_BIOS=0x80
>> LILO_ROOT=/dev/hda1
>>
>>
>> echo "Blocks=${BLOCKS} H:S:C=${HEADS}:${SECTORS}:${CYLINDERS}"
>>
>> echo "Create *Empty* image file..."
>> dd if=/dev/zero of=${OUTIMG} bs=512 count=${BLOCKS}
>>
>> echo "Generate input for fdisk..."
>> cat > fdisk.input.commands <<EOF
>> x
>> c
>> ${CYLINDERS}
>> h
>> ${HEADS}
>> s
>> ${SECTORS}
>> r
>> n
>> p
>> 1
>> 1
>> ${CYLINDERS}
>> a
>> 1
>> w
>> EOF
>>
>> echo "Exec fdisk to make partitions..."
>> fdisk ${OUTIMG} < fdisk.input.commands
>>
>> #dd if=mbr.img of=rootfs.loop.img bs=1 count=445 conv=notrunc
>>
>> echo "Mount new partition to the loopback device..."
>> LOOPPAR=$(losetup -f)
>> echo "Found free loop device: ${LOOPPAR}"
>> echo "Create loop device for partition 1 of the new disk..."
>> losetup -o $((${SECTORS} * 512)) ${LOOPPAR} ${OUTIMG}
>>
>> ORG_PBLOCKS=$(fdisk -s ${LOOPPAR})
>> PARTITION_BLOCKS=$((${ORG_PBLOCKS} - $((${HEADS} * ${SECTORS} / 2))))
>> echo "Newly created pratition PARTITION_BLOCKS=${PARTITION_BLOCKS}"
>>
>> echo "Make EXT2 file system on loop partition 1..."
>> mkfs.ext2 -L LinuxRoot ${LOOPPAR} ${PARTITION_BLOCKS}
>>
>> echo "Mount newly created ext2 fs to the mountpoint..."
>> mount ${LOOPPAR} ${MNTDIR}
>>
>> echo "Copy ext2 filesystem to the mountpoint..."
>> cat ${INFS} | tar -xC ${MNTDIR}
>>
>> LOOPDEV=$(losetup -f)
>> echo "Create loop device for the new disk..."
>> losetup ${LOOPDEV} ${OUTIMG}
>>
>> echo "Generate Lilo Conf..."
>> echo " bios=${LILO_BIOS}"
>> echo " root=${LILO_ROOT}"
>>
>> cat > lilo.conf.gen <<EOF
>> disk=${LOOPDEV}
>>     bios=${LILO_BIOS}
>>     heads=${HEADS} sectors=${SECTORS} cylinders=${CYLINDERS}
>>     partition=${LOOPPAR} start=${SECTORS}
>> boot=${LOOPPAR}
>> map=${MNTDIR}/boot/map
>> backup=/dev/null
>> compact
>> prompt
>> timeout=500
>> nowarn
>> lba32
>> #ignore-table
>> default=TcLinux
>> #vmdefault=TcL-VMW
>> # vga=788 800x600-16bpp
>> # vga=785 640x480-16bpp
>> # vga=791 1024x768-16bpp
>>
>> image=${MNTDIR}/boot/bzImage
>>     root="LABEL=LinuxRoot"
>>     label=TcLinux
>>     append="root=${LILO_ROOT}"
>>     vga=788
>>     read-only
>>
>> image=${MNTDIR}/boot/bzImage
>>     root="LABEL=LinuxRoot"
>>     label=TcLinux-Text
>>     append="root=${LILO_ROOT}"
>>     vga=normal
>>     read-only
>>
>> #image=${MNTDIR}/boot/bzImage
>> #    root=${LILO_ROOT}
>> #    label=TcLinux
>> #    read-only
>>
>> #image=${MNTDIR}/boot/bzImage-devel
>> #    root=${LILO_ROOT}
>> #    label=TcL-VMW
>> #    vga=788
>> #    read-only
>> #
>> #image=${MNTDIR}/boot/bzImage-devel
>> #    root=${LILO_ROOT}
>> #    label=TcL-VMW-640x480
>> #    vga=785
>> #    read-only
>>
>> EOF
>>
>> ${LILO} -C lilo.conf.gen -M ${LOOPDEV} mbr
>> ${LILO} -C lilo.conf.gen
>>
>> echo "Unmounting ext2 fs..."
>> umount ${LOOPPAR}
>> echo "Free used loop devices..."
>> losetup -d ${LOOPPAR}
>> losetup -d ${LOOPDEV}
>>
>> #rm -f ${OUTVMDK}
>> #qemu-img convert ${OUTIMG} -O vmdk ${OUTVMDK}
>> #
>> #rm -f ${OUTVMDK}.bz2
>> #bzip2 --best rootfs.loop.vmdk
>> </code>
>>
>> Agrrrhh, and also i use patched lilo, to work with loopback devices ... if
>> somebody is interested on this i will attach also the patches for lilo.
>> If someone plan touse grub, or something else ... the thinks are similar.
>>
>> BR,
>> Assen Stoyanov
>>
>> ----- Original Message -----
>>  *From:* Arun Reddy <reddyac@gmail.com>
>> *To:* Wayne Keenan <wayne.keenan@gmail.com>
>> *Cc:* Buildroot List <buildroot@uclibc.org>
>> *Sent:* Monday, May 26, 2008 11:13 PM
>> *Subject:* Re: [Buildroot] Anyone try simulating their
>> Buildroot-createdfilesystem image in QEMU?
>>
>> Hey fellas, I would like to thank you for having this discussion in my
>> thread. I completely understand the point that buildroot doesn't make disk
>> images. I too tried qemu-img convert to see if I can "convert" the buildroot
>> created image to a harddisk image. But to actually convert the buildroot
>> image to a harddisk image, I did this successfully with my x86 build using
>> the script under ~/buildroot/scripts/build-ext3-img. In that, it actually
>> goes through what Knut-Havard outlined. Have you guys taken a look at it? I
>> tried using this script for my arm build (I ran my x86 build using
>> VirtualBox, but VirtualBox doesn't support ARM targets), and it seemed like
>> I made a harddisk image, but I still can't boot it in QEMU.
>>
>> I think it might be worth looking into Wayne if you're curious. I will
>> play around with this method more and see what I can come up with. I have
>> yet to read the new link you gave as well. I hope to come up with something
>> by tonight!
>>
>> On Mon, May 26, 2008 at 10:22 AM, Wayne Keenan <wayne.keenan@gmail.com>
>> wrote:
>>
>>>
>>>
>>>   On Mon, May 26, 2008 at 5:50 PM, Knut-H?vard Aksnes <
>>> kna at tirsdagsklubben.nu> wrote:
>>>
>>>> Wayne Keenan wrote:
>>>>
>>>>> Hi,
>>>>>
>>>>> How about using the qemu-img  conversion utility to convert from
>>>>> ext[2|3] (or other) to qcow (qemu) format ?
>>>>>
>>>>> That's OK to do as soon as you have a disk image available in some
>>>> format. The problem is that buildroot doesn 't build disk images it builds
>>>> partition images. What's missing is some kind of simple tool that wraps one
>>>> or more partition images (plus optionally some kind of Master Boot Record)
>>>> into a disk image.
>>>
>>>
>>> good point.  *blush*
>>>
>>> What I curretly do is export the RFS directory as an NFS mount point and
>>> then am able to mount it from within an ARM QEMU session and also mount the
>>> same export on target device.  Admittedly, my NFS RFS its not my buildroot
>>> RFS right at the moment, just a core Debian one, I just haven't gotten
>>> around to exporting and trying the BR one yet.
>>>
>>> Regards
>>> Wayne
>>>
>>
>>  ------------------------------
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>>
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080527/de138bf5/attachment.htm 
