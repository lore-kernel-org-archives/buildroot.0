From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 21:56:24 +0200
Subject: [Buildroot] [git commit] support/config-fragments: fix br-riscv{32,
 64} toolchain fragments
Message-ID: <20190923195335.D3D2D8F179@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f89871e81085fe955f4fe602070dc32628d30f3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit aee39cbf27e833fad9962eb99b5655dbadcfee60 ("arch/riscv:
set the default float ABI based on ISA extensions"), RISC-V 32/64 use
the lp32d/lp64d ABIs by default. But our pre-built external toolchains
were built with the LP32/LP64 ABI.

Building with lp32d/lp64d gcc flags, but a toolchain built with the
LP32/LP64 ABI causes a number of failures such as:

  /home/mark/buildroot-test/instance-1/output/host/riscv64-buildroot-linux-gnu/sysroot/usr/include/gnu/stubs.h:11:11: fatal error: gnu/stubs-lp64d.h: No such file or directory

or:

  /home/mark/buildroot-test/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-gnu/7.4.0/../../../../riscv64-buildroot-linux-gnu/bin/ld: /tmp/cc2BTtFE.o: can't link hard-float modules with soft-float modules
  /home/mark/buildroot-test/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-gnu/7.4.0/../../../../riscv64-buildroot-linux-gnu/bin/ld: failed to merge target specific data of file /tmp/cc2BTtFE.o

So let's fix our config fragments to reflect the ABIs those toolchains
were built with.

Fixes:

  http://autobuild.buildroot.net/results/a3959b0613cf561059483abc580b144be4817d1a/ (libsepol)
  http://autobuild.buildroot.net/results/3db50d8a0a913413b2198d6c301419136d2d22a7/ (attr)
  http://autobuild.buildroot.net/results/7780fada05b8440ae3e97618615624a6a2dac03f/ (libusb)
  and many others

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-riscv32.config | 1 +
 support/config-fragments/autobuild/br-riscv64.config | 1 +
 2 files changed, 2 insertions(+)

diff --git a/support/config-fragments/autobuild/br-riscv32.config b/support/config-fragments/autobuild/br-riscv32.config
index cea472400b..e34f7b4aad 100644
--- a/support/config-fragments/autobuild/br-riscv32.config
+++ b/support/config-fragments/autobuild/br-riscv32.config
@@ -1,5 +1,6 @@
 BR2_riscv=y
 BR2_RISCV_32=y
+BR2_RISCV_ABI_ILP32=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
 BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv32-glibc-2019.05.1.tar.bz2"
diff --git a/support/config-fragments/autobuild/br-riscv64.config b/support/config-fragments/autobuild/br-riscv64.config
index 2b6ba7094d..7c98512694 100644
--- a/support/config-fragments/autobuild/br-riscv64.config
+++ b/support/config-fragments/autobuild/br-riscv64.config
@@ -1,4 +1,5 @@
 BR2_riscv=y
+BR2_RISCV_ABI_LP64=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
 BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-glibc-2019.05.1.tar.bz2"
