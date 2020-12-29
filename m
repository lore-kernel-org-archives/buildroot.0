From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 23:28:57 +0100
Subject: [Buildroot] [git commit] package/glibc,
 toolchain/toolchain-buildroot: disable native RPC in glibc
 toolchains
Message-ID: <20201229221232.EAD778353E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9853983336b0b5a80ee0318f19d0f7143e8dd722
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for obsolete RPC was dropped in glibc 2.14 (2011-05-31), then
reinstated and marked obsolete in glibc 2.16 (2012-06-30), and finally
dropped for good in 2.32 (2020-08-04), which we are about to start
using.

In preparation for that, drop the usage of obsolete RPC support in
glibc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr: add a bit of history]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glibc/glibc.mk                  | 1 -
 toolchain/toolchain-buildroot/Config.in | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4721177d83..d51dce89f5 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -137,7 +137,6 @@ define GLIBC_CONFIGURE_CMDS
 		--disable-profile \
 		--disable-werror \
 		--without-gd \
-		--enable-obsolete-rpc \
 		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
 		--with-headers=$(STAGING_DIR)/usr/include)
 	$(GLIBC_ADD_MISSING_STUB_H)
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index f6f1bcc75d..4004c0edf8 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -60,9 +60,6 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	depends on !BR2_powerpc_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
 	select BR2_TOOLCHAIN_USES_GLIBC
-	# our glibc.mk enables RPC support, except for riscv32 and arc
-	# that don't have it anymore (glibc 2.32+)
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC if !BR2_RISCV_32 && !BR2_arc
 	help
 	  This option selects glibc as the C library for the
 	  cross-compilation toolchain.
