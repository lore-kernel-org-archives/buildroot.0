From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Dec 2013 18:20:56 +0100
Subject: [Buildroot] [PATCH 13/16] toolchain: enable microblaze toolchain
In-Reply-To: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386264059-14057-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Spenser Gilliland <spenser@gillilanding.com>

This commit allows to build an internal toolchain for the Microblaze
architecture, with either glibc or eglibc.

Note that we add an explicit list of architectures that are supported
by uClibc, and Microblaze is not part of them, because it currently
doesn't build for this architecture.

[Thomas: add better commit log, add architecture dependencies on
uClibc, to avoid selecting uClibc on Microblaze]

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in                     | 2 +-
 toolchain/toolchain-buildroot/Config.in | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3980d79..bbfd367 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -35,7 +35,7 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
-	depends on !BR2_microblaze && !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_aarch64 && !BR2_nios2
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 94df0ff..cd88889 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -10,6 +10,11 @@ choice
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc"
 	select BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_arcle   || BR2_arceb  || BR2_arm    || BR2_armeb    || \
+		   BR2_avr32   || BR2_bfin   || BR2_i386   || BR2_m68k     || \
+		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
+		   BR2_powerpc || BR2_sh     || BR2_sparc  || BR2_xtensa   || \
+		   BR2_x86_64
 	help
 	  This option selects uClibc as the C library for the
 	  cross-compilation toolchain.
@@ -22,7 +27,7 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
-		   BR2_x86_64
+		   BR2_x86_64 || BR2_microblaze
 	depends on BR2_USE_MMU
 	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_USES_GLIBC
@@ -40,7 +45,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
-		   BR2_x86_64
+		   BR2_x86_64 || BR2_microblaze
 	select BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_PREFER_STATIC_LIB
 	# our glibc.mk enables RPC support
-- 
1.8.1.2
