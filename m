From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 7 Apr 2017 13:16:15 +0200
Subject: [Buildroot] [PATCH v6 0/9] support/test-pkg: fixes and enhancements
	+ add autobuild configs
Message-ID: <20170407111624.4629-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 This series combines the test-pkg rework from Yann [1] with my adding the
autobuild toolchain defconfigs in-tree [2]. The two series are combined 
because I added a patch that makes test-pkg use the in-tree autobuild
configs instead of fetching them from [3], so the two series conflict
with each other.

 Since the configs are now in-tree, there is no toolchain URL anymore,
so adding the option to specify an alternate URL [4] doesn't make much
sense. It is replaced with an option to specify an alternate toolchain
directory.

 Finally, I added some further enhancement (refactoring) patches:
- moving the minimal config fragment into a separate file;
- using merge_config.sh (which requires two preparatory patches).
These can be applied more or less independently ("less" because they
conflict with the earlier patches in the series).

 This v6:
- drops the already applied patches;
- puts the configs in support/config-fragments instead of configs
  (which implies changes in test-pkg and in the commit messages of
   the rest of the series);
- drops the patches for supporting subdirectories under configs/
- doesn't move the mkdir of the build directory up from build_one()
  to main().

 Regards,
 Arnout


[1] http://patchwork.ozlabs.org/patch/728392/
[2] http://patchwork.ozlabs.org/patch/743573/
[3] http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv
[4] http://patchwork.ozlabs.org/patch/728393/

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

----------------------------------------------------------------
The following changes since commit 80e2a5465880965b93d3647ca96f4af5f55252c4:

  gst1-plugins-base: remove legacy freetype handling (2017-04-06 22:43:40 +0200)

are available in the git repository at:

  http://gitlab.com/arnout/buildroot toolchain-defconfigs

for you to fetch changes up to efbc1cf69c2571e06a2b638290097f980084df96:

  support/test-pkg: use merge_config.sh to merge the fragments (2017-04-07 13:06:06 +0200)

----------------------------------------------------------------
Arnout Vandecappelle (8):
      support/test-pkg: calculate toolchain name only once
      support: add autobuild toolchain config fragments
      support/test-pkg: move minimal.config into a separate file
      support/test-pkg: get configs from in-tree configs
      support/test-pkg: add option to use an alternate toolchain directory
      Makefile: refactor *config targets
      Makefile: add alldefconfig target
      support/test-pkg: use merge_config.sh to merge the fragments

Yann E. MORIN (1):
      support/test-pkg: run legal-info

 Makefile                                           | 45 ++---------
 docs/manual/adding-packages-tips.txt               |  5 +-
 .../autobuild/armv5-ctng-linux-gnueabi.config      | 10 +++
 .../autobuild/armv7-ctng-linux-gnueabihf.config    | 13 ++++
 .../autobuild/br-aarch64-glibc.config              |  9 +++
 .../autobuild/br-arc-full-internal.config          |  3 +
 .../autobuild/br-arcle-hs38.config                 | 10 +++
 .../config-fragments/autobuild/br-arm-basic.config |  8 ++
 .../autobuild/br-arm-cortex-a9-glibc.config        | 11 +++
 .../autobuild/br-arm-cortex-a9-musl.config         | 11 +++
 .../autobuild/br-arm-cortex-m4-full.config         | 12 +++
 .../autobuild/br-arm-full-nothread.config          | 11 +++
 .../autobuild/br-arm-full-static.config            | 11 +++
 .../config-fragments/autobuild/br-arm-full.config  | 10 +++
 .../autobuild/br-arm-internal-full.config          |  6 ++
 .../config-fragments/autobuild/br-bfin-full.config | 12 +++
 .../autobuild/br-i386-pentium-mmx-musl.config      | 10 +++
 .../autobuild/br-i386-pentium4-full.config         | 10 +++
 .../autobuild/br-m68k-5208-full.config             | 11 +++
 .../autobuild/br-m68k-68040-full.config            | 10 +++
 .../autobuild/br-microblazeel-full-internal.config |  1 +
 .../autobuild/br-microblazeel-full.config          | 10 +++
 .../autobuild/br-mips32r6-el-hf-glibc.config       | 11 +++
 .../autobuild/br-mips64-n64-full.config            | 10 +++
 .../autobuild/br-mips64r6-el-hf-glibc.config       | 12 +++
 .../autobuild/br-mipsel-o32-full.config            | 10 +++
 .../autobuild/br-nios2-glibc.config                |  9 +++
 .../autobuild/br-openrisc-uclibc.config            | 10 +++
 .../autobuild/br-powerpc-603e-basic-cpp.config     | 10 +++
 .../autobuild/br-powerpc-e500mc-full.config        | 11 +++
 .../autobuild/br-powerpc-internal-full.config      |  5 ++
 .../autobuild/br-powerpc64-power7-glibc.config     |  9 +++
 .../autobuild/br-powerpc64le-power8-glibc.config   |  9 +++
 .../config-fragments/autobuild/br-sh4-full.config  | 10 +++
 .../autobuild/br-sparc-uclibc.config               |  9 +++
 .../autobuild/br-sparc64-glibc.config              |  8 ++
 .../autobuild/br-x86-64-core2-full.config          | 11 +++
 .../autobuild/br-x86-64-musl.config                | 10 +++
 .../autobuild/br-xtensa-full-internal.config       |  4 +
 .../autobuild/br-xtensa-full.config                |  9 +++
 .../autobuild/i686-ctng-linux-gnu.config           | 10 +++
 .../autobuild/linaro-aarch64.config                |  2 +
 .../config-fragments/autobuild/linaro-arm.config   |  4 +
 .../autobuild/mips64el-ctng_n32-linux-gnu.config   |  9 +++
 .../autobuild/mips64el-ctng_n64-linux-gnu.config   | 11 +++
 .../powerpc-ctng_e500v2-linux-gnuspe.config        | 11 +++
 .../autobuild/sourcery-arm-armv4t.config           |  4 +
 .../autobuild/sourcery-arm-thumb2.config           |  6 ++
 .../config-fragments/autobuild/sourcery-arm.config |  3 +
 .../autobuild/sourcery-mips.config                 |  4 +
 .../autobuild/sourcery-mips64.config               |  5 ++
 .../autobuild/sourcery-nios2.config                |  2 +
 .../config-fragments/autobuild/sourcery-sh.config  |  4 +
 .../autobuild/sourcery-x86-64.config               |  4 +
 .../config-fragments/autobuild/sourcery-x86.config |  3 +
 .../autobuild/x86_64-ctng_locales-linux-gnu.config | 11 +++
 support/config-fragments/minimal.config            |  6 ++
 support/scripts/test-pkg                           | 86 ++++++++++++----------
 58 files changed, 514 insertions(+), 77 deletions(-)
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
 create mode 100644 support/config-fragments/autobuild/sourcery-sh.config
 create mode 100644 support/config-fragments/autobuild/sourcery-x86-64.config
 create mode 100644 support/config-fragments/autobuild/sourcery-x86.config
 create mode 100644 support/config-fragments/autobuild/x86_64-ctng_locales-linux-gnu.config
 create mode 100644 support/config-fragments/minimal.config
