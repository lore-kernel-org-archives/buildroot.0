From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2015 14:27:38 +0200
Subject: [Buildroot] [PATCH 0/3] core/pkg-kernel-config: ensure linux
	supports modules (branch yem/kernel-module)
Message-ID: <cover.1440418870.git.yann.morin.1998@free.fr>
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
    support for modules, LINUX_NEEDS_MODULES, that should be set whenever
    a package wants to build a kernel modules, and is automatically set
    by the kernel-module infra,

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

Regards,
Yann E. MORIN.


The following changes since commit 7deaa277fd4c89c67de39ea21b4cd081ab85366f:

  arch/arm: add missing arm1136j-s variant (2015-08-24 00:43:12 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/kernel-module

for you to fetch changes up to 2af986ecd146d1dc6e7603bd93fac5420c459e41:

  packages: ensure linux supports modules even when not using kernel-module (2015-08-24 14:14:23 +0200)

----------------------------------------------------------------
Yann E. MORIN (3):
      core/pkg-kernel-module: ensure linux supports modules
      core/pkg-kernel-module: drop now-useles check for CONFIG_MODULES
      packages: ensure linux supports modules even when not using kernel-module

 linux/linux.mk                           | 2 ++
 package/linux-fusion/linux-fusion.mk     | 9 ++++++---
 package/nvidia-driver/nvidia-driver.mk   | 4 ++++
 package/pkg-kernel-module.mk             | 9 +++++----
 package/racehound/racehound.mk           | 4 ++++
 package/rtai/rtai.mk                     | 4 ++++
 package/ti-gfx/ti-gfx.mk                 | 5 +++++
 package/xtables-addons/xtables-addons.mk | 4 ++++
 8 files changed, 34 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
