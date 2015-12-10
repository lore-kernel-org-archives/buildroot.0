From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Dec 2015 19:53:15 +0100
Subject: [Buildroot] [PATCH 0/7] linux: simplify requesting kernel modules
	(branch yem/needs-modules)
Message-ID: <cover.1449771844.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a proposal to make it easier and mor esimple for packages
to request that the Linux kernel be built with support for loadable
modules.

This work was prompted by a comment from Thomas on IRC, who did not like
much that packages had to write things like:

    ifeq ($(BR2_PACKAGE_FOO),y)
    LINUX_NEEDS_MODULES = y
    endif

The LINUX_NEEDS_MODULES variable was introduced as a pure make variable,
because we needed it to implement the kernel-module infra. So, we just
turned to using it even from packages that do not use that infra.

However, that's indeed quite cumbersome that packages do have to write
this code in their .mk files, when we already have the logic in two
places:

  - in the Config.in, since that's handled natively by Kconfig,
  - in the generic package infra, in which we already have that
    condition to add packages to the list.

So, this series introduce BR2_LINUX_NEEDS_MODULES, the Kconfig
counter-part of LINUX_NEEDS_MODULES. LINUX_NEEDS_MODULES still gets set
by the kernel-module infra when the package is enabled, but is also set
when BR2_LINUX_NEEDS_MODULES is.


Regards,
Yann E. MORIN.


The following changes since commit e85a0bb03face4963b1e93b83cdb01066d68b79b:

  package/lttng-tools: fix static build (2015-12-09 23:39:11 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/needs-modules

for you to fetch changes up to 94c80013dc21effd198e7fe4b21ddf5f1d41e8fe:

  package/xtables-addons: require kernel modules from Kconfig (2015-12-10 18:37:00 +0100)

----------------------------------------------------------------
Yann E. MORIN (7):
      linux: add blind kconfig option to require kernel modules
      package/linux-fusion: require kernel modules from Kconfig
      package/nvidia-driver: require kernel modules from Kconfig
      package/racehound: require kernel modules from Kconfig
      package/rtai: require kernel modules from Kconfig
      package/ti-gfx: require kernel modules from Kconfig
      package/xtables-addons: require kernel modules from Kconfig

 linux/Config.in                          | 6 ++++++
 linux/linux.mk                           | 3 +++
 package/linux-fusion/Config.in           | 3 ++-
 package/linux-fusion/linux-fusion.mk     | 6 ------
 package/nvidia-driver/Config.in          | 1 +
 package/nvidia-driver/nvidia-driver.mk   | 4 ----
 package/racehound/Config.in              | 3 ++-
 package/racehound/racehound.mk           | 6 ------
 package/rtai/Config.in                   | 1 +
 package/rtai/rtai.mk                     | 6 ------
 package/ti-gfx/Config.in                 | 3 ++-
 package/ti-gfx/ti-gfx.mk                 | 6 ------
 package/xtables-addons/Config.in         | 1 +
 package/xtables-addons/xtables-addons.mk | 6 ------
 14 files changed, 18 insertions(+), 37 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
