From: =?UTF-8?B?SmVucyBNw7ZsemVy?= <moelzerjens@gmail.com>
Date: Tue, 16 Mar 2021 19:24:09 +0100
Subject: [Buildroot] GRUB works with qemu but not on real hardware
Message-ID: <CAGszA8=WtUw6d6=KsmgR=8k=L8t3bva6UYYiEc4jVK5Un9gTwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm building an image for a i486 based Board booting via BIOS/MBR using
GRUB. The resulting disk image works fine in qemu (`qemu-system-i386 -hda
disk.img`) but does not work on real hardware. The GRUB menu and shell work
but when loading Linux there is just a blinking cursor for a few seconds
followed by a reboot. This is definitely a problem with GRUB as the exact
same bzImage boots fine via PXELINUX on the same Hardware! It also seems
like Linux isn't even loaded since the reboot also happens with `panic=0`
and I don't get any output even with `earlyprintk`.

I used the GRUB shell to confirm that it can access the boot partition and
find the bzImage. I also tried to manually boot it from the shell but that
fails with the same behavior.

The disk image is generated with genimage following the advise from
`buildroot/boot/grub2/readme.txt` but I also tried the manual way using
`grub-bios-setup` described there with the same non-working result.

At this point I have no clue what the problem could be (I assume it must be
a bug in GRUB or how it is built?) and no idea how to debug this further.

I use a initial RAM filesystem that is directly linked into the kernel and
the grub2 package from buildroot.

Buildroot version is 2021.02 with Linux 5.10, using a internal toolchain
with GCC 10.x and musl as libc.

This is the `genimage.cfg` used (`grub_boot.img` is just
`${HOST_DIR}/lib/grub/i386-pc/boot.img` copied into the `images` dir).

```
image boot.vfat {
    vfat {
        file boot/grub/grub.cfg { image = "grub.cfg" }
        file boot/bzImage { image = "bzImage" }
    }
    size = 32M
}

image data.img {
    ext4{}
    size = 32M
}

image disk.img {
    hdimage {}

    partition mbr {
        in-partition-table = "no"
        image = "grub_boot.img"
        offset = 0
        size = 512
    }
    partition grub {
        in-partition-table = "no"
        image = "grub.img"
        offset = 512
    }

    partition boot {
        partition-type = 0xC
        image = "boot.vfat"
        bootable = "true"
        offset = 1M
    }

    partition data {
        partition-type = 0x83
        image = "data.img"
    }
}
```

This is the `grub.cfg` used:

```
set default="0"
set timeout="2"

menuentry "Buildroot" {
    linux /boot/bzImage console=ttyS0,115200 earlyprintk=serial,ttyS0,115200
}
```

I use the exact same bzImage file and Linux cmdline when booting via
PXELINUX (which works).
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210316/749ce4da/attachment.html>
