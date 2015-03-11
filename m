From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2015 23:30:18 +0100
Subject: [Buildroot] [PATCH 0/7] [RFC] Introduce services as a (long-term)
	replacement for _INSTALL_INIT_(SYSV|SYSTEMD) (branch yem/services)
Message-ID: <cover.1426112628.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Following up on Gustavo's proposal [0] on a clean up on our init
scripts (and eventually our systemd unit files), here is an *RFC*
series that tries to implement Gustavo's idea.

The series is split in four parts:

  - patches 1-3 are preparatory work, and not much interesting in the
    Grand Scheme of Life;

  - patches 4-5 introduce a generated kconfig snippet, that contains
    the list of services for each enabled packages, that the user can
    enable/disable at will, directly from the menuconfig (for now, the
    default is that all services are disabled, that can be changed
    later);

  - patch 6 is the guts that installs the service files:
    - installs the service's startup script,
    - enables/disables the service,
    - installs the service's configuration, if it exists;

  - patch 7 is just an example (with empty scripts) of how to declare
    services in a package.

To be noted:
  - the code will need some revamp; this is just meant to be an RFC!
  - only sysv init is handled for now
  - this is by far incomplete even for the sysv case
  - the /etc/config/ part has been left out for now; it would anyway
    most probably provided via a rootfs-overlay
  - the manual part is missing
  - there are typoes all over the place :-/

As usual: on your mark, get set, comment! ;-)

[0] http://lists.busybox.net/pipermail/buildroot/2015-March/121086.html

Regards,
Yann E. MORIN.


The following changes since commit a4788aa6157d1496cdd32cb9802710d4e97bc550:

  btrfs-progs: bump to version 3.19 (2015-03-11 22:38:36 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/services

for you to fetch changes up to f2c8684c9a6cfa5cfe8d776ac8ce4693667c329f:

  [NOT TO BE APPLIED] package/busybox: add afake services as example (2015-03-11 23:08:51 +0100)

----------------------------------------------------------------
Yann E. MORIN (7):
      package infra: print the name of the package being parsed
      Makefile: always scan packages' .mk files, even with no .config
      Makefile: introduce a intermediate rule before the configurators
      packages: introduce a generated kconfig snippet in the menuconfig
      packages: generate services sub-menu
      [INCOMPLETE] pkg-generic: act on enabled services
      [NOT TO BE APPLIED] package/busybox: add afake services as example

 Config.in                    |  4 +++
 Makefile                     | 67 ++++++++++++++++++++++++++++----------------
 package/Config.in            |  2 ++
 package/busybox/S98bar       |  0
 package/busybox/S99foo       |  0
 package/busybox/bar.defaults |  1 +
 package/busybox/busybox.mk   |  2 ++
 package/pkg-generic.mk       | 28 ++++++++++++++++++
 package/pkg-utils.mk         |  3 ++
 9 files changed, 83 insertions(+), 24 deletions(-)
 create mode 100644 package/busybox/S98bar
 create mode 100644 package/busybox/S99foo
 create mode 100644 package/busybox/bar.defaults

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
