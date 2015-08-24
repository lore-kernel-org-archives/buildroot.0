From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2015 18:49:59 +0200
Subject: [Buildroot] [PATCH 0/4 v2] core/pkg-kernel-config: ensure linux
	supports modules (branch yem/kernel-module)
Message-ID: <cover.1440434894.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes two standing issues with the way we handle packages
that build kernel modules:

  - first, the current check is broken, because $(LINUX_DIR) should be
    double-$ed, as it is used in a macro from an infra,

  - second, it is currently possible to (try to) build such packages
    without the kernel config havong CONFIG_MODULES set.

So, these three patches fix that:

  - introduce a new internal variable to tell the kernel to enable
    support for modules, LINUX_NEEDS_MODULES, that should be set
    whenever a package wants to build a kernel modules, and is
    automatically set by the kernel-module infra,

  - the (broken) check is no longer needed so removed,

  - a few packages that build kernel modules without using the
    kernel-module infra are fixed to manually set that variable.

I believe that should go into master, because:

  - it actually fixes build issues

  - the kernel-module infra is brand new in this release, and should be
    fixed and stable prior to being released to the wide hostile world
    ;-)

Thanks to Peter for suggesting the solution, and to No? and Jan for
their previous attempts that eventually led to this series.

Changes v1 -> v2:
  - to not force CONFIG_MODULES if requesting package is not enabled
    (Peter, Jan)
  - update commit log that the check was broken anyway
  - add 4th patch to slightly improve linux-fusion


Regards,
Yann E. MORIN.


The following changes since commit 2c1e3a1a79e600ebb863aa67a2d06f4479e28b2a:

  apitrace: bump to version 7.0 (2015-08-24 17:17:19 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/kernel-module

for you to fetch changes up to 96204099417c101327b357870e89386fe1757931:

  package/linux-fusion: slight simplification (2015-08-24 18:45:25 +0200)

----------------------------------------------------------------
Yann E. MORIN (4):
      core/pkg-kernel-module: ensure linux supports modules
      core/pkg-kernel-module: drop now-useles check for CONFIG_MODULES
      packages: ensure linux supports modules even when not using kernel-module
      package/linux-fusion: slight simplification

 linux/linux.mk                           |  2 ++
 package/linux-fusion/linux-fusion.mk     | 11 ++++++++---
 package/nvidia-driver/nvidia-driver.mk   |  4 ++++
 package/pkg-kernel-module.mk             |  9 +++++----
 package/racehound/racehound.mk           |  6 ++++++
 package/rtai/rtai.mk                     |  6 ++++++
 package/ti-gfx/ti-gfx.mk                 |  7 +++++++
 package/xtables-addons/xtables-addons.mk |  6 ++++++
 8 files changed, 44 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
