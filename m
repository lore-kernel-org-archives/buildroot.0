From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Feb 2015 22:19:55 +0100
Subject: [Buildroot] [PATCHv3 0/5] Graph about installed size per package
Message-ID: <1423171200-24583-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is the third iteration of the patches adding a 'size-stats'
feature, which mainly allows to generate a pie chart of the size
contribution of each package to the overall root filesystem size.

Changes since v2:

 - Use print0 in find and -0 in xargs to support spaces in filenames,
   just in case. Suggested by J?r?me Pouiller.

 - Support custom skeleton locations, instead of assuming the skeleton
   comes from system/skeleton.

 - Fix the size-stats target to actually call the size-stats script,
   and not graph-size, which was the old name of the script in
   previous versions of the series.

 - Fix usage of the size-stats target in out of tree build
   situations. For consistency reasons, we chose to mimic what
   graph-depends already does, even if size-stats does not necessarily
   need to be executed from within CONFIG_DIR.

 - Add one patch to make sure that 'make clean' removes the graphs/
   subdirectory in the output directory, which wasn't done today. This
   issue isn't specific to size-stats, and already existed with
   graph-build and graph-depends.

Comments:

 - J?r?me Puiller suggested to add a warning for removed
   files. However, many files are removed in the target-finalize step
   (man pages, etc.) and we don't want to have gazillions of warnings
   about these completely normal file removals.

Thomas Petazzoni (5):
  Makefile: remove the graphs/ dir on 'make clean'
  pkg-generic: add step_pkg_size global instrumentation hook
  support/scripts: add size-stats script
  Makefile: implement a size-stats target
  Dummy testing packages

 Config.in                  |   9 ++
 Makefile                   |  19 +++-
 package/Config.in          |   2 +
 package/foo1/Config.in     |   2 +
 package/foo1/file.img      | Bin 0 -> 2097152 bytes
 package/foo1/foo1.mk       |   8 ++
 package/foo2/Config.in     |   2 +
 package/foo2/file.img      | Bin 0 -> 4194304 bytes
 package/foo2/foo2.mk       |   8 ++
 package/pkg-generic.mk     |  36 +++++++
 support/scripts/size-stats | 231 +++++++++++++++++++++++++++++++++++++++++++++
 11 files changed, 314 insertions(+), 3 deletions(-)
 create mode 100644 package/foo1/Config.in
 create mode 100644 package/foo1/file.img
 create mode 100644 package/foo1/foo1.mk
 create mode 100644 package/foo2/Config.in
 create mode 100644 package/foo2/file.img
 create mode 100644 package/foo2/foo2.mk
 create mode 100755 support/scripts/size-stats

-- 
2.1.0
