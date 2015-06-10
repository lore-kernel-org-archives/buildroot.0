From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Jun 2015 21:22:04 +0200
Subject: [Buildroot] [PATCH 0/11 v2] pkg-kernel-module: new infra to ease
	building kernel modules (branch yem/kernel-modules)
Message-ID: <cover.1433964001.git.yann.morin.1998@free.fr>
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


The following changes since commit 74c67922edbfcf1b1aaa04ab68fce218e2b903e9:

  valgrind: backport support for glibc 2.20+ (2015-06-10 11:47:46 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/kernel-modules

for you to fetch changes up to d5dd0daf87cc08d3da3d20f37ac6c62c5f781df2:

  package/sysdig: use kernel-module helper (2015-06-10 21:19:37 +0200)

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

 docs/manual/adding-packages-kernel-module.txt      | 129 +++++++++++++++++++++
 docs/manual/adding-packages.txt                    |   2 +
 package/Makefile.in                                |   1 +
 package/cryptodev-linux/cryptodev-linux.mk         |  14 +--
 package/igh-ethercat/igh-ethercat.mk               |  14 +--
 package/ktap/ktap.mk                               |   7 +-
 package/lttng-modules/lttng-modules.mk             |  11 +-
 package/ocf-linux/0001-modules-cross.patch         |  42 -------
 package/ocf-linux/ocf-linux.mk                     |  17 ++-
 package/on2-8170-modules/on2-8170-modules.mk       |  11 +-
 .../0001-fix-CROSS_COMPILE-usage-in-Makefile.patch |  16 ---
 ...-3.3.x.patch => 0001-fix-for-linux-3.3.x.patch} |   0
 package/owl-linux/owl-linux.mk                     |  15 +--
 package/pkg-kernel-module.mk                       |  89 ++++++++++++++
 package/simicsfs/simicsfs.mk                       |  10 +-
 package/sysdig/sysdig.mk                           |  22 +++-
 16 files changed, 266 insertions(+), 134 deletions(-)
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
