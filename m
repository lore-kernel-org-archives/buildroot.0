From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 23 Mar 2020 13:38:56 +0800
Subject: [Buildroot] [PATCH] configs/qemu_riscv{32,
 64}_virt_defconfig: Remove BR2_TARGET_GENERIC_GETTY_PORT
In-Reply-To: <20200322161316.GI2364@scaer>
References: <1583583630-25647-1-git-send-email-bmeng.cn@gmail.com>
 <8db0057c-b6a4-97ad-9446-c6a6aed558f3@gmail.com> <20200322160115.GH2364@scaer>
 <20200322161316.GI2364@scaer>
Message-ID: <CAEUhbmViD6uo_BeP4bRG_Gxe_UyXHoLvQ8GA7-J1KovpUTVvAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Mar 23, 2020 at 12:13 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Romain, Bin, All,
>
> On 2020-03-22 17:01 +0100, Yann E. MORIN spake thusly:
> > On 2020-03-22 16:52 +0100, Romain Naour spake thusly:
> > > Le 07/03/2020 ? 13:20, Bin Meng a ?crit :
> > > > Currently BR2_TARGET_GENERIC_GETTY_PORT is set to ttyS0 in both
> > > > qemu_riscv32_virt and qemu_riscv64_virt defconfig files. This
> > > > limits usecases when the same one rootfs could be used on QEMU
> > > > 'sifive_u' machine and SiFive HiFive Unleashed board.
> > > >
> > > > Remove it so that the default boot console can be used.
> > >
> > > By doing this change, we need to check if -nographic is used to start qemu (so
> > > the serial port is the default console) or if console=ttyS0 is used in the
> > > kernel command line.
> > >
> > > riscv32 and risc64 are both using -nographic to start Qemu.
> > >
> > > Your use case is similar to the one from [1]
> > >
> > > [1]
> > > https://git.buildroot.net/buildroot/commit/?id=131300e6f1d0745a1455d246684550e6ecb68549
> > >
> > > Reviewed-by: Romain Naour <romain.naour@gmail.com>
> >
> > Thanks Romain for this review (and for bringing me in!)
> >
> > However, I disagree: these defconfig files are for qemu, not the real
> > hardware.
> >

I understand your points.

> > Additionally, we do have a configuration for the hifive unleashed board
> > already, hifive_unleashed_defconfig, which is what should be used for
> > the real hardware.
>
> Romain pointed out on IRC that this change is in fact dual-sided:
>
>   - it allows the generic riscv defconfigs to boot on the real hardware
>     HiFive Unleashed board

The changes wanted to make the rootfs be generic so that it can be
reusable among all RISC-V targets. IMO QEMU RISC-V config is the best
candidate to do such things.

>
>   - it allows the generic riscv defconfigs to boot on the emulated
>     HiFive Unleashed board which is known to qemu as sifive_u.
>

That's correct.

> Still, my position does not change: if one wants to boot something in
> the sifive_u which emulates a HiFive Unleashed board, then one better
> use the original hifive_unleashed_defconfig, rather than the generic
> riscv one.
>

The hifive_unleashed_defconfig can do something specific to one
particular board (eg: generating a workable flash or SD card image),
but the proposed change in this patch is for generic RISC-V boards'
rootfs.

Regards,
Bin
