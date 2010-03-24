From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 24 Mar 2010 23:42:42 +0100
Subject: [Buildroot] [PATCH] external toolchain: fix sysroot location if the
	toolchain was	moved
Message-ID: <20100324224238.1489.74099.stgit@roazhon.bzh.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>

Sysrooted toolchain can be relocated. In this case, the sysroot is no
longer located at the place it was configured at.

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
---

 toolchain/external-toolchain/ext-tool.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 1f5aa19..80bdae6 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -205,7 +205,14 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 EXTERNAL_LIBS+=libstdc++.so
 endif
 
-SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=)
+# This dance is needed because the toolchain may have been relocated, so the
+# configured paths may no longer match; fortunately, the sysroot moves along
+# the toolchain, so is always at the same place relative to the toolchain's
+# current location.
+CFG_PREFIX_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--prefix=" | cut -f2 -d=)
+CFG_SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot=" | cut -f2 -d=)
+REL_SYSROOT_DIR=$(shell echo "$(CFG_SYSROOT_DIR)" |sed -r -e 's:^$(CFG_PREFIX_DIR)::;')
+SYSROOT_DIR=$(TOOLCHAIN_EXTERNAL_PATH)/$(REL_SYSROOT_DIR)
 
 $(STAMP_DIR)/ext-toolchain-installed:
 	@echo "Checking external toolchain settings"
