From: lee choon gay <choongay@yahoo.com>
Date: Wed, 20 Aug 2014 19:31:49 -0700
Subject: [Buildroot] About i386 Architecture and Grub2
In-Reply-To: <20140820141013.24de59df@free-electrons.com>
References: <1408534632.82498.YahooMailNeo@web141703.mail.bf1.yahoo.com>
 <20140820141013.24de59df@free-electrons.com> 
Message-ID: <1408588309.32587.YahooMailNeo@web141705.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi. Thanks for replying.

I build the code with settings below.
menuconfig -> Filesystem images -> ext4.
menuconfig -> Filesystem images -> tar the root filesystem.
menuconfig -> System configuration -> Init system with Busybox (default).
menuconfig -> Toolchain -> Buildroot toolchain (default).
menuconfig -> Toolchain -> C library uClibc (default).

Steps to build the partitions.
1) I use sudo dd if=/dev/zero bs=1M count=1 of=/dev/sdb to wipe out the original partition in my pendrive.
2) sudo fdisk -l will shows /dev/sdb doesn't contain
 a valid partition table.
3) To recreate the partition, I use sudo fdisk /dev/sdb.
4) I enter n for new partition, p for primary, label partition as 1, default minimum for first sector, 5000000 for last sector.
5) Then enter n again to create second partition, p for primary, label partition as 2, 5000001 for first sector, default maximum for last sector.
6) Then enter w to write the partition table.
7) Power cycle the pendrive.
8) I format the partitions using sudo mkfs.ext4 /dev/sdb1 and sudo mkfs.ext4 /dev/sdb2.
9) I sudo mount /dev/sdb1 /home/leecgy/temp1 and sudo chmod a+rw /home/leecgy/temp1 to enable writing to partition 1.
10) Then sudo mount /dev/sdb2 /home/leecgy/temp2 and sudo chmod a+rw /home/leecgy/temp2 to enable writing to partition 2.
11) I right click and create new folder called boot in partition 1, then right click and copy paste the bzImage into boot folder.
12) Then right click and create new folder
 called grub in boot folder, then right click and copy paste the grub.cfg into grub folder.
13) I sudo grub-install --boot-directory=/home/leecgy/temp1/boot /dev/sdb to install grub.
14) I right click and extract the rootfs.tar, then right click and copy paste the contents inside rootfs into partition 2.

When trying to boot up, the code dump a lot of?error and stuck. I cannot shift+page up to see the top of the error.

Please let me know if you need more info.

Thanks.

 


On Wednesday, August 20, 2014 8:10 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
  


Hello,

On Wed, 20 Aug 2014 04:37:12 -0700, lee choon gay wrote:

> But
 the data is not persistent, anything that I save will be gone after reboot.
> I am looking for method to make the data persistent (no?ram file system).
> I try to boot up the code without using rootfs.cpio as follow.
> The code won't boot up.
> 
> set default="0"
> set timeout="0"
> 
> menuentry "any name" {
> ????????? Linux /boot/bzImage root=/dev/sda2 noinitrd?console=tty1
> ????????? }
> 
> For your info, I use pendrive for this.
> And the bzImage and rootfs.cpio is located in partition 1 boot folder.

If you're using a root filesystem in the second partition, then there's
no point in keeping the rootfs.cpio file in the fist partition.


> File system is located in partition 2.
> 
> Hope I can get some?help here.
> Thank you very much. :)

Yes, but please provide more details, like what happens when you try to
boot, and how you create your second partition exactly. With the
informations you provided, there is just no way for us to help you as
you didn't provide enough details.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140820/50c1ed1b/attachment.html>
