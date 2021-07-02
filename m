From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Fri, 2 Jul 2021 15:04:20 +0200
Subject: [Buildroot] Buildroot way to populate additional partition
Message-ID: <CAOiXNkBX7rM5oLqEEjGJb7Z613=A3g7tK+jJNjOt3e3JosGBpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildrooters,

I am building a system where rootfs should be read-only. However, it
should be possible to store user data (application specific data, wifi
configurations, etc.). For these purposes, I decided to use overlayfs.
In particular, Buildroot is configured not to remount rootfs with
read/write permission and /etc /var and /home should be mounted using
overlayfs with the upper filesystem located on the separate writable
partition. Here is how my fstab looks like:

# <file system>    <mount pt>    <type>    <options>    <dump>    <pass>
/dev/root    /        ext4    ro,noauto    0    1
proc        /proc        proc    defaults    0    0
devpts        /dev/pts    devpts
defaults,gid=5,mode=620,ptmxmode=0666    0    0
tmpfs        /dev/shm    tmpfs    mode=0777    0    0
tmpfs        /tmp        tmpfs    mode=1777    0    0
tmpfs        /run        tmpfs    mode=0755,nosuid,nodev    0    0
sysfs        /sys        sysfs    defaults    0    0
/dev/mmcblk0p6    /overlay    ext4    rw        0    1
overlay        /etc        overlay
lowerdir=/etc,upperdir=/overlay/etc,workdir=/overlay/work_etc    0
2
overlay        /var        overlay
lowerdir=/var,upperdir=/overlay/var,workdir=/overlay/work_var    0
2
overlay        /home        overlay
lowerdir=/home,upperdir=/overlay/home,workdir=/overlay/work_home    0

And this is my genimage.cfg.template:
image sdcard.img {
    hdimage {
        gpt = "true"    }
    partition fsbl1 {
        image = "%ATFBIN%"    }
    partition fsbl2 {
        image = "%ATFBIN%"    }
    partition ssbl {
        image = "u-boot.stm32"    }
    partition env {
        size = 16K    }
    partition rootfs {
        image = "rootfs.ext4"
        bootable = "yes"    }
    partition data {
        image = "data.img"    }
}
image data.img {
    name = "data"
    ext4 {
        label = "data"
        features = "extents,uninit_bg,dir_index,has_journal,filetype"
    }
    size = 32M
}

Here is a data partition created with ext4 data.img and is a target
for user data via overlayfs.

As you can see from fstab, there should be a set of directories
pre-created on the data partition:
/etc, /work_etc, /var, /work_var, /home and /work_home. And this is my
problem currently - I do not know how to pre-create them during the
build in a Buildroot-way.

I understand that the primary way to customize the rootfs is using
Buildroot's overlays. However, since I am not specifying the mount
point for data partition (because it should be mounted with
overlayfs), I have no idea how to pre-create directories mentioned
above. Even though I can probably find some hack-ish way to do it (for
example by mounting data.img and modify it before the final image will
be created) I am wondering what is the right way [tm] to do it with
Buildroot.

Thank you,
Andrey.
