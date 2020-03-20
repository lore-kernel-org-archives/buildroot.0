From: unixmania at gmail.com <unixmania@gmail.com>
Date: Fri, 20 Mar 2020 20:35:41 -0300
Subject: [Buildroot] [[PATCH RFC] 0/6] Add a kernel module loading mechanism
Message-ID: <20200320233547.28586-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Currently there are two ways to load kernel modules in Buildroot:

- via systemd (systemd-modules-load.service)
- via OpenRC (/etc/init.d/modules)

The systemd mechanism uses configuration files, eacho one containing a
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

Patch #3 adds a target-finalize hook to linux to ensure that depmod -a
is executed after all packages install their modules, otherwise modprobe
fails at run-time, because the module is not included in
/lib/modules/<kernel-version>/modules.dep.

Patchs #4..6 modify packages dmraid, owfs and ti-sgx-km to use the
modules-load mechanism. 

Package ti-gfx should be modified too, but I did not find a board
configuration to test it.

*** BLURB HERE ***

Carlos Santos (6):
  package/kmod: add modules-load init script
  package/busybox: add modules-load init script
  linux: run depmod in a target-finalize hook
  package/dmraid: use modules-load to load the kernel module
  package/owfs: use modules-load to load the kernel module
  package/ti-sgx-km: use modules-load to load the kernel module

 linux/linux.mk                  | 11 ++++-
 package/busybox/S02modules-load |  1 +
 package/busybox/busybox.mk      | 12 +++++
 package/dmraid/S20dmraid        |  3 --
 package/dmraid/dmraid.mk        | 12 +++++
 package/kmod/S02modules-load    | 85 +++++++++++++++++++++++++++++++++
 package/kmod/kmod.mk            |  5 ++
 package/owfs/S60owfs            |  2 -
 package/owfs/owfs.mk            | 11 +++++
 package/ti-sgx-km/ti-sgx-km.mk  | 10 ++++
 package/ti-sgx-um/S80ti-sgx     | 19 +-------
 11 files changed, 148 insertions(+), 23 deletions(-)
 create mode 120000 package/busybox/S02modules-load
 create mode 100644 package/kmod/S02modules-load

-- 
2.18.2
