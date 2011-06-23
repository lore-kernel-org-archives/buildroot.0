From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 Jun 2011 12:21:21 +0300
Subject: [Buildroot] [PATCH] toolchain: add user defined target LDFLAGS
	options
Message-ID: <b4ad3d880f9c9e43b70d43bf527593487f3b1035.1308820722.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow the user to specify additional options for the target LDFLAGS.

I use this to pass the -te500v2 option to the linker, when using the
CodeSourcery toolchain for PowerPC. This chooses the correct CRT for e500 hard
float. Otherwise I get errors like

undefined reference to `_save32gpr_31'
undefined reference to `_rest32gpr_31_x'

at final link time.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/Makefile.in           |    2 +-
 toolchain/toolchain-common.in |    5 +++++
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 2ca8c31..a6cee06 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -81,7 +81,7 @@ ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CFLAGS+=-I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/include
 endif
 
-TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib
+TARGET_LDFLAGS+=-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib $(BR2_TARGET_LDFLAGS)
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_SYSROOT_OPT=--sysroot=$(STAGING_DIR)
 
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index f67c30a..8a87493 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -173,3 +173,8 @@ config BR2_TARGET_OPTIMIZATION
 	help
 	  Optimizations to use when building for the target host.
 	  NOTE: gcc optimization level is defined in build options.
+
+config BR2_TARGET_LDFLAGS
+	string "Target linker options"
+	help
+	  Options to pass to the linker when buiding for the target host.
-- 
1.7.5.4
