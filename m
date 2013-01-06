From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 12:13:20 +0100
Subject: [Buildroot] [git commit] Fix installation of crosstool-ng libraries
	to target
Message-ID: <20130106164433.3CF159A5F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de1eb105a45f88d8c6bf0e00f9b878a36114a5c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using the crosstool-ng toolchain option, the libc libraries were not
installed to target.  Buildroot calls the show-tuple function to determine
the directory to copy from, and it seems that outputs the result to stderr
instead of stdout

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
