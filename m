From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 27 Nov 2017 08:41:28 -0200
Subject: [Buildroot] [PATCH 0/3] libvirt and required packages
Message-ID: <20171127104131.27975-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series introduces a new package, libvirt, along with some required
changes:

- nmap: add option to build/install ncat

The libvirt daemon (libvirtd) needs a "nc" command with support for Unix
sockets to permit remote management via virt-manager. The netcat-openbsd
package provides such command but requires glibc, so we would not have
remote management on uClibc-based systems. Ncat is compatible with
uClibc and musl.

- netcf: new package

The netcf library library is used by libvirt when udev is not available.

- libvirt: new package

Libvirt is collection of software that provides a convenient way to
manage virtual machines and other virtualization functionality, such as
storage and network interface management. These software pieces include
an API library, a daemon (libvirtd), and a command line utility (virsh).

Carlos Santos (3):
  nmap: add option to build/install ncat
  netcf: new package
  libvirt: new package

 package/Config.in                                  |   2 +
 package/libvirt/Config.in                          |  44 ++++
 package/libvirt/S30devkvmperms                     |  28 +++
 package/libvirt/S90libvirt                         | 139 ++++++++++++
 package/libvirt/device_table.txt                   |  39 ++++
 package/libvirt/libvirt.hash                       |   2 +
 package/libvirt/libvirt.mk                         | 233 +++++++++++++++++++++
 package/netcf/0001-fix-misplaced-empty.patch       |  36 ++++
 ...002-call-aug_load-at-most-once-per-second.patch |  83 ++++++++
 ...g_match-query-for-all-ifcfg-files-related.patch | 113 ++++++++++
 ...ude-bond-element-for-bonds-with-no-slaves.patch |  56 +++++
 ...erly-classify-bond-devices-with-no-slaves.patch |  35 ++++
 ...006-netcf-transaction.sh-remove-bash-isms.patch |  50 +++++
 ...t-script-as-etc-init.d-S30netcf-transacti.patch |  35 ++++
 ...08-configure.ac-fix-AM_INIT_AUTOMAKE-call.patch |  29 +++
 ...LUDES-by-AM_CPPFLAGS-in-some-Makefile.am-.patch |  52 +++++
 package/netcf/Config.in                            |  24 +++
 package/netcf/S30netcf-transaction                 |   9 +
 package/netcf/netcf.hash                           |   2 +
 package/netcf/netcf.mk                             |  22 ++
 package/nmap/Config.in                             |  27 ++-
 package/nmap/nmap.mk                               |  38 +++-
 22 files changed, 1095 insertions(+), 3 deletions(-)
 create mode 100644 package/libvirt/Config.in
 create mode 100755 package/libvirt/S30devkvmperms
 create mode 100644 package/libvirt/S90libvirt
 create mode 100644 package/libvirt/device_table.txt
 create mode 100644 package/libvirt/libvirt.hash
 create mode 100644 package/libvirt/libvirt.mk
 create mode 100644 package/netcf/0001-fix-misplaced-empty.patch
 create mode 100644 package/netcf/0002-call-aug_load-at-most-once-per-second.patch
 create mode 100644 package/netcf/0003-optimize-aug_match-query-for-all-ifcfg-files-related.patch
 create mode 100644 package/netcf/0004-linux-include-bond-element-for-bonds-with-no-slaves.patch
 create mode 100644 package/netcf/0005-Properly-classify-bond-devices-with-no-slaves.patch
 create mode 100644 package/netcf/0006-netcf-transaction.sh-remove-bash-isms.patch
 create mode 100644 package/netcf/0007-Install-init-script-as-etc-init.d-S30netcf-transacti.patch
 create mode 100644 package/netcf/0008-configure.ac-fix-AM_INIT_AUTOMAKE-call.patch
 create mode 100644 package/netcf/0009-Replace-INCLUDES-by-AM_CPPFLAGS-in-some-Makefile.am-.patch
 create mode 100644 package/netcf/Config.in
 create mode 100644 package/netcf/S30netcf-transaction
 create mode 100644 package/netcf/netcf.hash
 create mode 100644 package/netcf/netcf.mk

-- 
2.14.3
