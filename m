From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jun 2014 20:32:24 +0200
Subject: [Buildroot] Is grub-bios-setup the way to go to make a bootable
 CF?
In-Reply-To: <CAEzGmjD9xC59mSjgPAr2GeB15cUwaExp7KfjbRyRMFVHD=92+g@mail.gmail.com>
References: <CAEzGmjD9xC59mSjgPAr2GeB15cUwaExp7KfjbRyRMFVHD=92+g@mail.gmail.com>
Message-ID: <20140627203224.1149e36a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lennart Ramberg,

On Fri, 27 Jun 2014 12:32:03 +0200, Lennart Ramberg wrote:

> I am struggling with making a grub 2-bootable Compact Flash for a BIOS
> based PC target.
> The closest I came so far in the target machine is:
>   grub rescue >
> 
> Then I found 'grub-bios-setup' as a possibly better alternative, but got
> stuck as below.
> Is grub-bios-setup the way to go at all?

Have you checked the detailed instructions available in the help text
of the grub2 package (accessible through xconfig/menuconfig) ? From the
help text:

          Notes on using Grub2 for BIOS-based platforms
          =============================================

          1. Create a disk image
             dd if=/dev/zero of=disk.img bs=1M count=32
          2. Partition it (either legacy or GPT style partitions work)
             cfdisk disk.img
              - Create one partition, type Linux, for the root
                filesystem. The only constraint is to make sure there
                is enough free space *before* the first partition to
                store Grub2. Leaving 1 MB of free space is safe.
          3. Setup loop device and loop partitions
             sudo losetup -f disk.img
             sudo partx -a disk.img
          4. Prepare the root partition
             sudo mkfs.ext3 -L root /dev/loop0p1
             sudo mount /dev/loop0p1 /mnt
             sudo tar -C /mnt -xf output/images/rootfs.tar
             sudo umount /mnt
          5. Install Grub2
             ./output/host/usr/sbin/grub-bios-setup \
                        -b ./output/host/usr/lib/grub/i386-pc/boot.img \
                        -c ./output/images/grub.img -d . /dev/loop0
          6. Your disk.img is ready!

Of course, this help text is about creating a disk image, but it should
apply (with minor changes) to a real device.

Let me know if that works for you!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
