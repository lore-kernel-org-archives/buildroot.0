From: Tom Deblauwe <tom.deblauwe@ebo-enterprises.com>
Date: Thu, 22 May 2014 14:32:49 +0200
Subject: [Buildroot] dev-tty1 and systemd
Message-ID: <537DEE71.5050600@ebo-enterprises.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am booting with an initramfs and am using systemd as /sbin/init. It
all works very well, but it seems the device /dev/tty1 can not be opened
by systemd in the end. In my grub configuration I add the "console=tty1"
to the cmdline. Then in my init script inside my initramfs I am using
mdev like this:

mount -t proc proc /proc -o nosuid,noexec,nodev
mount -t sysfs sys /sys -o nosuid,noexec,nodev
mount -t devtmpfs dev /dev -o mode=0755,nosuid
mount -t tmpfs run /run -o nosuid,nodev,mode=0755
mkdir -m755 /run/initramfs
echo /sbin/mdev > /proc/sys/kernel/hotplug
mdev -s


Later in the script I mount the real rootfs on /new_root  and then I do
this at the end:

mount --move /proc /new_root/proc
mount --move /sys /new_root/sys
mount --move /dev /new_root/dev
exec switch_root -c /dev/console /new_root /sbin/init "$@"

This works and starts, however, I then get the problem that systemd can
not open the /dev/tty1 device. It searches for dev-tty1.device. I
suspect it has something to do with busybox keeping a hold on tty1 or
something like that. I already tried using "console=tty3" as a kernel
cmdline but that didn't help. The dev-tty1.service still can not get a
hold of /dev/tty1.

Anybody knows what is going on?

Best regards,
Tom,
Email Confidentiality: e-BO Enterprises<http://www.ebo-enterprises.com/> Company Registration Number BE 0470174242. This email message and any attachments are for the sole use of the intended recipient(s) and may contain information that is proprietary to e-BO Enterprises<http://www.ebo-enterprises.com/>. If you have received this message in error, please notify the sender by reply, and delete all copies of this message and any attachments. If you are the intended recipient you may use the information contained in this message and any files attached to this message only as authorized by e-BO Enterprises<http://www.ebo-enterprises.com/>. Any unauthorized use, dissemination or disclosure of this message or its attachments is strictly prohibited. The contents of this e-mail are not to be considered binding upon e-BO Enterprises<http://www.ebo-enterprises.com/>.
