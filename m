From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jul 2015 02:21:35 +0200
Subject: [Buildroot] [PATCH 0/11 v3] core: new infra to ease building kernel
	modules (branch yem/kernel-modules)
Message-ID: <cover.1436660369.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces a new infrastructure to help writing packages
that build kernel modules.

Unlike other package infrastrucutre, this new kernel-module
infrastructure is not stand-alone, but is made as a complement to
existing infrastructures, so that packages can build both userland and
kernel modules.

A few packages (9) are converted to use that new infrastructure, and it
greatly simplifies most of them (even allowing us to drop some of our
patches).

Furthermore, as a side effect of converting it to this new inra, it also
fixes the sysdig package, which is cirrently broken because it tries to
build with the host kernel.

Unfortunately, not all packages that build kernel headers were
converted, becasue they use very custom (aka convoluted) Makefiles to
reinvent out-of-tree module building, and it is too much work to fix
them.


Changes v2 -> v3:
  - better documentation  (Arnout, Jeremy)
  - better commit logs  (Arnout, Doug)
  - drop more variables  (Arnout)
  - override PWD in the infra, not per-package

Changes v1 -> v2:
  - drop third and fourth args to inner macros (unneeded), fix comments
    about inner macros  (Arnout, Baruch)
  - add LINU_MAKE_ENV  (Arnout)
  - be less verbose, print a single MESSAGE  (Thomas, Arnout)
  - rephrase parts of the manual  (Arnout)
  - explain now-missing variable in ktap  (Thomas)
  - fix crypto-dev  (Doug)
  - fix owl-linux


Regards,
Yann E. MORIN.


The following changes since commit 98573709465cd0cf27f31e219cc51f8e5535ff11:

  package/x11r7/xdriver_xf86-input-libinput: bump version to 0.11.0 (2015-07-12 00:52:28 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/kernel-modules

for you to fetch changes up to 643b9f65eee71f7f842fcb640af562a9c11d80d8:

  package/sysdig: use kernel-module helper (2015-07-12 02:14:34 +0200)

----------------------------------------------------------------
Yann E. MORIN (11):
      package-infra: add helper to build kernel modules
      docs/manual: add kernel-module
      package/lttng-modules: use kernel-module helper
      package/igh-ethercat: use kernel-module helper
      package/ktap: use kernel-module helper
      package/cryptodev-linux: use the kernel-module helper
      package/ocf-linux: use kernel-module helper
      package/on2-8170-modules: use kernel-module helper
      package/owl-linux: use kernel-module helper
      package/simicsfs: use kernel-module helper
      package/sysdig: use kernel-module helper

 docs/manual/adding-packages-kernel-module.txt      | 142 +++++++++++++++++++++
 docs/manual/adding-packages.txt                    |   2 +
 package/Makefile.in                                |   1 +
 package/cryptodev-linux/cryptodev-linux.mk         |  12 +-
 package/igh-ethercat/igh-ethercat.mk               |  14 +-
 package/ktap/ktap.mk                               |   7 +-
 package/lttng-modules/lttng-modules.mk             |  11 +-
 package/ocf-linux/0001-modules-cross.patch         |  42 ------
 package/ocf-linux/ocf-linux.mk                     |  17 +--
 package/on2-8170-modules/on2-8170-modules.mk       |  11 +-
 .../0001-fix-CROSS_COMPILE-usage-in-Makefile.patch |  16 ---
 ...-3.3.x.patch => 0001-fix-for-linux-3.3.x.patch} |   0
 package/owl-linux/owl-linux.mk                     |  11 +-
 package/pkg-kernel-module.mk                       |  96 ++++++++++++++
 package/simicsfs/simicsfs.mk                       |  10 +-
 package/sysdig/sysdig.mk                           |  22 +++-
 16 files changed, 278 insertions(+), 136 deletions(-)
 create mode 100644 docs/manual/adding-packages-kernel-module.txt
 delete mode 100644 package/ocf-linux/0001-modules-cross.patch
 delete mode 100644 package/owl-linux/0001-fix-CROSS_COMPILE-usage-in-Makefile.patch
 rename package/owl-linux/{0002-fix-for-linux-3.3.x.patch => 0001-fix-for-linux-3.3.x.patch} (100%)
 create mode 100644 package/pkg-kernel-module.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
