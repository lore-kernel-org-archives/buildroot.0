From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 28 Mar 2017 10:48:39 +0100
Subject: [Buildroot] Issue performing switch_root to a UBIFS partition
In-Reply-To: <20170328093941.yui6vunw5waaqtqr@skv.local>
References: <20170328093941.yui6vunw5waaqtqr@skv.local>
Message-ID: <f31ec5e6-efc2-8895-02f8-fa56bb366a5b@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/03/2017 10:39, Andrey Skvortsov wrote:
>>
>> The whole stuff is very strange. Have you tried it yourself with
>> recent BR and kernel?
>

I have switch_root working great with buildroot 2016.11. In my initramfs 
/sbin/init looks like:

#!/bin/sh

# Startup the system
/bin/mount -t proc proc /proc
/bin/mount -o remount,rw /
/bin/mkdir -p /dev/pts
/bin/mkdir -p /dev/shm
/bin/mount -a

if [ -b /dev/sda1 ]; then
   /bin/mount /dev/sda1 /usb
elif [ -b /dev/sda ]; then
   /bin/mount /dev/sda /usb
else
   echo "usbkey not detected"
   exit -1
fi
if [ $? -ne 0 ]; then
   echo "usbkey mount failed"
   exit -1
fi
if [ ! -f /usb/rootfs.squashfs ]; then
   echo "rootfs missing from usbkey"
   exit -1
fi
/bin/mount -o loop,ro -t squashfs /usb/rootfs.squashfs /mnt

echo "Moving mounts..."
/bin/mount --move /dev/pts /mnt/dev/pts
/bin/mount --move /dev/shm /mnt/dev/shm
/bin/mount --move /dev /mnt/dev
/bin/mount --move /run /mnt/run
/bin/mount --move /tmp /mnt/tmp
/bin/mount --move /sys /mnt/sys
/bin/mount --move /proc /mnt/proc
echo "Doing switch_root..."
exec /sbin/switch_root -c /dev/console /mnt /sbin/init

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Engineering Manager                      Office Tel: +44 (0)20 7471 9424
Carallon Ltd, International House, 7 High Street, Ealing, London  W5 5DB
------------------------------------------------------------------------
