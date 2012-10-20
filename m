From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 21 Oct 2012 01:45:21 +0200
Subject: [Buildroot] [PATCH 00/10] Various simplifications of the buildroot
	configuration
Message-ID: <1350776731-8467-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Second attempt at my "project directory" series - this time leaving out
the project directory.

First patch adds a section to the manual to explain how to store the
configuration.  It's basically Thomas's ELC-E presentation of last
year, but I've added a section for when it's out-of-tree.  I also added
a very brief explanation about how to add packages and patches
out-of-tree.

The second patch adds the fs-overlay as a config option.  Skeleton
is not deprecated this time round.

The next seven patches add the update-all-config target.  At
Thomas S.'s suggestion, it's split up more.  The first three
add missing -update-config targets and fix the busybox one;
the last three ones make sure that the buildroot default
config files are not overwritten by update-all-config.

The final patch adds the BR2_DEFCONFIG to .config, so
update-all-config can save directly to the right config file.

Regards,
Arnout

----------------------------------------------------------------
Arnout Vandecappelle (Essensium/Mind) (10):
      manual: add section about storing the configuration.
      target/generic: add filesystem overlay option
      ctng: add ctng-update-config target
      busybox: busybox-update-config should depend on busybox-configure
      at91bootstrap3: add -update-config target
      Add update-all-config target
      busybox: update-all-config shouldn't update default busybox config
      crosstool-ng: update-all-config shouldn't update default busybox config
      uClibc: update-all-config shouldn't update default uClibc config
      Make savedefconfig save to a configured file.

 Config.in                                        |   12 ++
 Makefile                                         |   32 +++-
 boot/at91bootstrap3/at91bootstrap3.mk            |    8 +
 docs/manual/adding-packages-directory.txt        |    1 +
 docs/manual/board-support.txt                    |   35 ----
 docs/manual/customize-rootfs.txt                 |   21 +-
 docs/manual/customize-store.txt                  |  223 ++++++++++++++++++++++
 docs/manual/customize.txt                        |    2 +
 linux/linux.mk                                   |    2 +
 package/busybox/Config.in                        |    7 +-
 package/busybox/busybox.mk                       |   13 +-
 target/generic/Config.in                         |   11 ++
 toolchain/toolchain-crosstool-ng/Config.in       |    6 +-
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   21 +-
 toolchain/uClibc/Config.in                       |    7 +-
 toolchain/uClibc/uclibc.mk                       |   25 +--
 16 files changed, 340 insertions(+), 86 deletions(-)
 delete mode 100644 docs/manual/board-support.txt
 create mode 100644 docs/manual/customize-store.txt
