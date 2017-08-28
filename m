From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 28 Aug 2017 15:47:57 +0800
Subject: [Buildroot] minnowboard_max_defconfig,
 changes to build for 32-bit, fails in the end when installing grub
In-Reply-To: <20170828090545.61959c3c@windsurf>
References: <CAEUhbmW6BXHrudGz5LB4=xQYf3-3noyoUzDuryFv39_VUoP_cw@mail.gmail.com>
 <20170828090545.61959c3c@windsurf>
Message-ID: <CAEUhbmXdy31cqK4tMZsW6ghbS0R78wxJGnaFyfHU8QZkQGyHLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Aug 28, 2017 at 3:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun, 27 Aug 2017 19:57:48 +0800, Bin Meng wrote:
>
>> I wanted to build a 32-bit rootfs for minnowboard max, so I started by:
>>
>> $ make minnowboard_max_defconfig
>> $ make menuconfig
>> change "Target options" -> "Target Architecture" to i386, save and exit
>> $ make
>>
>> It fails in the end.
>>
>> mkdir -p /buildroot/output/images/
>> /buildroot/output/host/bin/grub-mkimage -d
>> /buildroot/output/host/lib/grub/i386-pc -O i386-pc -o
>> /buildroot/output/images/grub.img -p "(hd0,msdos1)/boot/grub"  boot
>> linux ext2 fat squash4 part_msdos part_gpt normal efi_gop
>> /buildroot/output/host/bin/grub-mkimage: error: cannot open
>> `/buildroot/output/host/lib/grub/i386-pc/efi_gop.mod': No such file or
>> directory.
>> package/pkg-generic.mk:308: recipe for target
>> '/buildroot/output/build/grub2-2.02/.stamp_target_installed' failed
>> make: *** [/buildroot/output/build/grub2-2.02/.stamp_target_installed] Error 1
>>
>> Am I missing anything?
>
> Yes: you're changing a defconfig to a different configuration, so
> obviously, you can get build failures.
>
> By switching to i386, grub2 is no longer configured with
> BR2_TARGET_GRUB2_X86_64_EFI (as specified in the defconfig), but with
> BR2_TARGET_GRUB2_I386_PC. But BR2_TARGET_GRUB2_BUILTIN_MODULES still
> contains efi_gop, which isn't built because you're no longer building
> an EFI-capable grub2.
>

Thanks for the hints. Since I changed "Target Architecture" to i386 in
menuconfig, I see the grub2 platform has also changed to "i386-pc"
automatically, but the built modules
(BR2_TARGET_GRUB2_BUILTIN_MODULES) remains unchanged, and that
explains the build error. Is this a limitation of Kconfig that it
cannot switch BR2_TARGET_GRUB2_BUILTIN_MODULES automatically?

I did further testing by switching "Target Architecture" back to
x86-64, and I saw grub2 platform did not change to the EFI stuff and
remained as "i386-pc".

Regards,
Bin
