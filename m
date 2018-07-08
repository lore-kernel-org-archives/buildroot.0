From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:14:40 +0200
Subject: [Buildroot] [PATCH 00/50 v2] package/busybox: invert
 dependencies
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <b14c83bf-ae27-627b-d8f8-00987c43f86b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-07-18 11:46, Yann E. MORIN wrote:
> Hello All!
> 
> Currently, the issue that busybox may install the same executables as
> those from other packages, is handled in all those packages. This is
> not very practical from a maintenance point of view.
[snip]
> Inverting a single dependency could introduce a dependency loop, which
> would be resolved by a latter inversion. For example, suppose we were to
> start with this initial situation:
> 
>     B -->-- A -->-- busybox
>      `------>-------'
> 
> With the first inversion, we'd get to now have a dependency loop:
> 
>     B -->-- A -->-- busybox -->-- B
> 
> Then with the second inversion, we'd resolve that loop:
> 
>                     busybox -->-- B -->-- A
>                            `------>------'
> 
> Detecting and avoiding those loops is not trivial, because they may
> imply multiple intermediate packages between B and A. So, the series
> does not attempt to prevent those loops, as they are entirely resolved
> by the end of the series anyway.

 Because of this, I've applied the entire series 2-49 in one go.

 I'm not happy with patch 50 so I'll comment on that.

 Regards,
 Arnout

> 
> 
> Regards,
> Yann E. MORIN.
> 
> 
> The following changes since commit 0fe0c50d3683be4975a4551ac183707692b11215
> 
>   systemd: Fix polkit build order (2018-07-08 00:19:37 +0200)
> 
> 
> are available in the git repository at:
> 
>   git://git.buildroot.org/~ymorin/git/buildroot.git
> 
> for you to fetch changes up to 7d4417e280d8c1db48496f8e35895c4819cae957
> 
>   support/scripts: don't draw most of busybox' dependencies (2018-07-08 11:24:23 +0200)
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (50):
>       package/busybox: update to 1.29.0
>       package/busybox: invert dependency with whois
>       package/busybox: invert dependency with wget
>       package/busybox: invert dependency with vim
>       package/busybox: invert dependency with util-linux
>       package/busybox: invert dependency with usbutils
>       package/busybox: invert dependency with unzip
>       package/busybox: invert dependency with traceroute
>       package/busybox: invert dependency with tftpd
>       package/busybox: invert dependency with tar
>       package/busybox: invert dependency with sysvinit
>       package/busybox: invert dependency with systemd
>       package/busybox: invert dependency with syslog-ng
>       package/busybox: invert dependency with sysklogd
>       package/busybox: invert dependency with start-stop-daemon
>       package/busybox: invert dependency with rsyslog
>       package/busybox: invert dependency with psmisc
>       package/busybox: invert dependency with procps-ng
>       package/busybox: invert dependency with pciutils
>       package/busybox: invert dependency with ntp
>       package/busybox: invert dependency with nmap
>       package/busybox: invert dependency with netcat-openbsd
>       package/busybox: invert dependency with netcat
>       package/busybox: invert dependency with net-tools
>       package/busybox: invert dependency with mtd
>       package/busybox: invert dependency with lsof
>       package/busybox: invert dependency with less
>       package/busybox: invert dependency with kmod
>       package/busybox: invert dependency with iputils
>       package/busybox: invert dependency with iproute2
>       package/busybox: invert dependency with ifupdown
>       package/busybox: invert dependency with ifplugd
>       package/busybox: invert dependency with ifenslave
>       package/busybox: invert dependency with i2c-tools
>       package/busybox: invert dependency with gzip
>       package/busybox: invert dependency with grep
>       package/busybox: invert dependency with gawk
>       package/busybox: invert dependency with fbset
>       package/busybox: invert dependency with e2fsprogs
>       package/busybox: invert dependency with dos2unix
>       package/busybox: invert dependency with diffutils
>       package/busybox: invert dependency with debianutils
>       package/busybox: invert dependency with dcron
>       package/busybox: invert dependency with cpio
>       package/busybox: invert dependency with coreutils
>       package/busybox: invert dependency with binutils
>       package/busybox: invert dependency with bc
>       package/busybox: invert dependency with bash
>       package/busybox: add dependency on attr
>       support/scripts: don't draw most of busybox' dependencies
> 
>  package/bash/bash.mk                               |  4 +-
>  package/bc/bc.mk                                   |  5 --
>  package/binutils/binutils.mk                       |  5 --
>  ...ags-strip-non-l-arguments-returned-by-pkg.patch |  4 +-
>  package/busybox/busybox.hash                       | 10 +---
>  package/busybox/busybox.mk                         | 68 +++++++++++++++++++---
>  package/coreutils/coreutils.mk                     |  6 --
>  package/cpio/cpio.mk                               |  1 -
>  package/dcron/dcron.mk                             |  5 --
>  package/debianutils/debianutils.mk                 |  2 -
>  package/diffutils/diffutils.mk                     |  4 --
>  package/dos2unix/dos2unix.mk                       |  4 +-
>  package/e2fsprogs/e2fsprogs.mk                     | 10 +---
>  package/fbset/fbset.mk                             |  5 --
>  package/gawk/gawk.mk                               |  5 --
>  package/grep/grep.mk                               |  5 --
>  package/gzip/gzip.mk                               |  2 -
>  package/i2c-tools/i2c-tools.mk                     |  4 --
>  package/ifenslave/ifenslave.mk                     |  1 -
>  package/ifplugd/ifplugd.mk                         |  5 --
>  package/ifupdown/ifupdown.mk                       |  1 -
>  package/iproute2/iproute2.mk                       |  6 --
>  package/iputils/iputils.mk                         |  6 --
>  package/kmod/kmod.mk                               |  3 -
>  package/less/less.mk                               |  3 +-
>  package/lsof/lsof.mk                               |  3 -
>  package/mtd/mtd.mk                                 |  4 --
>  package/net-tools/net-tools.mk                     |  8 +--
>  package/netcat-openbsd/netcat-openbsd.mk           |  6 --
>  package/netcat/netcat.mk                           | 13 -----
>  package/nmap/nmap.mk                               |  6 --
>  package/ntp/ntp.mk                                 |  2 +-
>  package/pciutils/pciutils.mk                       |  5 --
>  package/procps-ng/procps-ng.mk                     | 10 +---
>  package/psmisc/psmisc.mk                           |  5 --
>  package/rsyslog/rsyslog.mk                         |  5 --
>  package/start-stop-daemon/start-stop-daemon.mk     |  3 +-
>  package/sysklogd/sysklogd.mk                       |  5 --
>  package/syslog-ng/syslog-ng.mk                     |  5 --
>  package/systemd/systemd.mk                         |  6 --
>  package/sysvinit/sysvinit.mk                       |  5 --
>  package/tar/tar.mk                                 |  7 +--
>  package/tftpd/tftpd.mk                             |  5 --
>  package/traceroute/traceroute.mk                   |  5 --
>  package/unzip/unzip.mk                             |  2 -
>  package/usbutils/usbutils.mk                       |  5 --
>  package/util-linux/util-linux.mk                   |  6 --
>  package/vim/vim.mk                                 |  5 +-
>  package/wget/wget.mk                               |  5 --
>  package/whois/whois.mk                             |  3 +-
>  support/scripts/graph-depends                      | 11 ++++
>  51 files changed, 90 insertions(+), 229 deletions(-)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
