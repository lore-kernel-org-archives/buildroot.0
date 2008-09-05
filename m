From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 5 Sep 2008 23:09:18 +1000
Subject: [Buildroot] Login exited
In-Reply-To: <ed4892840809050038j3d0be1edjca3226465afedfdb@mail.gmail.com>
References: <ed4892840809010102n6293e75ejc6caf1dd57a954db@mail.gmail.com>
	<ed4892840809011747w183e8e8bma1451d38c40e65c0@mail.gmail.com>
	<200809031950.49148.vda.linux@googlemail.com>
	<ed4892840809031850y32161b46qc99547711ab535a7@mail.gmail.com>
	<20080904020018.GC16933@cloud.net.au>
	<ed4892840809032234h62607fb2oac8847e3da884e44@mail.gmail.com>
	<20080904142912.GB28250@cloud.net.au>
	<ed4892840809040849x7505c56ft98135e1535dc0fcc@mail.gmail.com>
	<20080905010758.GA22747@cloud.net.au>
	<ed4892840809050038j3d0be1edjca3226465afedfdb@mail.gmail.com>
Message-ID: <20080905130918.GB31755@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 05, 2008 at 03:38:31PM +0800, Steven Woody wrote:
> PS.  I just noticed, there is an error line when I run 'make' to get
> my rootfs image, it is:
>  ...
>  rootdir=/root/buildroot/project_build_arm/uclibc/root
>  table='target/generic/mini_device_table.txt'
>  /root/buildroot/build_arm/cramfs-1.1/mkcramfs: invalid option -- l
>  rm -f /root/buildroot/project_build_arm/uclibc/.fakeroot*
> 
> I checked, there is no a -l option for mkcramfs, but the buildroot
> does try to use it.  Anyway, the cramfs is created successfully, but I
> am not sure it is not a problem.

-l is for a little endian file system, so if it's producing a file
system with the wrong endianness, yes that's a big problem.

I'm assuming your target is little-endian. (By the way the
buildroot.config you attached to the next message was actually some sort
of configure log, not a buildroot configuration - so I couldn't check
that).

Your mkcramfs build must have got wrong, or you're missing the patches
or something. Specifically you must have
target/cramfs/cramfs-02-endian.patch - it's dated 2005 so I can't
believe it's just a case of an old version.

Can you check if you have that patch? Perhaps you can "make
cramfs-dirclean", then make again, and if you still see the problem then
post a build log from "make cramfs-dirclean cramfs".

It's unfortunate that mkcramfs doesn't bomb out when passed invalid
options..


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
