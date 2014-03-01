From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 12:53:28 +0100
Subject: [Buildroot] [git commit] Makefile: ensure system is built even if
	no filesystem image is selected
Message-ID: <20140301115345.1D0349BC7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbb3b862025dc29e8889a7958a6c918873192273
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
