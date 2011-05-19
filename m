From: Diego Iastrubni <diegoiast@gmail.com>
Date: Thu, 19 May 2011 14:34:28 +0300
Subject: [Buildroot] Slow boots caused by
 ca520507fc15a8213334a76339a3e6d567e91ea0 (udev, inittab)
In-Reply-To: <BANLkTinfxAON7FioeoC9scz9MF9F3fVp+w@mail.gmail.com>
References: <BANLkTi=cikrdVk_mikRhpLYZtgDarZCukw@mail.gmail.com>
	<20110517152841.2da7be8c@surf>
	<BANLkTinfxAON7FioeoC9scz9MF9F3fVp+w@mail.gmail.com>
Message-ID: <BANLkTik-DyW2P62rGHM70=PYS=nBYFiRoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 17, 2011 at 4:45 PM, Diego Iastrubni <diegoiast@gmail.com>
wrote:
>> Moreover the ca520507fc15a8213334a76339a3e6d567e91ea0 you're pointing
>> did not change the inittab, so I don't know how reverting could modify
>> the inittab. Are you referring to the udev startup script ?
> I reverted S10udev of course.
> How can I debug this?

I debugged it by writing "set -x" and see what is executed over RS323 and
also looking at the output of "mount".

Eventually, it seems that the delay was caused by the RAMFS not booing
mounted on /dev/ which means that udev was writing real files (about 200)
over my NFS share to my real limux machine. That *is* kinda slow....

Adding the following lines fixed it (note that this mount point is not
available is fstab!):

      grep -q "^udev $udev_root" /proc/mounts || mount -t ramfs udev
$udev_root || exit 1
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110519/e99644c3/attachment.html>
