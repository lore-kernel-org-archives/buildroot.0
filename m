From: guoren at kernel.org <guoren@kernel.org>
Date: Wed,  8 May 2019 16:58:33 +0800
Subject: [Buildroot] [PATCH V2 7/9] package/glibc: Add C-SKY support
In-Reply-To: <1557305915-11247-1-git-send-email-guoren@kernel.org>
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
Message-ID: <1557305915-11247-7-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

Add glibc build for C-SKY Architecture.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 package/glibc/glibc.hash                | 2 ++
 package/glibc/glibc.mk                  | 3 +++
 toolchain/toolchain-buildroot/Config.in | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 5316f03..6e47559 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,2 +1,4 @@
 # This hash file is not used; instead, update the
 # hash files in the per-version sub-directories.
+# Locally calculated (fetched from https://github.com/c-sky/glibc)
+sha512 9deb2deceefe347d72de13510a5baa3de00f94c684f3b25e136ca3660f61e65a69f2115abb488c2ab0fa93cda8535853ce1e13e186efcc8434ecc4049efd82b5  glibc-7630ed2fa60caea98f500e4a7a51b88f9bf1e176.tar.gz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0345f1f..c4ddf8b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -10,6 +10,9 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
 else ifeq ($(BR2_RISCV_32),y)
 GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
 GLIBC_SITE = $(call github,riscv,riscv-glibc,$(GLIBC_VERSION))
+else ifeq ($(BR2_csky),y)
+GLIBC_VERSION = 7630ed2fa60caea98f500e4a7a51b88f9bf1e176
+GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index beb17a2..d9f16e2 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -48,7 +48,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
 		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
 		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
-		   (BR2_arcle && BR2_ARC_ATOMIC_EXT)
+		   (BR2_arcle && BR2_ARC_ATOMIC_EXT) || BR2_csky
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-- 
2.7.4
