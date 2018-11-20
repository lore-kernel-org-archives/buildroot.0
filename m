From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 20 Nov 2018 00:11:13 -0200
Subject: [Buildroot] qemu-aarch64 applications misbehaving
References: <CAKAbLo9SzmvsEGfhRyZRYLgRSocJUEgEbR=a9v2cBUsdqeKVig@mail.gmail.com>
Message-ID: <5bf36d417679f_75483ff1fa07b04437757@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Nov 19, 2018 at 02:04 PM, Zeno Endemann wrote:

> Applications run under qemu-aarch64 are misbehaving for me. For example,
> minimal (console only) Qt application are crashing on startup, and also the
> BusyBox's "df" (disk usage) is printing out silly numbers. While I'm not
> positive I suspect these are bugs in qemu.
> 
> I build the guest os using buildroot 2018.08.2,
> qemu_aarch64_virt_defconfig, and running it as instructed (minus network,
> don't need it):
> 
> qemu-system-aarch64 -M virt -cpu cortex-a57 -nographic -smp 1 -kernel
> output/images/Image -append "root=/dev/vda console=ttyAMA0" -drive
> file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device
> virtio-blk-device,drive=hd0
> 
> (Host os is Ubuntu 18.04, QEMU emulator version 2.11.1(Debian
> 1:2.11+dfsg-1ubuntu7.7))

I have exactly the same host OS and qemu version.

> 
> Can someone confirm this? Any hints would be much appreciated.

I confirm 'df' printing silly numbers with both these images:
2018.08.2 : https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/122632959
2018.11-rc1 : https://gitlab.com/buildroot.org/buildroot/-/jobs/118747268

On 2018.08.2 I also did this:
make qemu_aarch64_virt_defconfig
make menuconfig # and enable BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
make host-qemu # to build qemu 2.12.1
output/host/bin/qemu-system-aarch64 ...
and the issue with 'df' still occurs.

On current master (00d63a153d) I did this:
make qemu_aarch64_virt_defconfig
make menuconfig # and enable BR2_TOOLCHAIN_EXTERNAL
make clean
make
qemu-system-aarch64 ... # using the system-provided qemu 2.11.1
and the issue with 'df' does not occur.

> 
> While at it, another side question: Is there a reason why the
> qemu_aarch64_virt_defconfig built kernel does not include the drivers for
> qemu graphics emulation?

Regards,
Ricardo
