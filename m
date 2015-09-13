From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Sep 2015 22:22:36 +0200
Subject: [Buildroot] [git commit] toolchain-external/CodeSourcery MIPS
	2015.05: fix lib-names headers
Message-ID: <20150913204625.0F57181910@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb68e9fccb4b3af08d72645141075b1a785fd5ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CodeSourcery MIPS 2015.05 toolchain has some missing headers we need
to create manually in order to avoid compilation errors. A bug has been
already reported and fixed upstream, and the fix will be included in the
next release.

Fixes:
  http://autobuild.buildroot.net/results/bea/bea76392dec5c8e1bcea8be990ad109c6d27e947/
  http://autobuild.buildroot.net/results/64f/64f2b6b6e60d5c2d9537ad6891211cda6baaf6d5/
  ...and many more.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/toolchain-external.mk |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 967e9ec..61a5dba 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -253,6 +253,37 @@ define TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
 	ln -snf . $(TARGET_DIR)/usr/lib/aarch64-linux-gnu
 endef
 
+# The CodeSourcery MIPS 2015.05 toolchain has some missing headers we
+# need to create manually in order to avoid compilation errors. A bug
+# has been already reported and fixed upstream, and the fix will be
+# included in the next release.
+define TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505_LIB_NAMES_FIX
+	cp $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_hard.h \
+		$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_soft.h
+	$(SED) 's#hard#soft#' $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_soft.h
+
+	cp $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_hard.h \
+		$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_hard_2008.h
+	$(SED) 's#hard#hard_2008#' $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_hard_2008.h
+	$(SED) 's#ld.so.1#ld-linux-mipsn8.so.1#' $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_hard_2008.h
+	$(SED) '/LD_SO/i \
+		#define LD_LINUX_MIPSN8_SO              "ld-linux-mipsn8.so.1"' \
+		$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_hard_2008.h
+
+	cp $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_soft.h \
+		$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-n64_soft.h
+	$(SED) 's#o32#n64#' $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-n64_soft.h
+
+	cp $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_soft.h \
+		$(STAGING_DIR)/usr/include/gnu/
+
+	cp $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-o32_hard_2008.h \
+		$(STAGING_DIR)/usr/include/gnu/
+
+	cp $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/mips-linux-gnu/libc/usr/include/gnu/lib-names-n64_soft.h \
+		$(STAGING_DIR)/usr/include/gnu/
+endef
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi
 TOOLCHAIN_EXTERNAL_SOURCE = arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
@@ -293,6 +324,7 @@ TOOLCHAIN_EXTERNAL_SOURCE = mips-2014.11-22-mips-linux-gnu-i686-pc-linux-gnu.tar
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2015.05-18-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505_LIB_NAMES_FIX
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
