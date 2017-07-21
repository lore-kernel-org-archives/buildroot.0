From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:05:07 +0200
Subject: [Buildroot] [PATCH v7 00/23] Move toolchain configs and autobuild
	logic in-tree
Message-ID: <20170721010530.4747-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 This series adds the toolchain configs in-tree. In addition, the part
of the autobuild-run script that generates the random .config is also
moved in-tree, to utils/genrandconfig. With these two changes, we can
make sure that the autobuilders stay in sync with the Buildroot tree,
i.e. that only toolchains are tried that actually work with that
version of Buildroot, and that the exclusions are correct. This enables
us to run autobuilders on different branches, like the maintainance
branches.

 The series also includes a large number of refactoring and improvement
patches that are more or less optional.

 In this version, I chose to keep the toolchain-configs.csv file, to
keep things simpler. It is only really used to keep track of the host
architecture required by each toolchain. There are still various
options to specify the host architecture in a different way; we can
follow up later with one of these.
- Rename the toolchain configs to something that includes the required
  host arch.
- Rename the toolchain tarball itself to something that includes the
  host arch.
- Adding a dummy config option BR2_HOSTARCH=... to the toolchain config.

 In addition to this series, there is a series that updates the
autobuild-run script to use genrandconfig, which I will also post in
reply to this mail. Since the interface of genrandconfig gradually
changes with subsequent patches from this series, there are separate
patches for the autobuild-run script as well. Those patches should
be squashed to whatever version from this series makes it into master.

 Some further possible improvements:
- Remove the SystemInfo class from autobuild-run, instead using the
  one from genrandconfig. Not so trivial :-(
- Refactor test-pkg with genrandconfig so the logic for generating
  a random configuration is common.
- More refactorings are possible in genrandconfig, e.g. to simplify
  the way exclusions are handles.

This series can also be found on
https://gitlab.com/arnout/buildroot toolchain-defconfigs-2

Changes in v7:
- new patches for genrandconfig;
- use toolchain-configs.csv instead of listing the directory;
- add BR2_COMPILER_PARANOID_UNSAFE_PATH=y and
  BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y to minimal.config

Changes in v6:
- drops the already applied patches;
- puts the configs in support/config-fragments instead of configs
  (which implies changes in test-pkg and in the commit messages of
   the rest of the series);
- drops the patches for supporting subdirectories under configs/
- doesn't move the mkdir of the build directory up from build_one()
  to main().

 Regards,
 Arnout

---
Arnout Vandecappelle (23):
  utils/genrandconfig: new script
  genrandconfig: use subprocess.check_output instead of Popen
  genrandconfig: fix (some) pep8 warnings
  genrandconfig: replace kwargs with explicit arguments
  genrandconfig: move instantiation of SystemInfo down
  genrandconfig: verbose output and use stderr
  genrandconfig: calculate outputdir in __main__
  genrandconfig: calculate buildrootdir in __main__
  genrandconfig: pass outputdir and buildrootdir as arguments
  genrandconfig: calculate configfile only once
  genrandconfig: fix the case when outputdir is 'output'
  support/test-pkg: move minimal.config into a separate file
  minimal.config: add BR2_COMPILER_PARANOID_UNSAFE_PATH=y
  minimal.config: add BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
  genrandconfig: use minimal.config
  support: add autobuild toolchain config fragments
  test-pkg: get configs from in-tree toolchain-configs.csv
  support/test-pkg: add option to use an alternate toolchains CSV file
  genrandconfig: get configs from in-tree toolchain-configs.csv
  toolchain-configs.csv: remove unused libc column
  Makefile: refactor *config targets
  Makefile: add alldefconfig target
  test-pkg: use merge_config.sh to merge the fragments

 Makefile                                           |  45 +--
 .../autobuild/armv5-ctng-linux-gnueabi.config      |  10 +
 .../autobuild/armv7-ctng-linux-gnueabihf.config    |  13 +
 .../autobuild/br-aarch64-glibc.config              |   9 +
 .../autobuild/br-arc-full-internal.config          |   3 +
 .../autobuild/br-arcle-hs38.config                 |  11 +
 .../config-fragments/autobuild/br-arm-basic.config |   8 +
 .../autobuild/br-arm-cortex-a9-glibc.config        |  11 +
 .../autobuild/br-arm-cortex-a9-musl.config         |  11 +
 .../autobuild/br-arm-cortex-m4-full.config         |  12 +
 .../autobuild/br-arm-full-nothread.config          |  11 +
 .../autobuild/br-arm-full-static.config            |  11 +
 .../config-fragments/autobuild/br-arm-full.config  |  10 +
 .../autobuild/br-arm-internal-full.config          |   6 +
 .../config-fragments/autobuild/br-bfin-full.config |  12 +
 .../autobuild/br-i386-pentium-mmx-musl.config      |  10 +
 .../autobuild/br-i386-pentium4-full.config         |  10 +
 .../autobuild/br-m68k-5208-full.config             |  11 +
 .../autobuild/br-m68k-68040-full.config            |  10 +
 .../autobuild/br-microblazeel-full-internal.config |   1 +
 .../autobuild/br-microblazeel-full.config          |  10 +
 .../autobuild/br-mips32r6-el-hf-glibc.config       |  11 +
 .../autobuild/br-mips64-n64-full.config            |  10 +
 .../autobuild/br-mips64r6-el-hf-glibc.config       |  12 +
 .../autobuild/br-mipsel-o32-full.config            |  10 +
 .../autobuild/br-nios2-glibc.config                |   9 +
 .../autobuild/br-openrisc-uclibc.config            |  10 +
 .../autobuild/br-powerpc-603e-basic-cpp.config     |  10 +
 .../autobuild/br-powerpc-e500mc-full.config        |  11 +
 .../autobuild/br-powerpc-internal-full.config      |   5 +
 .../autobuild/br-powerpc64-power7-glibc.config     |   9 +
 .../autobuild/br-powerpc64le-power8-glibc.config   |   9 +
 .../config-fragments/autobuild/br-sh4-full.config  |  10 +
 .../autobuild/br-sparc-uclibc.config               |   9 +
 .../autobuild/br-sparc64-glibc.config              |   8 +
 .../autobuild/br-x86-64-core2-full.config          |  11 +
 .../autobuild/br-x86-64-musl.config                |  10 +
 .../autobuild/br-xtensa-full-internal.config       |   4 +
 .../autobuild/br-xtensa-full.config                |   9 +
 .../autobuild/i686-ctng-linux-gnu.config           |  10 +
 .../autobuild/linaro-aarch64.config                |   3 +
 .../config-fragments/autobuild/linaro-arm.config   |   5 +
 .../autobuild/mips64el-ctng_n32-linux-gnu.config   |   9 +
 .../autobuild/mips64el-ctng_n64-linux-gnu.config   |  11 +
 .../powerpc-ctng_e500v2-linux-gnuspe.config        |  11 +
 .../autobuild/sourcery-arm-armv4t.config           |   4 +
 .../autobuild/sourcery-arm-thumb2.config           |   7 +
 .../config-fragments/autobuild/sourcery-arm.config |   3 +
 .../autobuild/sourcery-mips.config                 |   4 +
 .../autobuild/sourcery-mips64.config               |   5 +
 .../autobuild/sourcery-nios2.config                |   3 +
 .../autobuild/sourcery-x86-64.config               |   4 +
 .../autobuild/toolchain-configs.csv                |  52 +++
 .../autobuild/x86_64-ctng_locales-linux-gnu.config |  11 +
 support/config-fragments/minimal.config            |   8 +
 utils/genrandconfig                                | 430 +++++++++++++++++++++
 utils/test-pkg                                     |  50 +--
 57 files changed, 970 insertions(+), 62 deletions(-)
 create mode 100644 support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config
 create mode 100644 support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config
 create mode 100644 support/config-fragments/autobuild/br-aarch64-glibc.config
 create mode 100644 support/config-fragments/autobuild/br-arc-full-internal.config
 create mode 100644 support/config-fragments/autobuild/br-arcle-hs38.config
 create mode 100644 support/config-fragments/autobuild/br-arm-basic.config
 create mode 100644 support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
 create mode 100644 support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
 create mode 100644 support/config-fragments/autobuild/br-arm-cortex-m4-full.config
 create mode 100644 support/config-fragments/autobuild/br-arm-full-nothread.config
 create mode 100644 support/config-fragments/autobuild/br-arm-full-static.config
 create mode 100644 support/config-fragments/autobuild/br-arm-full.config
 create mode 100644 support/config-fragments/autobuild/br-arm-internal-full.config
 create mode 100644 support/config-fragments/autobuild/br-bfin-full.config
 create mode 100644 support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
 create mode 100644 support/config-fragments/autobuild/br-i386-pentium4-full.config
 create mode 100644 support/config-fragments/autobuild/br-m68k-5208-full.config
 create mode 100644 support/config-fragments/autobuild/br-m68k-68040-full.config
 create mode 100644 support/config-fragments/autobuild/br-microblazeel-full-internal.config
 create mode 100644 support/config-fragments/autobuild/br-microblazeel-full.config
 create mode 100644 support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
 create mode 100644 support/config-fragments/autobuild/br-mips64-n64-full.config
 create mode 100644 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
 create mode 100644 support/config-fragments/autobuild/br-mipsel-o32-full.config
 create mode 100644 support/config-fragments/autobuild/br-nios2-glibc.config
 create mode 100644 support/config-fragments/autobuild/br-openrisc-uclibc.config
 create mode 100644 support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
 create mode 100644 support/config-fragments/autobuild/br-powerpc-e500mc-full.config
 create mode 100644 support/config-fragments/autobuild/br-powerpc-internal-full.config
 create mode 100644 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
 create mode 100644 support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
 create mode 100644 support/config-fragments/autobuild/br-sh4-full.config
 create mode 100644 support/config-fragments/autobuild/br-sparc-uclibc.config
 create mode 100644 support/config-fragments/autobuild/br-sparc64-glibc.config
 create mode 100644 support/config-fragments/autobuild/br-x86-64-core2-full.config
 create mode 100644 support/config-fragments/autobuild/br-x86-64-musl.config
 create mode 100644 support/config-fragments/autobuild/br-xtensa-full-internal.config
 create mode 100644 support/config-fragments/autobuild/br-xtensa-full.config
 create mode 100644 support/config-fragments/autobuild/i686-ctng-linux-gnu.config
 create mode 100644 support/config-fragments/autobuild/linaro-aarch64.config
 create mode 100644 support/config-fragments/autobuild/linaro-arm.config
 create mode 100644 support/config-fragments/autobuild/mips64el-ctng_n32-linux-gnu.config
 create mode 100644 support/config-fragments/autobuild/mips64el-ctng_n64-linux-gnu.config
 create mode 100644 support/config-fragments/autobuild/powerpc-ctng_e500v2-linux-gnuspe.config
 create mode 100644 support/config-fragments/autobuild/sourcery-arm-armv4t.config
 create mode 100644 support/config-fragments/autobuild/sourcery-arm-thumb2.config
 create mode 100644 support/config-fragments/autobuild/sourcery-arm.config
 create mode 100644 support/config-fragments/autobuild/sourcery-mips.config
 create mode 100644 support/config-fragments/autobuild/sourcery-mips64.config
 create mode 100644 support/config-fragments/autobuild/sourcery-nios2.config
 create mode 100644 support/config-fragments/autobuild/sourcery-x86-64.config
 create mode 100644 support/config-fragments/autobuild/toolchain-configs.csv
 create mode 100644 support/config-fragments/autobuild/x86_64-ctng_locales-linux-gnu.config
 create mode 100644 support/config-fragments/minimal.config
 create mode 100755 utils/genrandconfig

-- 
2.13.2
