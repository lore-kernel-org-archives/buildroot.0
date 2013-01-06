From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sun,  6 Jan 2013 06:11:45 +0100
Subject: [Buildroot] [PATCH] Fix installation of crosstool-ng libraries to
	target
Message-ID: <1357449105-14780-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using the crosstool-ng toolchain option, the libc libraries were not installed to target.
Buildroot calls the show-tuple function to determine the directory to copy from, and it seems
that outputs the result to stderr instead of stdout

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 6f81e30..553c9ee 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -66,7 +66,7 @@ endif
 # Actual copy
 $(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
 	$(Q)mkdir -p $(TARGET_DIR)/lib
-	$(Q)CTNG_TUPLE="$$( $(call ctng,show-tuple) )";                     \
+	$(Q)CTNG_TUPLE="$$( $(call ctng,show-tuple 2>&1) )";                \
 	    CTNG_SYSROOT="$(HOST_DIR)/usr/$${CTNG_TUPLE}/sysroot";          \
 	    echo "CTNG_TUPLE='$${CTNG_TUPLE}'";                             \
 	    echo "CTNG_SYSROOT='$${CTNG_SYSROOT}'";                         \
-- 
1.7.10.4
