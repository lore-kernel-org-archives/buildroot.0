From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  7 Jan 2021 14:39:37 +0100
Subject: [Buildroot] [PATCH 00/10] CPE validation
Message-ID: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

We have recently merged support to allow packages to express their CPE
identifier, which is a unique identifier used by the NIST database to
identify software products, and associate CVEs to them.

This patch series extends that by ensuring that CPEs affected to
packages in Buildroot do exist in the official CPE dictionary from
NIST, and if they do not exist, assist in generating the XML snippet
that the CPE dictionary maintainers expect.

In more details:

 - PATCHes 1 to 5 are just fixes/improvements to pkg-stats.

 - PATCH 6 introduces support/scripts/cpedb.py, which is a new set of
   helper that is capable of downloading the CPE dictionary, parsing
   it, and generating XML snippets to submit new CPE entries.

 - PATCH 7 modifies support/scripts/pkg-stats to leverage the features
   of cpedb.py to include validation of CPE identifiers of Buildroot
   patches.

 - PATCH 8 adds support/scripts/gen-missing-cpe, which allows to
   generate the XML snippets expected by the CPE dictionary mainainers

 - PATCH 9 hooks up support/scripts/gen-missing-cpe as the "make
   missing-cpe" top-level make target

 - PATCH 10 extends the documentation with more details about
   Buildroot features related to vulnerability management.

This is based on work from Matt Weber, which has been further
refactored/rewritten by Gr?gory Clement and myself.

To test this:

 $ make pkg-stats
 $ firefox output/pkg-stats.html
 $ make missing-cpe
 $ ls output/cpe-updates/

This work is also available at:

  https://github.com/tpetazzoni/buildroot/commits/cpe-validation

Thomas

Matt Weber (2):
  support/scripts/cpedb.py: new CPE XML helper
  support/scripts/gen-missing-cpe: add new script

Thomas Petazzoni (8):
  support/scripts/pkg-stats: improvements in is_status_*() methods
  support/scripts/pkg-stats: fix the status reporting of CVEs
  support/scripts/pkg-stats: drop unused cpeid_name() function
  support/scripts/pkg-stats: drop unused --cpeid option
  support/scripts/pkg-stats: fix flake8 warnings
  support/scripts/pkg-stats: check CPE existence in CPE dictionnary
  Makefile: add new missing-cpe target
  docs/manual: add details about vulnerability management

 Makefile                        |   8 ++
 docs/manual/common-usage.txt    |  42 +++++++
 support/scripts/cpedb.py        | 193 ++++++++++++++++++++++++++++++++
 support/scripts/gen-missing-cpe |  65 +++++++++++
 support/scripts/pkg-stats       |  60 ++++++----
 5 files changed, 344 insertions(+), 24 deletions(-)
 create mode 100644 support/scripts/cpedb.py
 create mode 100755 support/scripts/gen-missing-cpe

-- 
2.29.2
