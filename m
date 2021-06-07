From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  7 Jun 2021 22:42:15 +0200
Subject: [Buildroot] [PATCH v5 0/5] Introduce bmap-tools as target + host
 package
Message-ID: <20210607204221.124908-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Back in 2019, Nicolas Carrier started a patch series on bmap-tools,
which was kind of abandonned after 4 iterations. I'm now trying to
pick it up and revive it.

Compared to the v4 from Nicolas:

 - Checked the list of optional runtime dependencies that bmap-tools
   can use, as suggested by Romain Naour, and added some explanations
   in the Config.in help text about them. There is not much more we
   can do about them in Buildroot: they are not optional build time
   dependencies, but only runtime dependencies, and only needed when
   certain features are needed (so there is no reason to make them
   mandatory dependencies).

 - Added the missing pyexpat runtime dependency.

 - Drop incorrect build-time dependencies, which are only runtime ones
   (target python-setuptools)

 - Update to the latest version of bmap-tools

 - Misc improvements to the test cases, migration to a newer toolchain
   that doesn't exhibit an fallocate() bug. Moving to a newer
   toolchain requires updating the pre-built kernel image used for the
   runtime test infrastructure.

 - Added a host variant for the bmap-tools package, as this tool can
   also be very useful on the host to optimize the time needed to
   write an image. This host bmap-tools package comes with a test case
   as well.

Thanks!

Thomas Petazzoni

Nicolas Carrier (2):
  package/bmap-tools: new package
  support/testing/tests/package/test_bmap_tools: new test

Thomas Petazzoni (3):
  package/bmap-tools: enable host package
  support/testing/infra/emulator.py: update pre-built kernels
  support/testing/tests/package/test_bmap_tools: add test for host
    bmap-tools

 DEVELOPERS                                    |  6 ++
 package/Config.in                             |  1 +
 package/Config.in.host                        |  1 +
 package/bmap-tools/Config.in                  | 44 ++++++++++
 package/bmap-tools/Config.in.host             | 12 +++
 package/bmap-tools/bmap-tools.hash            |  3 +
 package/bmap-tools/bmap-tools.mk              | 14 +++
 support/testing/infra/emulator.py             |  8 +-
 .../tests/package/sample_bmap_tools.sh        | 15 ++++
 .../testing/tests/package/test_bmap_tools.py  | 88 +++++++++++++++++++
 10 files changed, 188 insertions(+), 4 deletions(-)
 create mode 100644 package/bmap-tools/Config.in
 create mode 100644 package/bmap-tools/Config.in.host
 create mode 100644 package/bmap-tools/bmap-tools.hash
 create mode 100644 package/bmap-tools/bmap-tools.mk
 create mode 100755 support/testing/tests/package/sample_bmap_tools.sh
 create mode 100644 support/testing/tests/package/test_bmap_tools.py

-- 
2.31.1
