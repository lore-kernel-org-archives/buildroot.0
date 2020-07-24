From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 24 Jul 2020 16:25:48 -0700
Subject: [Buildroot] [PATCH v2 00/13] package/udisks: bump version to 2.9.0
Message-ID: <20200724232601.2441272-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Hello again!

Round 2 of this patch series is now out, and with it brings some changes.

First off, I stripped out all of the dependencies from libblocksize and
libbytesize, and rebuilt the packages from the ground up, ensuring that only
the bare minimum dependencies are selected.

I found that the problem building udisks on older distributions was NOT due to
a polkit being too old or not being present, but instead, it is due to
host-gettext-gnu's msgfmt utility attempting to use the host
/usr/share/gettext directory, which may or may not exist.

To fix udisks failing to build on older distributions when NLS support is
enabled, the first patch adds a small msgfmt wrapper which exports
GETTEXTDATADIR to "${TARGET_DIR}/usr/share/gettext/"
before calling msgfmt.real. This wrapper is installed with a post-install hook.

This problem does not happen with gettext-tiny as it has its own msgfmt,
which works correctly.

I broke up the plugin selection quite a bit more and added a patch per plugin
for the libblockdev package, which should be even MORE pleasing to Thomas!

I have not included introspection patches, I will wait until this patch
series is implemented.

Thanks again for the feedback and help!

Adam

Adam Duskett (13):
  package/gettext-gnu: add msgfmt wrapper
  package/libblockdev: new package
  package/libbytesize: new package
  package/libblockdev: add crypto plugin support
  package/libblockdev: add support for fs plugin
  package/libblockdev: add support for loop plugin
  package/libblockdev: add support for lvm plugin
  package/libblockdev: add support for mdraid plugin
  package/libblockdev: add support for parted plugin
  package/libblockdev: add support for swap plugin
  package/udisks/Config.in: alphabatize package selection
  package/udisks/udisks.mk: alphabatize dependencies
  package/udisks: bump version to 2.9.0

 DEVELOPERS                                    |  2 +
 package/Config.in                             |  1 +
 package/gettext-gnu/gettext-gnu.mk            | 13 +++
 package/gettext-gnu/msgfmt                    |  3 +
 package/libblockdev/Config.in                 | 69 ++++++++++++++++
 package/libblockdev/libblockdev.hash          |  3 +
 package/libblockdev/libblockdev.mk            | 79 ++++++++++++++++++
 .../0001-remove-msgcat-dependency.patch       | 36 +++++++++
 package/libbytesize/Config.in                 | 10 +++
 package/libbytesize/libbytesize.hash          |  3 +
 package/libbytesize/libbytesize.mk            | 27 +++++++
 ...-fix-build-with-newer-glibc-versions.patch | 29 -------
 .../0002-Fix-systemd-service-file.patch       | 33 --------
 ...issue-with-missing-sys-sysmacros.h-i.patch | 81 -------------------
 package/udisks/Config.in                      | 20 ++++-
 package/udisks/udisks.hash                    |  4 +-
 package/udisks/udisks.mk                      | 36 ++++++---
 17 files changed, 289 insertions(+), 160 deletions(-)
 create mode 100644 package/gettext-gnu/msgfmt
 create mode 100644 package/libblockdev/Config.in
 create mode 100644 package/libblockdev/libblockdev.hash
 create mode 100644 package/libblockdev/libblockdev.mk
 create mode 100644 package/libbytesize/0001-remove-msgcat-dependency.patch
 create mode 100644 package/libbytesize/Config.in
 create mode 100644 package/libbytesize/libbytesize.hash
 create mode 100644 package/libbytesize/libbytesize.mk
 delete mode 100644 package/udisks/0001-fix-build-with-newer-glibc-versions.patch
 delete mode 100644 package/udisks/0002-Fix-systemd-service-file.patch
 delete mode 100644 package/udisks/0003-Fix-compilation-issue-with-missing-sys-sysmacros.h-i.patch

-- 
2.26.2
