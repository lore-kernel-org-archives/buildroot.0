From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Jan 2012 16:11:33 +0100
Subject: [Buildroot] [RFC 00/15] Automatically produce legal compliance info
Message-ID: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

during the latest Buildroot Developers Day in November 2011 and in this
mailing list there has been some discussion about introducing in Buildroot the
possibility to derive automatically legally relevant material, such as
licensing info and source tarballs for open source packages.

This is a first tentative implementation of these features.

This code is not yet fully working, but I wanted to share it with you to
receive some early comments. I also wanted to allow those who will participate
to the next Buildroot Developer Day next Friday to have an idea of this
proposal in advance, in case this were object of discussion during the
meeting.

My approach is based on the creation of a per-package _LICENSE constant in
eack .mk file, such as:
  FOOBAR_LICENSE = GPL_V3
  MYAPP_LICENSE = PROPRIETARY
This is the only effort required to the package creator. Where it is not
specified it defaults to "unknown".

My overall goal is to add a new 'make legal-info' target that:
 - produces a manifest file listing all packages, including closed-source ones
   (and, why not, prints out to stdout the same info);
 - copies source code tarballs for all non-proprietary packages (although I'm
   saving also tarballs for BSD-licensed packages for now);
 - save the complete text of all license files that must be included in the
   product documentation (typically COPYING and LICENSE files); this is to
   simplify the work of who must provide these info to documentation writers.

This patchset implements the first two points, albeit with some issues that I
discuss below.
About the third point I devised a few different possible implementations, but
each of them has relevant drawbacks, so I left this point out for the moment.

Here's what is currently implmented:

  $ make legal-info
  busybox  1.19.3       GPL_V2_ONLY
  bzip2    1.0.5        BSD
  directfb 1.4.15       LGPL_V2.1
  foobar   1.2.3.4      PROPRIETARY
  freetype 2.4.8        unknown
  iostat   2.2          GPL_V2
  ...
  $ cat output/legal-info/manifest.csv 
  package,version,license
  busybox,1.19.3,GPL_V2_ONLY
  bzip2,1.0.5,BSD
  directfb,1.4.15,LGPL_V2.1
  foobar,1.2.3.4,PROPRIETARY
  freetype,2.4.8,unknown
  iostat,2.2,GPL_V2
  ...
  $ ls output/legal-info/sources/
  autoconf-2.65.tar.bz2
  automake-1.11.1.tar.bz2
  binutils-2.21.1.tar.bz2
  busybox-1.19.3.tar.bz2
  bzip2-1.0.5.tar.gz
  DirectFB-1.4.15.tar.gz
  fakeroot_1.9.5.tar.gz
  freetype-2.4.8.tar.bz2
  ...

The implementation is somewhat similar to 'make external-deps'.
A $(PKG)-legal-info target is created for each package which echoes the
$(PKG)_LICENSE value and other info both to stdout and to the manifest file.
It also copies source tarball in $(BASE_DIR)/legal-info/sources unless
$(PKG)_LICENSE equals "PROPRIETARY".

A top-level 'legal-info' target collects all of these per-package targets.

The implementation takes only ~35 lines of code so it should be simple to
review.

Now the long list of open issues.

The semantics of the _LICENSE variable is still non well defined.
It might be a generic string (e.g. FOOBAR_LICENSE = modified 3-clause BSD),
or one from a well-defined list of known licenses.
The former interpretation is probably the more useful for producing a manifest
file. The latter might be useful to help an automated implementation of the
last goal listed above: save the complete text of all license files to a
directory.

This patchset has been tested only in a few configurations. The only one that
has been really tested with reasonable depth is presented in the last patch
of this series.
This might in turn grow this list of open issues as soon as different configs
are tested...

Some packages do not appear in the 'make legal-info' output. It looks
like they are all and only the Buildroot's internal toolchain files (gcc,
mpfr, mpc etc). I couldn't find where the cause is yet, but I'm sure a more
expert eye can enlighten me.

Copying the source tarball does not currently work for packages with
_SITE_METHOD equal to local, as there is no tarball associated to it.
Other methods, such as file and all versioning systems, are not tested, but
they should work as there's a tarball in the download dir.

Non-gentargets and non-autotargets packages are not tested. I guess they need
a $(PKG)-legal-info target to be defined manually.

It might be useful to remove the output/legal-info dir before populating it,
to be sure there are no remnants of previous runs. It would not have a big
additional cost, since the computations and copies must be done anyway.

Finally, there is no documentation yet. I will write some if the presented
approach is considered good.

The patches are logically divided in these parts:
 - patches 1 to 4 introduce the mechanism to extract all the legal info;
   this is the interesting part;
 - patches 5 to 13 define the _LICENSE constant for some packages;
 - patches 14 and 15 only add some testing stuff; they are not meant to be
   merged.

Luca

Luca Ceresoli (15):
  legal-info: new target to echo basic per-package legal info
  legal-info: produce a manifest file with licensing info
  legal-info: save source tarballs for all packages
  legal-info: do not copy sources for proprietary packages
  mpc: define license
  linux: define license
  m4: define license
  busybox: define license
  bzip2: define license
  directfb: define license
  iostat: define license
  lzop: define license
  tslib: define license
  foobar: create a fake proprietary package (testing only)
  Create a test config (testing only)

 Makefile                          |   26 ++++++++++++++++++++++----
 configs/legal_info_test_defconfig |   13 +++++++++++++
 linux/linux.mk                    |    1 +
 package/Config.in                 |    1 +
 package/Makefile.package.in       |   11 +++++++++++
 package/busybox/busybox.mk        |    1 +
 package/bzip2/bzip2.mk            |    1 +
 package/directfb/directfb.mk      |    1 +
 package/foobar/Config.in          |    5 +++++
 package/foobar/foobar.mk          |   13 +++++++++++++
 package/foobar/source/foobar.c    |    7 +++++++
 package/iostat/iostat.mk          |    1 +
 package/lzop/lzop.mk              |    1 +
 package/m4/m4.mk                  |    1 +
 package/mpc/mpc.mk                |    1 +
 package/tslib/tslib.mk            |    1 +
 16 files changed, 81 insertions(+), 4 deletions(-)
 create mode 100644 configs/legal_info_test_defconfig
 create mode 100644 package/foobar/Config.in
 create mode 100644 package/foobar/foobar.mk
 create mode 100644 package/foobar/source/foobar.c

-- 
1.7.5.4
