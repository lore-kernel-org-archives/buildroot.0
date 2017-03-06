From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 14:24:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/mke2img: use mkfs to generate
 rootfs image
In-Reply-To: <9ba789cc-143e-2102-56be-90793313af23@armadeus.com>
References: <1488445576-12857-1-git-send-email-sebastien.szymanski@armadeus.com>
 <20170302113411.26bd85f5@free-electrons.com>
 <1da03de6-08c6-93fd-3c2d-ec1bd6fabe1f@armadeus.com>
 <20170302134714.29b75bed@free-electrons.com>
 <9ba789cc-143e-2102-56be-90793313af23@armadeus.com>
Message-ID: <20170306142425.670ab5ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Mar 2017 14:20:56 +0100, S?bastien Szymanski wrote:

> I copied the target/ directory on a xfs filesystem and looked the
> differences. On ext4, the size of a directory is at least the size of
> block. With find, we can get the number of directories with a size less
> than the size of a block:
> 
> XFS fs
> $ du -s -k /mnt/target
> 16032
> 
> Ext4 fs (4K block size):
> $ du -s -k output/target
> 16320
> 
> $ find /mnt/target/ -type d -size -1024c | wc -l
> 72
> 
> 16032 + 72*4 = 16320
> 
> I didn't check if this is true with other filesystems.

I'm wondering if XFS also doesn't store very small files, and possibly
symbolic links, in a different way.

In any case, I believe we agree that looking at the size of files
stored in filesystem A doesn't give an accurate idea of how much space
they will consume once stored with filesystem B.

> > Therefore, I would suggest that we get rid of this, and instead add an
> > option "Filesystem size" in Config.in, default to some reasonable value
> > like 64M or 128M, and it would be up to the user to define it to a
> > value that is large enough to host the package selection he has done.  
> 
> Can't we automate this? I mean depending of the size of the target
> directory, we use one of the following size: 64M, 128M, 256M,

How do you know which one to choose? If you look at the target
directory size, then you end up doing what you do today, and which is
broken. Or you have to take some really really big margin. But OK, we
can try with even margin (like 20% or 30% margin).

> and then we shrink the filesystem with resize2fs -M ?

Why would you shrink it down? The fact that our filesystem images today
are really just the size of the files they contain is most of time
annoying, and you have to increase the size of the filesystem
afterwards to make the system usable. So it'd be great to instead have
images of 64 MB, 128 MB, 256 MB, with some free space.

Of course, we should have options to allow the user to indicate the
size he wants, and comply with this size exactly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
