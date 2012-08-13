From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 13 Aug 2012 18:32:08 +0800
Subject: [Buildroot] [PATCH 5/5] buildroot: initramfs: Generate vmImage
 without builtin initramfs rootfs.
In-Reply-To: <20120811201335.09a3082e@skate>
References: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
 <1344330577-25159-5-git-send-email-sonic.adi@gmail.com>
 <20120811201335.09a3082e@skate>
Message-ID: <CAJxxZ0NiToOrkAbk2Wd=YBJyAmVEMd108hHN2NhfwBBvd=efOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 12, 2012 at 2:13 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Tue, 7 Aug 2012 17:09:37 +0800,
> Sonic Zhang <sonic.adi@gmail.com> a ?crit :
>
>> From: Sonic Zhang <sonic.zhang@analog.com>
>>
>> This is for developer's convenience when debugging via initramfs uImage.
>>
>> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>
> What is the problem being solved here? Could you expand a bit on the
> "why" this is needed? When you make changes to the root filesystem and
> do "make", the initramfs is regenerated, and the kernel image is
> regenerated as well with the current Buildroot, so I'm not sure what
> this patch is solving.

The uImage generated for initramfs can't be used directly to boot
kernel with a rootfs on the other device by setting boot parameters
"root=/dev/mtdblock0" in uboot. Some test cases need to boot from the
other device without rebuilding the uImage for initramfs.

This patch generates a pure kernel image (vmImage) for developers
convenience in addition to the uImage which has initramfs linked in.


Regards,

Sonic

>
>> +     $(if $(BR2_TARGET_ROOTFS_INITRAMFS),
>> +             cp $(LINUX_IMAGE_PATH) $(KERNEL_ARCH_PATH)/boot/vmImage)
>
> I'm confused. What is this vmImage thing that you are copying back into
> the kernel tree here...
>
>>  define LINUX_INSTALL_IMAGES_CMDS
>>       cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
>> +     $(if $(BR2_TARGET_ROOTFS_INITRAMFS),
>> +             cp $(KERNEL_ARCH_PATH)/boot/vmImage $(BINARIES_DIR))
>
> and installing to output/images here?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
