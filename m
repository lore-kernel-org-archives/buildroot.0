From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Fri,  1 Nov 2019 12:03:37 -0700
Subject: [Buildroot] [PATCH] toolchain,
 glibc: Allow ARC big endian glibc builds
Message-ID: <20191101190337.13411-1-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apparently big endian glibc builds just work, if we let the endian
header allow that (which prev was #error).

So this patch bumps glibc to version which fixes the header (this
hopefully will become arc-2019.09-release) and then enables arceb
in glibc toolchain builds

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 package/glibc/glibc.mk                  | 2 +-
 toolchain/toolchain-buildroot/Config.in | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index d46063c5d111..754408881397 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_arc),y)
-GLIBC_VERSION =  arc-2019.03-release
+GLIBC_VERSION = ec681dddfa99894513c85da7d5d257b60d04f915
 GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VERSION))
 else ifeq ($(BR2_RISCV_32),y)
 GLIBC_VERSION = 06983fe52cfe8e4779035c27e8cc5d2caab31531
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index c0612bf04176..587e097a9c92 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -48,7 +48,8 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
 		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
 		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
-		   (BR2_arcle && BR2_ARC_ATOMIC_EXT) || BR2_csky
+		   ((BR2_arcle || BR2_arceb) && BR2_ARC_ATOMIC_EXT)     || \
+		   BR2_csky
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-- 
2.20.1
