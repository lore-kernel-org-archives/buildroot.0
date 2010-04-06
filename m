From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 07 Apr 2010 00:50:10 +0200
Subject: [Buildroot] [PATCH] toolchain: fix using external toolchains built
	with buildroot
In-Reply-To: <20100406224918.23853.83103.stgit@roazhon.bzh.lan>
References: <20100406224918.23853.83103.stgit@roazhon.bzh.lan>
Message-ID: <20100406225010.23853.36745.stgit@roazhon.bzh.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>

The toolchains built with buildroot use specially crafted paths for their
sysroot and prefix. Fix that by asking gcc where it finds a file we
know by relative path to the sysroot.

This has the side effect of greatly simplifying the sysroot detection
in every cases tested so far (BR toolchains, CT-NG toolchains, and
CodeSourcery toolchains).

Fixes bug #851.

Thanks Thomas Petazzoni for the hint and some testings.
Thanks Grant Edwards for the report and the comments.
---
 toolchain/external-toolchain/ext-tool.mk |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

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
