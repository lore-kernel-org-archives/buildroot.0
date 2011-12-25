From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Sun, 25 Dec 2011 01:10:53 +0100
Subject: [Buildroot] Buildroot 2011.11 on x86_64 - neither udev nor mdev
 loads needed modules at startup
Message-ID: <CAMduVEdmasu=7LYzR7AkGO9amtOLV7L3AYxBJJ6+9_jhhk7LAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I compiled the buildroot-2011.11 for x86_64 platform. Unfortunately
after the startup the device drivers are not loaded. I've tried to use
both mdev and udev, and results are the same.
I have the following settings in the kernel configuration:
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y

When I load the drivers manually:
eg. (on qemu-system-x86_64):
#modprobe e1000
#modprobe uhci_hcd

the NIC and the USB device (passed by -usbdevice host:0xabcd:0xcdef)
are recognized correctly.
The syptoms were the same on the real hardware (E350M1 board) which
currently not available to me.

I attach my buildroot configuration and my kernel configuration
together with /var/log/messages from the emulated machine.

The "mount" command returns the following:
rootfs on / type rootfs (rw,relatime)
devtmpfs on /dev type devtmpfs
(rw,relatime,size=998680k,nr_inodes=249670,mode=755)
proc on /proc type proc (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620,ptmxmode=000)
tmpfs on /dev/shm type tmpfs (rw,relatime,mode=777)
tmpfs on /tmp type tmpfs (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)

The udevd is running (what's interesting, after I run "#modprobe
e1000", there are even two udevd processes running both as
"/sbin/udevd -d").

Is it a problem with this release of buildroot, or have I something
misconfigured?
-- 
TIA & Merry Christmas!
WZab
-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernel_config.gz
Type: application/x-gzip
Size: 32361 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111225/38e9d3cb/attachment-0003.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_config.gz
Type: application/x-gzip
Size: 5000 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111225/38e9d3cb/attachment-0004.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: var_log_messages.gz
Type: application/x-gzip
Size: 3616 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111225/38e9d3cb/attachment-0005.bin>
