From: Mitch Davis <mjd+buildroot@afork.com>
Date: Wed, 25 Aug 2010 15:35:13 +1000
Subject: [Buildroot] package/hotplug
In-Reply-To: <201008191359.23930.minimod@morethan.org>
References: <0D753D10438DA54287A00B0270842697643E62F9E6@AUSP01VMBX24.collaborationhost.net>
	<AANLkTikvuz8Fc5kiwEXdQ8WFSAnD87egOWpvtyLx=yLm@mail.gmail.com>
	<0D753D10438DA54287A00B0270842697643E6303F9@AUSP01VMBX24.collaborationhost.net>
	<201008191359.23930.minimod@morethan.org>
Message-ID: <AANLkTikpnMNXUvg8yR4q4xsOdtxZ2Lca1Lrt8e99aDaz@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hartley,

On Fri, Aug 20, 2010 at 4:59 AM, Michael S. Zick <minimod@morethan.org> wrote:
> On Thu August 19 2010, H Hartley Sweeten wrote:
>> On Thursday, August 19, 2010 10:58 AM, Will Newton wrote:
>> > On Thu, Aug 19, 2010 at 6:10 PM, H Hartley Sweeten wrote:
>> >> But, how to I get mdev to mount the drive after it's detected?
>> >
>> > it may be possible with the mdev config file. It seems to only be
>> > documented in the source:
>> >
>> > http://git.busybox.net/busybox/tree/util-linux/mdev.c
>> >
>> > See the section that mentions executing a command.
>>
>> I figured it had something to do with the mdev.conf file. ?I did
>> some grep'ing and found the KwikByte target handles this with a
>> custom '/sbin/automount.script' that is called by mdev.
>>
>> I have modified my setup and it appears to be working. ?When I plug
>> in the USB drive it is now detected and mounted. ?The only issue I
>> have now is when the drive is removed. ?mdev does call the script
>> to unmount the drive but I get two kernel errors:
>>
>> usb 2-1.4: USB disconnect, address 4
>> FAT: bread failed in fat_clusters_flush
>> FAT: bread failed in fat_clusters_flush
>>
>> I think these are generated because the drive is actually not present
>> when umount tries to unmount it. ?I'm using the -f option (force unmount)
>> but that doesn't seem to prevent the error.
>
> It can't, the drive isn't there to write to once you remove it.
>
> Add a "safely unmount" thingy to whatever interface your device has,
> call a:
> mount -o remount device_name
> script.
> Note there is no option specified after the "remount" - not a typo here.
> That will make the kernel flush its VFS buffers for that device.

If you don't need to write to the device, you could also use "mount -o
ro" to make it read-only.  Then you won't get the message.  If it
happens that you need to write, you can temporarily call "mount -o
remount,rw", do your op, then "mount -o remount,ro".

Alternatively (and this is a little bit gross), if you don't want the
kernel to do any mounting, you may be able to hack "mtools" to use it
as a library:

  http://www.gnu.org/software/mtools/

Then the kernel wouldn't care if the device was pulled unexpectedly.

Mitch.
