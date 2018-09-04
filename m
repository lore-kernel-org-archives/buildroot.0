From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 4 Sep 2018 12:06:22 +0100
Subject: [Buildroot] [PATCH 1/1] configs/qemu: add
 qemu_riscv64_virt_defconfig
In-Reply-To: <CALURroTrVJq20uNXSsxsCEwZjYYEvGF0-KZyEeKokxw1p4FdKA@mail.gmail.com>
References: <20180831143853.24340-1-mark.corbin@embecosm.com>
 <CALURroTrVJq20uNXSsxsCEwZjYYEvGF0-KZyEeKokxw1p4FdKA@mail.gmail.com>
Message-ID: <09c18768-5757-e4ca-deac-0fb8d502d1da@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christopher

On 02/09/18 16:09, Christopher McCrory wrote:
>
>
> On Fri, Aug 31, 2018 at 7:40 AM Mark Corbin <mark.corbin@embecosm.com
> <mailto:mark.corbin@embecosm.com>> wrote:
>
>     Add RISC-V 64-bit defconfig for QEMU virt machine.
>
>     Tested with QEMU 2.12.1
>
>     Signed-off-by: Mark Corbin <mark.corbin@embecosm.com
>     <mailto:mark.corbin@embecosm.com>>
>     ---
>     ?board/qemu/riscv64-virt/linux.config | 24 ++++++++++++++++++++++++
>     ?board/qemu/riscv64-virt/readme.txt? ?| 22 ++++++++++++++++++++++
>     ?configs/qemu_riscv64_virt_defconfig? | 24 ++++++++++++++++++++++++
>     ?3 files changed, 70 insertions(+)
>     ?create mode 100644 board/qemu/riscv64-virt/linux.config
>     ?create mode 100644 board/qemu/riscv64-virt/readme.txt
>     ?create mode 100644 configs/qemu_riscv64_virt_defconfig
>
>
> <snip>
>
> I've been using the Raspberry pi platform,? but I recently saw the
> HiFive1 [1] and want to try it out. So this patch came at at
> fortuitous time.
The HiFive1 only has 16K of on-board RAM and no DRAM controller. To run
Linux you'd need a Hifive Unleashed. Alternatively, you can boot Linux
on a lowRISC core using a Nexys4 DDR FPGA board from Digilent which is
only $265. I plan to try this soon, but I haven't worked out how to
combine my Buildroot kernel image with the lowRISC version of the BBL
bootloader yet...another job for my TODO list.
>
> the defconfig as is works and boots up in qemu !
> # cat /etc/os-release
> NAME=Buildroot
> VERSION=2018.08-rc3-00002-gf478e82db1
> ID=buildroot
> VERSION_ID=2018.08-rc3
> PRETTY_NAME="Buildroot 2018.08-rc3"
> # uname -a
> Linux buildroot 4.15.0 #1 SMP Sat Sep 1 02:17:41 PDT 2018 riscv64
> GNU/Linux
> # cat /proc/cpuinfo
> hart??? : 0
> isa??? : rv64imafdcsu
> mmu??? : sv48
>
> # dmesg
> OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
> Linux version 4.15.0 (chrismcc at wednesday) (gcc version 7.3.0
> (Buildroot 2018.08-rc3-00002-gf478e82db1)) #1 SMP Sat Sep 1 02:17:41
> PDT 2018
>
> So:
>
> Tested-by: Christopher McCrory <chrismcc@gmail.com
> <mailto:chrismcc@gmail.com>>
>
>
>
> I then added some more packeges, most failed loading libraries
>
> perl works!
> # perl -E "say 'Hello World!'"
> Hello World!
>
> # bash
> bash: error while loading shared libraries: libreadline.so.7: cannot
> open shared object file: No such file or directory
>
> # ps ax
> ps: error while loading shared libraries: libprocps.so.7: cannot open
> shared object file: No such file or directory
> # vim /tmp/foo
> vim: error while loading shared libraries: libncurses.so.6: cannot
> open shared object file: No such file or directory
> # httpd -V
> httpd: error while loading shared libraries: libpcre.so.1: cannot open
> shared object file: No such file or directory
>
> # lsmod
> lsmod: error while loading shared libraries: libz.so.1: cannot open
> shared object file: No such file or directory
> # busybox lsmod
> lsmod: /proc/modules: No such file or directory
> Module????????????????? Size? Used by??? Not tainted
>
> # tcpdump
> tcpdump: error while loading shared libraries: libpcap.so.1: cannot
> open shared object file: No such file or directory
> # sudo pwd
> sudo: error in /etc/sudo.conf, line 0 while loading plugin
> "sudoers_policy"
> sudo: unable to load /usr/libexec/sudo/sudoers.so: libz.so.1: cannot
> open shared object file: No such file or directory
> sudo: fatal error, unable to load plugins
I've tried this myself - looks like I have a library path issue to sort
out! The libraries appear to have been built correctly, I suspect that
they are just in unexpected locations.

Regards

Mark
>
>
>
> [1] https://www.sifive.com/products/hifive1/
>
> ?
> -- 
> Christopher McCrory
> To the optimist, the glass is half full.
> To the pessimist, the glass is half empty.
> To the engineer, the glass is twice as big as it needs to be.

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180904/bb085bdf/attachment.html>
