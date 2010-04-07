From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Apr 2010 09:49:20 +0200
Subject: [Buildroot] [git commit master] toolchain: fix using external
	toolchains built with buildroot
Message-ID: <20100407075141.8E5452CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6db57c69360087b3b7b8fc2b7764d2911ec24d43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The toolchains built with buildroot use specially crafted paths for their
sysroot and prefix. Fix that by asking gcc where it finds a file we
know by relative path to the sysroot.

This has the side effect of greatly simplifying the sysroot detection
in every cases tested so far (BR toolchains, CT-NG toolchains, and
CodeSourcery toolchains).

Fixes bug #851.

Thanks Thomas Petazzoni for the hint and some testings.
Thanks Grant Edwards for the report and the comments.

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                  |    3 ++-
 toolchain/external-toolchain/ext-tool.mk |    9 +--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index 34f47a0..2ffd672 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 
 	Toolchain: uClibc 0.9.30.3 / 0.9.31, older 0.9.30.x removed.
 	2.6.33 kernel headers, binutils 2.20.1, removed broken nios2
-	support.
+	support, improved external toolchain support.
 
 	X.org updated to 7.5.
 
@@ -23,6 +23,7 @@
 	#800: [PATCH] iperf update to 2.0.4
 	#805: [PATCH] mdadm - version update
 	#817: integrator926_defconfig uses unsupported uboot board name
+	#851: Add option to specify --sysroot value for external toolchain
 	#1105: Add new netperf package
 	#1111: Bump wget to 1.12 and migrate to Makefile.autotools.in
 	#1117: Bump nano to 2.2.3 and migrate to Makefile.autotools.in
diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 80bdae6..4493281 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -205,14 +205,7 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 EXTERNAL_LIBS+=libstdc++.so
 endif
 
-# This dance is needed because the toolchain may have been relocated, so the
-# configured paths may no longer match; fortunately, the sysroot moves along
-# the toolchain, so is always at the same place relative to the toolchain's
-# current location.
-CFG_PREFIX_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--prefix=" | cut -f2 -d=)
-CFG_SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot=" | cut -f2 -d=)
-REL_SYSROOT_DIR=$(shell echo "$(CFG_SYSROOT_DIR)" |sed -r -e 's:^$(CFG_PREFIX_DIR)::;')
-SYSROOT_DIR=$(TOOLCHAIN_EXTERNAL_PATH)/$(REL_SYSROOT_DIR)
+SYSROOT_DIR=$(shell readlink -f $$(LANG=C $(TARGET_CC) -print-file-name=libc.a |sed -r -e 's:usr/lib/libc\.a::;'))
 
 $(STAMP_DIR)/ext-toolchain-installed:
 	@echo "Checking external toolchain settings"
-- 
1.6.3.3
