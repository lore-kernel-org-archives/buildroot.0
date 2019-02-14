From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Feb 2019 11:36:19 +0100
Subject: [Buildroot] [PATCH 2/2] support/config-fragments/autobuild: use
 external toolchains in RISC-V configs
In-Reply-To: <20190214103619.31068-1-thomas.petazzoni@bootlin.com>
References: <20190214103619.31068-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190214103619.31068-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit replaces the two RISC-V configurations used for the
autobuilders to use pre-built external toolchains rather than internal
toolchains. This saves quite a bit of build time in the autobuilders,
and also allows people to reproduce build issues in a much more
efficient, since rebuilding the toolchain is not needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mark Corbin <mark.corbin@embecosm.com>
---
 .../autobuild/br-riscv32-internal-glibc.config            | 3 ---
 support/config-fragments/autobuild/br-riscv32.config      | 8 ++++++++
 .../autobuild/br-riscv64-internal-glibc.config            | 3 ---
 support/config-fragments/autobuild/br-riscv64.config      | 7 +++++++
 support/config-fragments/autobuild/toolchain-configs.csv  | 4 ++--
 5 files changed, 17 insertions(+), 8 deletions(-)
 delete mode 100644 support/config-fragments/autobuild/br-riscv32-internal-glibc.config
 create mode 100644 support/config-fragments/autobuild/br-riscv32.config
 delete mode 100644 support/config-fragments/autobuild/br-riscv64-internal-glibc.config
 create mode 100644 support/config-fragments/autobuild/br-riscv64.config

diff --git a/support/config-fragments/autobuild/br-riscv32-internal-glibc.config b/support/config-fragments/autobuild/br-riscv32-internal-glibc.config
deleted file mode 100644
index c5348a28da..0000000000
--- a/support/config-fragments/autobuild/br-riscv32-internal-glibc.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_riscv=y
-BR2_RISCV_32=y
-BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-riscv32.config b/support/config-fragments/autobuild/br-riscv32.config
new file mode 100644
index 0000000000..9565a0b70b
--- /dev/null
+++ b/support/config-fragments/autobuild/br-riscv32.config
@@ -0,0 +1,8 @@
+BR2_riscv=y
+BR2_RISCV_32=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv32-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-riscv64-internal-glibc.config b/support/config-fragments/autobuild/br-riscv64-internal-glibc.config
deleted file mode 100644
index d952c73a86..0000000000
--- a/support/config-fragments/autobuild/br-riscv64-internal-glibc.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_riscv=y
-BR2_RISCV_64=y
-BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
diff --git a/support/config-fragments/autobuild/br-riscv64.config b/support/config-fragments/autobuild/br-riscv64.config
new file mode 100644
index 0000000000..61912cfd7b
--- /dev/null
+++ b/support/config-fragments/autobuild/br-riscv64.config
@@ -0,0 +1,7 @@
+BR2_riscv=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-2019.02-rc1.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 3681bc519f..c51335ac63 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -51,8 +51,8 @@ support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config,x86_64
 support/config-fragments/autobuild/br-powerpc-e500mc-full.config,x86_64
 support/config-fragments/autobuild/br-powerpc-internal-full.config,any
-support/config-fragments/autobuild/br-riscv32-internal-glibc.config,any
-support/config-fragments/autobuild/br-riscv64-internal-glibc.config,any
+support/config-fragments/autobuild/br-riscv32.config,x86_64
+support/config-fragments/autobuild/br-riscv64.config,x86_64
 support/config-fragments/autobuild/br-sh4-full.config,x86_64
 support/config-fragments/autobuild/br-sparc-uclibc.config,x86_64
 support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
-- 
2.20.1
