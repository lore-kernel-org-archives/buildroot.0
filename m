From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Nov 2014 22:14:45 +0200
Subject: [Buildroot] [PATCH] system/device_table.txt: add /dev/null entry
In-Reply-To: <20141127203720.10997803@free-electrons.com>
References: <0a2f80f7ceb3272bf534f85fbf5030df36cae191.1417070676.git.baruch@tkos.co.il>
 <20141127203720.10997803@free-electrons.com>
Message-ID: <20141127201445.GD4690@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Nov 27, 2014 at 08:37:20PM +0100, Thomas Petazzoni wrote:
> On Thu, 27 Nov 2014 08:44:36 +0200, Baruch Siach wrote:
> > /dev/null is the "console" for system startup commands listed in the default
> > /etc/inittab. These commands fail when /dev/null isn't there. This breaks
> > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV, as /proc and /sys are not mounted when
> > mdev runs, causing the following errors:
> > 
> > can't open /dev/null: No such file or directory
> > can't open /dev/null: No such file or directory
> > can't open /dev/null: No such file or directory
> > can't open /dev/null: No such file or directory
> > can't open /dev/null: No such file or directory
> > can't open /dev/null: No such file or directory
> > ...
> > Starting mdev...
> > /etc/init.d/S10mdev: line 19: can't create /proc/sys/kernel/hotplug: nonexistent directory
> > mdev: /sys/class: No such file or directory
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  system/device_table.txt | 1 +
> >  1 file changed, 1 insertion(+)
> 
> So, in the end, my proposal would be to drop this patch, and instead
> have a patch that fixes the cpio code to not create this
> useless /dev/console device when cpio is not enabled. We have not
> supported udev/mdev without devtmpfs since a long time, I don't really
> see the point of bringing this back, as 2.6.32 is now very old and most
> people have the possibility of moving to a 2.6.32+ kernel.
> 
> Baruch, do you agree with this proposal?

Supporting a non devtmpfs with mdev only requires creating /dev/null and 
/dev/console statically. I think this is a small price to pay for an 
out-of-the-box working build. Anyway, I don't feel strongly about it. I can 
easily work around the problem with a custom device table file, at least as 
long as I haven't rebuilt the kernel.

By the way, the kernel that comes with this board IS 2.6.32, and we have just 
now started development based on the SoC on the board.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
