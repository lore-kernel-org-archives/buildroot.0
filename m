From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Nov 2017 18:45:47 +0100
Subject: [Buildroot] [PATCH 00/14] fs: cleanups and enhancements
Message-ID: <cover.1510508733.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series brings a few cleanups, fixes and enhancements to the
filesystem infra. More is to come, but this is already large enough
and self-contained, so that it warrants being pushed.

The underlying reason for this series if many-fold.

First, some comments and code in the fs infra have started to bit-rot
and are now wrong, misleading, sub-optimal. So, we update those to the
current state with patches 1..7, essentially to get rid of the
duplication between post-gen hooks and post-target rules, which
basically serve the exact same purpose.

The second part of the series deals with re-organising the infra, so
that all actions common to all image generations are done only once, not
once per image. As a side effect, the scripts used to do the generation
are moved to their own directory, and kept afterward to help debugging
if needed.

As a side effect, this common part is now done only once, so it will
automatically act as a synchronisation point when we later add support
for top-level aparallel build: no two filesystem images will have to
modify the content of tartget/ at the same time anymore.

Now, since we have pre- and post-fs hooks registered by packages, the
target directory is no longer immutable during the creation of
filesystem images. So, when two filesystem images are enabled, they
will both try to run the pre-rootfs hooks, generate the image, then run
the post-rootfs hooks; none of this is atomic, obviously, so they will
conflict. At best, there will be a failure, at worst there will be
silent corruption.

So, the last patch makes the target-finalize step act on a copy of
target/, so as to leave target/ in the state it was set by installing
packages, and each filesystem image generator only sees that and can
tweak it as needed without impacting the others. That copy is deleted
after the filesystem image is generated.


Regards,
Yann E. MORIN.


The following changes since commit 7feaac43718bdfff056e35ffdeec424bf03f1e9c

  wpa_supplicant: mesh support needs openssl (2017-11-12 10:12:08 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 8a74ac07aaa7e2f745ab75dde70f42ee0bff5cb1

  TEST-ME (2017-11-12 12:19:34 +0100)


----------------------------------------------------------------
Yann E. MORIN (14):
      core: sort packages and eliminate duplicates in show-targets
      linux: split overly-long dependency line for readability
      linux: meddle not in the internals of filesystems
      fs/initramfs: cleanups, enhance comments
      fs/ext2: use a post-gen hook rather than a post-target rule
      fs/cpio: use a post-gen hook rather than a post-target rule
      fs/common: get rid of post-target rules
      fs: remove TARGET_DIR_WARNING_FILE late
      fs: don't pollute $(BUILD_DIR) with temp files
      fs/iso9660: don't pollute $(BUILD_DIR) with temp dir
      fs: don't remove intermediate files
      fs: move actions common to all filesystems to their own rule
      core: finalise target in its own location
      TEST-ME

 .gitlab-ci.yml                                     | 204 ---------------------
 Makefile                                           |  30 ++-
 fs/common.mk                                       |  89 +++++----
 fs/cpio/cpio.mk                                    |  11 +-
 fs/ext2/ext2.mk                                    |  10 +-
 fs/initramfs/initramfs.mk                          |  22 ++-
 fs/iso9660/iso9660.mk                              |   2 +-
 linux/linux.mk                                     |  15 +-
 package/pkg-generic.mk                             |   2 -
 .../skeleton-init-systemd/skeleton-init-systemd.mk |   6 -
 support/testing/tests/core/test_post_scripts.py    |   8 +-
 support/testing/tests/core/test_rootfs_overlay.py  |   4 +-
 12 files changed, 117 insertions(+), 286 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
