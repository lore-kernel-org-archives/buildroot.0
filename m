From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue,  8 Sep 2015 23:28:48 +0200
Subject: [Buildroot] [RFC 0/6] mdev-only /dev management (without devtmpfs)
Message-ID: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patchset adds a new /dev management mechanism, using mdev for
dynamic device creation but without relying on devtmpfs.

The main motivation is the need of dynamic /dev management and/or firmware
loading assisted by mdev on targets that are bound to kernels < 2.6.32,
and thus cannot use devtmpfs.

The topic has been discussed back in July when I proposed a totally
unacceptable implementation. In the discussion that followed I made a
proposal [0], whose general principle was positively received by Thomas.

The proposal is to augment the /dev management choice this way:
      ( ) Static using device table
      ( ) Static using device table + mdev   <- New option
      (X) Dynamic using devtmpfs only
      ( ) Dynamic using {devtmpfs +} mdev    {} = new wording only
      ( ) Dynamic using {devtmpfs +} eudev   {} = new wording only

Of course we still have a static table to make the system boot until mdev
is activated.

In order to activate mdev I first tried to hook in S10mdev to make a boot
process that is similar to the current "devtmpfs + mdev" case. But that
didn't work well, because when S10mdev runs /dev/shm and /dev/pts are
already mounted. This raises issues explained in detail in the commit log
for patch 3.

Instead the approached that worked best is to activate mdev as early as
possible, i.e. in inittab. This makes the system boot (of course) like the
static case for the few very initial moments of userspace life: launching
init and mounting /proc and /sys; yes, we now mount /sys in inittab, it's
needed by mdev. Then mdev is enabled, and things look very much like any
other dynamic method since then.

In the end I think the modifications to implement this feature are
relatively few, and it all works well. I tested it with 10 qemu configs,
testing every /dev management method with both busybox and sysvinit init.
Patch 6 shows my ugly testing scripts.

So it is quite stable. It is called an RFC because the change touches a few
important lines and because this addition was not considered a good idea by
Peter, according to Thomas' memory [1].

I even wondered whether this new kind of /dev management should replace
the "devtmpfs + mdev" at some point, since it does not seem to provide
any drawback. Unless I'm missing something, which is definitely possible...

There is one rough edge that I'd like to have comments about: variable
naming. The new method implemented by this patchset is dynamic and uses
mdev, so it should ba named BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV and
described in kconfig as "dynamic using mdev". But hey, that name and
description are already used for the current "devtmpfs + mdev" method! So
we might want to rename all variables to encompass the new use case in a
clean way. Thid would also imply lagacy management etc.

For the time being I didn't enter the jungle of variable naming and just
expanded the description for the current mdev and eudev cases to clarify
they also use devtmpfs. This is done in patch 2. Then I called the newly
introduced method BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV_ONLY and
described it "Dynamic using mdev only", to make sure it is well
distinguishable@least during teh oatch review process. If the overall
work is considered good, I'll take care of the renaming in a future
patchset.

Here are a few figures about the storage space needed for the various
configurations. All are compared to the "devtmpfs + mdev" reference method.
Not a big surprise, the differences are all quite negligible, being all
below 1%.

  devtmpfs+mdev:       zImage  2.1 MB, rootfs.ext2 6.8 MB
  -------------------------------------------------------
  devtmpfs-only delta: zImage   equal, rootfs.ext2  -9 kB
  mdev-only delta:     zImage -1.6 kB, rootfs.ext2  equal
  static delta:        zImage -1.6 kB, rootfs.ext2 +28 kB

Luca

[0] http://lists.busybox.net/pipermail/buildroot/2015-July/133695.html
[1] http://lists.busybox.net/pipermail/buildroot/2015-July/133701.html

Luca Ceresoli (6):
  Move mounting /sys from fstab to inittab
  system: clarify /dev management using devtmpfs + {mdev,eudev}
  system: add mdev-only /dev management (without devtmpfs)
  system: strip the initial /dev for mdev-only /dev management
  docs/manual: document "Dynamic using mdev only" /dev management
  **** DO NOT COMMIT THIS **** ugly stuff to test mdev-only /dev
    management

 .gitignore                             |  1 +
 configs/test_bb_dyn_devtmpfs_defconfig | 12 ++++++++++++
 configs/test_bb_dyn_eudev_defconfig    | 13 +++++++++++++
 configs/test_bb_dyn_mdev_defconfig     | 13 +++++++++++++
 configs/test_bb_mdev_only_defconfig    | 13 +++++++++++++
 configs/test_bb_static_defconfig       | 13 +++++++++++++
 configs/test_sv_dyn_devtmpfs_defconfig | 13 +++++++++++++
 configs/test_sv_dyn_eudev_defconfig    | 14 ++++++++++++++
 configs/test_sv_dyn_mdev_defconfig     | 14 ++++++++++++++
 configs/test_sv_mdev_only_defconfig    | 14 ++++++++++++++
 configs/test_sv_static_defconfig       | 14 ++++++++++++++
 docs/manual/configure.txt              | 18 +++++++++++++++---
 linux/linux.mk                         |  2 +-
 package/busybox/activate-mdev          |  5 +++++
 package/busybox/busybox.mk             |  7 +++++++
 package/busybox/inittab                |  2 ++
 package/skeleton/skeleton.mk           | 15 +++++++++++++++
 package/sysvinit/inittab               | 14 ++++++++------
 run                                    | 12 ++++++++++++
 system/Config.in                       | 11 ++++++++---
 system/device_table_dev_mdev_only.txt  | 10 ++++++++++
 system/skeleton/etc/fstab              |  1 -
 test-all                               | 34 ++++++++++++++++++++++++++++++++++
 23 files changed, 251 insertions(+), 14 deletions(-)
 create mode 100644 configs/test_bb_dyn_devtmpfs_defconfig
 create mode 100644 configs/test_bb_dyn_eudev_defconfig
 create mode 100644 configs/test_bb_dyn_mdev_defconfig
 create mode 100644 configs/test_bb_mdev_only_defconfig
 create mode 100644 configs/test_bb_static_defconfig
 create mode 100644 configs/test_sv_dyn_devtmpfs_defconfig
 create mode 100644 configs/test_sv_dyn_eudev_defconfig
 create mode 100644 configs/test_sv_dyn_mdev_defconfig
 create mode 100644 configs/test_sv_mdev_only_defconfig
 create mode 100644 configs/test_sv_static_defconfig
 create mode 100755 package/busybox/activate-mdev
 create mode 100755 run
 create mode 100644 system/device_table_dev_mdev_only.txt
 create mode 100755 test-all

-- 
1.9.1
