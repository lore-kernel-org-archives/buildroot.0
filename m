From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 17 May 2018 22:13:13 -0500
Subject: [Buildroot] [PATCH v5 0/7] CPE ID Support
Message-ID: <1526613200-48452-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series begins adding CPE identifier support to Buildroot. The
intent is to establish and maintain a baseline of CPE IDs, one for each
package. Each of these IDs ties back to a NIST database entry for the
respective piece of software, which is linked to specific vunderabilities.

Within Buildroot, a CPE report can be generated (like legal-info) that
captures a target build's list of CPE IDs. This report can then be
checked for validity using the new support/scripts/cpe-report or another
third party tool. The script uses a new cpedb.py helper to search and
identify the validity of the CPE strings.

The pkgstats script has been extended to provide CPE ID checking of
matching/requires update/new as part of its html output.  It also uses
the new cpedb.py helper.

As part of testing this series, the following branch contains a series
of fixups required to make these specific packages match the database.
(I can submit these to the mailing list but there are ~70 of them)

https://github.com/rc-matthew-l-weber/buildroot/tree/cpe-info-github
Commit 14c3ee6 to 567732d

A follow-on patchset will be submitted adding support for pkgstat generation
of CPE updates in XML and Buildroot manual updates for guidance on submission
of those XML database updates to the NIST organization. (We'd like to get
feedback on this series first to save us effort on the update XML stuff)

Matt Weber (7):
  cpe-info: new make target
  cpe-info: id prefix/suffix
  cpe-info: only report target pkgs
  cpe-info: update manual for new pkg vars
  support/scripts/cpedb.py: new CPE XML helper
  support/scripts/pkg-stats: add CPE reporting
  support/scripts/cpe-report: new script

 Makefile                                |  17 ++++-
 docs/manual/adding-packages-generic.txt | 117 ++++++++++++++++++++------------
 package/Makefile.in                     |   4 ++
 package/pkg-generic.mk                  |  21 ++++++
 package/pkg-utils.mk                    |   8 +++
 support/scripts/cpe-report              |  53 +++++++++++++++
 support/scripts/cpedb.py                |  52 ++++++++++++++
 support/scripts/pkg-stats               |  80 ++++++++++++++++++++--
 8 files changed, 302 insertions(+), 50 deletions(-)
 create mode 100755 support/scripts/cpe-report
 create mode 100644 support/scripts/cpedb.py

-- 
1.9.1
