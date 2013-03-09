From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Sat, 9 Mar 2013 09:26:36 -0300
Subject: [Buildroot] Regarding /dev management
Message-ID: <CALF0-+WdzsqUdQyiwagDELkqx5HhdxEe+_LwKpwgs-LVosLd0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

Yesterday I spent a couple hours trying to build my first buildroot fs.
In particular, I wanted to use devtmpfs
(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS)
but found that /dev is not mounted by default in skeleton fs scripts,
it should be mounted in inittab before some other things.

After some hacking in skeleton files, I managed to get the thing working.

Did I miss something? Is this the expected behavior?

Notice that I'm using the cpio image output and using the rootfs as in
initramfs.
In this case, CONFIG_DEVTMPFS=y and CONFIG_DEVTMPFS_MOUNT=y
kernel options do not matter, because... (quoting Kconfig)

""This will instruct the kernel to automatically mount the
devtmpfs filesystem at /dev, directly after the kernel has
mounted the root filesystem. The behavior can be overridden
with the commandline parameter: devtmpfs.mount=0|1.

This option does not affect initramfs based booting, here
the devtmpfs filesystem always needs to be mounted manually
after the roots is mounted.""

Perhaps we can add some hack to add:

::sysinit:/bin/mount -t devtmpfs devtmpfs /dev

to skeleton when BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y.

However, being new to buildroot, perhaps I'm speaking non-sense and the
developer is expected to use its own custom skeleton in this case.

Thanks,
-- 
    Ezequiel
