From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 5 Jul 2020 16:13:37 +0200
Subject: [Buildroot] [PATCH] qemu_aarch64_virt: use the in-kernel
 defconfig
In-Reply-To: <CAK7LNATQBqH0Od3Ux00YiWrA41PQO6DMQndGzpGhretSJzOa8w@mail.gmail.com>
References: <20200704141802.1586504-1-masahiroy@kernel.org>
 <affa122f-ca38-e1f8-7bba-79ece4e87024@gmail.com>
 <CAK7LNATQBqH0Od3Ux00YiWrA41PQO6DMQndGzpGhretSJzOa8w@mail.gmail.com>
Message-ID: <bddd7d10-fe39-d7eb-34d7-4709bf778c88@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Masahiro,

Le 04/07/2020 ? 19:07, Masahiro Yamada a ?crit?:
> On Sun, Jul 5, 2020 at 12:41 AM Romain Naour <romain.naour@gmail.com> wrote:
>>
>> Hi Masahiro,
>>
>> Le 04/07/2020 ? 16:18, Masahiro Yamada a ?crit :
>>> The defconfig file from the kernel tree works enough for the
>>> qemu-system-aarch64 virt machine. Remove the custom config file.
>>
>> I'm agree that we should use the architecture's default configuration when
>> possible and use a defconfig fragment to enable (or disable) additional options.
>>
>> Note: The default defconfig contain more option enabled that the defconfig
>> provided by Buildroot. The kernel build time is slightly increased.
>>
>> Can you compare the diff between the two defconfig ?
> 
> 
> I attached the diff file because it has 4970 lines.
> 
> 
> Just in case, the following is how I checked the diff
> in-kernel defconfig vs buildroot custom config.
> 
> 
> $ git checkout v5.4.42
> $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- O=default defconfig
> $ mkdir custom
> $ cp ~/ref/buildroot/board/qemu/aarch64-virt/linux.config  custom/.config
> $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-  O=custom   olddefconfig
> $ scripts/diffconfig  default/.config  custom/.config > diff.txt

Why not use savedefconfig ?

Here is the options enabled by the custom defconfig but not enabled by the
architecture's default configuration:

CONFIG_BINFMT_MISC=y
CONFIG_PACKET_DIAG=y
CONFIG_NET_KEY=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_NET_SCHED=y
CONFIG_VSOCKETS=y
CONFIG_CHR_DEV_SG=y
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y
CONFIG_SCSI_VIRTIO=y
CONFIG_DUMMY=y
CONFIG_NLMON=y
CONFIG_HW_RANDOM_VIRTIO=y
CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
CONFIG_PL320_MBOX=y
CONFIG_TMPFS_POSIX_ACL=y

Those two options are build inside the kernel by the custom defconfig but build
as a module by the architecture's default configuration:
CONFIG_MACVLAN=y
CONFIG_HW_RANDOM=y

> 
>> If some options enabled in the custom linux.conf but not in the architecture's
>> default configuration, we need to consider adding them in a defconfig fragment file.
> 
> 
> This custom config was added in 2014
> (commit 6999e6760dc1dda6a25cf5250bedad28ed16dc16)

Unfortunately we don't have an explanation why some option has been enabled in
the custom defconfig.

At least, CONFIG_HW_RANDOM_VIRTIO should be kept for qemu testing in order to
use the random number generator provided by Qemu.

> 
> Since then, the default in the kernel has changed a lot.
> 
> 
> Do you think it would make sense to
> keep the thousands of lines of config fragment?
> 
> Can you explain _why_ each config in the fragment file
> needs to be customized?

By using savedefconfig, the config fragment should contain a short list of options.

> 
> 
> I believe the sensible way is to throw away the
> 6-year-old config setting.
> 
> Just use the in-kernel default (with test).
> 
> 
> My motivation of this commit is
> buildroot custom config
> (board/qemu/aarch64-virt/linux.config)
> does NOT work for -bios boot.
> (TF-A -> edk2 -> kernel)
> I did not dig into why.
> 
> 
> The in-kernel defconfig works both
> -kernel boot and -bios boot
> as far as I tested.
> 
> So, I trust the in-kernel defconfig
> rather than the buildroot custom file.

Note that qemu defconfig are not for generic purpose, Buildroot users should
customize the kernel configuration as needed.

Best regards,
Romain

> 
> 
> 
>> Best regards,
>> Romain
> 
> 
> 
