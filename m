From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Mar 2017 09:18:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/mke2img: use mkfs to generate
 rootfs image
In-Reply-To: <20170306142425.670ab5ab@free-electrons.com>
References: <1488445576-12857-1-git-send-email-sebastien.szymanski@armadeus.com>
 <20170302113411.26bd85f5@free-electrons.com>
 <1da03de6-08c6-93fd-3c2d-ec1bd6fabe1f@armadeus.com>
 <20170302134714.29b75bed@free-electrons.com>
 <9ba789cc-143e-2102-56be-90793313af23@armadeus.com>
 <20170306142425.670ab5ab@free-electrons.com>
Message-ID: <955c4f35-4408-0a0f-361c-efa0a8a328fd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-03-17 14:24, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 6 Mar 2017 14:20:56 +0100, S?bastien Szymanski wrote:
> 
>> I copied the target/ directory on a xfs filesystem and looked the
>> differences. On ext4, the size of a directory is at least the size of
>> block. With find, we can get the number of directories with a size less
>> than the size of a block:
>>
>> XFS fs
>> $ du -s -k /mnt/target
>> 16032
>>
>> Ext4 fs (4K block size):
>> $ du -s -k output/target
>> 16320
>>
>> $ find /mnt/target/ -type d -size -1024c | wc -l
>> 72
>>
>> 16032 + 72*4 = 16320
>>
>> I didn't check if this is true with other filesystems.
> 
> I'm wondering if XFS also doesn't store very small files, and possibly
> symbolic links, in a different way.
> 
> In any case, I believe we agree that looking at the size of files
> stored in filesystem A doesn't give an accurate idea of how much space
> they will consume once stored with filesystem B.

 As an approximation, however, we could look at the apparent file size, and add
e.g. 1KB per inode. So (du --apparent-size) + 1K * (du --inodes). AFAICS this
should always be an overestimate. Well, that is, assuming that mkfs.ext2 retains
hardlinks.

>>> Therefore, I would suggest that we get rid of this, and instead add an
>>> option "Filesystem size" in Config.in, default to some reasonable value
>>> like 64M or 128M, and it would be up to the user to define it to a
>>> value that is large enough to host the package selection he has done.  
>>
>> Can't we automate this? I mean depending of the size of the target
>> directory, we use one of the following size: 64M, 128M, 256M,
> 
> How do you know which one to choose? If you look at the target
> directory size, then you end up doing what you do today, and which is
> broken. Or you have to take some really really big margin. But OK, we
> can try with even margin (like 20% or 30% margin).

 If we use "reasonable sizes", do take into account that a typical SD card is
slightly smaller than the corresponding power-of-two (or sometimes even SI)
value, and that you typically need a little bit of extra space for a boot
partition. So the "reasonable sizes" should be something like 60M, 122M, ...

 Also, the list is going to be pretty long: we have enough packages in Buildroot
to go over 1GB rootfs...


>> and then we shrink the filesystem with resize2fs -M ?
> 
> Why would you shrink it down? 

 Because resize2fs will calculate the exact required size. It can do that
because the fs is already created so all the information is there to calculate
the size.

 With this approach, we could do a serious overestimate in the first pass (e.g.
double of the apparent size), then resize to the actual required size, and then
(if BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS is specified) resize again to add the
extra space.

 This could work, but sounds pretty inefficient...


> The fact that our filesystem images today
> are really just the size of the files they contain is most of time
> annoying, and you have to increase the size of the filesystem
> afterwards to make the system usable. So it'd be great to instead have
> images of 64 MB, 128 MB, 256 MB, with some free space.
> 
> Of course, we should have options to allow the user to indicate the
> size he wants, and comply with this size exactly.

 We have that: BR2_TARGET_ROOTFS_EXT2_BLOCKS. Before that was introduced (in
2005), the size was always auto-calculated.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
