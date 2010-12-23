From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 Dec 2010 11:13:33 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain: add missing stamp
	file touch in external toolchain
Message-ID: <20101223101346.276528E297@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e6633fd2e37d25f32958f30e852baa216ce1384a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the support of custom external toolchains, we forgot to touch the
$(STAMP_DIR)/ext-toolchain-checked stamp file, which means that the
toolchain was re-checked and re-installed at everyt build.

At the same time, quietize a bit other stamp files touch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/ext-tool.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index d6153f1..ab8bc94 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -137,7 +137,7 @@ $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE):
 $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
 	mkdir -p $(@D)
 	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
-	touch $@
+	$(Q)touch $@
 
 # Checks for an already installed toolchain: check the toolchain
 # location, check that it supports sysroot, and then verify that it
@@ -165,6 +165,7 @@ $(STAMP_DIR)/ext-toolchain-checked:
 	else \
 		$(call check_glibc,$${SYSROOT_DIR}) ; \
 	fi
+	$(Q)touch $@
 
 # Integration of the toolchain into Buildroot: find the main sysroot
 # and the variant-specific sysroot, then copy the needed libraries to
@@ -194,4 +195,4 @@ $(STAMP_DIR)/ext-toolchain-installed: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 	if [ -L $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
 		$(call create_lib64_symlinks) ; \
 	fi ; \
-	touch $@
+	$(Q)touch $@
-- 
1.7.2.2
