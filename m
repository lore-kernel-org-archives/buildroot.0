From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 22:10:44 +0100
Subject: [Buildroot] [git commit] toolchain/crosstool-ng: sprinkle with some
	calls to MESSAGE
Message-ID: <20130120211456.3D2FC9A306@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9adea3f859ef6600fc6f42627aa9b0b8accaf545
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thus, the failing step can be easily extracted by autobuilders,
to ease with post-mortem analysis.

At the same time, remove two debug echoes (Arnout).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index c09f732..6554982 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -68,9 +68,7 @@ $(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
 	$(Q)mkdir -p $(TARGET_DIR)/lib
 	$(Q)CTNG_TUPLE="$$( $(call ctng,show-tuple 2>&1) )";                \
 	    CTNG_SYSROOT="$(HOST_DIR)/usr/$${CTNG_TUPLE}/sysroot";          \
-	    echo "CTNG_TUPLE='$${CTNG_TUPLE}'";                             \
-	    echo "CTNG_SYSROOT='$${CTNG_SYSROOT}'";                         \
-	    echo "Copy external toolchain libraries to target...";          \
+	    $(call MESSAGE,"Copying toolchain libraries to target...");     \
 	    for libs in $(CTNG_LIBS_LIB); do                                \
 	        $(call copy_toolchain_lib_root,$${CTNG_SYSROOT},,lib,$$libs,/lib); \
 	    done;                                                           \
@@ -85,6 +83,7 @@ $(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
 #       depending on the selected C library. Those deps are added later
 
 $(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/.config
+	$(Q)$(call MESSAGE,"Building the crosstool-NG toolchain")
 	$(Q)$(call ctng,build.$(PARALLEL_JOBS))
 	$(Q)printf "\n"
 	$(Q)touch $@
