From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Jun 2015 00:20:43 +0200
Subject: [Buildroot] [PATCH 0/11] pkg-kernel-module: new infra to ease
	building kernel modules (branch yem/kernel-modules)
Message-ID: <cover.1433628825.git.yann.morin.1998@free.fr>
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

Regards,
Yann E. MORIN.


The following changes since commit de823a5bd3976ac9fcf039c57869ccf8e9fc0a45:

  opkg: gpg support needs libgpg-error (2015-06-06 15:38:56 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/kernel-modules

for you to fetch changes up to e2ea306fbb76707d821144673bf6805cd2f3e532:

  package/sysdig: use kernel-module helper (2015-06-07 00:04:03 +0200)

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

 docs/manual/adding-packages-kernel-module.txt      | 120 +++++++++++++++++++++
 docs/manual/adding-packages.txt                    |   2 +
 package/Makefile.in                                |   1 +
 package/cryptodev-linux/cryptodev-linux.mk         |  13 +--
 package/igh-ethercat/igh-ethercat.mk               |  14 +--
 package/ktap/ktap.mk                               |   7 +-
 package/lttng-modules/lttng-modules.mk             |  11 +-
 package/ocf-linux/0001-modules-cross.patch         |  42 --------
 package/ocf-linux/ocf-linux.mk                     |  17 ++-
 package/on2-8170-modules/on2-8170-modules.mk       |  11 +-
 .../0001-fix-CROSS_COMPILE-usage-in-Makefile.patch |  16 ---
 ...-3.3.x.patch => 0001-fix-for-linux-3.3.x.patch} |   0
 package/owl-linux/owl-linux.mk                     |  11 +-
 package/pkg-kernel-module.mk                       |  94 ++++++++++++++++
 package/simicsfs/simicsfs.mk                       |  10 +-
 package/sysdig/sysdig.mk                           |  22 +++-
 16 files changed, 254 insertions(+), 137 deletions(-)
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
