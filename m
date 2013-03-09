From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Mar 2013 15:09:45 +0100
Subject: [Buildroot] Regarding /dev management
In-Reply-To: <CALF0-+WdzsqUdQyiwagDELkqx5HhdxEe+_LwKpwgs-LVosLd0g@mail.gmail.com>
 (Ezequiel Garcia's message of "Sat, 9 Mar 2013 09:26:36 -0300")
References: <CALF0-+WdzsqUdQyiwagDELkqx5HhdxEe+_LwKpwgs-LVosLd0g@mail.gmail.com>
Message-ID: <87ppz83brq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "E" == Ezequiel Garcia <elezegarcia@gmail.com> writes:

 E> Hi everyone,
 E> Yesterday I spent a couple hours trying to build my first buildroot fs.
 E> In particular, I wanted to use devtmpfs
 E> (BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS)
 E> but found that /dev is not mounted by default in skeleton fs scripts,
 E> it should be mounted in inittab before some other things.

 E> After some hacking in skeleton files, I managed to get the thing working.

 E> Did I miss something? Is this the expected behavior?

 E> Notice that I'm using the cpio image output and using the rootfs as in
 E> initramfs.
 E> In this case, CONFIG_DEVTMPFS=y and CONFIG_DEVTMPFS_MOUNT=y
 E> kernel options do not matter, because... (quoting Kconfig)

 E> ""This will instruct the kernel to automatically mount the
 E> devtmpfs filesystem at /dev, directly after the kernel has
 E> mounted the root filesystem. The behavior can be overridden
 E> with the commandline parameter: devtmpfs.mount=0|1.

 E> This option does not affect initramfs based booting, here
 E> the devtmpfs filesystem always needs to be mounted manually
 E> after the roots is mounted.""

Indeed, for everything besides initramfs CONFIG_DEVTMPFS_MOUNT does the
right thing, and we don't need to do anything in userspace.

 E> Perhaps we can add some hack to add:

 E> ::sysinit:/bin/mount -t devtmpfs devtmpfs /dev

 E> to skeleton when BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y.

 E> However, being new to buildroot, perhaps I'm speaking non-sense and the
 E> developer is expected to use its own custom skeleton in this case.

We already take care of this for initramfs, see fs/cpio/init and the
ROOTFS_CPIO_ADD_INIT rule. Doesn't that work for you?

-- 
Bye, Peter Korsgaard
