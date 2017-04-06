From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 6 Apr 2017 20:18:40 +0200
Subject: [Buildroot] [PATCH v5 00/13] support/test-pkg: fixes and
	enhancements + add autobuild defconfigs
Message-ID: <cover.1491502445.git.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

 This series combines the test-pkg rework from Yann [1] with my adding the
autobuild toolchain defconfigs in-tree [2]. The two series are combined 
because I added a patch that makes test-pkg use the in-tree autobuild
defconfigs instead of fetching them from [3], so the two series conflict
with each other.

 Since the defconfigs are now in-tree, there is no toolchain URL anymore,
so adding the option to specify an alternate URL [4] doesn't make much
sense. It is replaced with an option to specify an alternate toolchain
directory.

 Finally, I added some further enhancement (refactoring) patches:
- moving the minimal config fragment into a separate file;
- using merge_config.sh (which requires two preparatory patches).
These can be applied more or less independently.

 Regards,
 Arnout


[1] http://patchwork.ozlabs.org/patch/728392/
[2] http://patchwork.ozlabs.org/patch/743573/
[3] http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv
[4] http://patchwork.ozlabs.org/patch/728393/


The following changes since commit 9a521546ed553d2be23740bbf1a7aa05bce9eb09:

  libnspr: use __nios2__ instead of nios2 (2017-04-06 16:13:52 +0200)

are available in the git repository at:

  https://gitlab.com/arnout/buildroot toolchain-defconfigs

for you to fetch changes up to 698b2328063f47c75ed2d298cf378a2afd41ac37:

  [RFC] list-defconfigs: support defconfigs in subdirectories (2017-04-06 20:12:49 +0200)

----------------------------------------------------------------
Arnout Vandecappelle (9):
      Makefile: support defconfigs in subdirectories
      configs: add autobuild toolchain defconfigs
      support/test-pkg: move minimal.config into a separate file
      support/test-pkg: get configs from buildroot defconfigs
      support/test-pkg: add option to use an alternate toolchain directory
      Makefile: refactor *config targets
      Makefile: add alldefconfig target
      support/test-pkg: use merge_config.sh to merge the fragments
      [RFC] list-defconfigs: support defconfigs in subdirectories

Yann E. MORIN (4):
      docs/manual: document the test-pkg script
      support/test-pkg: print number of toolchains and progress
      support/test-pkg: calculate toolchain name only once
      support/test-pkg: run legal-info

 Makefile                                           |  82 ++++++----------
 .../autobuild/armv5-ctng-linux-gnueabi_defconfig   |  10 ++
 .../autobuild/armv7-ctng-linux-gnueabihf_defconfig |  13 +++
 configs/autobuild/br-aarch64-glibc_defconfig       |   9 ++
 configs/autobuild/br-arc-full-internal_defconfig   |   3 +
 configs/autobuild/br-arcle-hs38_defconfig          |  10 ++
 configs/autobuild/br-arm-basic_defconfig           |   8 ++
 configs/autobuild/br-arm-cortex-a9-glibc_defconfig |  11 +++
 configs/autobuild/br-arm-cortex-a9-musl_defconfig  |  11 +++
 configs/autobuild/br-arm-cortex-m4-full_defconfig  |  12 +++
 configs/autobuild/br-arm-full-nothread_defconfig   |  11 +++
 configs/autobuild/br-arm-full-static_defconfig     |  11 +++
 configs/autobuild/br-arm-full_defconfig            |  10 ++
 configs/autobuild/br-arm-internal-full_defconfig   |   6 ++
 configs/autobuild/br-bfin-full_defconfig           |  12 +++
 .../autobuild/br-i386-pentium-mmx-musl_defconfig   |  10 ++
 configs/autobuild/br-i386-pentium4-full_defconfig  |  10 ++
 configs/autobuild/br-m68k-5208-full_defconfig      |  11 +++
 configs/autobuild/br-m68k-68040-full_defconfig     |  10 ++
 .../br-microblazeel-full-internal_defconfig        |   1 +
 configs/autobuild/br-microblazeel-full_defconfig   |  10 ++
 .../autobuild/br-mips32r6-el-hf-glibc_defconfig    |  11 +++
 configs/autobuild/br-mips64-n64-full_defconfig     |  10 ++
 .../autobuild/br-mips64r6-el-hf-glibc_defconfig    |  12 +++
 configs/autobuild/br-mipsel-o32-full_defconfig     |  10 ++
 configs/autobuild/br-nios2-glibc_defconfig         |   9 ++
 configs/autobuild/br-openrisc-uclibc_defconfig     |  10 ++
 .../autobuild/br-powerpc-603e-basic-cpp_defconfig  |  10 ++
 configs/autobuild/br-powerpc-e500mc-full_defconfig |  11 +++
 .../autobuild/br-powerpc-internal-full_defconfig   |   5 +
 .../autobuild/br-powerpc64-power7-glibc_defconfig  |   9 ++
 .../br-powerpc64le-power8-glibc_defconfig          |   9 ++
 configs/autobuild/br-sh4-full_defconfig            |  10 ++
 configs/autobuild/br-sparc-uclibc_defconfig        |   9 ++
 configs/autobuild/br-sparc64-glibc_defconfig       |   8 ++
 configs/autobuild/br-x86-64-core2-full_defconfig   |  11 +++
 configs/autobuild/br-x86-64-musl_defconfig         |  10 ++
 .../autobuild/br-xtensa-full-internal_defconfig    |   4 +
 configs/autobuild/br-xtensa-full_defconfig         |   9 ++
 configs/autobuild/i686-ctng-linux-gnu_defconfig    |  10 ++
 configs/autobuild/linaro-aarch64_defconfig         |   2 +
 configs/autobuild/linaro-arm_defconfig             |   4 +
 .../mips64el-ctng_n32-linux-gnu_defconfig          |   9 ++
 .../mips64el-ctng_n64-linux-gnu_defconfig          |  11 +++
 .../powerpc-ctng_e500v2-linux-gnuspe_defconfig     |  11 +++
 configs/autobuild/sourcery-arm-armv4t_defconfig    |   4 +
 configs/autobuild/sourcery-arm-thumb2_defconfig    |   6 ++
 configs/autobuild/sourcery-arm_defconfig           |   3 +
 configs/autobuild/sourcery-mips64_defconfig        |   5 +
 configs/autobuild/sourcery-mips_defconfig          |   4 +
 configs/autobuild/sourcery-nios2_defconfig         |   2 +
 configs/autobuild/sourcery-sh_defconfig            |   4 +
 configs/autobuild/sourcery-x86-64_defconfig        |   4 +
 configs/autobuild/sourcery-x86_defconfig           |   3 +
 .../x86_64-ctng_locales-linux-gnu_defconfig        |  11 +++
 docs/manual/adding-packages-tips.txt               |  94 +++++++++++++++++++
 docs/manual/adding-packages.txt                    |   3 +
 support/misc/minimal.config                        |   6 ++
 support/scripts/test-pkg                           | 104 +++++++++++----------
 59 files changed, 636 insertions(+), 102 deletions(-)
 create mode 100644 configs/autobuild/armv5-ctng-linux-gnueabi_defconfig
 create mode 100644 configs/autobuild/armv7-ctng-linux-gnueabihf_defconfig
 create mode 100644 configs/autobuild/br-aarch64-glibc_defconfig
 create mode 100644 configs/autobuild/br-arc-full-internal_defconfig
 create mode 100644 configs/autobuild/br-arcle-hs38_defconfig
 create mode 100644 configs/autobuild/br-arm-basic_defconfig
 create mode 100644 configs/autobuild/br-arm-cortex-a9-glibc_defconfig
 create mode 100644 configs/autobuild/br-arm-cortex-a9-musl_defconfig
 create mode 100644 configs/autobuild/br-arm-cortex-m4-full_defconfig
 create mode 100644 configs/autobuild/br-arm-full-nothread_defconfig
 create mode 100644 configs/autobuild/br-arm-full-static_defconfig
 create mode 100644 configs/autobuild/br-arm-full_defconfig
 create mode 100644 configs/autobuild/br-arm-internal-full_defconfig
 create mode 100644 configs/autobuild/br-bfin-full_defconfig
 create mode 100644 configs/autobuild/br-i386-pentium-mmx-musl_defconfig
 create mode 100644 configs/autobuild/br-i386-pentium4-full_defconfig
 create mode 100644 configs/autobuild/br-m68k-5208-full_defconfig
 create mode 100644 configs/autobuild/br-m68k-68040-full_defconfig
 create mode 100644 configs/autobuild/br-microblazeel-full-internal_defconfig
 create mode 100644 configs/autobuild/br-microblazeel-full_defconfig
 create mode 100644 configs/autobuild/br-mips32r6-el-hf-glibc_defconfig
 create mode 100644 configs/autobuild/br-mips64-n64-full_defconfig
 create mode 100644 configs/autobuild/br-mips64r6-el-hf-glibc_defconfig
 create mode 100644 configs/autobuild/br-mipsel-o32-full_defconfig
 create mode 100644 configs/autobuild/br-nios2-glibc_defconfig
 create mode 100644 configs/autobuild/br-openrisc-uclibc_defconfig
 create mode 100644 configs/autobuild/br-powerpc-603e-basic-cpp_defconfig
 create mode 100644 configs/autobuild/br-powerpc-e500mc-full_defconfig
 create mode 100644 configs/autobuild/br-powerpc-internal-full_defconfig
 create mode 100644 configs/autobuild/br-powerpc64-power7-glibc_defconfig
 create mode 100644 configs/autobuild/br-powerpc64le-power8-glibc_defconfig
 create mode 100644 configs/autobuild/br-sh4-full_defconfig
 create mode 100644 configs/autobuild/br-sparc-uclibc_defconfig
 create mode 100644 configs/autobuild/br-sparc64-glibc_defconfig
 create mode 100644 configs/autobuild/br-x86-64-core2-full_defconfig
 create mode 100644 configs/autobuild/br-x86-64-musl_defconfig
 create mode 100644 configs/autobuild/br-xtensa-full-internal_defconfig
 create mode 100644 configs/autobuild/br-xtensa-full_defconfig
 create mode 100644 configs/autobuild/i686-ctng-linux-gnu_defconfig
 create mode 100644 configs/autobuild/linaro-aarch64_defconfig
 create mode 100644 configs/autobuild/linaro-arm_defconfig
 create mode 100644 configs/autobuild/mips64el-ctng_n32-linux-gnu_defconfig
 create mode 100644 configs/autobuild/mips64el-ctng_n64-linux-gnu_defconfig
 create mode 100644 configs/autobuild/powerpc-ctng_e500v2-linux-gnuspe_defconfig
 create mode 100644 configs/autobuild/sourcery-arm-armv4t_defconfig
 create mode 100644 configs/autobuild/sourcery-arm-thumb2_defconfig
 create mode 100644 configs/autobuild/sourcery-arm_defconfig
 create mode 100644 configs/autobuild/sourcery-mips64_defconfig
 create mode 100644 configs/autobuild/sourcery-mips_defconfig
 create mode 100644 configs/autobuild/sourcery-nios2_defconfig
 create mode 100644 configs/autobuild/sourcery-sh_defconfig
 create mode 100644 configs/autobuild/sourcery-x86-64_defconfig
 create mode 100644 configs/autobuild/sourcery-x86_defconfig
 create mode 100644 configs/autobuild/x86_64-ctng_locales-linux-gnu_defconfig
 create mode 100644 support/misc/minimal.config

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
