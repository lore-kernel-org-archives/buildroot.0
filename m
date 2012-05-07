From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:10:21 +0200
Subject: [Buildroot] [PATCH v3 00/22] Automatically produce legal compliance
	info
Message-ID: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

here is the third version of the legal-info feature implementation.

For the records, previous versions are here:
v1: http://lists.busybox.net/pipermail/buildroot/2012-January/049590.html
v2: http://lists.busybox.net/pipermail/buildroot/2012-March/051132.html

The approach is based on two per-package constants in eack .mk file, such as:
  FOO_LICENSE = GPLv2+
  FOO_LICENSE_FILES = COPYING
  BAR_LICENSE = LGPLv2.1 + GPLv3
  BAR_LICENSE_FILES = COPYING.LGPL demo-app/COPYING.GPL3
  MYAPP_LICENSE = PROPRIETARY
This is the only effort required to the package creator. If <PKG>_LICENSE is
not specified it defaults to "unknown".

After running 'make legal-info', the following things will be produced in
$(O)/legal-info/:
  $ find legal-info/ -type f
  legal-info/README            # Lists saved stuff, warns about unsaved stuff
  legal-info/licenses.txt      # Text of all licenses
  legal-info/buildroot.config  # The buildroot config
  legal-info/licenses/buildroot/COPYING       # License files, one dir per pkg
  legal-info/licenses/busybox/LICENSE
  legal-info/licenses/...other packages...
  legal-info/manifest.csv                     # CSV table summarizing all info
  legal-info/sources/busybox-1.19.4.tar.bz2   # tarballs
  legal-info/sources/kmod-5.tar.xz
  legal-info/sources/libtool-2.2.10.tar.gz
  legal-info/sources/...other packages...

Given the technical difficulties, the toolchain and the BR sources are not
saved. Warnings are generated to make sure the user is aware of this.

One of the issues raised about the previous patchset was about packages
without a license file, such as jpeg or fbset. These usually declare their
license in a comment at the top of one or more source files.

Yann E. Morin suggested to solve this problem in a general way implementing a
_LICENSE_HOOK that does whatever is needed to copy the license.
I found the idea good and started implementing it, but I did not reach
anything decently structured yet. As I don't want to further delay the basic
work, I chose to postpone this feature to a later step.


License compliance advice to users
==================================

During the latest Buildroot Developer Day in February, a request was made to
give an advice from Buildroot developers' to Buildroot users about how to
comply with both Buildroot's and the packages' licenses.
This is added to the manual in patch 9. Of course this must match as much as
possible what the developers think, so please read it and give comments!


Possible future improvements
============================

These are left as future enhancemenst, after the merge of the first core
functionality, in order to keep it as simple as possible for a first step.

- The toolchain is not currently saved (internal, external, ct-NG, no
  discrimination). Actually, only GENTARGETS-based packages are handled, so the
  best approach might be to "simply" migrate the toolchains to GENTARGETS.

- Save the Buildroot sources too. If the sources are not a git clone this might
  be as simple as tar of the current directory and exclude dl and output, but
  this has never been tested. Also, make sure this works for out-of-tree BR
  builds.

- Add a hook for a post-legal-info script.

- Add a <PKG>_LICENSE_HOOK for packages without a license file.


Changelog
=========

Changed in v3:
- moved the $(1)-legal-info target near the end of GENTARGETS_INNER, out of the
  may of target sequencing where it used to be in the previous patch sets;
- improved readability by creating a set of functions to produce a warning,
  to add a line to the csv, etc as suggested by ThomasDS (this made the core
  code shorter and cleaner);
- clarified the BSD-like licenses, differentiating 2/3/4 clauses and others;
- clarified *GPL licenses, and dropped definitions for packages that do not
  have a clear and simple use of those licenses (tslib, busybox, qt);
- dropped warning patches for tinyhttpd, xfsprogs, microperl, fis, doom-wads,
  uemacs and cups which have now been converted to GEN/AUTOTARGETS;
- updated after the split of Makefile.package.in in pkg-*.mk and related
  cleanups;
- added a few lines of explanation in the message of the first big commit that
  implements all the logic;
- documented the legal-info stuff in the manual;
- added (tentative) advice about Buildroot license compliance;
- various improvements here and there.

Changed in v2:
- squashed together patches 1-4 from RFC v1; now all the legal-info mechanism
  is implmented in a unique patch.
- rebase on top of current master
- don't clean $(REDIST_SOURCES_DIR): it is a subdir of $(LEGAL_INFO_DIR), so
  doesn't need to be cleaned twice
- added legal-info-clean target
- made legal-info target .PHONY
- remove the output/legal-info dir before populating it
- when saving source tarballs, create hardlinks instead of copies if possible
- add infrastructure to warn the user about info that has not been saved: a
  .warnings file is filled with such info and displayed to the user at the
  end of the legal-info processing
- ensure manual (non-GENTARGETS-based) packages return error, at least; this
  required to explicitly create a -legal-info target for each of them, or
  they would have been silently skipped.
- list also Buildroot in the manifest file! :)
- save the Buildroot .config
- save license files listed in <PKG>_LICENSE_FILES, both in a separate
  directory for each package and all together in a unique file
- various cleanups.

Patches
=======

- The implementation is all in the first commit, which is commented on its
  own.
- A few patches follow to make non-GENTARGETS packages warn about their
  dumbness.
- A couple of patches add documentation about the legal-info stuff.
- Other commits define licenses for some packages.

The following changes since commit 057c729c2438107b426576121bcf83f792734a6f:

  external-toolchain: add support for Linaro 2012.04 (2012-05-07 17:08:37 +0200)

are available in the git repository at:
  git://github.com/lucaceresoli/buildroot.git legal-info

Luca Ceresoli (22):
  legal-info: infrastructure to collect legally-relevant material
  gettext: warn that legal-info is not implemented
  netkitbase: warn that legal-info is not implemented
  netkittelnet: warn that legal-info is not implemented
  newt: warn that legal-info is not implemented
  ttcp: warn that legal-info is not implemented
  vpnc: warn that legal-info is not implemented
  manual: document usage of the legal-info feature
  manual: add advice about GPL compliance for Buildroot
  linux: define license
  m4: define license
  mpc: define license
  fakeroot: define license
  bzip2: define license
  directfb: define license
  iostat: define license
  lzo: define license
  lzop: define license
  libusb: define license
  pcre: define license
  netsnmp: define license
  berkeleydb: define license

 Makefile                                   |   42 +++++++++-
 docs/manual/adding-packages-gentargets.txt |   18 ++++
 docs/manual/using.txt                      |  127 ++++++++++++++++++++++++++++
 linux/linux.mk                             |    2 +
 package/berkeleydb/berkeleydb.mk           |    2 +
 package/bzip2/bzip2.mk                     |    2 +
 package/directfb/directfb.mk               |    2 +
 package/fakeroot/fakeroot.mk               |    2 +
 package/gettext/gettext.mk                 |    3 +
 package/iostat/iostat.mk                   |    2 +
 package/libusb/libusb.mk                   |    2 +
 package/lzo/lzo.mk                         |    2 +
 package/lzop/lzop.mk                       |    2 +
 package/m4/m4.mk                           |    2 +
 package/mpc/mpc.mk                         |    2 +
 package/netkitbase/netkitbase.mk           |    3 +
 package/netkittelnet/netkittelnet.mk       |    3 +
 package/netsnmp/netsnmp.mk                 |    2 +
 package/newt/newt.mk                       |    3 +
 package/pcre/pcre.mk                       |    2 +
 package/pkg-gentargets.mk                  |   65 ++++++++++++++
 package/pkg-utils.mk                       |   25 ++++++
 package/ttcp/ttcp.mk                       |    3 +
 package/vpnc/vpnc.mk                       |    3 +
 support/legal-info/README.header           |   24 +++++
 support/legal-info/README.warnings-header  |    4 +
 26 files changed, 346 insertions(+), 3 deletions(-)
 create mode 100644 support/legal-info/README.header
 create mode 100644 support/legal-info/README.warnings-header

Luca

-- 
1.7.5.4
