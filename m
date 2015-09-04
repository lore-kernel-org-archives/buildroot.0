From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Sep 2015 13:16:59 +0200
Subject: [Buildroot] [git commit] package/linux-fusion: slight simplification
Message-ID: <20150904111726.880887FB01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=249f487e97db809fe35b4c8a959b4670f533062b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using an intermediate variable to "store" LINUX_VERSION_PROBED is
unnecessary, because they are both recursively-expanded variables, and
the `make kernel-version` code will anyway be used in both places it is
needed; storing in an intermediate variable will not make that a single
expansion of the sub-shell.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-fusion/linux-fusion.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index d52fe40..326ef88 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -17,17 +17,16 @@ ifeq ($(BR2_PACKAGE_LINUX_FUSION),y)
 LINUX_NEEDS_MODULES = y
 endif
 
-LINUX_FOR_FUSION = $(LINUX_VERSION_PROBED)
 LINUX_FUSION_ETC_DIR = $(TARGET_DIR)/etc/udev/rules.d
 
-LINUX_FUSION_MAKE_OPTS = KERNEL_VERSION=$(LINUX_FOR_FUSION)
+LINUX_FUSION_MAKE_OPTS = KERNEL_VERSION=$(LINUX_VERSION_PROBED)
 LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(LINUX_DIR)
 LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(LINUX_DIR)
 
 LINUX_FUSION_MAKE_OPTS += SYSROOT=$(TARGET_DIR)
 LINUX_FUSION_MAKE_OPTS += ARCH=$(KERNEL_ARCH)
 LINUX_FUSION_MAKE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)
-LINUX_FUSION_MAKE_OPTS += KERNEL_MODLIB=/lib/modules/$(LINUX_FOR_FUSION)/kernel
+LINUX_FUSION_MAKE_OPTS += KERNEL_MODLIB=/lib/modules/$(LINUX_VERSION_PROBED)/kernel
 
 define LINUX_FUSION_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(LINUX_FUSION_MAKE_OPTS) -C $(@D)
