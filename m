From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2020 14:10:30 +0200
Subject: [Buildroot] [PATCH 00/22] linux: allow packages to set kconfig
 options (branch yem/pkg-linux-opts)
Message-ID: <cover.1586002215.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Currently, in the spirit of making it work out of the box, we have
some linux kconfig options set depending on whether some packages
are enabled or not.

This list has been slowly growing over time, with now more than half
of the kernel options being set by packages. Yet, some more packages
will eventualy want to set some options, like the pending firewalld
giant hairball [0]; this is going to be an insane and unmaintainable
list.

Furthermore, there is no mechanism to allow packages from a br2-external
tree to easily provide options to be set in the kernel config.

This series brings in such a mechanism, for packages to be able to
provide a way to set linux kernel options, be they in-tree packages
or not.

Additionally, this makes the list more manageable, by splitting it
over to the responsible packages.

Finally, it brings a nice cleanup, where we no longer have to repeat
the knowledge of how the .config file is named, as the name from the
pkg-kconfig infra gets reused.

[0] http://lists.busybox.net/pipermail/buildroot/2020-March/278683.html


Regards,
Yann E. MORIN.


The following changes since commit 9daf7483e9cf86d86797e799c73be80dbbbb9acf

  package/ntp: security bump to version 4.2.8p14 (2020-04-03 10:04:25 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 681cc941334365689dadc41143521d842cd98189

  package/kernel-module-imx-gpu-viv: bear the kernel options munging (2020-04-04 13:50:16 +0200)


----------------------------------------------------------------
Yann E. MORIN (22):
      core/pkg-utils: rationalise kconfig option mangling
      core/pkg-utils: kconfig mangling defaults to current package's .config
      boot/barebox: don't specify .config to munge
      boot/uboot: don't specify .config to munge
      boot/busybox: don't specify .config to munge
      boot/swupdate: don't specify .config to munge
      boot/uclibc: don't specify .config to munge
      linux: don't specify .config to munge
      linux: allow packages to set options
      package/audit: bear the kernel options munging
      package/intel-micro-code: bear the kernel options munging
      package/ktap: bear the kernel options munging
      package/pcm-tools: bear the kernel options munging
      package/linux-tools/perf: bear the kernel options munging
      package/systemd: bear the kernel options munging
      package/smack: bear the kernel options munging
      package/sunxi-mali-mainline-driver: bear the kernel options munging
      package/iptables: bear the kernel options munging
      package/xtables-addons: bear the kernel options munging
      package/wireguard-linux-compat: bear the kernel options munging
      package/libselinux: bear the kernel options munging
      package/kernel-module-imx-gpu-viv: bear the kernel options munging

 boot/barebox/barebox.mk                            |   4 +-
 boot/uboot/uboot.mk                                |   6 +-
 docs/manual/adding-packages-generic.txt            |   9 ++
 linux/linux.mk                                     | 112 ++++-----------
 package/audit/audit.mk                             |   5 +
 package/busybox/busybox.mk                         |  71 +++++-----
 .../kernel-module-imx-gpu-viv.mk                   |   4 +
 package/intel-microcode/intel-microcode.mk         |   5 +
 package/iptables/iptables.mk                       |   7 +
 package/ktap/ktap.mk                               |   7 +
 package/libselinux/libselinux.mk                   |  10 ++
 package/linux-tools/linux-tool-perf.mk.in          |   4 +
 package/pcm-tools/pcm-tools.mk                     |   4 +
 package/pkg-generic.mk                             |   3 +
 package/pkg-kconfig.mk                             |   2 +
 package/pkg-utils.mk                               |  27 ++--
 package/smack/smack.mk                             |   6 +
 .../sunxi-mali-mainline-driver.mk                  |   5 +
 package/swupdate/swupdate.mk                       |   4 +-
 package/systemd/systemd.mk                         |   9 ++
 package/uclibc/uclibc.mk                           | 152 ++++++++++-----------
 .../wireguard-linux-compat.mk                      |   8 ++
 package/xtables-addons/xtables-addons.mk           |   7 +
 23 files changed, 257 insertions(+), 214 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
