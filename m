From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 22:59:39 +0100
Subject: [Buildroot] [PATCH 00/12] Ensure extractor dependencies are taken
 into account
Message-ID: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The starting point for this series is to fix the following build
failure:

  http://autobuild.buildroot.net/results/83c/83c6d47c06334bef27791a59bdd491b1de124c49/build-end.log

The problem is the following:

 - The _SOURCE for gettext-tiny is a .tar.gz

 - In addition to this _SOURCE tarball, we also extract the
   gettext-gnu source code, which is a .tar.xz

 - Extracting .tar.xz may require building host-xzcat, is xzcat is not
   available system-wide

 - The build fails because host-xzcat is not added in the dependencies
   of gettext-tiny. Indeed, while generic-package takes care of adding
   the extract dependencies needed for _SOURCE, it does not know about
   other extract dependencies.

This issue appears in
http://autobuild.buildroot.net/results/83c/83c6d47c06334bef27791a59bdd491b1de124c49/build-end.log
because BR2_PER_PACKAGE_DIRECTORIES=y and therefore any missing
dependency is immediately visible. But in theory, it could appear
without per-package support.

This series solves that by introducing an extractor-pkg-dependency
that returns the list of packages that must be added to
<pkg>_EXTRACT_DEPENDENCIES to extract the archive passed as
argument. It is then used in package/pkg-generic.mk to replace the
existing logic to calculate <pkg>_EXTRACT_DEPENDENCIES, and then in
the several places where suitable-extractor was used to manually
extract a tarball.

We also rename extractor-dependency to extractor-system-dependency to
clarify its difference from extractor-pkg-dependency, and we rework
the implementation of extractor-system-dependency.

Best regards,

Thomas Petazzoni

Thomas Petazzoni (12):
  package/pkg-utils.mk: rename extractor-dependency to
    extractor-system-dependency
  package/pkg-utils.mk: add extractor-pkg-dependency macro
  package/pkg-utils.mk: rework implementation of
    extractor-system-dependency
  package/pkg-generic.mk: use extractor-pkg-dependency macro
  arch/arch.mk.xtensa: fix usage of arch-xtensa-overlay-extract
  package/android-tools: add missing extract dependencies
  package/cargo: add missing extract dependencies
  package/gettext-tiny: add missing extract dependencies
  package/murata-cyw-fw: add missing extract dependencies
  package/nvidia-tegra23/nvidia-tegra32-binaries: add missing extract
    dependencies
  package/perl: add missing extract dependencies
  package/rust-bin: add missing extract dependencies

 arch/arch.mk.xtensa                           |  2 ++
 boot/uboot/uboot.mk                           |  1 +
 linux/linux.mk                                |  1 +
 package/android-tools/android-tools.mk        |  2 ++
 package/binutils/binutils.mk                  |  2 ++
 package/cargo/cargo.mk                        |  2 ++
 package/gcc/gcc-final/gcc-final.mk            |  1 +
 package/gcc/gcc-initial/gcc-initial.mk        |  1 +
 package/gdb/gdb.mk                            |  2 ++
 package/gettext-tiny/gettext-tiny.mk          |  1 +
 package/murata-cyw-fw/murata-cyw-fw.mk        |  3 +++
 .../nvidia-tegra23-binaries.mk                |  1 +
 package/perl/perl.mk                          |  1 +
 package/pkg-generic.mk                        | 12 ++--------
 package/pkg-utils.mk                          | 24 ++++++++++++++-----
 package/rust-bin/rust-bin.mk                  |  4 +++-
 support/dependencies/check-host-lzip.mk       |  1 -
 support/dependencies/check-host-xzcat.mk      |  1 -
 18 files changed, 43 insertions(+), 19 deletions(-)

-- 
2.23.0
