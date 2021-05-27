From: Juergen Stuber <juergen@jstuber.net>
Date: Thu, 27 May 2021 16:51:18 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain/toolchain-external: Allow
 relative paths in BR2_TOOLCHAIN_EXTERNAL_PATH.
Message-ID: <20210527145118.31373-1-juergen@jstuber.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Convert BR2_TOOLCHAIN_EXTERNAL_PATH to an absolute path when used.

Otherwise the symbolic links to the external toolchain binaries are
not installed in host/bin when BR2_TOOLCHAIN_EXTERNAL_PATH is relative.
This happens because TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
changes directory into host/bin to create the symbolic links.
From there the tools are no longer found via the relative path and
a single symbolic link host/bin/$(prefix)-* is created instead.

Signed-off-by: Juergen Stuber <juergen@jstuber.net>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 6d91cb5d1e..2b70007a34 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -68,7 +68,7 @@ TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR = $(HOST_DIR)/opt/ext-toolchain
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
 else
-TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
+TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(abspath $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH)))
 endif
 
 ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
-- 
2.20.1
