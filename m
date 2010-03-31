From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 31 Mar 2010 10:53:12 +0200
Subject: [Buildroot] [git commit master] external toolchain: fix sysroot
	location if the toolchain was moved
Message-ID: <20100331085411.D1DF620AEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3b7aee23f2ab732f06b8a090ca002fb102d547ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sysrooted toolchain can be relocated. In this case, the sysroot is no
longer located at the place it was configured at.

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Acked-By: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
-- 
1.6.3.3
