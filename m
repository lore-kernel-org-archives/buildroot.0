From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Nov 2014 08:56:40 +0100
Subject: [Buildroot] [PATCH] system/device_table.txt: add /dev/null entry
In-Reply-To: <0a2f80f7ceb3272bf534f85fbf5030df36cae191.1417070676.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 27 Nov 2014 08:44:36 +0200")
References: <0a2f80f7ceb3272bf534f85fbf5030df36cae191.1417070676.git.baruch@tkos.co.il>
Message-ID: <87fvd5oz47.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > /dev/null is the "console" for system startup commands listed in the default
 > /etc/inittab. These commands fail when /dev/null isn't there. This breaks
 > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV, as /proc and /sys are not mounted when
 > mdev runs, causing the following errors:

 > can't open /dev/null: No such file or directory
 > can't open /dev/null: No such file or directory
 > can't open /dev/null: No such file or directory
 > can't open /dev/null: No such file or directory
 > can't open /dev/null: No such file or directory
 > can't open /dev/null: No such file or directory
 > ...

Hmm, is this on a kernel without devtmpfs? Devtmpfs is expected to be
used with mdev (and we automatically enable it if you build a kernel
with BR).

> Starting mdev...
 > /etc/init.d/S10mdev: line 19: can't create /proc/sys/kernel/hotplug: nonexistent directory
 > mdev: /sys/class: No such file or directory

So you don't have /proc and /sys? Is this also a custom rootfs skeleton
/ inittab? With the default one we do a mount -a before running /etc/init.d/rcS.

-- 
Bye, Peter Korsgaard
