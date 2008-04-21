From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 22 Apr 2008 00:06:13 +1000
Subject: [Buildroot] r21760 and device_table.txt problems
In-Reply-To: <2590773a0804192217i61a6fe1ct7801f800e3afdd39@mail.gmail.com>
References: <2590773a0804181647y4200320du60683223dd30a1d4@mail.gmail.com>
	<20080419145815.GB12780@cloud.net.au>
	<2590773a0804192217i61a6fe1ct7801f800e3afdd39@mail.gmail.com>
Message-ID: <20080421140613.GB21702@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 20, 2008 at 01:17:34AM -0400, Christopher Taylor wrote:
> Yes, that makes sense. Unfortunately, I'm not even seeing regular files.
> Your response leads me to conclude that while the device nodes are not
> currently present in the fs tree (for the reasons you specified), they
> _will_ be created during boot.

Can you post the output of the final stages of make? You should see it
running genext2fs, mkfs.jffs2 or something similar for the output format
you are using, within a fakeroot environment which also includes running
the makedevs program.

In my case, I see a bunch of empty regular files left in the
project_build_$arch/$project/root/dev directory after the build, which
is what I expected.

> In a desktop environment this is usually handled by devfs or udev
> these days.  How is it usually done within buildroot? I don't remember
> enabling devfs or udev in buildroot or the kernel, but I'll look on
> Monday.  If it's a static listings like before devfs, how should I go
> about creating the device nodes for my target fs ... just mknod as
> root before I make an image?

The device table is supposed to be used to populate the static /dev in
the root image. If you want dynamic /dev I think you need to write this
into your rc script yourself. Probably mount tmpfs on /dev and run mdev
or udev to populate it.

> Would simply running make as root fix this and create the device nodes
> per the deivce_table?

I suspect not. It will depend on what you see from the build.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
