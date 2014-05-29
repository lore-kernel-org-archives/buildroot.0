From: vomlehn at canopus-us.com <vomlehn@canopus-us.com>
Date: Wed, 28 May 2014 22:24:11 -0700
Subject: [Buildroot] [PATCH 0/3] Manage big root directory trees by breaking
	them up.
Message-ID: <1401341054-16705-1-git-send-email-vomlehn@canopus-us.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: David VomLehn <vomlehn@canopus-us.com>

These patches are not as tightly coupled as the usually series of patches,
but I think the pieces make more sense when viewed in the context of the
whole patchset.  The problem to be solved is that Python is big and my root
filesystem has to fit in a little flash device. So, I:

1.	Created the ability to break the target filesystem into multiple
	filesystems,
2.	Enhanced autotools so that I could specify the --prefix and
	--exec-prefix values. This allowed me to install packages in
	their own directory, which the above patch lets me split into a
	filesystem I can store on a much bigger flash device, and
3.	I modified the Python package so that the installation directory
	is a configurable.

With these in place, I configure Python to be in /usr/local and make that
a separate filesystem, which I can deploy in a nice big flash device. Problem
solved.

David VomLehn (3):
  Add the capability to create sub-filesystems from the target
    filesystem.
  Allow specification of values for --prefix and --exec-prefix in
    autotools.
  Support installation of Python in a different directory.

 Makefile                                  |    5 +-
 docs/manual/adding-packages-autotools.txt |    8 ++
 docs/manual/customize-rootfs.txt          |   74 ++++++++++
 fs/Config.in                              |   25 ++++
 fs/cloop/Config.in                        |   12 ++
 fs/cloop/cloop-post.mk                    |   13 ++
 fs/cloop/cloop-pre.mk                     |    7 +
 fs/common.mk                              |  224 ++++++++++++++++++++++++++---
 fs/cpio/Config.in                         |   12 ++
 fs/cpio/cpio-post.mk                      |   42 ++++++
 fs/cpio/cpio-pre.mk                       |    7 +
 fs/cramfs/Config.in                       |   12 ++
 fs/cramfs/cramfs-post.mk                  |   19 +++
 fs/cramfs/cramfs-pre.mk                   |    7 +
 fs/ext2/Config.in                         |   12 ++
 fs/ext2/ext2-post.mk                      |   37 +++++
 fs/ext2/ext2-pre.mk                       |    6 +
 fs/initramfs/initramfs-post.mk            |   22 +++
 fs/initramfs/initramfs-pre.mk             |    5 +
 fs/iso9660/iso9660-post.mk                |   51 +++++++
 fs/iso9660/iso9660-pre.mk                 |    9 ++
 fs/jffs2/Config.in                        |   12 ++
 fs/jffs2/jffs2-post.mk                    |   49 +++++++
 fs/jffs2/jffs2-pre.mk                     |    7 +
 fs/romfs/Config.in                        |   12 ++
 fs/romfs/romfs-post.mk                    |   15 ++
 fs/romfs/romfs-pre.mk                     |    7 +
 fs/squashfs/Config.in                     |   12 ++
 fs/squashfs/squashfs-post.mk              |   29 ++++
 fs/squashfs/squashfs-pre.mk               |    7 +
 fs/tar/Config.in                          |   12 ++
 fs/tar/tar-post.mk                        |   13 ++
 fs/tar/tar-pre.mk                         |    7 +
 fs/ubifs/Config.in                        |   12 ++
 fs/ubifs/ubi-post.mk                      |   30 ++++
 fs/ubifs/ubi-pre.mk                       |    7 +
 fs/ubifs/ubifs-post.mk                    |   27 ++++
 fs/ubifs/ubifs-pre.mk                     |    7 +
 fs/yaffs2/Config.in                       |   12 ++
 fs/yaffs2/yaffs-post.mk                   |   13 ++
 fs/yaffs2/yaffs-pre.mk                    |    7 +
 package/pkg-autotools.mk                  |    7 +-
 package/python/Config.in                  |    7 +
 package/python/python.mk                  |   26 ++--
 44 files changed, 911 insertions(+), 35 deletions(-)
 create mode 100644 fs/cloop/cloop-post.mk
 create mode 100644 fs/cloop/cloop-pre.mk
 create mode 100644 fs/cpio/cpio-post.mk
 create mode 100644 fs/cpio/cpio-pre.mk
 create mode 100644 fs/cramfs/cramfs-post.mk
 create mode 100644 fs/cramfs/cramfs-pre.mk
 create mode 100644 fs/ext2/ext2-post.mk
 create mode 100644 fs/ext2/ext2-pre.mk
 create mode 100644 fs/initramfs/initramfs-post.mk
 create mode 100644 fs/initramfs/initramfs-pre.mk
 create mode 100644 fs/iso9660/iso9660-post.mk
 create mode 100644 fs/iso9660/iso9660-pre.mk
 create mode 100644 fs/jffs2/jffs2-post.mk
 create mode 100644 fs/jffs2/jffs2-pre.mk
 create mode 100644 fs/romfs/romfs-post.mk
 create mode 100644 fs/romfs/romfs-pre.mk
 create mode 100644 fs/squashfs/squashfs-post.mk
 create mode 100644 fs/squashfs/squashfs-pre.mk
 create mode 100644 fs/tar/tar-post.mk
 create mode 100644 fs/tar/tar-pre.mk
 create mode 100644 fs/ubifs/ubi-post.mk
 create mode 100644 fs/ubifs/ubi-pre.mk
 create mode 100644 fs/ubifs/ubifs-post.mk
 create mode 100644 fs/ubifs/ubifs-pre.mk
 create mode 100644 fs/yaffs2/yaffs-post.mk
 create mode 100644 fs/yaffs2/yaffs-pre.mk

-- 
1.7.9.5
