From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Apr 2014 23:44:26 +0200
Subject: [Buildroot] How transfer what image(s) to target-CF?
In-Reply-To: <CAEzGmjCXKEQTEEbz7a9JfX80rVafF4XedTjfZDQYyVOypASgAA@mail.gmail.com>
References: <CAEzGmjA3wbjEFb6sQYov_rJFJuB8oJFx2Y6XOA7WWHce743=dg@mail.gmail.com>
 <5357DD2D.1030702@mind.be>
 <CAEzGmjCXKEQTEEbz7a9JfX80rVafF4XedTjfZDQYyVOypASgAA@mail.gmail.com>
Message-ID: <535985BA.1020009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Lennart,

 [Please don't top-post, instead reply below the relevant quoted paragraph.]

On 24/04/14 12:07, Lennart Ramberg wrote:
> Thanks Arnout,
> 
> Now, please, for the 'how'-part, that 'put':
> 
> How exactly would I here use commands like dd and/or cpio, and in what order?

 With "put", I just meant copying onto the existing FAT filesystem. But
it seems that is not what you want.


> Assume the target CF is mounted as /dev/sdX on the host.
> 
> To complicate matters :-) I aim at ext3.

 Then you have two options: either create an ext3 image, or create a
tarball and format the CF card from a separate script.

1. Set the following options:

BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_3=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=1000000
(the latter is assuming you have a 1GB CF card).

This will create a rootfs.ext3 image.
You can write this to your CF card with
cat output/images/rootfs.ext3 > /dev/sdX1
(assuming you've partitioned it already, and your rootfs is partition 1).

2. Select the tarball as the target rootfs.

Now in a separate script, use mkfs.ext3 to create the rootfs directly on
the CF card. Then mount it and untar output/images/rootfs.tar to the rootfs.


 In both cases, you'll probably want to use grub2 as the bootloader and
select the BR2_LINUX_KERNEL_INSTALL_TARGET option.


 Regards,
 Arnout

> 
> Regards
> Lennart
> 
> 
> On Wed, Apr 23, 2014 at 5:33 PM, Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> wrote:
> 
>     On 23/04/14 15:42, Lennart Ramberg wrote:
>     > Hello,
>     >
>     > New and experimenting, I want my target Linux system to reside on a
>     > Compact Flash,
>     > such that I can pull it from the host (Buildroot) computer and
>     > then insert it in my x86 target as an IDE-drive and boot.
>     >
>     > What file(s) should I have in host .../output/images/  and how do I put
>     > it(them) in the CF?
>     > I have USB on my host and a USB-CF-adapter and a formatted CF.
> 
>      The simplest is probably to use cpio as your rootfs, syslinux as the
>     bootloader, bzImage as the kernel, and put that on a FAT filesystem.
> 
> 
>      Regards,
>      Arnout
> 
>     --
>     Arnout Vandecappelle                          arnout at mind be
>     Senior Embedded Software Architect            +32-16-286500
>     <tel:%2B32-16-286500>
>     Essensium/Mind                                http://www.mind.be
>     G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>     LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>     GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
