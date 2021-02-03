From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 22:42:51 +0100
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: use
 Bootlin toolchain for Xtensa uclibc
Message-ID: <20210203212740.245748635A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcb2747d65ff44bcea5bab057647044112f3aa03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using an external toolchain built specifically for the
autobuilders to test Xtensa/uclibc, use a pre-built Bootlin toolchain.

To be noted: that fragment was in fact already using a Bootlin
bleeding-edge toolchain, because BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y is
missing from the fragment:

    $ cat support/config-fragments/autobuild/br-xtensa-full.config >.config

    $ make olddefconfig

    $ grep BOOTLIN .config
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_BLEEDING_EDGE=y
    # BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE is not set

The original fragment was supposed to use a stable toolchain, so we
switch to explictly use a stable Bootlin toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr:
  - add blurb about missing BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/config-fragments/autobuild/bootlin-xtensa-uclibc.config | 3 +++
 support/config-fragments/autobuild/br-xtensa-full.config        | 9 ---------
 support/config-fragments/autobuild/toolchain-configs.csv        | 2 +-
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/support/config-fragments/autobuild/bootlin-xtensa-uclibc.config b/support/config-fragments/autobuild/bootlin-xtensa-uclibc.config
new file mode 100644
index 0000000000..7975287456
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-xtensa-uclibc.config
@@ -0,0 +1,3 @@
+BR2_xtensa=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_XTENSA_LX60_UCLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-xtensa-full.config b/support/config-fragments/autobuild/br-xtensa-full.config
deleted file mode 100644
index 9d0092143c..0000000000
--- a/support/config-fragments/autobuild/br-xtensa-full.config
+++ /dev/null
@@ -1,9 +0,0 @@
-BR2_xtensa=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2020.02.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 36de0168d8..c0b10e3e03 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -42,6 +42,7 @@ support/config-fragments/autobuild/bootlin-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-sparc64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-uclibc.config,x86_64
+support/config-fragments/autobuild/bootlin-xtensa-uclibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
 support/config-fragments/autobuild/br-arc-internal-glibc.config,any
 support/config-fragments/autobuild/br-arm-basic.config,x86_64
@@ -61,7 +62,6 @@ support/config-fragments/autobuild/br-riscv64.config,x86_64
 support/config-fragments/autobuild/br-riscv64-full-internal.config,any
 support/config-fragments/autobuild/br-riscv64-musl.config,x86_64
 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config,any
-support/config-fragments/autobuild/br-xtensa-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
 support/config-fragments/autobuild/linaro-aarch64.config,x86
 support/config-fragments/autobuild/linaro-aarch64-be.config,x86
