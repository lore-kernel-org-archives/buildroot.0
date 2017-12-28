From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Dec 2017 11:40:26 +0100
Subject: [Buildroot] [PATCH 0/2 v2] fs: make it behave more like the package
 infra
Message-ID: <cover.1514457621.git.yann.morin.1998@free.fr>
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
that these are in fact not two filesystems, but ubi can be spun off as
its own filesystem (that depends on ubifs, which is anyway already the
case).

So, after we spin off the UBI image to its own filesystem, we eventually
turn the rootfs infra into a package-like infra, whereby naming the
filesystem is no longer needed, which allows one to simply write:

   $(eval $(rootfs))

The 'rootfs' keyword may seem rather generic, but it is currently unused
in our tree (except in a post-image script for the chromebook defconfig):

    $ git grep -E '\<rootfs[[:space:]]*:?='
    board/chromebook/snow/mksd.sh:rootfs=$BINARIES_DIR/rootfs.ext2

Changes v1 -> v2:
  - register the UBI image as a separate filesystem, not an option of
    the ubifs filesystem  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit 0b39b14b27700ff4cde566b704d9f633f9230a30

  Config.in.legacy: update comment that old entries have been removed (2017-12-28 10:06:58 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to f803f25cacb7d566fdc0bb1af9dd134371e25a86

  fs: make it behave a bit more like the package infra (2017-12-28 11:25:35 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      fs/ubifs: spin-off ubi to be its own filesystem
      fs: make it behave a bit more like the package infra

 fs/Config.in                  |  1 +
 fs/axfs/axfs.mk               |  2 +-
 fs/cloop/cloop.mk             |  2 +-
 fs/common.mk                  |  7 +++---
 fs/cpio/cpio.mk               |  2 +-
 fs/cramfs/cramfs.mk           |  2 +-
 fs/ext2/ext2.mk               |  2 +-
 fs/iso9660/iso9660.mk         |  2 +-
 fs/jffs2/jffs2.mk             |  2 +-
 fs/romfs/romfs.mk             |  2 +-
 fs/squashfs/squashfs.mk       |  2 +-
 fs/tar/tar.mk                 |  2 +-
 fs/ubi/Config.in              | 51 +++++++++++++++++++++++++++++++++++++++++++
 fs/{ubifs => ubi}/ubi.mk      |  4 ++--
 fs/{ubifs => ubi}/ubinize.cfg |  0
 fs/ubifs/Config.in            | 51 -------------------------------------------
 fs/ubifs/ubifs.mk             |  2 +-
 fs/yaffs2/yaffs.mk            |  2 +-
 18 files changed, 69 insertions(+), 69 deletions(-)
 create mode 100644 fs/ubi/Config.in
 rename fs/{ubifs => ubi}/ubi.mk (92%)
 rename fs/{ubifs => ubi}/ubinize.cfg (100%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
