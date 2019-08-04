From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 08:55:10 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: set
 gcc version for RISC-V toolchains
Message-ID: <20190804065227.9EE0881838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc938c221d36c2dd7d22cfd19259662d823a2376
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Prior to b3ba26150d49dbc6b06ad402c5f6fbd398a71451
("toolchain/toolchain-external/toolchain-external-custom: be more
flexible on gcc version"), the default gcc version selected by
Buildroot for custom external toolchain was affected by the
BR2_ARCH_NEEDS_GCC_AT_LEAST_xyz definitions.

Since BR2_riscv selects BR2_ARCH_NEEDS_GCC_AT_LEAST_7, gcc 7.x was the
default gcc version assumed to be used in a custom RISC-V external
toolchain, so our config snippets for RISC-V toolchains were correct.

With b3ba26150d49dbc6b06ad402c5f6fbd398a71451 applied, the default gcc
version assumed for custom external toolchains is the latest one
(currently gcc 9.x), while our RISC-V toolchains use gcc 7.x. So we
now need to explicitly give the gcc version used by our RISC-V
toolchains, otherwise the build fails with:

  Incorrect selection of gcc version: expected 9.x, got 7.4.0

Fixes:

  http://autobuild.buildroot.net/results/b872befe1adec2633b9cbcc49bc0eb7619f606c2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/br-riscv32.config | 1 +
 support/config-fragments/autobuild/br-riscv64.config | 1 +
 2 files changed, 2 insertions(+)

diff --git a/support/config-fragments/autobuild/br-riscv32.config b/support/config-fragments/autobuild/br-riscv32.config
index c64dd79b4d..cea472400b 100644
--- a/support/config-fragments/autobuild/br-riscv32.config
+++ b/support/config-fragments/autobuild/br-riscv32.config
@@ -3,6 +3,7 @@ BR2_RISCV_32=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
 BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv32-glibc-2019.05.1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_0=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-riscv64.config b/support/config-fragments/autobuild/br-riscv64.config
index 4c156e9e34..2b6ba7094d 100644
--- a/support/config-fragments/autobuild/br-riscv64.config
+++ b/support/config-fragments/autobuild/br-riscv64.config
@@ -2,6 +2,7 @@ BR2_riscv=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
 BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-glibc-2019.05.1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
