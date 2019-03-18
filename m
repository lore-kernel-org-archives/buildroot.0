From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Mar 2019 15:10:23 -0700
Subject: [Buildroot] [PATCH v2 5/5] boot: riscv: Initial commit of
 OpenSBI
In-Reply-To: <20190318222650.2dbb3591@windsurf>
References: <20190318210106.6347-1-alistair.francis@wdc.com>
 <20190318210106.6347-5-alistair.francis@wdc.com>
 <20190318222650.2dbb3591@windsurf>
Message-ID: <CAKmqyKNLo9-b5b6ie5WQXOaRarkr=1k+wpEv__RA=HdBLD_TGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 18, 2019 at 2:26 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Alistair,
>
> On Mon, 18 Mar 2019 21:02:04 +0000
> Alistair Francis <Alistair.Francis@wdc.com> wrote:
>
> > OpenSBI is a much improved alternative to BBL (riscv-pk). Add OpenSBI
> > support to buildroot.
> >
> > OpenSBI is also set as the default boot loader for RISC-V.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> This should be two separate commits:
>
>  - One adding boot/opensbi/ as a new package
>
>  - One updating the defconfig to use opensbi (and the new Image kernel
>    format)
>
> So overall, you should have the following commits:
>
>         linux: allow BR2_LINUX_KERNEL_IMAGE on RISC-V
>         boot/opensbi: new package
>         configs/qemu_riscv*_virt: use opensbi instead of riscv-pk

Done, will be fixed in v3.

>
>
> >  N:   Alvaro G. M <alvaro.gamez@hazent.com>
> > diff --git a/board/qemu/riscv32-virt/readme.txt b/board/qemu/riscv32-virt/readme.txt
> > index 2da99580e5..f73f4278de 100644
> > --- a/board/qemu/riscv32-virt/readme.txt
> > +++ b/board/qemu/riscv32-virt/readme.txt
> > @@ -1,7 +1,11 @@
> > -Run the emulation with:
> > +Run Linux in emulation with:
> >
> > -  qemu-system-riscv32 -M virt -kernel output/images/bbl -append "root=/dev/vda ro console=ttyS0" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
> > +  qemu-system-riscv32 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80400000 -append "root=/dev/vda ro console=ttyS0" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
> >
> >  The login prompt will appear in the terminal that started Qemu.
> >
> > -Tested with QEMU 2.12.1
> > +It is also possible to boot u-boot in QEMU. Although at the time of testing there were some issues with the OpenSBI to u-boot hand off. Run u-boot in emulation with:
> > +
> > +  qemu-system-riscv32 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/u-boot,addr=0x80400000 -append "root=/dev/vda ro console=ttyS0" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
>
> The defconfig is not building U-Boot for RISC-V, so this part is not
> relevant in this readme.txt.

Although I think it makes sense to leave in for those who are
interested in booting u-boot, I will remove it.

>
> > +It is also possible to boot u-boot in QEMU. Although at the time of testing there were some issues with the OpenSBI to u-boot hand off. Run u-boot in emulation with:
> > +
> > +  qemu-system-riscv64 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/u-boot,addr=0x80200000 -append "root=/dev/vda ro console=ttyS0" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
>
> Ditto.
>
> > diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
> > new file mode 100644
> > index 0000000000..65d39aa664
> > --- /dev/null
> > +++ b/boot/opensbi/Config.in
> > @@ -0,0 +1,23 @@
> > +config BR2_TARGET_OPENSBI
> > +     bool "opensbi"
> > +     depends on BR2_riscv
> > +     help
> > +       OpenSBI aims to provide an open-source and extensible
> > +       implementation of the RISC-V SBI specification for a platform
> > +       specific firmware (M-mode) and a general purpose OS, hypervisor
> > +       or bootloader (S-mode or HS-mode). OpenSBI implementation can
> > +       be easily extended by RISC-V platform or System-on-Chip vendors
> > +       to fit a particular hadware configuration.
> > +
> > +       https://github.com/riscv/opensbi.git
> > +
> > +if BR2_TARGET_OPENSBI
> > +config BR2_TARGET_OPENSBI_PLAT
> > +     string "OpenSBI Platform"
> > +     default ""
> > +     help
> > +       Specifies the OpenSBI platform to build. If no platform is specified only
> > +       the OpenSBI platform independent static library libsbi.a is built. If a
> > +       platform is specified then the platform specific static library libplatsbi.a
> > +       and firmware examples are built.
>
> I'm pretty sure "make check-package" would whine here about the lines
> being too long. Could you make sure to run "make check-package" before
> your next submission ?

Yep, I didn't know that was an option.

>
> > +OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_OPENSBI_PLAT))
> > +ifneq ($(OPENSBI_PLAT),)
> > +     OPENSBI_MAKE_ENV += PLATFORM=$(OPENSBI_PLAT)
>
> No indentation here.

Fixed.

Alistair

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
