From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 11:05:58 +0200
Subject: [Buildroot] [PATCH 00/15 v4] fs: support parallel filesystems build
Message-ID: <cover.1522487149.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

TL;DR: filsystems are not parallel-safe, so we generate an intermediate
tarball from target/, which then serves as input for the various
filesystems; we also run pre-gen hooks under fakeroot, and get rid of
post-fs package-provided hooks.

Full explanations follows:

Currently, the filesystems are all built sequentially. This is
unfortunate, because each filesystem commands may modify the content of
target/, e.g. when systemd is enabled on a read-only filesystem, or cpio
to add its /init stub. cpio even changes the packages-supplied list of
devices, to shoe-horn /dev/console.

This has two issues:

  - the content of the generated rootfs depends on whether other
    filesystems are enabled or not;

  - it is not posible to build filesystems in parallel, becasue of
    concurency on target/.

A further (less critical) issue is that the fakeroot stuff is repeated
again and again for each filesystem: generating the user, groups and
device tables...

The only sane solution is to have each filesystem operate on its own
copy of target/, which is assembled once uner fakeroot and then re-used
by each filesystem, so that they can each do their own last-ditch tweaks
to the content of the filesystem before generating the image.

So we introduce an intermediate tarball that is assembled under
fakeroot, to run all the common fakeroot-needing setup. Each filesytem
then run a very simple fakeroot script that extracts that intermediate
tarball in a transient per-filesystem location and use that as input to
their image generation commands. This also allows to run the fakerooted,
common actions only once.

Today, the filesystems pre-/post-gen hooks are called very early,
outside of the fakeroot script, which means they can not do modifications
that require root access, like creating device nodes.

And as a last straw, the recently added (in August 2017) support for
package-provided pre-/post-fs hooks, and used solely by systemd on a
read-only filesystem, means that the target directory may be left in an
inconsistent state should the filesystem image generator fails, because
those pre-/post-fs hooks really need an atomic seciont which we can not
provide.

For this reason, the only solution is to act on a copy of target/.

So, now that all the issues have been exposed and their solutions
explained, the series is split as such:

  - first we move the filesystemns pre-gen hooks under fakeroot, and we
    fix the cpio filesystem to correctly create its device node; the
    post-gen hooks need not run under fakeroot, because they are only
    supposed to act on the generated image, which does not require root
    rights (and modifying target/ after the iamge has been generated is
    pointless anyway;

  - then we introduce per-rootfs variables (per rootfs name and directory,
    and per rootfs target directory) and fakeroot scripts, and off-load
    the common dependencies to a common rule;

  - then we eventually split the filesystem generation in two, introducing
    the intermediate tarball, which filesystems re-use as input to
    generate their images. We also introduce a copy of target/ from which
    to generate the intermediate tarball, which allows us to get rid of
    the post-fs hooks provided by packages.

  - finally, the last patchs adds the removal of the transient copies of
    the target/ directory, as well as of the intermediate tarball, since
    they all can be rather large and are not meant to be user-visible.

As an aside, the pre-gen and post-gen hooks are not totally symetric
anymore: the pre-gen hooks run under fakeroot while the post-gen hooks
do not. A brief discussion on IRC suggested a change of name, since they
are no longer symetric, but in the end, I left this renaming as a
further exercise.

The series still runs the test suite with a few failures, that are
already present on master it based on:

  - master: https://gitlab.com/buildroot.org/buildroot/pipelines/17079175
  - series: https://gitlab.com/ymorin/buildroot-ci/pipelines/17080587

Note: the entire series was tested by Matthew, but I carry his tested-by
tag only on the last commit.

Changes v2 -> v3:
  - none; rebased on master

Changes v1 -> v2:
  - drop applied patches
  - write a complete commit log for now-first patch  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit 5966e2dc54dfb19c5fde3a09d72f3abc6125c202

  package/openocd: fix fallout after no-C++ fixups (2018-03-31 09:26:19 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to aa32fec260607f3c9e3a436873b8ef72802078e7

  fs: remove intermediate artefacts (2018-03-31 10:50:25 +0200)


----------------------------------------------------------------
Yann E. MORIN (15):
      fs: run filesystem hooks under fakeroot
      fs/cpio: don't extend packages' permissions table
      fs/iso9660: rename internal variable
      core: introduce intermediate BASE_TARGET_DIR variable
      fs: set per-rootfs variable name
      fs: define per-rootfs directory
      fs: use a per-rootfs fakeroot script
      fs: split per-rootfs dependency line
      fs: introduce per-rootfs TARGET_DIR variable
      fs: new intermediate rootfs-common to gather common dependencies
      fs: introduce a macro for reproducible command
      fs: use a common tarball as base for the other filesystems
      fs: run packages' filesystem hooks in a copy of target/
      fs: get rid of package-provided post-fs hooks
      fs: remove intermediate artefacts

 Makefile                                           |  17 ++-
 fs/common.mk                                       | 114 +++++++++++++++------
 fs/cpio/cpio.mk                                    |   5 +-
 fs/iso9660/iso9660.mk                              |  30 +++---
 package/pkg-generic.mk                             |   6 +-
 .../skeleton-init-systemd/skeleton-init-systemd.mk |   6 --
 support/testing/tests/core/test_post_scripts.py    |  23 +++--
 7 files changed, 128 insertions(+), 73 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
