From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 6 Apr 2017 20:18:46 +0200
Subject: [Buildroot] [PATCH v5 06/13] configs: add autobuild toolchain
	defconfigs
In-Reply-To: <cover.1491502445.git.arnout@mind.be>
References: <cover.1491502445.git.arnout@mind.be>
Message-ID: <20170406181854.5242-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently have a list of toolchain configurations that are used by
the autobuilders at [1]. However, this makes it a little more difficult
for people to use these configurations, and also to have a different
list of configurations for different branches. For example if a new
architecture is introduced, the 2017.02.x branch doesn't have support
for this architecture yet so it shouldn't try to run those configs.

Therefore, include the autobuild defconfigs directly in Buildroot, so
they can be branched together with the rest. To avoid polluting the
configs/ directory too much, the autobuild defconfigs are kept in an
"autobuild" subdirectory.

Generated with
wget -nd --no-parent --recursive http://autobuild.buildroot.net/toolchains/configs/
mmv '*.config' '#1_defconfig'

The toolchain CSV file [1] contained some additional information, but
this information turns out not to be needed.

- The hostarch required by the toolchain binary. This is used by the
  autobuild script to avoid trying a toolchain that it cannot use.
  However, it is better that the autobuild script instead just checks
  if all the options specified in the toolchain config are still
  selected after creating a full config, like is done in the test-pkg
  script. That's much more robust against other things that might
  block a toolchain from being used.

- The libc used. This is used only for one thing: to let the
  autobuild script decide if it should try to enable BR2_STATIC_LIBS
  or not. However, that line can just be added unconditionally: for
  glibc toolchains, it will get removed again, no harm done.

[1] http://autobuild.buildroot.net/toolchains/configs/toolchain-configs.csv

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: Refresh after rebuild of the br-* toolchains
    Don't add HOSTARCH, it's not needed as explained above

Note: I choose to name them xxx_defconfig and put them under to configs
directory so they can be used directly as a quick way to set up a build
with an external toolchain. However, neither test-pkg nor autobuild-run
will use them as _defconfig, so we could just as well call them *.config
and put them under e.g. support/autobuild-toolchains. Let me know what
you think.
---
 configs/autobuild/armv5-ctng-linux-gnueabi_defconfig        | 10 ++++++++++
 configs/autobuild/armv7-ctng-linux-gnueabihf_defconfig      | 13 +++++++++++++
 configs/autobuild/br-aarch64-glibc_defconfig                |  9 +++++++++
 configs/autobuild/br-arc-full-internal_defconfig            |  3 +++
 configs/autobuild/br-arcle-hs38_defconfig                   | 10 ++++++++++
 configs/autobuild/br-arm-basic_defconfig                    |  8 ++++++++
 configs/autobuild/br-arm-cortex-a9-glibc_defconfig          | 11 +++++++++++
 configs/autobuild/br-arm-cortex-a9-musl_defconfig           | 11 +++++++++++
 configs/autobuild/br-arm-cortex-m4-full_defconfig           | 12 ++++++++++++
 configs/autobuild/br-arm-full-nothread_defconfig            | 11 +++++++++++
 configs/autobuild/br-arm-full-static_defconfig              | 11 +++++++++++
 configs/autobuild/br-arm-full_defconfig                     | 10 ++++++++++
 configs/autobuild/br-arm-internal-full_defconfig            |  6 ++++++
 configs/autobuild/br-bfin-full_defconfig                    | 12 ++++++++++++
 configs/autobuild/br-i386-pentium-mmx-musl_defconfig        | 10 ++++++++++
 configs/autobuild/br-i386-pentium4-full_defconfig           | 10 ++++++++++
 configs/autobuild/br-m68k-5208-full_defconfig               | 11 +++++++++++
 configs/autobuild/br-m68k-68040-full_defconfig              | 10 ++++++++++
 configs/autobuild/br-microblazeel-full-internal_defconfig   |  1 +
 configs/autobuild/br-microblazeel-full_defconfig            | 10 ++++++++++
 configs/autobuild/br-mips32r6-el-hf-glibc_defconfig         | 11 +++++++++++
 configs/autobuild/br-mips64-n64-full_defconfig              | 10 ++++++++++
 configs/autobuild/br-mips64r6-el-hf-glibc_defconfig         | 12 ++++++++++++
 configs/autobuild/br-mipsel-o32-full_defconfig              | 10 ++++++++++
 configs/autobuild/br-nios2-glibc_defconfig                  |  9 +++++++++
 configs/autobuild/br-openrisc-uclibc_defconfig              | 10 ++++++++++
 configs/autobuild/br-powerpc-603e-basic-cpp_defconfig       | 10 ++++++++++
 configs/autobuild/br-powerpc-e500mc-full_defconfig          | 11 +++++++++++
 configs/autobuild/br-powerpc-internal-full_defconfig        |  5 +++++
 configs/autobuild/br-powerpc64-power7-glibc_defconfig       |  9 +++++++++
 configs/autobuild/br-powerpc64le-power8-glibc_defconfig     |  9 +++++++++
 configs/autobuild/br-sh4-full_defconfig                     | 10 ++++++++++
 configs/autobuild/br-sparc-uclibc_defconfig                 |  9 +++++++++
 configs/autobuild/br-sparc64-glibc_defconfig                |  8 ++++++++
 configs/autobuild/br-x86-64-core2-full_defconfig            | 11 +++++++++++
 configs/autobuild/br-x86-64-musl_defconfig                  | 10 ++++++++++
 configs/autobuild/br-xtensa-full-internal_defconfig         |  4 ++++
 configs/autobuild/br-xtensa-full_defconfig                  |  9 +++++++++
 configs/autobuild/i686-ctng-linux-gnu_defconfig             | 10 ++++++++++
 configs/autobuild/linaro-aarch64_defconfig                  |  2 ++
 configs/autobuild/linaro-arm_defconfig                      |  4 ++++
 configs/autobuild/mips64el-ctng_n32-linux-gnu_defconfig     |  9 +++++++++
 configs/autobuild/mips64el-ctng_n64-linux-gnu_defconfig     | 11 +++++++++++
 .../autobuild/powerpc-ctng_e500v2-linux-gnuspe_defconfig    | 11 +++++++++++
 configs/autobuild/sourcery-arm-armv4t_defconfig             |  4 ++++
 configs/autobuild/sourcery-arm-thumb2_defconfig             |  6 ++++++
 configs/autobuild/sourcery-arm_defconfig                    |  3 +++
 configs/autobuild/sourcery-mips64_defconfig                 |  5 +++++
 configs/autobuild/sourcery-mips_defconfig                   |  4 ++++
 configs/autobuild/sourcery-nios2_defconfig                  |  2 ++
 configs/autobuild/sourcery-sh_defconfig                     |  4 ++++
 configs/autobuild/sourcery-x86-64_defconfig                 |  4 ++++
 configs/autobuild/sourcery-x86_defconfig                    |  3 +++
 configs/autobuild/x86_64-ctng_locales-linux-gnu_defconfig   | 11 +++++++++++
 54 files changed, 449 insertions(+)
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

diff --git a/configs/autobuild/armv5-ctng-linux-gnueabi_defconfig b/configs/autobuild/armv5-ctng-linux-gnueabi_defconfig
new file mode 100644
index 0000000000..c2f4cb62ca
--- /dev/null
+++ b/configs/autobuild/armv5-ctng-linux-gnueabi_defconfig
@@ -0,0 +1,10 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="armv5-ctng-linux-gnueabi"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/armv7-ctng-linux-gnueabihf_defconfig b/configs/autobuild/armv7-ctng-linux-gnueabihf_defconfig
new file mode 100644
index 0000000000..60ec952940
--- /dev/null
+++ b/configs/autobuild/armv7-ctng-linux-gnueabihf_defconfig
@@ -0,0 +1,13 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv7-ctng-linux-gnueabihf.tar.xz"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="armv7-ctng-linux-gnueabihf"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-aarch64-glibc_defconfig b/configs/autobuild/br-aarch64-glibc_defconfig
new file mode 100644
index 0000000000..1e7387aa29
--- /dev/null
+++ b/configs/autobuild/br-aarch64-glibc_defconfig
@@ -0,0 +1,9 @@
+BR2_aarch64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-aarch64-glibc-2017.02-744-g40962a0.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arc-full-internal_defconfig b/configs/autobuild/br-arc-full-internal_defconfig
new file mode 100644
index 0000000000..4755c9e45b
--- /dev/null
+++ b/configs/autobuild/br-arc-full-internal_defconfig
@@ -0,0 +1,3 @@
+BR2_arcle=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/autobuild/br-arcle-hs38_defconfig b/configs/autobuild/br-arcle-hs38_defconfig
new file mode 100644
index 0000000000..ab5476c51f
--- /dev/null
+++ b/configs/autobuild/br-arcle-hs38_defconfig
@@ -0,0 +1,10 @@
+BR2_arcle=y
+BR2_archs38=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arm-basic_defconfig b/configs/autobuild/br-arm-basic_defconfig
new file mode 100644
index 0000000000..676ffb0ebf
--- /dev/null
+++ b/configs/autobuild/br-arm-basic_defconfig
@@ -0,0 +1,8 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/configs/autobuild/br-arm-cortex-a9-glibc_defconfig b/configs/autobuild/br-arm-cortex-a9-glibc_defconfig
new file mode 100644
index 0000000000..919a062b58
--- /dev/null
+++ b/configs/autobuild/br-arm-cortex-a9-glibc_defconfig
@@ -0,0 +1,11 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_VFP=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2017.02-744-g40962a0.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arm-cortex-a9-musl_defconfig b/configs/autobuild/br-arm-cortex-a9-musl_defconfig
new file mode 100644
index 0000000000..7bd0f4ed10
--- /dev/null
+++ b/configs/autobuild/br-arm-cortex-a9-musl_defconfig
@@ -0,0 +1,11 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_VFP=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.02-744-g40962a0.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arm-cortex-m4-full_defconfig b/configs/autobuild/br-arm-cortex-m4-full_defconfig
new file mode 100644
index 0000000000..228de9f514
--- /dev/null
+++ b/configs/autobuild/br-arm-cortex-m4-full_defconfig
@@ -0,0 +1,12 @@
+BR2_arm=y
+BR2_cortex_m4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-m4-full-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arm-full-nothread_defconfig b/configs/autobuild/br-arm-full-nothread_defconfig
new file mode 100644
index 0000000000..9942453bb2
--- /dev/null
+++ b/configs/autobuild/br-arm-full-nothread_defconfig
@@ -0,0 +1,11 @@
+BR2_arm=y
+BR2_arm1176jzf_s=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arm-full-static_defconfig b/configs/autobuild/br-arm-full-static_defconfig
new file mode 100644
index 0000000000..b343c3f076
--- /dev/null
+++ b/configs/autobuild/br-arm-full-static_defconfig
@@ -0,0 +1,11 @@
+BR2_arm=y
+BR2_STATIC_LIBS=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arm-full_defconfig b/configs/autobuild/br-arm-full_defconfig
new file mode 100644
index 0000000000..736dea6d6d
--- /dev/null
+++ b/configs/autobuild/br-arm-full_defconfig
@@ -0,0 +1,10 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arm-internal-full_defconfig b/configs/autobuild/br-arm-internal-full_defconfig
new file mode 100644
index 0000000000..2e70534882
--- /dev/null
+++ b/configs/autobuild/br-arm-internal-full_defconfig
@@ -0,0 +1,6 @@
+BR2_arm=y
+BR2_ARM_EABI=y
+BR2_UCLIBC_VERSION_NG=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/autobuild/br-bfin-full_defconfig b/configs/autobuild/br-bfin-full_defconfig
new file mode 100644
index 0000000000..dde98379fa
--- /dev/null
+++ b/configs/autobuild/br-bfin-full_defconfig
@@ -0,0 +1,12 @@
+BR2_bfin=y
+BR2_bf512=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-bfin-full-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-i386-pentium-mmx-musl_defconfig b/configs/autobuild/br-i386-pentium-mmx-musl_defconfig
new file mode 100644
index 0000000000..14aa0d6f42
--- /dev/null
+++ b/configs/autobuild/br-i386-pentium-mmx-musl_defconfig
@@ -0,0 +1,10 @@
+BR2_x86_pentium_mmx=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-i386-pentium-mmx-musl-2017.02-744-g40962a0.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-i386-pentium4-full_defconfig b/configs/autobuild/br-i386-pentium4-full_defconfig
new file mode 100644
index 0000000000..919c64839e
--- /dev/null
+++ b/configs/autobuild/br-i386-pentium4-full_defconfig
@@ -0,0 +1,10 @@
+BR2_x86_pentium4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-m68k-5208-full_defconfig b/configs/autobuild/br-m68k-5208-full_defconfig
new file mode 100644
index 0000000000..4b31fe7c4d
--- /dev/null
+++ b/configs/autobuild/br-m68k-5208-full_defconfig
@@ -0,0 +1,11 @@
+BR2_m68k=y
+BR2_m68k_cf5208=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-5208-full-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-m68k-68040-full_defconfig b/configs/autobuild/br-m68k-68040-full_defconfig
new file mode 100644
index 0000000000..816ee1af08
--- /dev/null
+++ b/configs/autobuild/br-m68k-68040-full_defconfig
@@ -0,0 +1,10 @@
+BR2_m68k=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-68040-full-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-microblazeel-full-internal_defconfig b/configs/autobuild/br-microblazeel-full-internal_defconfig
new file mode 100644
index 0000000000..0d2d7df8f1
--- /dev/null
+++ b/configs/autobuild/br-microblazeel-full-internal_defconfig
@@ -0,0 +1 @@
+BR2_microblazeel=y
diff --git a/configs/autobuild/br-microblazeel-full_defconfig b/configs/autobuild/br-microblazeel-full_defconfig
new file mode 100644
index 0000000000..057b80fe45
--- /dev/null
+++ b/configs/autobuild/br-microblazeel-full_defconfig
@@ -0,0 +1,10 @@
+BR2_microblazeel=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-microblaze-full-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-mips32r6-el-hf-glibc_defconfig b/configs/autobuild/br-mips32r6-el-hf-glibc_defconfig
new file mode 100644
index 0000000000..3f47ea499c
--- /dev/null
+++ b/configs/autobuild/br-mips32r6-el-hf-glibc_defconfig
@@ -0,0 +1,11 @@
+BR2_mipsel=y
+BR2_mips_32r6=y
+# BR2_MIPS_SOFT_FLOAT is not set
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips32r6-el-hf-2017.02-744-g40962a0.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-mips64-n64-full_defconfig b/configs/autobuild/br-mips64-n64-full_defconfig
new file mode 100644
index 0000000000..be287b4144
--- /dev/null
+++ b/configs/autobuild/br-mips64-n64-full_defconfig
@@ -0,0 +1,10 @@
+BR2_mips64el=y
+BR2_MIPS_NABI64=y
+# BR2_MIPS_SOFT_FLOAT is not set
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64-n64-full-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-mips64r6-el-hf-glibc_defconfig b/configs/autobuild/br-mips64r6-el-hf-glibc_defconfig
new file mode 100644
index 0000000000..bdb709d5b5
--- /dev/null
+++ b/configs/autobuild/br-mips64r6-el-hf-glibc_defconfig
@@ -0,0 +1,12 @@
+BR2_mips64el=y
+BR2_mips_64r6=y
+BR2_MIPS_NABI64=y
+# BR2_MIPS_SOFT_FLOAT is not set
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64r6-n64-el-hf-2017.02-744-g40962a0.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-mipsel-o32-full_defconfig b/configs/autobuild/br-mipsel-o32-full_defconfig
new file mode 100644
index 0000000000..e648b6bdc0
--- /dev/null
+++ b/configs/autobuild/br-mipsel-o32-full_defconfig
@@ -0,0 +1,10 @@
+BR2_mipsel=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-nios2-glibc_defconfig b/configs/autobuild/br-nios2-glibc_defconfig
new file mode 100644
index 0000000000..6500fcc781
--- /dev/null
+++ b/configs/autobuild/br-nios2-glibc_defconfig
@@ -0,0 +1,9 @@
+BR2_nios2=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-nios2-full-2017.02-744-g40962a0.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-openrisc-uclibc_defconfig b/configs/autobuild/br-openrisc-uclibc_defconfig
new file mode 100644
index 0000000000..40e3af1e83
--- /dev/null
+++ b/configs/autobuild/br-openrisc-uclibc_defconfig
@@ -0,0 +1,10 @@
+BR2_or1k=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-powerpc-603e-basic-cpp_defconfig b/configs/autobuild/br-powerpc-603e-basic-cpp_defconfig
new file mode 100644
index 0000000000..58523723c9
--- /dev/null
+++ b/configs/autobuild/br-powerpc-603e-basic-cpp_defconfig
@@ -0,0 +1,10 @@
+BR2_powerpc=y
+BR2_powerpc_603e=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-powerpc-e500mc-full_defconfig b/configs/autobuild/br-powerpc-e500mc-full_defconfig
new file mode 100644
index 0000000000..43b4c8c0a9
--- /dev/null
+++ b/configs/autobuild/br-powerpc-e500mc-full_defconfig
@@ -0,0 +1,11 @@
+BR2_powerpc=y
+BR2_powerpc_e500mc=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-e500mc-full-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-powerpc-internal-full_defconfig b/configs/autobuild/br-powerpc-internal-full_defconfig
new file mode 100644
index 0000000000..2621e9fb41
--- /dev/null
+++ b/configs/autobuild/br-powerpc-internal-full_defconfig
@@ -0,0 +1,5 @@
+BR2_powerpc=y
+BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/autobuild/br-powerpc64-power7-glibc_defconfig b/configs/autobuild/br-powerpc64-power7-glibc_defconfig
new file mode 100644
index 0000000000..5c56a0d453
--- /dev/null
+++ b/configs/autobuild/br-powerpc64-power7-glibc_defconfig
@@ -0,0 +1,9 @@
+BR2_powerpc64=y
+BR2_powerpc_power7=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64-power7-glibc-2017.02-744-g40962a0.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-powerpc64le-power8-glibc_defconfig b/configs/autobuild/br-powerpc64le-power8-glibc_defconfig
new file mode 100644
index 0000000000..e11c22fa87
--- /dev/null
+++ b/configs/autobuild/br-powerpc64le-power8-glibc_defconfig
@@ -0,0 +1,9 @@
+BR2_powerpc64le=y
+BR2_powerpc_power8=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64le-power8-glibc-2017.02-744-g40962a0.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-sh4-full_defconfig b/configs/autobuild/br-sh4-full_defconfig
new file mode 100644
index 0000000000..593d813227
--- /dev/null
+++ b/configs/autobuild/br-sh4-full_defconfig
@@ -0,0 +1,10 @@
+BR2_sh=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sh4-full-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-sparc-uclibc_defconfig b/configs/autobuild/br-sparc-uclibc_defconfig
new file mode 100644
index 0000000000..b5d3556e55
--- /dev/null
+++ b/configs/autobuild/br-sparc-uclibc_defconfig
@@ -0,0 +1,9 @@
+BR2_sparc=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-sparc64-glibc_defconfig b/configs/autobuild/br-sparc64-glibc_defconfig
new file mode 100644
index 0000000000..a7fa8b525d
--- /dev/null
+++ b/configs/autobuild/br-sparc64-glibc_defconfig
@@ -0,0 +1,8 @@
+BR2_sparc64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2017.02-744-g40962a0.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-x86-64-core2-full_defconfig b/configs/autobuild/br-x86-64-core2-full_defconfig
new file mode 100644
index 0000000000..d680b1466c
--- /dev/null
+++ b/configs/autobuild/br-x86-64-core2-full_defconfig
@@ -0,0 +1,11 @@
+BR2_x86_64=y
+BR2_x86_core2=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-x86-64-musl_defconfig b/configs/autobuild/br-x86-64-musl_defconfig
new file mode 100644
index 0000000000..f2bbcb32d1
--- /dev/null
+++ b/configs/autobuild/br-x86-64-musl_defconfig
@@ -0,0 +1,10 @@
+BR2_x86_64=y
+BR2_x86_atom=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2017.02-744-g40962a0.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-xtensa-full-internal_defconfig b/configs/autobuild/br-xtensa-full-internal_defconfig
new file mode 100644
index 0000000000..f642a4d76b
--- /dev/null
+++ b/configs/autobuild/br-xtensa-full-internal_defconfig
@@ -0,0 +1,4 @@
+BR2_xtensa=y
+BR2_JLEVEL=8
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/autobuild/br-xtensa-full_defconfig b/configs/autobuild/br-xtensa-full_defconfig
new file mode 100644
index 0000000000..c56393e306
--- /dev/null
+++ b/configs/autobuild/br-xtensa-full_defconfig
@@ -0,0 +1,9 @@
+BR2_xtensa=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/i686-ctng-linux-gnu_defconfig b/configs/autobuild/i686-ctng-linux-gnu_defconfig
new file mode 100644
index 0000000000..9a961123c3
--- /dev/null
+++ b/configs/autobuild/i686-ctng-linux-gnu_defconfig
@@ -0,0 +1,10 @@
+BR2_x86_i686=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/i686-ctng-linux-gnu.tar.xz"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="i686-ctng-linux-gnu"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/linaro-aarch64_defconfig b/configs/autobuild/linaro-aarch64_defconfig
new file mode 100644
index 0000000000..bb466f384b
--- /dev/null
+++ b/configs/autobuild/linaro-aarch64_defconfig
@@ -0,0 +1,2 @@
+BR2_aarch64=y
+BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/configs/autobuild/linaro-arm_defconfig b/configs/autobuild/linaro-arm_defconfig
new file mode 100644
index 0000000000..91149a7d1d
--- /dev/null
+++ b/configs/autobuild/linaro-arm_defconfig
@@ -0,0 +1,4 @@
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_ARM_EABIHF=y
+BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/configs/autobuild/mips64el-ctng_n32-linux-gnu_defconfig b/configs/autobuild/mips64el-ctng_n32-linux-gnu_defconfig
new file mode 100644
index 0000000000..cf33ea26f3
--- /dev/null
+++ b/configs/autobuild/mips64el-ctng_n32-linux-gnu_defconfig
@@ -0,0 +1,9 @@
+BR2_mips64el=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n32-linux-gnu.tar.xz"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="mips64el-ctng_n32-linux-gnu"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/mips64el-ctng_n64-linux-gnu_defconfig b/configs/autobuild/mips64el-ctng_n64-linux-gnu_defconfig
new file mode 100644
index 0000000000..942a1b13b5
--- /dev/null
+++ b/configs/autobuild/mips64el-ctng_n64-linux-gnu_defconfig
@@ -0,0 +1,11 @@
+BR2_mips64el=y
+BR2_MIPS_NABI64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="mips64el-ctng_n64-linux-gnu"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/powerpc-ctng_e500v2-linux-gnuspe_defconfig b/configs/autobuild/powerpc-ctng_e500v2-linux-gnuspe_defconfig
new file mode 100644
index 0000000000..e82d3fbda7
--- /dev/null
+++ b/configs/autobuild/powerpc-ctng_e500v2-linux-gnuspe_defconfig
@@ -0,0 +1,11 @@
+BR2_powerpc=y
+BR2_powerpc_8548=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng_e500v2-linux-gnuspe.tar.xz"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="powerpc-ctng_e500v2-linux-gnuspe"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_12=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/sourcery-arm-armv4t_defconfig b/configs/autobuild/sourcery-arm-armv4t_defconfig
new file mode 100644
index 0000000000..4c0e01fecb
--- /dev/null
+++ b/configs/autobuild/sourcery-arm-armv4t_defconfig
@@ -0,0 +1,4 @@
+BR2_arm=y
+BR2_arm920t=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
diff --git a/configs/autobuild/sourcery-arm-thumb2_defconfig b/configs/autobuild/sourcery-arm-thumb2_defconfig
new file mode 100644
index 0000000000..14b64b7892
--- /dev/null
+++ b/configs/autobuild/sourcery-arm-thumb2_defconfig
@@ -0,0 +1,6 @@
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_ARM_EABI=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_OPTIMIZATION=""
diff --git a/configs/autobuild/sourcery-arm_defconfig b/configs/autobuild/sourcery-arm_defconfig
new file mode 100644
index 0000000000..8ade4647f2
--- /dev/null
+++ b/configs/autobuild/sourcery-arm_defconfig
@@ -0,0 +1,3 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
diff --git a/configs/autobuild/sourcery-mips64_defconfig b/configs/autobuild/sourcery-mips64_defconfig
new file mode 100644
index 0000000000..77e3a853e1
--- /dev/null
+++ b/configs/autobuild/sourcery-mips64_defconfig
@@ -0,0 +1,5 @@
+BR2_mips64el=y
+BR2_mips_64r2=y
+BR2_MIPS_NABI64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS=y
diff --git a/configs/autobuild/sourcery-mips_defconfig b/configs/autobuild/sourcery-mips_defconfig
new file mode 100644
index 0000000000..103e20bfc2
--- /dev/null
+++ b/configs/autobuild/sourcery-mips_defconfig
@@ -0,0 +1,4 @@
+BR2_mips=y
+BR2_mips_32r2=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS=y
diff --git a/configs/autobuild/sourcery-nios2_defconfig b/configs/autobuild/sourcery-nios2_defconfig
new file mode 100644
index 0000000000..0124413d9f
--- /dev/null
+++ b/configs/autobuild/sourcery-nios2_defconfig
@@ -0,0 +1,2 @@
+BR2_nios2=y
+BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/configs/autobuild/sourcery-sh_defconfig b/configs/autobuild/sourcery-sh_defconfig
new file mode 100644
index 0000000000..515fc8fbb1
--- /dev/null
+++ b/configs/autobuild/sourcery-sh_defconfig
@@ -0,0 +1,4 @@
+BR2_sh=y
+BR2_sh4a=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH=y
diff --git a/configs/autobuild/sourcery-x86-64_defconfig b/configs/autobuild/sourcery-x86-64_defconfig
new file mode 100644
index 0000000000..6c7ad4c5b7
--- /dev/null
+++ b/configs/autobuild/sourcery-x86-64_defconfig
@@ -0,0 +1,4 @@
+BR2_x86_64=y
+BR2_x86_steamroller=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64=y
diff --git a/configs/autobuild/sourcery-x86_defconfig b/configs/autobuild/sourcery-x86_defconfig
new file mode 100644
index 0000000000..ad629f626b
--- /dev/null
+++ b/configs/autobuild/sourcery-x86_defconfig
@@ -0,0 +1,3 @@
+BR2_x86_pentium4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86=y
diff --git a/configs/autobuild/x86_64-ctng_locales-linux-gnu_defconfig b/configs/autobuild/x86_64-ctng_locales-linux-gnu_defconfig
new file mode 100644
index 0000000000..435034be27
--- /dev/null
+++ b/configs/autobuild/x86_64-ctng_locales-linux-gnu_defconfig
@@ -0,0 +1,11 @@
+BR2_x86_64=y
+BR2_x86_corei7=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/x86_64-ctng_locales-linux-gnu.tar.xz"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="x86_64-ctng_locales-linux-gnu"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
-- 
2.11.0
