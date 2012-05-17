From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 19:32:59 +0200
Subject: [Buildroot] [PATCH v4 00/22] Automatically produce legal compliance
	info
Message-ID: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

here is the third version of the legal-info feature implementation.

Links to discussion of previous versions:
v1: http://lists.busybox.net/pipermail/buildroot/2012-January/049590.html
v2: http://lists.busybox.net/pipermail/buildroot/2012-March/051132.html
v3: http://lists.busybox.net/pipermail/buildroot/2012-May/053574.html

This version is only a minor update to fix various issues reported by other
developers. There are not changes to the general structure, so please see
the link above for v3 for a detailed presentation.

Let me repeat only my plea to all Buildroot developers to read and give
feedback on patch 9.
It gives an advice from Buildroot developers to Buildroot users about how to
comply with both Buildroot's and the packages' licenses.
Of course this must match as much as possible what the developers think, so
please read it and give either your different views or your ack (preferably
with a formal Acked-by tag).

Thanks.

Changelog
=========

The implementation is all in the first commit, which is commented on its own.
A few patches follow to make non-GENTARGETS packages warn about their dumbness.
A couple of patches add documentation about the legal-info stuff.
Other commits define licenses for some packages.

Changed in v4:
- rebased on the current next branch;
- legal-info must depend on dirs (or downloads may fail);
- manual: clarify that legal-info needs a config;
- manual: document PROPRIETARY packages;
- uppercase header in manifest.csv;
- removed useless qstrip;
- don't filter-out host-makedevs from TARGETS_LEGAL_INFO (which is a bad,
  incomplete and hard to maintain); instead exclude packages with empty
  _SOURCE (assumed to be part of Buildroot) from being processed in
  GENTARGETS; this fixes the previously incorrect behaviour for mcookie;
- added message "Collecting legal info";
- s/cannot produce any legal info/legal-info not yet implemented/ for manual
  packages to be more correct;
- other very minor changes.

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
- added advice about Buildroot license compliance;
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

The following changes since commit 56901908c63ed7b2aedffaa4b2143ce87a15d837:

  wpa_supplicant: explicitly disable libnl by default (2012-05-16 15:26:48 +0200)

are available in the git repository at:

  git at github.com:lucaceresoli/buildroot.git tags/legal-info-v4

for you to fetch changes up to c9343867ce99c8f0cf6cfc40657db295eb7c9552:

  berkeleydb: define license (2012-05-17 19:02:19 +0200)

Luca

----------------------------------------------------------------
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

 Makefile                                   |   42 ++++++++-
 docs/manual/adding-packages-gentargets.txt |   21 +++++
 docs/manual/using.txt                      |  130 ++++++++++++++++++++++++++++
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
 package/pkg-gentargets.mk                  |   61 +++++++++++++
 package/pkg-utils.mk                       |   25 ++++++
 package/ttcp/ttcp.mk                       |    3 +
 package/vpnc/vpnc.mk                       |    3 +
 support/legal-info/README.header           |   24 +++++
 support/legal-info/README.warnings-header  |    4 +
 26 files changed, 348 insertions(+), 3 deletions(-)
 create mode 100644 support/legal-info/README.header
 create mode 100644 support/legal-info/README.warnings-header

-- 
1.7.9.5
