From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:41:34 +0100
Subject: [Buildroot] [PATCH 0/9 v2] fs: cleanups and enhancements (branch
	yem/fs)
Message-ID: <cover.1457721607.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces some cleaups and enhancements to the filesystem
infrastructure.

Most notably, it gets rid of the post-target rules, i.e. rules defined
by filesystems that were to be executed after the image was generated,
in favour of post-gen hooks.

The reason for getting rid of post-target rules is that they were not
really needed, and the way they were used was dubious when dealing with
top-level parallel builds. Also, the sole user for which those rules
were documented to be useful was not even using the filesystem infra.

To be noted: patch 8/9 was the beginning of a bigger plan to rework how
images are generated. However, and quite sadly, that bigger plan is now
evading my recollection. It's sad to get old... ;-] Nevertheless, the
patch by itself still makes sense, so I kept it.

Finally, the series also introduces the concept of a "landing" area for
the target directory.

This landing area is a copy of the currently-known target/ directory,
copy in which all the target-finalize step and hooks are run, leaving
the original target/ directory to contain only what packages have
installed.

Please read the commit log for the final patch for more on that landing
area. I also kept it in the series despite Thomas opoosition to it; at
least it is now properly archived for posterity on the ML archives...


Changes v1 -> v2:
  - rebased on top of master


Regards,
Yann E. MORIN.


The following changes since commit 0b7b84310c3781c346eea4c114c8cb4e97bbd8ea:

  olimex_imx233_olinuxino_defconfig: genimage support (2016-03-11 13:14:54 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fs

for you to fetch changes up to 8892913385099f562cba138ac3b4f762d8cc4d49:

  [RFC] core: finalise target in its own location (2016-03-11 19:36:40 +0100)

----------------------------------------------------------------
Yann E. MORIN (9):
      core: sort packages and eliminate duplicates before building
      linux: split overly-long dependency line for readability
      linux: meddle not in the affairs of filesystems, for you are tasty with bacon
      fs/initramfs: cleanup and enhance comments
      fs/ext2: use a post-gen hook rather than a post-target rule
      fs/cpio: use a post-gen hook rather than a post-target rule
      fs/common: get rid of post-target rules
      fs/common: move actions common to all filesystems to their own rule
      [RFC] core: finalise target in its own location

 Makefile                  | 34 +++++++++++++++++++++++-
 fs/common.mk              | 67 +++++++++++++++++++++++++----------------------
 fs/cpio/cpio.mk           | 11 ++++----
 fs/ext2/ext2.mk           | 10 +++----
 fs/initramfs/initramfs.mk | 22 +++++++++++-----
 linux/linux.mk            | 13 +++++----
 6 files changed, 99 insertions(+), 58 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
