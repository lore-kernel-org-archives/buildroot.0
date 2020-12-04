From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Fri, 4 Dec 2020 08:26:45 +0000
Subject: [Buildroot] [PATCH] Revert "package/gdb: prevent gdbserver
 being selected for RISC-V builds"
In-Reply-To: <20201204091325.31cc0f2a@windsurf.home>
References: <20201204014549.2669932-1-vgupta@synopsys.com>
 <20201204091325.31cc0f2a@windsurf.home>
Message-ID: <0dcca055-35c9-4089-a9b9-8fa8ca253640@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 12/4/20 12:13 AM, Thomas Petazzoni wrote:
> Hello,
>
> On Thu,  3 Dec 2020 17:45:49 -0800
> Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
>> This reverts commit 44a9babcc67cd011e957ba9fd1cf741891957c12.
>>
>> As of Buildroot 2020.11 (glibc build of qemu_riscv64_virt_defconfig),
>> cross-gdb for RISCV buildis fine and can also attach to a qemu
>> instance, so remove the gate on not building it.
> Is this true for all gdb versions we support ? We currently support
> 8.2, 8.3 and 9.2.

My working setup has gdb 8.3 and I just tested 8.2 works well too - I'm 
guessing 9.2 should be fine.

riscv64-softmmu/qemu-system-riscv64 -M virt -nographic -bios 
images/fw_jump.elf? -kernel images/Image? -append "root=/dev/vda ro"? 
-drive file=images/rootfs.ext2,format=raw,id=hd0 -device 
virtio-blk-device,drive=hd0? -netdev user,id=net0 -device 
virtio-net-device,netdev=net0 -s -S


./host/usr/bin/riscv64-linux-gdb
GNU gdb (GDB) 8.2.1
Copyright (C) 2018 Free Software Foundation, Inc.
(gdb) file build/linux-5.4.58/vmlinux

(gdb) b start_kernel
Breakpoint 1 at 0xffffffe00000070e

(gdb) target remote :1234
Remote debugging using :1234
warning: Target-supplied registers are not supported by the current 
architecture
0x0000000000001000 in ?? ()
(gdb) c
Continuing.

Breakpoint 1, 0xffffffe00000070c in start_kernel ()
(gdb) si
0xffffffe00000070e in start_kernel ()

-Vineet
