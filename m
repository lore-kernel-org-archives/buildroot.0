From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:12:21 +0200
Subject: [Buildroot] [PATCH 00/50] busybox: invert dependencies
Message-ID: <cover.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Currently, the issue that busybox may install the same executables as
those from other packages, is handled in all those packages. This is
not very practical.

Furthermore, this means that those packages all overwrite the
busybox-installed applets, which means that this triggers the
no-two-packages-touch-the-same-file rule. So far, this is only a
warning, but when we eventually go with TLPB, we'll have to enforce
that rule.

But busybox can be told to be smart, and not replace existing files
during installation. This is in fact what we do with a hook, which uses
'sed' to force the 'noclobber' install. But now, Busybox upstream has
proper support for doing a noclobber install without artifice. So we
backport those required patches, and get rid of our existing hook.

All other commits are just trivial dependency exchange order between a
package and busybox, except for syslog-ng, for which we must take care
that busybox does not overwrite the init script.

Eventually, we also add a new dependency onto the 'attr' package, to
solve a potential conflict with the setfattr applet.

Inverting a single dependency could introduce a dependency loop, which
would be resolved by a latter inversion. For example, we could have that
initial situation:

    B ---> A ---> busybox
      \_________/

With the first inversion, we'd get to now have a dependency loop:

    B ---> A ---> busybox ---> B

Then with the second inversion, we'd resolve that loop:

                  busybox ---> B ---> A
                          \_________/

Detecting and avoiding those loops is not trivial, because they may
imply multiple intermediate packages between B and A. So, the series
does not attempt to prevent those loops, as they are entirely resolved
by the end of the series anyway.


Regards,
Yann E. MORIN.


The following changes since commit 9086de8e15d98abda64850c52b66756646e0c2f4

  qt5charts: fix license information (2018-07-02 23:02:42 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to d5b2e0eebf27fe994337e2c966f8ecf63849f3e1

  support/scripts: don't draw most of busybox' dependencies (2018-07-02 23:07:03 +0200)


----------------------------------------------------------------
Yann E. MORIN (50):
      package/busybox: backport upstream patch to fix install-noclobber
      package/busybox: invert dependency with whois
      package/busybox: invert dependency with wget
      package/busybox: invert dependency with vim
      package/busybox: invert dependency with util-linux
      package/busybox: invert dependency with usbutils
      package/busybox: invert dependency with unzip
      package/busybox: invert dependency with traceroute
      package/busybox: invert dependency with tftpd
      package/busybox: invert dependency with tar
      package/busybox: invert dependency with sysvinit
      package/busybox: invert dependency with systemd
      package/busybox: invert dependency with syslog-ng
      package/busybox: invert dependency with sysklogd
      package/busybox: invert dependency with start-stop-daemon
      package/busybox: invert dependency with rsyslogd
      package/busybox: invert dependency with psmisc
      package/busybox: invert dependency with procps-ng
      package/busybox: invert dependency with pciutils
      package/busybox: invert dependency with ntp
      package/busybox: invert dependency with nnamp
      package/busybox: invert dependency with netcat-openbsd
      package/busybox: invert dependency with netcat
      package/busybox: invert dependency with net-tools
      package/busybox: invert dependency with mtd
      package/busybox: invert dependency with lsof
      package/busybox: invert dependency with less
      package/busybox: invert dependency with kmod
      package/busybox: invert dependency with iputils
      package/busybox: invert dependency with iproute2
      package/busybox: invert dependency with ifupdown
      package/busybox: invert dependency with ifplugd
      package/busybox: invert dependency with ifenslave
      package/busybox: invert dependency with i2c-tools
      package/busybox: invert dependency with gzip
      package/busybox: invert dependency with grep
      package/busybox: invert dependency with gawk
      package/busybox: invert dependency with fbset
      package/busybox: invert dependency with e2fsprogs
      package/busybox: invert dependency with dos2unix
      package/busybox: invert dependency with diffutils
      package/busybox: invert dependency with debianutils
      package/busybox: invert dependency with dcron
      package/busybox: invert dependency with cpio
      package/busybox: invert dependency with coreutils
      package/busybox: invert dependency with binutils
      package/busybox: invert dependency with bc
      package/busybox: invert dependency with bash
      package/busybox: add dependency on attr
      support/scripts: don't draw most of busybox' dependencies

 package/bash/bash.mk                               |  4 +-
 package/bc/bc.mk                                   |  5 --
 package/binutils/binutils.mk                       |  5 --
 ...tall-respect-noclobber-for-script-wrapper.patch | 62 +++++++++++++++++++++
 ...stall-accept-more-than-one-install-option.patch | 63 +++++++++++++++++++++
 ...m-add-rule-to-install-without-cloberring-.patch | 29 ++++++++++
 ...lets-install-don-t-try-to-install-nothing.patch | 65 ++++++++++++++++++++++
 package/busybox/busybox.mk                         | 64 ++++++++++++++++++---
 package/coreutils/coreutils.mk                     |  6 --
 package/cpio/cpio.mk                               |  1 -
 package/dcron/dcron.mk                             |  5 --
 package/debianutils/debianutils.mk                 |  2 -
 package/diffutils/diffutils.mk                     |  4 --
 package/dos2unix/dos2unix.mk                       |  4 +-
 package/e2fsprogs/e2fsprogs.mk                     | 10 +---
 package/fbset/fbset.mk                             |  5 --
 package/gawk/gawk.mk                               |  5 --
 package/grep/grep.mk                               |  5 --
 package/gzip/gzip.mk                               |  2 -
 package/i2c-tools/i2c-tools.mk                     |  4 --
 package/ifenslave/ifenslave.mk                     |  1 -
 package/ifplugd/ifplugd.mk                         |  5 --
 package/ifupdown/ifupdown.mk                       |  1 -
 package/iproute2/iproute2.mk                       |  6 --
 package/iputils/iputils.mk                         |  6 --
 package/kmod/kmod.mk                               |  3 -
 package/less/less.mk                               |  3 +-
 package/lsof/lsof.mk                               |  3 -
 package/mtd/mtd.mk                                 |  4 --
 package/net-tools/net-tools.mk                     |  8 +--
 package/netcat-openbsd/netcat-openbsd.mk           |  6 --
 package/netcat/netcat.mk                           | 13 -----
 package/nmap/nmap.mk                               |  6 --
 package/ntp/ntp.mk                                 |  2 +-
 package/pciutils/pciutils.mk                       |  5 --
 package/procps-ng/procps-ng.mk                     | 10 +---
 package/psmisc/psmisc.mk                           |  5 --
 package/rsyslog/rsyslog.mk                         |  5 --
 package/start-stop-daemon/start-stop-daemon.mk     |  3 +-
 package/sysklogd/sysklogd.mk                       |  5 --
 package/syslog-ng/syslog-ng.mk                     |  5 --
 package/systemd/systemd.mk                         |  6 --
 package/sysvinit/sysvinit.mk                       |  5 --
 package/tar/tar.mk                                 |  7 +--
 package/tftpd/tftpd.mk                             |  5 --
 package/traceroute/traceroute.mk                   |  5 --
 package/unzip/unzip.mk                             |  2 -
 package/usbutils/usbutils.mk                       |  5 --
 package/util-linux/util-linux.mk                   |  6 --
 package/vim/vim.mk                                 |  5 +-
 package/wget/wget.mk                               |  5 --
 package/whois/whois.mk                             |  3 +-
 support/scripts/graph-depends                      | 10 ++++
 53 files changed, 299 insertions(+), 220 deletions(-)
 create mode 100644 package/busybox/0003-applets-install-respect-noclobber-for-script-wrapper.patch
 create mode 100644 package/busybox/0004-applets-install-accept-more-than-one-install-option.patch
 create mode 100644 package/busybox/0005-build-system-add-rule-to-install-without-cloberring-.patch
 create mode 100644 package/busybox/0006-applets-install-don-t-try-to-install-nothing.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
