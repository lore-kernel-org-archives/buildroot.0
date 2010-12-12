From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 12 Dec 2010 11:25:25 -0500
Subject: [Buildroot] [PATCH] toolchain-external: improve sysroot lookup with
	multilib
Message-ID: <1292171125-32589-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the external toolchain we're using starts in a path other than /usr/lib,
the sysroot detection fails as it has /usr/lib hardcoded.  Improve the code
to strip out any lib suffixes to handle the most common behavior.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 toolchain/toolchain-external/ext-tool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index a913162..646b8ea 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -65,7 +65,7 @@ endif # ! no threads
 TARGET_CC_NO_SYSROOT=$(filter-out --sysroot=%,$(TARGET_CC_NOCCACHE))
 SYSROOT_DIR=$(shell $(TARGET_CC_NO_SYSROOT) -print-sysroot 2>/dev/null)
 ifeq ($(SYSROOT_DIR),)
-SYSROOT_DIR=$(shell readlink -f $$(LANG=C $(TARGET_CC_NO_SYSROOT) -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;')
+SYSROOT_DIR=$(shell readlink -f $$(LANG=C $(TARGET_CC_NO_SYSROOT) -print-file-name=libc.a) |sed -r -e 's:usr/lib[^/]*/libc\.a::;')
 endif
 
 # Now, find if the toolchain specifies a sub-directory for the
-- 
1.7.3.3
