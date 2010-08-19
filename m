From: Michael S. Zick <minimod@morethan.org>
Date: Thu, 19 Aug 2010 13:59:18 -0500
Subject: [Buildroot] package/hotplug
In-Reply-To: <0D753D10438DA54287A00B0270842697643E6303F9@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B0270842697643E62F9E6@AUSP01VMBX24.collaborationhost.net>
	<AANLkTikvuz8Fc5kiwEXdQ8WFSAnD87egOWpvtyLx=yLm@mail.gmail.com>
	<0D753D10438DA54287A00B0270842697643E6303F9@AUSP01VMBX24.collaborationhost.net>
Message-ID: <201008191359.23930.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu August 19 2010, H Hartley Sweeten wrote:
> On Thursday, August 19, 2010 10:58 AM, Will Newton wrote:
> > On Thu, Aug 19, 2010 at 6:10 PM, H Hartley Sweeten wrote:
> >> But, how to I get mdev to mount the drive after it's detected?
> >
> > it may be possible with the mdev config file. It seems to only be
> > documented in the source:
> >
> > http://git.busybox.net/busybox/tree/util-linux/mdev.c
> >
> > See the section that mentions executing a command.
> 
> I figured it had something to do with the mdev.conf file.  I did
> some grep'ing and found the KwikByte target handles this with a
> custom '/sbin/automount.script' that is called by mdev.
> 
> I have modified my setup and it appears to be working.  When I plug
> in the USB drive it is now detected and mounted.  The only issue I
> have now is when the drive is removed.  mdev does call the script
> to unmount the drive but I get two kernel errors:
> 
> usb 2-1.4: USB disconnect, address 4
> FAT: bread failed in fat_clusters_flush
> FAT: bread failed in fat_clusters_flush
> 
> I think these are generated because the drive is actually not present
> when umount tries to unmount it.  I'm using the -f option (force unmount)
> but that doesn't seem to prevent the error.
> 

It can't, the drive isn't there to write to once you remove it.

Add a "safely unmount" thingy to whatever interface your device has, 
call a:
mount -o remount device_name
script.
Note there is no option specified after the "remount" - not a typo here.
That will make the kernel flush its VFS buffers for that device.

Mike
> Thanks for the help,
> Hartley
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
