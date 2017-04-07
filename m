From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 7 Apr 2017 13:16:18 +0200
Subject: [Buildroot] [PATCH v6 3/9] support: add autobuild toolchain config
	fragments
In-Reply-To: <20170407111624.4629-1-arnout@mind.be>
References: <20170407111624.4629-1-arnout@mind.be>
Message-ID: <20170407111624.4629-4-arnout@mind.be>
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

Therefore, include the autobuild config fragments directly in Buildroot,
so they can be branched together with the rest. We create a new
directory under support/ to store them.

Generated with
wget -nd --no-parent --recursive http://autobuild.buildroot.net/toolchains/configs/

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
v6: Move to support/config-fragments/autobuild
v5: Refresh after rebuild of the br-* toolchains
    Don't add HOSTARCH, it's not needed as explained above
v2-v4 don't exist (due to merging 2 series)
---
 .../autobuild/armv5-ctng-linux-gnueabi.config               | 10 ++++++++++
 .../autobuild/armv7-ctng-linux-gnueabihf.config             | 13 +++++++++++++
 support/config-fragments/autobuild/br-aarch64-glibc.config  |  9 +++++++++
 .../config-fragments/autobuild/br-arc-full-internal.config  |  3 +++
 support/config-fragments/autobuild/br-arcle-hs38.config     | 10 ++++++++++
 support/config-fragments/autobuild/br-arm-basic.config      |  8 ++++++++
 .../autobuild/br-arm-cortex-a9-glibc.config                 | 11 +++++++++++
 .../config-fragments/autobuild/br-arm-cortex-a9-musl.config | 11 +++++++++++
 .../config-fragments/autobuild/br-arm-cortex-m4-full.config | 12 ++++++++++++
 .../config-fragments/autobuild/br-arm-full-nothread.config  | 11 +++++++++++
 .../config-fragments/autobuild/br-arm-full-static.config    | 11 +++++++++++
 support/config-fragments/autobuild/br-arm-full.config       | 10 ++++++++++
 .../config-fragments/autobuild/br-arm-internal-full.config  |  6 ++++++
 support/config-fragments/autobuild/br-bfin-full.config      | 12 ++++++++++++
 .../autobuild/br-i386-pentium-mmx-musl.config               | 10 ++++++++++
 .../config-fragments/autobuild/br-i386-pentium4-full.config | 10 ++++++++++
 support/config-fragments/autobuild/br-m68k-5208-full.config | 11 +++++++++++
 .../config-fragments/autobuild/br-m68k-68040-full.config    | 10 ++++++++++
 .../autobuild/br-microblazeel-full-internal.config          |  1 +
 .../config-fragments/autobuild/br-microblazeel-full.config  | 10 ++++++++++
 .../autobuild/br-mips32r6-el-hf-glibc.config                | 11 +++++++++++
 .../config-fragments/autobuild/br-mips64-n64-full.config    | 10 ++++++++++
 .../autobuild/br-mips64r6-el-hf-glibc.config                | 12 ++++++++++++
 .../config-fragments/autobuild/br-mipsel-o32-full.config    | 10 ++++++++++
 support/config-fragments/autobuild/br-nios2-glibc.config    |  9 +++++++++
 .../config-fragments/autobuild/br-openrisc-uclibc.config    | 10 ++++++++++
 .../autobuild/br-powerpc-603e-basic-cpp.config              | 10 ++++++++++
 .../autobuild/br-powerpc-e500mc-full.config                 | 11 +++++++++++
 .../autobuild/br-powerpc-internal-full.config               |  5 +++++
 .../autobuild/br-powerpc64-power7-glibc.config              |  9 +++++++++
 .../autobuild/br-powerpc64le-power8-glibc.config            |  9 +++++++++
 support/config-fragments/autobuild/br-sh4-full.config       | 10 ++++++++++
 support/config-fragments/autobuild/br-sparc-uclibc.config   |  9 +++++++++
 support/config-fragments/autobuild/br-sparc64-glibc.config  |  8 ++++++++
 .../config-fragments/autobuild/br-x86-64-core2-full.config  | 11 +++++++++++
 support/config-fragments/autobuild/br-x86-64-musl.config    | 10 ++++++++++
 .../autobuild/br-xtensa-full-internal.config                |  4 ++++
 support/config-fragments/autobuild/br-xtensa-full.config    |  9 +++++++++
 .../config-fragments/autobuild/i686-ctng-linux-gnu.config   | 10 ++++++++++
 support/config-fragments/autobuild/linaro-aarch64.config    |  2 ++
 support/config-fragments/autobuild/linaro-arm.config        |  4 ++++
 .../autobuild/mips64el-ctng_n32-linux-gnu.config            |  9 +++++++++
 .../autobuild/mips64el-ctng_n64-linux-gnu.config            | 11 +++++++++++
 .../autobuild/powerpc-ctng_e500v2-linux-gnuspe.config       | 11 +++++++++++
 .../config-fragments/autobuild/sourcery-arm-armv4t.config   |  4 ++++
 .../config-fragments/autobuild/sourcery-arm-thumb2.config   |  6 ++++++
 support/config-fragments/autobuild/sourcery-arm.config      |  3 +++
 support/config-fragments/autobuild/sourcery-mips.config     |  4 ++++
 support/config-fragments/autobuild/sourcery-mips64.config   |  5 +++++
 support/config-fragments/autobuild/sourcery-nios2.config    |  2 ++
 support/config-fragments/autobuild/sourcery-sh.config       |  4 ++++
 support/config-fragments/autobuild/sourcery-x86-64.config   |  4 ++++
 support/config-fragments/autobuild/sourcery-x86.config      |  3 +++
 .../autobuild/x86_64-ctng_locales-linux-gnu.config          | 11 +++++++++++
 54 files changed, 449 insertions(+)
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

diff --git a/support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config b/support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config
new file mode 100644
index 0000000000..c2f4cb62ca
--- /dev/null
+++ b/support/config-fragments/autobuild/armv5-ctng-linux-gnueabi.config
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
diff --git a/support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config b/support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config
new file mode 100644
index 0000000000..60ec952940
--- /dev/null
+++ b/support/config-fragments/autobuild/armv7-ctng-linux-gnueabihf.config
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
diff --git a/support/config-fragments/autobuild/br-aarch64-glibc.config b/support/config-fragments/autobuild/br-aarch64-glibc.config
new file mode 100644
index 0000000000..1e7387aa29
--- /dev/null
+++ b/support/config-fragments/autobuild/br-aarch64-glibc.config
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
diff --git a/support/config-fragments/autobuild/br-arc-full-internal.config b/support/config-fragments/autobuild/br-arc-full-internal.config
new file mode 100644
index 0000000000..4755c9e45b
--- /dev/null
+++ b/support/config-fragments/autobuild/br-arc-full-internal.config
@@ -0,0 +1,3 @@
+BR2_arcle=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-arcle-hs38.config b/support/config-fragments/autobuild/br-arcle-hs38.config
new file mode 100644
index 0000000000..ab5476c51f
--- /dev/null
+++ b/support/config-fragments/autobuild/br-arcle-hs38.config
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
diff --git a/support/config-fragments/autobuild/br-arm-basic.config b/support/config-fragments/autobuild/br-arm-basic.config
new file mode 100644
index 0000000000..676ffb0ebf
--- /dev/null
+++ b/support/config-fragments/autobuild/br-arm-basic.config
@@ -0,0 +1,8 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2017.02-756-gae15148.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config b/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
new file mode 100644
index 0000000000..919a062b58
--- /dev/null
+++ b/support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
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
diff --git a/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config b/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
new file mode 100644
index 0000000000..7bd0f4ed10
--- /dev/null
+++ b/support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
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
diff --git a/support/config-fragments/autobuild/br-arm-cortex-m4-full.config b/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
new file mode 100644
index 0000000000..228de9f514
--- /dev/null
+++ b/support/config-fragments/autobuild/br-arm-cortex-m4-full.config
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
diff --git a/support/config-fragments/autobuild/br-arm-full-nothread.config b/support/config-fragments/autobuild/br-arm-full-nothread.config
new file mode 100644
index 0000000000..9942453bb2
--- /dev/null
+++ b/support/config-fragments/autobuild/br-arm-full-nothread.config
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
diff --git a/support/config-fragments/autobuild/br-arm-full-static.config b/support/config-fragments/autobuild/br-arm-full-static.config
new file mode 100644
index 0000000000..b343c3f076
--- /dev/null
+++ b/support/config-fragments/autobuild/br-arm-full-static.config
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
diff --git a/support/config-fragments/autobuild/br-arm-full.config b/support/config-fragments/autobuild/br-arm-full.config
new file mode 100644
index 0000000000..736dea6d6d
--- /dev/null
+++ b/support/config-fragments/autobuild/br-arm-full.config
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
diff --git a/support/config-fragments/autobuild/br-arm-internal-full.config b/support/config-fragments/autobuild/br-arm-internal-full.config
new file mode 100644
index 0000000000..2e70534882
--- /dev/null
+++ b/support/config-fragments/autobuild/br-arm-internal-full.config
@@ -0,0 +1,6 @@
+BR2_arm=y
+BR2_ARM_EABI=y
+BR2_UCLIBC_VERSION_NG=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-bfin-full.config b/support/config-fragments/autobuild/br-bfin-full.config
new file mode 100644
index 0000000000..dde98379fa
--- /dev/null
+++ b/support/config-fragments/autobuild/br-bfin-full.config
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
diff --git a/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config b/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
new file mode 100644
index 0000000000..14aa0d6f42
--- /dev/null
+++ b/support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config
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
diff --git a/support/config-fragments/autobuild/br-i386-pentium4-full.config b/support/config-fragments/autobuild/br-i386-pentium4-full.config
new file mode 100644
index 0000000000..919c64839e
--- /dev/null
+++ b/support/config-fragments/autobuild/br-i386-pentium4-full.config
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
diff --git a/support/config-fragments/autobuild/br-m68k-5208-full.config b/support/config-fragments/autobuild/br-m68k-5208-full.config
new file mode 100644
index 0000000000..4b31fe7c4d
--- /dev/null
+++ b/support/config-fragments/autobuild/br-m68k-5208-full.config
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
diff --git a/support/config-fragments/autobuild/br-m68k-68040-full.config b/support/config-fragments/autobuild/br-m68k-68040-full.config
new file mode 100644
index 0000000000..816ee1af08
--- /dev/null
+++ b/support/config-fragments/autobuild/br-m68k-68040-full.config
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
diff --git a/support/config-fragments/autobuild/br-microblazeel-full-internal.config b/support/config-fragments/autobuild/br-microblazeel-full-internal.config
new file mode 100644
index 0000000000..0d2d7df8f1
--- /dev/null
+++ b/support/config-fragments/autobuild/br-microblazeel-full-internal.config
@@ -0,0 +1 @@
+BR2_microblazeel=y
diff --git a/support/config-fragments/autobuild/br-microblazeel-full.config b/support/config-fragments/autobuild/br-microblazeel-full.config
new file mode 100644
index 0000000000..057b80fe45
--- /dev/null
+++ b/support/config-fragments/autobuild/br-microblazeel-full.config
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
diff --git a/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
new file mode 100644
index 0000000000..3f47ea499c
--- /dev/null
+++ b/support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
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
diff --git a/support/config-fragments/autobuild/br-mips64-n64-full.config b/support/config-fragments/autobuild/br-mips64-n64-full.config
new file mode 100644
index 0000000000..be287b4144
--- /dev/null
+++ b/support/config-fragments/autobuild/br-mips64-n64-full.config
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
diff --git a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
new file mode 100644
index 0000000000..bdb709d5b5
--- /dev/null
+++ b/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
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
diff --git a/support/config-fragments/autobuild/br-mipsel-o32-full.config b/support/config-fragments/autobuild/br-mipsel-o32-full.config
new file mode 100644
index 0000000000..e648b6bdc0
--- /dev/null
+++ b/support/config-fragments/autobuild/br-mipsel-o32-full.config
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
diff --git a/support/config-fragments/autobuild/br-nios2-glibc.config b/support/config-fragments/autobuild/br-nios2-glibc.config
new file mode 100644
index 0000000000..6500fcc781
--- /dev/null
+++ b/support/config-fragments/autobuild/br-nios2-glibc.config
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
diff --git a/support/config-fragments/autobuild/br-openrisc-uclibc.config b/support/config-fragments/autobuild/br-openrisc-uclibc.config
new file mode 100644
index 0000000000..40e3af1e83
--- /dev/null
+++ b/support/config-fragments/autobuild/br-openrisc-uclibc.config
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
diff --git a/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config b/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
new file mode 100644
index 0000000000..58523723c9
--- /dev/null
+++ b/support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
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
diff --git a/support/config-fragments/autobuild/br-powerpc-e500mc-full.config b/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
new file mode 100644
index 0000000000..43b4c8c0a9
--- /dev/null
+++ b/support/config-fragments/autobuild/br-powerpc-e500mc-full.config
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
diff --git a/support/config-fragments/autobuild/br-powerpc-internal-full.config b/support/config-fragments/autobuild/br-powerpc-internal-full.config
new file mode 100644
index 0000000000..2621e9fb41
--- /dev/null
+++ b/support/config-fragments/autobuild/br-powerpc-internal-full.config
@@ -0,0 +1,5 @@
+BR2_powerpc=y
+BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
new file mode 100644
index 0000000000..5c56a0d453
--- /dev/null
+++ b/support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
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
diff --git a/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config b/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
new file mode 100644
index 0000000000..e11c22fa87
--- /dev/null
+++ b/support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
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
diff --git a/support/config-fragments/autobuild/br-sh4-full.config b/support/config-fragments/autobuild/br-sh4-full.config
new file mode 100644
index 0000000000..593d813227
--- /dev/null
+++ b/support/config-fragments/autobuild/br-sh4-full.config
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
diff --git a/support/config-fragments/autobuild/br-sparc-uclibc.config b/support/config-fragments/autobuild/br-sparc-uclibc.config
new file mode 100644
index 0000000000..b5d3556e55
--- /dev/null
+++ b/support/config-fragments/autobuild/br-sparc-uclibc.config
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
diff --git a/support/config-fragments/autobuild/br-sparc64-glibc.config b/support/config-fragments/autobuild/br-sparc64-glibc.config
new file mode 100644
index 0000000000..a7fa8b525d
--- /dev/null
+++ b/support/config-fragments/autobuild/br-sparc64-glibc.config
@@ -0,0 +1,8 @@
+BR2_sparc64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2017.02-744-g40962a0.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-x86-64-core2-full.config b/support/config-fragments/autobuild/br-x86-64-core2-full.config
new file mode 100644
index 0000000000..d680b1466c
--- /dev/null
+++ b/support/config-fragments/autobuild/br-x86-64-core2-full.config
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
diff --git a/support/config-fragments/autobuild/br-x86-64-musl.config b/support/config-fragments/autobuild/br-x86-64-musl.config
new file mode 100644
index 0000000000..f2bbcb32d1
--- /dev/null
+++ b/support/config-fragments/autobuild/br-x86-64-musl.config
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
diff --git a/support/config-fragments/autobuild/br-xtensa-full-internal.config b/support/config-fragments/autobuild/br-xtensa-full-internal.config
new file mode 100644
index 0000000000..f642a4d76b
--- /dev/null
+++ b/support/config-fragments/autobuild/br-xtensa-full-internal.config
@@ -0,0 +1,4 @@
+BR2_xtensa=y
+BR2_JLEVEL=8
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-xtensa-full.config b/support/config-fragments/autobuild/br-xtensa-full.config
new file mode 100644
index 0000000000..c56393e306
--- /dev/null
+++ b/support/config-fragments/autobuild/br-xtensa-full.config
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
diff --git a/support/config-fragments/autobuild/i686-ctng-linux-gnu.config b/support/config-fragments/autobuild/i686-ctng-linux-gnu.config
new file mode 100644
index 0000000000..9a961123c3
--- /dev/null
+++ b/support/config-fragments/autobuild/i686-ctng-linux-gnu.config
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
diff --git a/support/config-fragments/autobuild/linaro-aarch64.config b/support/config-fragments/autobuild/linaro-aarch64.config
new file mode 100644
index 0000000000..bb466f384b
--- /dev/null
+++ b/support/config-fragments/autobuild/linaro-aarch64.config
@@ -0,0 +1,2 @@
+BR2_aarch64=y
+BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/support/config-fragments/autobuild/linaro-arm.config b/support/config-fragments/autobuild/linaro-arm.config
new file mode 100644
index 0000000000..91149a7d1d
--- /dev/null
+++ b/support/config-fragments/autobuild/linaro-arm.config
@@ -0,0 +1,4 @@
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_ARM_EABIHF=y
+BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/support/config-fragments/autobuild/mips64el-ctng_n32-linux-gnu.config b/support/config-fragments/autobuild/mips64el-ctng_n32-linux-gnu.config
new file mode 100644
index 0000000000..cf33ea26f3
--- /dev/null
+++ b/support/config-fragments/autobuild/mips64el-ctng_n32-linux-gnu.config
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
diff --git a/support/config-fragments/autobuild/mips64el-ctng_n64-linux-gnu.config b/support/config-fragments/autobuild/mips64el-ctng_n64-linux-gnu.config
new file mode 100644
index 0000000000..942a1b13b5
--- /dev/null
+++ b/support/config-fragments/autobuild/mips64el-ctng_n64-linux-gnu.config
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
diff --git a/support/config-fragments/autobuild/powerpc-ctng_e500v2-linux-gnuspe.config b/support/config-fragments/autobuild/powerpc-ctng_e500v2-linux-gnuspe.config
new file mode 100644
index 0000000000..e82d3fbda7
--- /dev/null
+++ b/support/config-fragments/autobuild/powerpc-ctng_e500v2-linux-gnuspe.config
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
diff --git a/support/config-fragments/autobuild/sourcery-arm-armv4t.config b/support/config-fragments/autobuild/sourcery-arm-armv4t.config
new file mode 100644
index 0000000000..4c0e01fecb
--- /dev/null
+++ b/support/config-fragments/autobuild/sourcery-arm-armv4t.config
@@ -0,0 +1,4 @@
+BR2_arm=y
+BR2_arm920t=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
diff --git a/support/config-fragments/autobuild/sourcery-arm-thumb2.config b/support/config-fragments/autobuild/sourcery-arm-thumb2.config
new file mode 100644
index 0000000000..14b64b7892
--- /dev/null
+++ b/support/config-fragments/autobuild/sourcery-arm-thumb2.config
@@ -0,0 +1,6 @@
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_ARM_EABI=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_OPTIMIZATION=""
diff --git a/support/config-fragments/autobuild/sourcery-arm.config b/support/config-fragments/autobuild/sourcery-arm.config
new file mode 100644
index 0000000000..8ade4647f2
--- /dev/null
+++ b/support/config-fragments/autobuild/sourcery-arm.config
@@ -0,0 +1,3 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
diff --git a/support/config-fragments/autobuild/sourcery-mips.config b/support/config-fragments/autobuild/sourcery-mips.config
new file mode 100644
index 0000000000..103e20bfc2
--- /dev/null
+++ b/support/config-fragments/autobuild/sourcery-mips.config
@@ -0,0 +1,4 @@
+BR2_mips=y
+BR2_mips_32r2=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS=y
diff --git a/support/config-fragments/autobuild/sourcery-mips64.config b/support/config-fragments/autobuild/sourcery-mips64.config
new file mode 100644
index 0000000000..77e3a853e1
--- /dev/null
+++ b/support/config-fragments/autobuild/sourcery-mips64.config
@@ -0,0 +1,5 @@
+BR2_mips64el=y
+BR2_mips_64r2=y
+BR2_MIPS_NABI64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS=y
diff --git a/support/config-fragments/autobuild/sourcery-nios2.config b/support/config-fragments/autobuild/sourcery-nios2.config
new file mode 100644
index 0000000000..0124413d9f
--- /dev/null
+++ b/support/config-fragments/autobuild/sourcery-nios2.config
@@ -0,0 +1,2 @@
+BR2_nios2=y
+BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/support/config-fragments/autobuild/sourcery-sh.config b/support/config-fragments/autobuild/sourcery-sh.config
new file mode 100644
index 0000000000..515fc8fbb1
--- /dev/null
+++ b/support/config-fragments/autobuild/sourcery-sh.config
@@ -0,0 +1,4 @@
+BR2_sh=y
+BR2_sh4a=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH=y
diff --git a/support/config-fragments/autobuild/sourcery-x86-64.config b/support/config-fragments/autobuild/sourcery-x86-64.config
new file mode 100644
index 0000000000..6c7ad4c5b7
--- /dev/null
+++ b/support/config-fragments/autobuild/sourcery-x86-64.config
@@ -0,0 +1,4 @@
+BR2_x86_64=y
+BR2_x86_steamroller=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64=y
diff --git a/support/config-fragments/autobuild/sourcery-x86.config b/support/config-fragments/autobuild/sourcery-x86.config
new file mode 100644
index 0000000000..ad629f626b
--- /dev/null
+++ b/support/config-fragments/autobuild/sourcery-x86.config
@@ -0,0 +1,3 @@
+BR2_x86_pentium4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86=y
diff --git a/support/config-fragments/autobuild/x86_64-ctng_locales-linux-gnu.config b/support/config-fragments/autobuild/x86_64-ctng_locales-linux-gnu.config
new file mode 100644
index 0000000000..435034be27
--- /dev/null
+++ b/support/config-fragments/autobuild/x86_64-ctng_locales-linux-gnu.config
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
