From: Alexandre Oliveira <alexandrenagy@gmail.com>
Date: Fri, 16 Oct 2015 09:33:53 +0000
Subject: [Buildroot] Kernel panic while trying to boot
 qemu_x86_64_defconfig on notebook with dual boot.
In-Reply-To: <562093C7.9000501@mind.be>
References: <CAAmaERMLtspQ2X-rSM_jaFGyqp_Gw1z6zOiPv=S9pZML=YjH-A@mail.gmail.com>
 <562093C7.9000501@mind.be>
Message-ID: <CAAmaEROCOJc_LYXDoFtBJwidH-h531ogKDY0EQJeKKnX6752Hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I realy Thank you Arnout for the asnwer.

There are still some questions to fully understand.

What I am trying to do now is do not use QEMU anymore.
I dont want to simulate a full computer. I want to boot the buildroot linux
after I reboot my notebook.

That's why I modified /boot/grub/grub.cfg from my Ubuntu, in order to
appear the new buildroot linux on bootloader after reboot.
There is not GRUB installed on buildroot linux.
After boot, GRUB will call /dev/sda7 operation system.
That's why I extracted the system image to /dev/sda7 partition. I wanna
boot it after reboot.

After reboot, I could start the kernel in /boot/bzImage inside /dev/sda7
partition.
However, kernel panics with:

===========================
VFS: Cannot open root device "sda7" or unknown-block(0,0)
Please append a correct "root=" boot option; here are the available
partitions:
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)  error -6
===========================

It looks like that in the new booting linux cannot find /dev/sda7 and mount
it on linux root directory /.

Do I explained it clearly now? Sorry about my poor english and explanation.
Is there another modification to do in order to boot buildroot linux on my
notebook?

Thanks again for the hurry answer and assistance !


Regards,
Alexandre Oliveira.



Em sex, 16 de out de 2015 ?s 03:47, Arnout Vandecappelle <arnout@mind.be>
escreveu:

>  Hi Alexandre,
>
>  I think you fail to understand what QEMU does. It emulates a complete PC.
> In
> other words...
>
> On 16-10-15 04:41, Alexandre Oliveira wrote:
> > Hello everyone.
> >
> > I am having a problem while trying to boot qemu_x86_64_defconfig on my
> notebook.
> > My configuration is really simple. The .config file is attached.
> >
> > Following the manual, I first tried to boot and run my configuration
> with QEMU,
> > using the command:
> >
> > ============
> > $ qemu-system-x86_64 -M pc -kernel images/bzImage -drive
> > file=images/rootfs.ext2,if=ide -append root=/dev/sda -net
> nic,model=rtl8139 -net
> > user
>
>  ... it will take images/rootfs.ext2 and present it to the guest (= the
> buildroot Linux) as if it's a complete hard disk. All the rest of your host
> system (= your Ubuntu) is completely invisible to the guest. Similarly, the
> guest will see an RTL8139 network interface even though you probably have a
> completely different network card in your PC. The guest can only access
> things
> that you explicitly pass to qemu.
>
> > ============
> >
> > This command works properly and Linux boots normally. After that, I
> created a
> > ext4 partition on /dev/sda7, which I mapped on /mnt/btlinux/
> >
> > ==================
> > $ sudo tar -C /mnt/btlinux/ -xf images/rootfs.tar
> > ==================
>
>  To pass this to qemu, you could unmount /mnt/btlinux and then start qemu
> with:
>
> qemu-system-x86_64 -M pc -kernel images/bzImage -drive
> file=/dev/sda7,if=ide
> -append root=/dev/sda -net nic,model=rtl8139 -net user
>
> i.e., replace images/rootfs.ext2 with /dev/sda7. This gives the guest
> direct
> access to a single partition of your hard drive. Note that it is a very
> bad idea
> to give the guest access to a mounted partition, since you'll have two
> OSes that
> try to read and write it simultaneously and they'll have a different idea
> of
> what is on there.
>
> >
> >
> > All files were correctly extracted to the partition. Then, I added one
> more boot
> > option on GRUB.cfg file.
>
>  In fact, with the -kernel command line option, grub isn't even used.
> That's why
> you don't see a menu and it starts Linux immediately.
>
> [snip]
>
> > 1 - Why QEMU boot work properly and when I extract the same image to
> /dev/sda7,
> > the boot fails?
> > 2 - What is QEMU doing that the 'normal boot' process are not doing?
> > 3 - Why the file at /boot/bzImage can be found but the device /dev/sda7
> can not?
> > 4 - Am I missing something?
>
>  Does this explain all your questions?
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151016/77eac59c/attachment.html>
