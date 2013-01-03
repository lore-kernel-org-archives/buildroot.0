From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 03 Jan 2013 09:53:40 +0100
Subject: [Buildroot] [RFC] How to handle targets that need more than one
 file system to boot?
In-Reply-To: <201301030940.07495.yann.morin.1998@free.fr>
References: <201212240100.17473.yann.morin.1998@free.fr>
 <201301030056.01956.yann.morin.1998@free.fr>
 <CAJJ6jxudS63P58imQ6nPn=_AA9JoBMZp3i=Dq2As1c9EiCDZxg@mail.gmail.com>
 <201301030940.07495.yann.morin.1998@free.fr>
Message-ID: <50E54714.8060602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/03/13 09:40, Yann E. MORIN wrote:
> Steve, All,
>
> On Thursday 03 January 2013 01:32:52 Steve Calfee wrote:
>> >  On Wed, Jan 2, 2013 at 3:56 PM, Yann E. MORIN<yann.morin.1998@free.fr>  wrote:
>>> >  >  Arnout, Steve, All,
>>> >  >
>>> >  >  On Wednesday 02 January 2013 Arnout Vandecappelle wrote:
>>>> >  >>  On 12/25/12 04:52, Steve Calfee wrote:
>>>>> >  >>  >  On Sun, Dec 23, 2012 at 4:00 PM, Yann E. MORIN<yann.morin.1998@free.fr>   wrote:
>>> >  >  [--SNIP--]
>>>>>> >  >>  >>  For now, buildroot can build a single filesystem image. This is not useable
>>>>>> >  >>  >>  for these systems. The only possibility as of today is to configure BR to
>>>>>> >  >>  >>  generate a tarball, and have a custom script that does the required split up
>>>>>> >  >>  >>  of the different components.
>>>> >  >>
>>>> >  >>     That's not really true, is it? Buildroot generates the ext2fs and the
>>>> >  >>  boot loader and kernel images, you only have to create the partitions and
>>>> >  >>  the fatfs and pull everything together into a single image.
>>> >  >
>>> >  >  So, you said the same as me: Buildroot (without external tools) can
>>> >  >  not generate more than one*filesystem*  image (ext2, tar, whatever).
>>> >  >
>> >
>> >  Hi Yann,
>> >
>> >  Maybe we are talking about different things. I think there is a config
>> >  option in buildroot that allows you to build multiple output
>> >  filesystems, I believe I have created ext4 and a tar.gz as outputs. I
>> >  think there are also various flash file systems you can create.
> Indeed, we're not speaking the same. Yes, Buildroot can generate different
> filesystem images with the*same*  content.
>
> I am trying to address the case where different parts of the filesystem
> hierarchy have to be stored in different filesystems, because they have
> to be in different partitions.
>
> For example, on the Raspberry Pi, we have to have:
>    - the first partition must be vfat and must contain the few binary
>      blobs (bootloader and config for the GPU, the Linux kernel and its
>      command line)
>    - the rest of the filesystem hierarchy can be whatever (eg. an extN
>      filesystem for / on the second partition, and another one for /home
>      on yet a third partition)
>
> Buildroot can not handle this case, which is the one I want to address
> if it makes sense.

  I think the usual case is that you have one rootfs image (e.g. ext2) 
and a number of other component images (e.g. bootloader, boot script, 
config for the GPU). Buildroot puts each of these in the images 
directory. In _some_ cases (e.g. RPi), the non-rootfs components should 
be put together into a fat filesystem. It is true that buildroot doesn't 
have support for that, but it is relatively simple to do that in a 
post-build script:

mkfs.vfat /dev/sdb1
sudo mount /dev/sdb1 /mnt
cp output/images/* /mnt
sudo umount /mnt

  There is certainly no need to split up the rootfs itself. (Unless the 
RPi-specific things install stuff in the rootfs while it really should go 
into the images directory, but that's a different issue).

  AFAIK there is no equivalent of genext2fs for FAT, so it would be 
rather difficult to make a boot-vfat.img in buildroot (use sudo? fuse? 
pmount?).


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
