From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 18 Nov 2010 05:28:21 -0500
Subject: [Buildroot] [PATCH] toolchain-external: allow vendor-controlled
	defaults
Message-ID: <1290076101-31697-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 toolchain/toolchain-external/Config.in.2 |   11 +++++++++++
 toolchain/toolchain-external/ext-tool.mk |    2 ++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in.2 b/toolchain/toolchain-external/Config.in.2
index 489558c..50e61e6 100644
--- a/toolchain/toolchain-external/Config.in.2
+++ b/toolchain/toolchain-external/Config.in.2
@@ -1,15 +1,26 @@
 #
 
 if BR2_TOOLCHAIN_EXTERNAL
+
+config BR2_TOOLCHAIN_OVERRIDE_VENDOR
+	bool "Override vendor/device toolchain defaults" if BR2_bfin
+	default y
+	help
+	  Some targets have standard toolchain namings which the
+	  vendor/device maintainer have defined.  If you wish to
+	  override their choices, say Y here.
+
 config BR2_TOOLCHAIN_EXTERNAL_PATH
 	string "External toolchain path"
 	default "/path/to/staging_dir/usr"
+	depends on BR2_TOOLCHAIN_OVERRIDE_VENDOR
 	help
 	  Path to where the external toolchain is installed.
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string "External toolchain prefix"
 	default "$(ARCH)-linux"
+	depends on BR2_TOOLCHAIN_OVERRIDE_VENDOR
 	help
 	  This the the external toolchain prefix. For example:
 	    armeb-unknown-linux-gnu, mipsel-unknown-linux-gnu, etc.
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 7e4645d..2501256 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -37,6 +37,8 @@
 #  cross-compiler binaries remains external, all libraries and headers
 #  are imported into the Buildroot tree.
 
+-include target/device/*/ext-tool.mk
+
 uclibc: dependencies $(STAMP_DIR)/ext-toolchain-installed
 
 LIB_EXTERNAL_LIBS=ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
-- 
1.7.3.2
