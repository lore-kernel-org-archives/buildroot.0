From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 18 Apr 2020 19:14:06 -0300
Subject: [Buildroot] [PATCH v2 0/5] Add a kernel module loading mechanism
Message-ID: <20200418221411.1549783-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Currently there are two ways to load kernel modules in Buildroot:

- via systemd (systemd-modules-load.service)
- via OpenRC (/etc/init.d/modules)

The systemd mechanism uses configuration files, each one containing a
list of kernel module names to load, separated by newlines. Empty lines
and lines whose first non-whitespace character is # or ; are ignored.
Files are loaded in the following order:

  /etc/modules-load.d/*.conf
  /run/modules-load.d/*.conf
  /usr/lib/modules-load.d/*.conf

OpenRC uses /etc/modules-load.d/*.conf, only, and does not ignore lines
beginning with ';'.

In order to provide a compatible mechanism for sysvinit/busybox init
systems, this series does the following:

Patch #1 adds a S02modules-load init script to kmod (which provides the
"modprobe" utility). It roughly mimics the systemd service.

Patch #2 adds the S02modules-load init script to Busybox. It's installed
only if kmod is not selected and modprobe is included in buildroot.

Patchs #3..5 modify packages dmraid, owfs and ti-sgx-km to use the
modules-load mechanism.

Package ti-gfx should be modified too, but I did not find a board
configuration to test it.

ABOUT THE REASON OF THIS SERIES

Since late 2017 I have been working on porting libvirt to Buildroot,
initially as part of my work at DATACOM and since April 2019 as a pet
project, using hardware kindly donated by DATCOM[1]. libvirt is a big
and complex package that has many build and run time dependencies and
requires several kernel modules to work.

In previous versions of the package, e.g. [2], the modules were loaded
by the S92libvirtd init script. The next patch, however (to be submitted
soon) will add support for both OpenRC and systemd init systems, so I
needed a commom mechanism to load the modules. That was how the patches
for kmod and busybox were born. The ones for dmraid, owfs an ti-sgx-km
are just a consequence of my "scratch the itch" syndrome. :-)

[1] https://www.datacom.com.br/en/produtos/network-appliance
[2] https://patchwork.ozlabs.org/patch/1183162/
---
Carlos Santos (5):
  package/kmod: add modules-load init script
  package/busybox: add modules-load init script
  package/dmraid: use modules-load to load the kernel module
  package/owfs: use modules-load to load the kernel module
  package/ti-sgx-km: use modules-load to load the kernel module

 package/busybox/S11modules-load |   1 +
 package/busybox/busybox.mk      |  12 ++++
 package/dmraid/S20dmraid        |   3 -
 package/dmraid/dmraid.mk        |  12 ++++
 package/kmod/S11modules-load    | 115 ++++++++++++++++++++++++++++++++
 package/kmod/kmod.mk            |  10 +++
 package/owfs/S60owfs            |   2 -
 package/owfs/owfs.mk            |  11 +++
 package/ti-sgx-km/ti-sgx-km.mk  |  10 +++
 package/ti-sgx-um/S80ti-sgx     |  19 +-----
 10 files changed, 173 insertions(+), 22 deletions(-)
 create mode 120000 package/busybox/S11modules-load
 create mode 100644 package/kmod/S11modules-load

-- 
2.18.2
