From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 26 Mar 2017 21:43:15 +0200
Subject: [Buildroot] [PATCH 2/2] configs: add autobuild configs
In-Reply-To: <20170326194315.17791-1-arnout@mind.be>
References: <20170326194315.17791-1-arnout@mind.be>
Message-ID: <20170326194315.17791-2-arnout@mind.be>
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

The toolchain-configs.csv file also contained additional information:
the hostarch required by the toolchain binary, and the libc used. The
latter can be found in the defconfig itself, but the hostarch isn't in
there. To avoid still having to maintain a separate file, we just add a
BR2_HOSTARCH string to the defconfig file. When the defconfig is used
this string is completely ignored, but it can be used by the
autobuild-run script.

[1] http://autobuild.buildroot.net/toolchains/configs/toolchain-configs.csv

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
The changes to the autobuild-run script still have to be done. It's not
entirely trivial :-) so I didn't feel up to it.

Instead of this approach, I also considered adding the
buildroot-generated toolchains as external toolchains to the menus.
However, then there would still be a need for config files that specify
the subarch used, as well as e.g. STATIC. While with this approach the
entire toolchains/configs directory can be removed from
autobuild.buildroot.net.
---
 .../autobuild/armv5-ctng-linux-gnueabi_defconfig   | 11 ++++++++++
 .../autobuild/armv7-ctng-linux-gnueabihf_defconfig | 14 +++++++++++++
 configs/autobuild/br-aarch64-glibc_defconfig       | 10 +++++++++
 configs/autobuild/br-arc-full-internal_defconfig   |  4 ++++
 configs/autobuild/br-arcle-hs38_defconfig          | 12 +++++++++++
 configs/autobuild/br-arm-basic_defconfig           |  9 ++++++++
 configs/autobuild/br-arm-cortex-a9-glibc_defconfig | 12 +++++++++++
 configs/autobuild/br-arm-cortex-a9-musl_defconfig  | 12 +++++++++++
 configs/autobuild/br-arm-cortex-m4-full_defconfig  | 14 +++++++++++++
 configs/autobuild/br-arm-full-nothread_defconfig   | 13 ++++++++++++
 configs/autobuild/br-arm-full-static_defconfig     | 13 ++++++++++++
 configs/autobuild/br-arm-full_defconfig            | 12 +++++++++++
 configs/autobuild/br-arm-internal-full_defconfig   |  7 +++++++
 configs/autobuild/br-bfin-full_defconfig           | 14 +++++++++++++
 .../autobuild/br-i386-pentium-mmx-musl_defconfig   | 11 ++++++++++
 configs/autobuild/br-i386-pentium4-full_defconfig  | 12 +++++++++++
 configs/autobuild/br-m68k-5208-full_defconfig      | 13 ++++++++++++
 configs/autobuild/br-m68k-68040-full_defconfig     | 12 +++++++++++
 .../br-microblazeel-full-internal_defconfig        |  1 +
 configs/autobuild/br-microblazeel-full_defconfig   | 12 +++++++++++
 .../autobuild/br-mips32r6-el-hf-glibc_defconfig    | 12 +++++++++++
 configs/autobuild/br-mips64-n64-full_defconfig     | 12 +++++++++++
 .../autobuild/br-mips64r6-el-hf-glibc_defconfig    | 13 ++++++++++++
 configs/autobuild/br-mipsel-o32-full_defconfig     | 12 +++++++++++
 configs/autobuild/br-nios2-glibc_defconfig         | 10 +++++++++
 configs/autobuild/br-openrisc-uclibc_defconfig     | 12 +++++++++++
 .../autobuild/br-powerpc-603e-basic-cpp_defconfig  | 11 ++++++++++
 configs/autobuild/br-powerpc-e500mc-full_defconfig | 13 ++++++++++++
 .../autobuild/br-powerpc-internal-full_defconfig   |  5 +++++
 .../autobuild/br-powerpc64-power7-glibc_defconfig  | 10 +++++++++
 .../br-powerpc64le-power8-glibc_defconfig          | 10 +++++++++
 configs/autobuild/br-sh4-full_defconfig            | 12 +++++++++++
 configs/autobuild/br-sparc-uclibc_defconfig        | 11 ++++++++++
 configs/autobuild/br-sparc64-glibc_defconfig       |  9 ++++++++
 configs/autobuild/br-x86-64-core2-full_defconfig   | 13 ++++++++++++
 configs/autobuild/br-x86-64-musl_defconfig         | 11 ++++++++++
 .../autobuild/br-xtensa-full-internal_defconfig    |  5 +++++
 configs/autobuild/br-xtensa-full_defconfig         | 11 ++++++++++
 configs/autobuild/i686-ctng-linux-gnu_defconfig    | 11 ++++++++++
 configs/autobuild/linaro-aarch64_defconfig         |  3 +++
 configs/autobuild/linaro-arm_defconfig             |  5 +++++
 .../mips64el-ctng_n32-linux-gnu_defconfig          | 10 +++++++++
 .../mips64el-ctng_n64-linux-gnu_defconfig          | 12 +++++++++++
 .../powerpc-ctng_e500v2-linux-gnuspe_defconfig     | 12 +++++++++++
 configs/autobuild/sourcery-arm-armv4t_defconfig    |  5 +++++
 configs/autobuild/sourcery-arm-thumb2_defconfig    |  7 +++++++
 configs/autobuild/sourcery-arm_defconfig           |  4 ++++
 configs/autobuild/sourcery-mips64_defconfig        |  6 ++++++
 configs/autobuild/sourcery-mips_defconfig          |  5 +++++
 configs/autobuild/sourcery-nios2_defconfig         |  3 +++
 configs/autobuild/sourcery-sh_defconfig            |  5 +++++
 configs/autobuild/sourcery-x86-64_defconfig        |  5 +++++
 configs/autobuild/sourcery-x86_defconfig           |  4 ++++
 .../x86_64-ctng_locales-linux-gnu_defconfig        | 24 ++++++++++++++++++++++
 54 files changed, 531 insertions(+)
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
index 0000000000..eb17e100a3
--- /dev/null
+++ b/configs/autobuild/armv5-ctng-linux-gnueabi_defconfig
@@ -0,0 +1,11 @@
+BR2_HOSTARCH="x86"
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
index 0000000000..f3c8732ff3
--- /dev/null
+++ b/configs/autobuild/armv7-ctng-linux-gnueabihf_defconfig
@@ -0,0 +1,14 @@
+BR2_HOSTARCH="x86"
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
index 0000000000..30560d2a26
--- /dev/null
+++ b/configs/autobuild/br-aarch64-glibc_defconfig
@@ -0,0 +1,10 @@
+BR2_HOSTARCH="x86_64"
+BR2_aarch64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-aarch64-glibc-2017.02-102-g6ce3806.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arc-full-internal_defconfig b/configs/autobuild/br-arc-full-internal_defconfig
new file mode 100644
index 0000000000..87f208bb65
--- /dev/null
+++ b/configs/autobuild/br-arc-full-internal_defconfig
@@ -0,0 +1,4 @@
+BR2_arcle=y
+BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/autobuild/br-arcle-hs38_defconfig b/configs/autobuild/br-arcle-hs38_defconfig
new file mode 100644
index 0000000000..ad64e4b582
--- /dev/null
+++ b/configs/autobuild/br-arcle-hs38_defconfig
@@ -0,0 +1,12 @@
+BR2_HOSTARCH="x86_64"
+BR2_arcle=y
+BR2_archs38=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2017.02-102-g6ce3806.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arm-basic_defconfig b/configs/autobuild/br-arm-basic_defconfig
new file mode 100644
index 0000000000..4b278925aa
--- /dev/null
+++ b/configs/autobuild/br-arm-basic_defconfig
@@ -0,0 +1,9 @@
+BR2_HOSTARCH="x86_64"
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2017.02-rc1-70-g7612a7d.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
diff --git a/configs/autobuild/br-arm-cortex-a9-glibc_defconfig b/configs/autobuild/br-arm-cortex-a9-glibc_defconfig
new file mode 100644
index 0000000000..8c5d808e55
--- /dev/null
+++ b/configs/autobuild/br-arm-cortex-a9-glibc_defconfig
@@ -0,0 +1,12 @@
+BR2_HOSTARCH="x86_64"
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_VFP=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2017.02-102-g6ce3806.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arm-cortex-a9-musl_defconfig b/configs/autobuild/br-arm-cortex-a9-musl_defconfig
new file mode 100644
index 0000000000..d5937a8407
--- /dev/null
+++ b/configs/autobuild/br-arm-cortex-a9-musl_defconfig
@@ -0,0 +1,12 @@
+BR2_HOSTARCH="x86_64"
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_VFP=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.02-rc1-2-g133c5ac.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arm-cortex-m4-full_defconfig b/configs/autobuild/br-arm-cortex-m4-full_defconfig
new file mode 100644
index 0000000000..53f5c6686d
--- /dev/null
+++ b/configs/autobuild/br-arm-cortex-m4-full_defconfig
@@ -0,0 +1,14 @@
+BR2_HOSTARCH="x86_64"
+BR2_arm=y
+BR2_cortex_m4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-m4-full-2017.02-rc1-70-g7612a7d.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arm-full-nothread_defconfig b/configs/autobuild/br-arm-full-nothread_defconfig
new file mode 100644
index 0000000000..a0d3775c0b
--- /dev/null
+++ b/configs/autobuild/br-arm-full-nothread_defconfig
@@ -0,0 +1,13 @@
+BR2_HOSTARCH="x86_64"
+BR2_arm=y
+BR2_arm1176jzf_s=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2017.02-rc1-70-g7612a7d.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arm-full-static_defconfig b/configs/autobuild/br-arm-full-static_defconfig
new file mode 100644
index 0000000000..c5af08f043
--- /dev/null
+++ b/configs/autobuild/br-arm-full-static_defconfig
@@ -0,0 +1,13 @@
+BR2_HOSTARCH="x86_64"
+BR2_arm=y
+BR2_STATIC_LIBS=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2017.02-rc1-70-g7612a7d.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arm-full_defconfig b/configs/autobuild/br-arm-full_defconfig
new file mode 100644
index 0000000000..a4a0371c16
--- /dev/null
+++ b/configs/autobuild/br-arm-full_defconfig
@@ -0,0 +1,12 @@
+BR2_HOSTARCH="x86_64"
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.02-rc1-70-g7612a7d.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-arm-internal-full_defconfig b/configs/autobuild/br-arm-internal-full_defconfig
new file mode 100644
index 0000000000..8ff6e8689a
--- /dev/null
+++ b/configs/autobuild/br-arm-internal-full_defconfig
@@ -0,0 +1,7 @@
+BR2_arm=y
+BR2_ARM_EABI=y
+BR2_UCLIBC_VERSION_NG=y
+BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/autobuild/br-bfin-full_defconfig b/configs/autobuild/br-bfin-full_defconfig
new file mode 100644
index 0000000000..74ade4d802
--- /dev/null
+++ b/configs/autobuild/br-bfin-full_defconfig
@@ -0,0 +1,14 @@
+BR2_HOSTARCH="x86_64"
+BR2_bfin=y
+BR2_bf512=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-bfin-full-2017.02-rc1-2-g133c5ac.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-i386-pentium-mmx-musl_defconfig b/configs/autobuild/br-i386-pentium-mmx-musl_defconfig
new file mode 100644
index 0000000000..94b0b45768
--- /dev/null
+++ b/configs/autobuild/br-i386-pentium-mmx-musl_defconfig
@@ -0,0 +1,11 @@
+BR2_HOSTARCH="x86_64"
+BR2_x86_pentium_mmx=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-i386-pentium-mmx-musl-2017.02-rc1-33-g1ed5524.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_18=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_SSP is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-i386-pentium4-full_defconfig b/configs/autobuild/br-i386-pentium4-full_defconfig
new file mode 100644
index 0000000000..d725c967d8
--- /dev/null
+++ b/configs/autobuild/br-i386-pentium4-full_defconfig
@@ -0,0 +1,12 @@
+BR2_HOSTARCH="x86_64"
+BR2_x86_pentium4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2017.02-rc1-2-g133c5ac.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-m68k-5208-full_defconfig b/configs/autobuild/br-m68k-5208-full_defconfig
new file mode 100644
index 0000000000..f11a3fa8ba
--- /dev/null
+++ b/configs/autobuild/br-m68k-5208-full_defconfig
@@ -0,0 +1,13 @@
+BR2_HOSTARCH="x86_64"
+BR2_m68k=y
+BR2_m68k_cf5208=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-5208-full-2017.02-rc1-2-g133c5ac.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-m68k-68040-full_defconfig b/configs/autobuild/br-m68k-68040-full_defconfig
new file mode 100644
index 0000000000..c9037140ae
--- /dev/null
+++ b/configs/autobuild/br-m68k-68040-full_defconfig
@@ -0,0 +1,12 @@
+BR2_HOSTARCH="x86_64"
+BR2_m68k=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-m68k-68040-full-2017.02-rc1-2-g133c5ac.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
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
index 0000000000..8896def98c
--- /dev/null
+++ b/configs/autobuild/br-microblazeel-full_defconfig
@@ -0,0 +1,12 @@
+BR2_HOSTARCH="x86_64"
+BR2_microblazeel=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-microblaze-full-2017.02-rc2-36-g7f5556c.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_18=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-mips32r6-el-hf-glibc_defconfig b/configs/autobuild/br-mips32r6-el-hf-glibc_defconfig
new file mode 100644
index 0000000000..7df1b96218
--- /dev/null
+++ b/configs/autobuild/br-mips32r6-el-hf-glibc_defconfig
@@ -0,0 +1,12 @@
+BR2_HOSTARCH="x86_64"
+BR2_mipsel=y
+BR2_mips_32r6=y
+# BR2_MIPS_SOFT_FLOAT is not set
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips32r6-el-hf-2017.02-102-g6ce3806.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-mips64-n64-full_defconfig b/configs/autobuild/br-mips64-n64-full_defconfig
new file mode 100644
index 0000000000..1904606ab6
--- /dev/null
+++ b/configs/autobuild/br-mips64-n64-full_defconfig
@@ -0,0 +1,12 @@
+BR2_HOSTARCH="x86_64"
+BR2_mips64el=y
+BR2_MIPS_NABI64=y
+# BR2_MIPS_SOFT_FLOAT is not set
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64-n64-full-2017.02-rc1-2-g133c5ac.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-mips64r6-el-hf-glibc_defconfig b/configs/autobuild/br-mips64r6-el-hf-glibc_defconfig
new file mode 100644
index 0000000000..28202a01f3
--- /dev/null
+++ b/configs/autobuild/br-mips64r6-el-hf-glibc_defconfig
@@ -0,0 +1,13 @@
+BR2_HOSTARCH="x86_64"
+BR2_mips64el=y
+BR2_mips_64r6=y
+BR2_MIPS_NABI64=y
+# BR2_MIPS_SOFT_FLOAT is not set
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64r6-n64-el-hf-2017.02-102-g6ce3806.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-mipsel-o32-full_defconfig b/configs/autobuild/br-mipsel-o32-full_defconfig
new file mode 100644
index 0000000000..67969b4e6b
--- /dev/null
+++ b/configs/autobuild/br-mipsel-o32-full_defconfig
@@ -0,0 +1,12 @@
+BR2_HOSTARCH="x86_64"
+BR2_mipsel=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2017.02-rc1-2-g133c5ac.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-nios2-glibc_defconfig b/configs/autobuild/br-nios2-glibc_defconfig
new file mode 100644
index 0000000000..e77feeae82
--- /dev/null
+++ b/configs/autobuild/br-nios2-glibc_defconfig
@@ -0,0 +1,10 @@
+BR2_HOSTARCH="x86_64"
+BR2_nios2=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-nios2-full-2017.02-102-g6ce3806.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-openrisc-uclibc_defconfig b/configs/autobuild/br-openrisc-uclibc_defconfig
new file mode 100644
index 0000000000..4e523d6838
--- /dev/null
+++ b/configs/autobuild/br-openrisc-uclibc_defconfig
@@ -0,0 +1,12 @@
+BR2_HOSTARCH="x86_64"
+BR2_or1k=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-openrisc-full-2017.02-rc2-2-g241609d.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-powerpc-603e-basic-cpp_defconfig b/configs/autobuild/br-powerpc-603e-basic-cpp_defconfig
new file mode 100644
index 0000000000..58ecae210e
--- /dev/null
+++ b/configs/autobuild/br-powerpc-603e-basic-cpp_defconfig
@@ -0,0 +1,11 @@
+BR2_HOSTARCH="x86_64"
+BR2_powerpc=y
+BR2_powerpc_603e=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-603e-basic-cpp-2017.02-rc1-2-g133c5ac.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-powerpc-e500mc-full_defconfig b/configs/autobuild/br-powerpc-e500mc-full_defconfig
new file mode 100644
index 0000000000..a7d8dfa851
--- /dev/null
+++ b/configs/autobuild/br-powerpc-e500mc-full_defconfig
@@ -0,0 +1,13 @@
+BR2_HOSTARCH="x86_64"
+BR2_powerpc=y
+BR2_powerpc_e500mc=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-powerpc-e500mc-full-2017.02-rc1-2-g133c5ac.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
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
index 0000000000..9a71df1043
--- /dev/null
+++ b/configs/autobuild/br-powerpc64-power7-glibc_defconfig
@@ -0,0 +1,10 @@
+BR2_HOSTARCH="x86_64"
+BR2_powerpc64=y
+BR2_powerpc_power7=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64-power7-glibc-2017.02-102-g6ce3806.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-powerpc64le-power8-glibc_defconfig b/configs/autobuild/br-powerpc64le-power8-glibc_defconfig
new file mode 100644
index 0000000000..137a3460a6
--- /dev/null
+++ b/configs/autobuild/br-powerpc64le-power8-glibc_defconfig
@@ -0,0 +1,10 @@
+BR2_HOSTARCH="x86_64"
+BR2_powerpc64le=y
+BR2_powerpc_power8=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-powerpc64le-power8-glibc-2017.02-102-g6ce3806.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-sh4-full_defconfig b/configs/autobuild/br-sh4-full_defconfig
new file mode 100644
index 0000000000..44d33b744f
--- /dev/null
+++ b/configs/autobuild/br-sh4-full_defconfig
@@ -0,0 +1,12 @@
+BR2_HOSTARCH="x86_64"
+BR2_sh=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sh4-full-2017.02-rc1-2-g133c5ac.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-sparc-uclibc_defconfig b/configs/autobuild/br-sparc-uclibc_defconfig
new file mode 100644
index 0000000000..0757679063
--- /dev/null
+++ b/configs/autobuild/br-sparc-uclibc_defconfig
@@ -0,0 +1,11 @@
+BR2_HOSTARCH="x86_64"
+BR2_sparc=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-uclibc-2017.02-rc1-2-g133c5ac.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-sparc64-glibc_defconfig b/configs/autobuild/br-sparc64-glibc_defconfig
new file mode 100644
index 0000000000..5cf34becb7
--- /dev/null
+++ b/configs/autobuild/br-sparc64-glibc_defconfig
@@ -0,0 +1,9 @@
+BR2_HOSTARCH="x86_64"
+BR2_sparc64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc64-full-2017.02-102-g6ce3806.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-x86-64-core2-full_defconfig b/configs/autobuild/br-x86-64-core2-full_defconfig
new file mode 100644
index 0000000000..c30a0f90a4
--- /dev/null
+++ b/configs/autobuild/br-x86-64-core2-full_defconfig
@@ -0,0 +1,13 @@
+BR2_HOSTARCH="x86_64"
+BR2_x86_64=y
+BR2_x86_core2=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2017.02-rc1-2-g133c5ac.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-x86-64-musl_defconfig b/configs/autobuild/br-x86-64-musl_defconfig
new file mode 100644
index 0000000000..e71f54d1e1
--- /dev/null
+++ b/configs/autobuild/br-x86-64-musl_defconfig
@@ -0,0 +1,11 @@
+BR2_HOSTARCH="x86_64"
+BR2_x86_64=y
+BR2_x86_atom=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2017.02-rc1-2-g133c5ac.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/br-xtensa-full-internal_defconfig b/configs/autobuild/br-xtensa-full-internal_defconfig
new file mode 100644
index 0000000000..23e631222f
--- /dev/null
+++ b/configs/autobuild/br-xtensa-full-internal_defconfig
@@ -0,0 +1,5 @@
+BR2_xtensa=y
+BR2_JLEVEL=8
+BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/configs/autobuild/br-xtensa-full_defconfig b/configs/autobuild/br-xtensa-full_defconfig
new file mode 100644
index 0000000000..c95d4e9864
--- /dev/null
+++ b/configs/autobuild/br-xtensa-full_defconfig
@@ -0,0 +1,11 @@
+BR2_HOSTARCH="x86_64"
+BR2_xtensa=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2017.02-rc1-2-g133c5ac.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/configs/autobuild/i686-ctng-linux-gnu_defconfig b/configs/autobuild/i686-ctng-linux-gnu_defconfig
new file mode 100644
index 0000000000..17fafb2c76
--- /dev/null
+++ b/configs/autobuild/i686-ctng-linux-gnu_defconfig
@@ -0,0 +1,11 @@
+BR2_HOSTARCH="x86"
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
index 0000000000..825836a564
--- /dev/null
+++ b/configs/autobuild/linaro-aarch64_defconfig
@@ -0,0 +1,3 @@
+BR2_HOSTARCH="x86"
+BR2_aarch64=y
+BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/configs/autobuild/linaro-arm_defconfig b/configs/autobuild/linaro-arm_defconfig
new file mode 100644
index 0000000000..7d5a20ba3a
--- /dev/null
+++ b/configs/autobuild/linaro-arm_defconfig
@@ -0,0 +1,5 @@
+BR2_HOSTARCH="x86"
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_ARM_EABIHF=y
+BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/configs/autobuild/mips64el-ctng_n32-linux-gnu_defconfig b/configs/autobuild/mips64el-ctng_n32-linux-gnu_defconfig
new file mode 100644
index 0000000000..d58bf34581
--- /dev/null
+++ b/configs/autobuild/mips64el-ctng_n32-linux-gnu_defconfig
@@ -0,0 +1,10 @@
+BR2_HOSTARCH="x86"
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
index 0000000000..19c3e3e859
--- /dev/null
+++ b/configs/autobuild/mips64el-ctng_n64-linux-gnu_defconfig
@@ -0,0 +1,12 @@
+BR2_HOSTARCH="x86"
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
index 0000000000..db8f44569d
--- /dev/null
+++ b/configs/autobuild/powerpc-ctng_e500v2-linux-gnuspe_defconfig
@@ -0,0 +1,12 @@
+BR2_HOSTARCH="x86"
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
index 0000000000..6d55ec50fb
--- /dev/null
+++ b/configs/autobuild/sourcery-arm-armv4t_defconfig
@@ -0,0 +1,5 @@
+BR2_HOSTARCH="x86"
+BR2_arm=y
+BR2_arm920t=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
diff --git a/configs/autobuild/sourcery-arm-thumb2_defconfig b/configs/autobuild/sourcery-arm-thumb2_defconfig
new file mode 100644
index 0000000000..45358800c5
--- /dev/null
+++ b/configs/autobuild/sourcery-arm-thumb2_defconfig
@@ -0,0 +1,7 @@
+BR2_HOSTARCH="x86"
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_ARM_EABI=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_OPTIMIZATION=""
diff --git a/configs/autobuild/sourcery-arm_defconfig b/configs/autobuild/sourcery-arm_defconfig
new file mode 100644
index 0000000000..d700ce096f
--- /dev/null
+++ b/configs/autobuild/sourcery-arm_defconfig
@@ -0,0 +1,4 @@
+BR2_HOSTARCH="x86"
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
diff --git a/configs/autobuild/sourcery-mips64_defconfig b/configs/autobuild/sourcery-mips64_defconfig
new file mode 100644
index 0000000000..92c58500d4
--- /dev/null
+++ b/configs/autobuild/sourcery-mips64_defconfig
@@ -0,0 +1,6 @@
+BR2_HOSTARCH="x86"
+BR2_mips64el=y
+BR2_mips_64r2=y
+BR2_MIPS_NABI64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS=y
diff --git a/configs/autobuild/sourcery-mips_defconfig b/configs/autobuild/sourcery-mips_defconfig
new file mode 100644
index 0000000000..d8fa742285
--- /dev/null
+++ b/configs/autobuild/sourcery-mips_defconfig
@@ -0,0 +1,5 @@
+BR2_HOSTARCH="x86"
+BR2_mips=y
+BR2_mips_32r2=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS=y
diff --git a/configs/autobuild/sourcery-nios2_defconfig b/configs/autobuild/sourcery-nios2_defconfig
new file mode 100644
index 0000000000..eb1731d3a8
--- /dev/null
+++ b/configs/autobuild/sourcery-nios2_defconfig
@@ -0,0 +1,3 @@
+BR2_HOSTARCH="x86"
+BR2_nios2=y
+BR2_TOOLCHAIN_EXTERNAL=y
diff --git a/configs/autobuild/sourcery-sh_defconfig b/configs/autobuild/sourcery-sh_defconfig
new file mode 100644
index 0000000000..d5a49b3e89
--- /dev/null
+++ b/configs/autobuild/sourcery-sh_defconfig
@@ -0,0 +1,5 @@
+BR2_HOSTARCH="x86"
+BR2_sh=y
+BR2_sh4a=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH=y
diff --git a/configs/autobuild/sourcery-x86-64_defconfig b/configs/autobuild/sourcery-x86-64_defconfig
new file mode 100644
index 0000000000..3cd67ac77f
--- /dev/null
+++ b/configs/autobuild/sourcery-x86-64_defconfig
@@ -0,0 +1,5 @@
+BR2_HOSTARCH="x86"
+BR2_x86_64=y
+BR2_x86_steamroller=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64=y
diff --git a/configs/autobuild/sourcery-x86_defconfig b/configs/autobuild/sourcery-x86_defconfig
new file mode 100644
index 0000000000..f60c4b1932
--- /dev/null
+++ b/configs/autobuild/sourcery-x86_defconfig
@@ -0,0 +1,4 @@
+BR2_HOSTARCH="x86"
+BR2_x86_pentium4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86=y
diff --git a/configs/autobuild/x86_64-ctng_locales-linux-gnu_defconfig b/configs/autobuild/x86_64-ctng_locales-linux-gnu_defconfig
new file mode 100644
index 0000000000..8489725794
--- /dev/null
+++ b/configs/autobuild/x86_64-ctng_locales-linux-gnu_defconfig
@@ -0,0 +1,24 @@
+BR2_HOSTARCH="x86"
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
+BR2_HOSTARCH="x86"
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
