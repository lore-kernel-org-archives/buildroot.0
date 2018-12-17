From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Dec 2018 09:19:34 +0100
Subject: [Buildroot] [PATCH] toolchain-external: download: add <CROSS>-cc
 symlink if not present
Message-ID: <20181217081934.24807-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/dbb/dbb3c4634d5fc726ca0b27c2dac0befbbab70912
http://autobuild.buildroot.net/results/dbb/dbb69acadc20b4bb559311348eca276c1e6343f7

Some external toolchains do not have a <CROSS>-cc binary/symlink, which is
used by some packages.  As a workaround, add a symlink to <CROSS>-gcc.

Notice that we can only do this for external toolchains we download
ourselves, and not pre-installed ones as we might not have write access to
them.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index db3570d96f..753a6c5207 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -106,6 +106,16 @@ define TOOLCHAIN_EXTERNAL_MOVE
 	mkdir -p $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
 	mv $(@D)/* $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)/
 endef
+
+# Some external toolchains do not have a <CROSS>-cc binary/symlink,
+# which is used by some packages. As a workaround, add a (relative)
+# symlink to <CROSS>-gcc
+define TOOLCHAIN_EXTERNAL_ADD_CC_SYMLINK
+	if [ ! -e $(TOOLCHAIN_EXTERNAL_CROSS)cc ]; then \
+		ln -s $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc $(TOOLCHAIN_EXTERNAL_CROSS)cc; \
+	fi
+endef
+
 endif
 
 #
@@ -515,7 +525,8 @@ ifeq ($$(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 $(2)_EXCLUDES = usr/lib/locale/*
 
 $(2)_POST_EXTRACT_HOOKS += \
-	TOOLCHAIN_EXTERNAL_MOVE
+	TOOLCHAIN_EXTERNAL_MOVE \
+	TOOLCHAIN_EXTERNAL_ADD_CC_SYMLINK
 endif
 
 # Checks for an already installed toolchain: check the toolchain
-- 
2.11.0
