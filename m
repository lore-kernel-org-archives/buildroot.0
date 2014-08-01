From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 01 Aug 2014 21:53:42 +0200
Subject: [Buildroot] [PATCH 0 of 5 v3] Introduction of kconfig-package
Message-ID: <patchbomb.1406922822@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series introduces a kconfig-package infrastructure and already
converts the uclibc and busybox packages.

I believe this series is complete in the sense that it could be applied as
one whole, not yet including the conversion of linux and barebox.

In a subsequent series, linux and barebox can be converted to
kconfig-package too, but there will need to be some changes to
kconfig-package to support them.
One particular difference with uclibc/busybox is that linux/barebox use a
different method to copy the original config file: instead of simply copying
it to build_dir/.config, it is first copied to arch/.../buildroot_defconfig
and then 'make ... buildroot_defconfig' is called. I'm considering in adding
a FOO_KCONFIG_INSTALL_CONFIG_CMDS variable to support this, which defaults
to the simple copy used by busybox/uclibc, but can be overwritten
appropriately by linux and barebox.
Anyway, this part is not yet ready and will only be available for 2014.11.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Thomas De Schampheleire (5)
  uclibc: fixup config before calling menuconfig
  infra: introduce a kconfig-package infrastructure
  manual: add documentation for kconfig-package
  uclibc: convert to kconfig-package infrastructure
  busybox: convert to kconfig-package infrastructure

 docs/manual/adding-packages-kconfig.txt |  56 +++++++++++++++++
 docs/manual/adding-packages.txt         |   2 +
 package/Makefile.in                     |   1 +
 package/busybox/busybox.mk              |  25 ++----
 package/pkg-kconfig.mk                  |  82 +++++++++++++++++++++++++
 package/uclibc/uclibc.mk                |  35 +++-------
 6 files changed, 161 insertions(+), 40 deletions(-)
