From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 17 Oct 2019 10:30:31 -0700
Subject: [Buildroot] qemu_riscv64_virt can't boot up with large cpio
 initial RAM filesystem
In-Reply-To: <20191016104813.GA10000@vmh-VirtualBox>
References: <2019100915262320629523@c-sky.com>
 <271a256064b670de4efcf805940de6b0926e4f24.camel@wdc.com>
 <20191016104813.GA10000@vmh-VirtualBox>
Message-ID: <CAKmqyKMtjEhhjDgOW4uXmxDx-WRsaNwo2YaTHUU8aKgHxv3cWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 16, 2019 at 3:49 AM Mao Han <han_mao@c-sky.com> wrote:
>
> On Tue, Oct 15, 2019 at 12:53:51AM +0000, Alistair Francis wrote:
> > On Wed, 2019-10-09 at 15:26 +0800, han_mao at c-sky.com wrote:
> > > Hi,
> > > I got some troble when I tried to use init ram fs on riscv64 virt.
> > > The default ext2 fs works fine. If I use cpio and init ram fs to
> > > replace that. The kernel can boot up with small ram fs, but
> > > a big ram fs(>100M) doesn't work.
> >
> > It's possible that your addresses are colliding. As in something is
> > being moved/written on top of your ramfs in memory and corrupting it.
> > It's also possible that you are out of memory?
> >
>
> I ran the qemu with -m 1024 so it doesn't look like a out of memory.
> LD_LIBRARY_PATH=../host/lib ../host/bin/qemu-system-riscv64 -M virt -m 1024 -kernel fw_jump.elf -device loader,file=Image,addr=0x80200000 -append "rootwait root=/dev/ram0" -nographic

Why not try passing the initrd in via QEMU's command lines and see if
that helps?

>
> > It's hard to debug without more information (such as a log).
> >
> Kernel almost output nothing when I start kernel with a large ram fs.

That seems like the problem. Look at why it isn't booting.

Alistair

> The log for small ram fs and large ram fs is attached.
>
> > Why do you need such a large ram fs? Why not just attach the image as a
> > drive?
> >
> I use buildroot to generate kernel image for our board, when the fpga
> board don't have any network/usb storage support, ram fs is a simple
> way to put all the required files into the system, and I want to verify
> that image on qemu.
>
> Thanks,
> Mao Han
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
