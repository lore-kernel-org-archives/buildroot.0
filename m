From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 22 Jul 2020 18:07:58 -0700
Subject: [Buildroot] [PATCH 00/12] package/udisks: bump version to 2.9.0
Message-ID: <20200723010810.3237608-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Hello!

I was bored and needed a small challenge. I remembered that I was finally
finishing up the GOI series around the same time that Giulio was helping me by
testing against a newer version of udisks.

As Giulio is currently not working on software development, I asked him via
Facebook messenger if he was OK with me taking over this patch series. He was
more than happy to give me this gigantic mess!

We thought that newer versions of udisks required GOI, but it
turns out this is not true! Hooray!

Still, this is a pretty hefty patch series, weighing in at 10 in total for the
basics, plus two additional patches at the end to enable GOI support.

Here is a quick summary of my trials and tribulations for anybody who has
made it this far into my ramblings:

Three new packages are necessary:
  - libbytesize
  - libblockdev
  - volume-key

libbytesize is pretty straight forward and doesn't require any significant
system dependencies?just a few small target packages.

libblockdev is an extensive helper library with a ton of plugins. I did test
all of the plugins that it * could * do, but for this patch series, I have
only included the bare minimum needed to get the udisks package version up to
modern standards.

Volume-key: This is a nasty requirement and includes a bunch of encryption
handling. libblockdev doesn't require this package, but udisks does. Because
of the numerous dependencies that volume-key requires, I decided to skip the
traditional "enable this package feature if a user happens to select the
dependent package" in favor of a simple menu config option.

After successfully compiling in Fedora 32, I loaded up CentOS7 with confidence.
Of course, my confidence was my undoing, and udisks immediately choked on
trying to build due to CentOS7 having an ancient pre-spidermonkey polkit.
After a few hours of fiddling around, I finally figured out what the issue
was, added host variants of spidermonkey and polkit, and then added
host-polkit as a dependency to udisks and everything compiled cleanly.

I have tested this patch series with a test-pkg -a in CentOS7, and I recieved
no errors (Other than me running out of hard drive space and having to restart
the test series!)

The size difference between the old and new versions of udisks, even with the
additional dependencies is:

Old: 56M
New: 69M

That's not too bad considering the 6 years of updates that udisks has gone
through!

I am sure there will be some additional changes requested, as this is a hefty
patch series, but * hopefully, * it is broken down enough that Thomas won't
complain too much! :)

Thanks for reading!
Adam

PS.
I added GOI support to libblockdev and udisks because I can. :)

Adam Duskett (12):
  package/gcr: fix gpg path
  package/libbytesize: add new package
  package/volume-key: new package
  package/libblockdev: new package
  package/libblockdev: add cryptography support
  package/libblockdev: add fs plugin support
  package/spidermonkey: add host variant
  package/polkit: add host variant
  package/udisks/Config.in: alphabatize the package selection
  package/udisks: bump version to 2.9.0
  package/libblockdev: add gobject-introspection support
  package/udisks: add gobject-introspection support

 DEVELOPERS                                    |  3 +
 package/Config.in                             |  3 +
 package/gcr/gcr.mk                            |  2 +-
 package/libblockdev/Config.in                 | 46 +++++++++++
 package/libblockdev/libblockdev.hash          |  3 +
 package/libblockdev/libblockdev.mk            | 62 ++++++++++++++
 package/libbytesize/Config.in                 | 10 +++
 package/libbytesize/libbytesize.hash          |  3 +
 package/libbytesize/libbytesize.mk            | 21 +++++
 package/polkit/polkit.mk                      | 13 +++
 package/spidermonkey/spidermonkey.mk          | 15 ++++
 ...-fix-build-with-newer-glibc-versions.patch | 29 -------
 .../0002-Fix-systemd-service-file.patch       | 33 --------
 ...issue-with-missing-sys-sysmacros.h-i.patch | 81 -------------------
 package/udisks/Config.in                      | 29 ++++---
 package/udisks/udisks.hash                    |  4 +-
 package/udisks/udisks.mk                      | 30 +++++--
 ...ove-po-Makefile.in-entry-from-AC_CON.patch | 28 +++++++
 package/volume-key/Config.in                  | 38 +++++++++
 package/volume-key/volume-key.hash            |  3 +
 package/volume-key/volume-key.mk              | 31 +++++++
 21 files changed, 324 insertions(+), 163 deletions(-)
 create mode 100644 package/libblockdev/Config.in
 create mode 100644 package/libblockdev/libblockdev.hash
 create mode 100644 package/libblockdev/libblockdev.mk
 create mode 100644 package/libbytesize/Config.in
 create mode 100644 package/libbytesize/libbytesize.hash
 create mode 100644 package/libbytesize/libbytesize.mk
 delete mode 100644 package/udisks/0001-fix-build-with-newer-glibc-versions.patch
 delete mode 100644 package/udisks/0002-Fix-systemd-service-file.patch
 delete mode 100644 package/udisks/0003-Fix-compilation-issue-with-missing-sys-sysmacros.h-i.patch
 create mode 100644 package/volume-key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch
 create mode 100644 package/volume-key/Config.in
 create mode 100644 package/volume-key/volume-key.hash
 create mode 100644 package/volume-key/volume-key.mk

-- 
2.26.2
