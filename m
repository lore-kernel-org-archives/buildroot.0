From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Jul 2014 19:49:27 +0200
Subject: [Buildroot] [PATCH 0 of 7] Introduction of kconfig-package
	infrastructure
Message-ID: <patchbomb.1406224167@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This patch series introduces a kconfig-package infrastructure and already
converts the uclibc and busybox packages.
The series is based on the to-be-applied uclibc patch series that improves the
behavior of the kconfig parts.

The final patch in this series is a bit an outlier: it is a preparation for the
conversion of the linux package to the kconfig-package infrastructure, and I
already included it to see if it's controversial or not.

I believe this series is complete in the sense that it could be applied as one
whole, not yet including the conversion of linux and barebox.
Two sets of changes are still needed:
- any changes based on your comments
- documentation and comments still missing in kconfig-package. I'm awaiting your
  feedback first. I can either add this as part of the series or use a followup
  patch to fix this.

I'm shooting for 2014.08 still, if you can provide feedback in time.

In a subsequent series, linux and barebox can be converted to kconfig-package
too, but there will need to be some changes to kconfig-package to support them.
One particular difference with uclibc/busybox is that linux/barebox use a
different method to copy the original config file: instead of simply copying it
to build_dir/.config, it is first copied to arch/.../buildroot_defconfig and
then 'make ... buildroot_defconfig' is called. I'm considering in adding a
FOO_KCONFIG_INSTALL_CONFIG_CMDS variable to support this, which defaults to the
simple copy used by busybox/uclibc, but can be overwritten appropriately by
linux and barebox.
Anyway, this part is not yet ready, and is likely not ready in time for 2014.08.

Thanks for your feedback,
Thomas

---
 fs/initramfs/initramfs.mk  |   2 +-
 linux/linux.mk             |  20 ++++++++++----------
 package/Makefile.in        |   1 +
 package/busybox/busybox.mk |  25 ++++++++++++-------------
 package/pkg-kconfig.mk     |  33 +++++++++++++++++++++++++++++++++
 package/uclibc/uclibc.mk   |  23 +++++++----------------
 6 files changed, 64 insertions(+), 40 deletions(-)
