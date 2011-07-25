From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Jul 2011 08:44:26 +0200
Subject: [Buildroot] [git commit] toolchain: add user defined target LDFLAGS
	options
Message-ID: <20110725064529.740418B4A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ec8eda419a54674a0d326ea25bd9c440cd059065
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow the user to specify additional options for the target LDFLAGS.

I use this to pass the -te500v2 option to the linker, when using the
CodeSourcery toolchain for PowerPC. This chooses the correct CRT for e500 hard
float. Otherwise I get errors like

undefined reference to `_save32gpr_31'
undefined reference to `_rest32gpr_31_x'

at final link time.

[Peter: fixup, use qstrip]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in           |    1 +
 toolchain/toolchain-common.in |    5 +++++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 8e9637c..c3af5d3 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -77,6 +77,7 @@ TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
 
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
+TARGET_LDFLAGS=$(call qstrip,$(BR2_TARGET_LDFLAGS))
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 4a2f379..bbb7be6 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -96,3 +96,8 @@ config BR2_TARGET_OPTIMIZATION
 	help
 	  Optimizations to use when building for the target host.
 	  NOTE: gcc optimization level is defined in build options.
+
+config BR2_TARGET_LDFLAGS
+	string "Target linker options"
+	help
+	  Extra options to pass to the linker when buiding for the target.
-- 
1.7.3.4
