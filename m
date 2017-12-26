From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Dec 2017 00:20:41 +0100
Subject: [Buildroot] [PATCH 0/3] fs: make it behave more like the package
 infra
Message-ID: <cover.1514330428.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Currently, to register a new filesystem, one has to call:

    $(eval $(call ROOTFS_TARGET,blabla))

This is different from the package infrastructure, where the name of the
package needs not be specified, and is automatically guessed. This makes
the fs infra a bit different, when there is no reason for that.

Well, it turns out that there is a reason: we currently register two
filesystems from the same directory: ubifs and ubi. But it turns out
that these are in fact not two filesystems, but ubi can be considered
only as a post-preocessing of the ubifs one.

So, after we fix the ubifs filesystem to register only one filesystem,
we eventually turn the rootfs infra into a package-like infra, whereby
naming the filesystem is no longer needed, which allows one to simply
write:
   $(eval $(rootfs))

The 'rootfs' keyword may seem rather generic, but it is currently unused
in our tree (except in a post-image script for the chromebook defconfig):

    $ git grep -E '\<rootfs[[:space:]]*:?='
    board/chromebook/snow/mksd.sh:rootfs=$BINARIES_DIR/rootfs.ext2


Regards,
Yann E. MORIN.


The following changes since commit 131188de8df20028e2a7efaba3fdb13b6cca0aa2

  json-c: bump to version 0.13 (2017-12-26 19:57:44 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 63ee53d0a4bbf5e9fc6f3f500dda279d99d1350f

  fs: make it behave a bit more like the package infra (2017-12-27 00:16:51 +0100)


----------------------------------------------------------------
Yann E. MORIN (3):
      fs/ubifs: split long line, use simple asignment
      fs/ubifs: UBI image is not another type of filesystem
      fs: make it behave a bit more like the package infra

 Config.in.legacy                     | 59 ++++++++++++++++++++++++++++++++++++
 fs/axfs/axfs.mk                      |  2 +-
 fs/cloop/cloop.mk                    |  2 +-
 fs/common.mk                         |  7 ++---
 fs/cpio/cpio.mk                      |  2 +-
 fs/cramfs/cramfs.mk                  |  2 +-
 fs/ext2/ext2.mk                      |  2 +-
 fs/iso9660/iso9660.mk                |  2 +-
 fs/jffs2/jffs2.mk                    |  2 +-
 fs/romfs/romfs.mk                    |  2 +-
 fs/squashfs/squashfs.mk              |  2 +-
 fs/tar/tar.mk                        |  2 +-
 fs/ubifs/Config.in                   | 23 ++++++++------
 fs/ubifs/ubi.mk                      | 32 -------------------
 fs/ubifs/ubifs.mk                    | 34 +++++++++++++++++++--
 fs/yaffs2/yaffs.mk                   |  2 +-
 support/testing/tests/fs/test_ubi.py |  6 ++--
 17 files changed, 122 insertions(+), 61 deletions(-)
 delete mode 100644 fs/ubifs/ubi.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
