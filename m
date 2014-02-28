From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Feb 2014 21:05:27 +0100
Subject: [Buildroot] [PATCH] Makefile: ensure system is built even if no
	filesystem image is selected
Message-ID: <1393617927-1661-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The parallel build patch series has significantly reworked how some of
the core dependencies are expressed. We now have the following
dependencies:

 all: world
 world: target-post-image
 target-post-image: $(TARGETS_ROOTFS)

with TARGETS_ROOTFS containing the list of root filesystem image
targets, each having the following dependencies:

 $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)

The bottom line is that the "target-finalize" target, which in turns
ensures that all packages are built, is only triggered if at least one
filesystem image is enabled.

As we want to support builds with no filesystem image selected, this
is not acceptable. As a fix, we change the target-post-image target
to:

 target-post-image: $(TARGETS_ROOTFS) target-finalize

This way, target-finalize will be triggered even if TARGETS_ROOTFS is
empty. This is still correct for parallel build, as the individual
root filesystem image targets still depend on target-finalize.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 2e5d11e..ae868da 100644
--- a/Makefile
+++ b/Makefile
@@ -620,7 +620,7 @@ target-generatelocales: host-localedef
 	done
 endif
 
-target-post-image: $(TARGETS_ROOTFS)
+target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(USER_HOOKS_EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
-- 
1.8.3.2
