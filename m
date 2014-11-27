From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 20:37:20 +0100
Subject: [Buildroot] [PATCH] system/device_table.txt: add /dev/null entry
In-Reply-To: <0a2f80f7ceb3272bf534f85fbf5030df36cae191.1417070676.git.baruch@tkos.co.il>
References: <0a2f80f7ceb3272bf534f85fbf5030df36cae191.1417070676.git.baruch@tkos.co.il>
Message-ID: <20141127203720.10997803@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 27 Nov 2014 08:44:36 +0200, Baruch Siach wrote:
> /dev/null is the "console" for system startup commands listed in the default
> /etc/inittab. These commands fail when /dev/null isn't there. This breaks
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV, as /proc and /sys are not mounted when
> mdev runs, causing the following errors:
> 
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> ...
> Starting mdev...
> /etc/init.d/S10mdev: line 19: can't create /proc/sys/kernel/hotplug: nonexistent directory
> mdev: /sys/class: No such file or directory
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  system/device_table.txt | 1 +
>  1 file changed, 1 insertion(+)

So, in the end, my proposal would be to drop this patch, and instead
have a patch that fixes the cpio code to not create this
useless /dev/console device when cpio is not enabled. We have not
supported udev/mdev without devtmpfs since a long time, I don't really
see the point of bringing this back, as 2.6.32 is now very old and most
people have the possibility of moving to a 2.6.32+ kernel.

Baruch, do you agree with this proposal?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
