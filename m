From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Dec 2012 01:00:17 +0100
Subject: [Buildroot] [RFC] How to handle targets that need more than one
	file system to boot?
Message-ID: <201212240100.17473.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Some systems require a specific partition layout to be able to boot.
For example:
  - the RaspberryPi:
    - the first, primary partition, and vfat-formatted, with the bootloader
      files and the kernel
    - the rest of the filesystem hierarchy can be dispatched at will
  - on i.MX:
    - the first, (primary?) partition must be non-FAT (special type?), with
      the bootloader raw-binary inside
    - the rest of the filesystem hierarchy can be whatever
  - on OMAP paltforms:
    - similar to the PI, but the kernel can be on ext2/3/4 (as wel as VFAT?)

For now, buildroot can build a single filesystem image. This is not useable
for these systems. The only possibility as of today is to configure BR to
generate a tarball, and have a custom script that does the required split up
of the different components.

It would be nice to have buildroot smoothly handle these cases.

After a quick talk on IRC with Thomas, here are a few proposals.

0) Keep as-is

Buildroot can not handle all possibilities, we can't even *think* about
all such possibilities. This is the easiest for buildroot, and pushes the
complexity down to the users.

1) Known, simple cases

Provision for a few select, known-simple cases (such as /boot on VFAT with
bootloader and kernel). This can be done rather easily, but is not worth
the effort only if it does not address most cases.

2) Use a descriptive, versatile framework

We could add an option in the menuconfig where the user could specify a
description (in a file) of the required layout, a bit like fs/ubi/ubinize
we have today. This would be in addition to the existing options, not a
replacement.

For example (syntax is just a first draft):
    [defaults]
    part.type=ext
    part.align=1MiB
    fs.size=auto
    fstab=yes
    fstab.mount=boot
    raw.content=file
    
    [bootloader]
    part.type=pri
    part.nb=1
    part.align=4MiB # Mandatory by design
    fs.type=raw
    raw.file=/boot/boot.raw
    fstab=no
    
    [boot]
    fs.dir=/boot
    fs.type=fat
    fstab.mount=no
    fs.label=boot
    part.type=pri
    fat.bits=32
    
    [root]
    fs.type=squashfs
    fs.label=root
    fs.size=64MiB
    fs.dir=/
    squashfs.comp=xz
    
    [home]
    fs.dir=/home
    fs.type=ext4
    fs.size=+1GiB
    fs.label=home
    
    [swap]
    fs.type=raw
    part.size=128MiB
    raw.content=gen
    raw.gen=exec:scripts/generate-swap 128MiB
    fstab.mount=no

Of course, this is far from being exhaustive, but the basics are visible:
  - syntax is .ini-like
  - order is not significant
  - missing fields are guessed or computed (eg. partition type/number),
    or use default values (to be documented)
  - sizes can be automatic ('auto'), enforced ('64MiB'), or free space
    ('+1GiB')
  - filesystem-agnostic options (eg. 'fs.label'), and filesystem-specific
    options (eg. 'fat.bits')
  - content can be generated
  - # starts a comment

So, what are your comments on this?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
