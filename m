From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Mon, 30 Jun 2014 10:23:06 +0200
Subject: [Buildroot] Is grub-bios-setup the way to go to make a bootable
	CF?
In-Reply-To: <20140627203224.1149e36a@free-electrons.com>
References: <CAEzGmjD9xC59mSjgPAr2GeB15cUwaExp7KfjbRyRMFVHD=92+g@mail.gmail.com>
 <20140627203224.1149e36a@free-electrons.com>
Message-ID: <CAEzGmjCgQmFhN9fuc_2z-Aj37k42Oyg4YmshkYbjy+pLAkFmEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you Thomas,

It helped to use sudo :-)
to get rid of that annoying
"cannot open `/boot/grub/device.map': No such file or directory."

Now, putting the thus created CF in the target system brings me (only) to:
grub>

Should I expect to automatically have come further?

--Details:---
I had disabled 'Run getty login prompt after boot'.
I selected to 'Install kernel image to /boot in target'.
So, my /boot contains only the directory grub and bzImage.
and /boot/grub contains only grub.cfg, which looks like:

grub.cfg:
set default="0"
set timeout="5"

menuentry "Buildroot" {
    linux /bzImage root=/dev/sda1 console=tty1
}
--End Details.-----

Regards
Lennart



On Fri, Jun 27, 2014 at 8:32 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Lennart Ramberg,
>
> On Fri, 27 Jun 2014 12:32:03 +0200, Lennart Ramberg wrote:
>
> > I am struggling with making a grub 2-bootable Compact Flash for a BIOS
> > based PC target.
> > The closest I came so far in the target machine is:
> >   grub rescue >
> >
> > Then I found 'grub-bios-setup' as a possibly better alternative, but got
> > stuck as below.
> > Is grub-bios-setup the way to go at all?
>
> Have you checked the detailed instructions available in the help text
> of the grub2 package (accessible through xconfig/menuconfig) ? From the
> help text:
>
>           Notes on using Grub2 for BIOS-based platforms
>           =============================================
>
>           1. Create a disk image
>              dd if=/dev/zero of=disk.img bs=1M count=32
>           2. Partition it (either legacy or GPT style partitions work)
>              cfdisk disk.img
>               - Create one partition, type Linux, for the root
>                 filesystem. The only constraint is to make sure there
>                 is enough free space *before* the first partition to
>                 store Grub2. Leaving 1 MB of free space is safe.
>           3. Setup loop device and loop partitions
>              sudo losetup -f disk.img
>              sudo partx -a disk.img
>           4. Prepare the root partition
>              sudo mkfs.ext3 -L root /dev/loop0p1
>              sudo mount /dev/loop0p1 /mnt
>              sudo tar -C /mnt -xf output/images/rootfs.tar
>              sudo umount /mnt
>           5. Install Grub2
>              ./output/host/usr/sbin/grub-bios-setup \
>                         -b ./output/host/usr/lib/grub/i386-pc/boot.img \
>                         -c ./output/images/grub.img -d . /dev/loop0
>           6. Your disk.img is ready!
>
> Of course, this help text is about creating a disk image, but it should
> apply (with minor changes) to a real device.
>
> Let me know if that works for you!
>
> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140630/80da00f0/attachment.html>
