From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Sep 2015 14:54:22 +0200
Subject: [Buildroot] [PATCH 4/4 v3] package/linux-fusion: slight
	simplification
In-Reply-To: <cover.1441284678.git.yann.morin.1998@free.fr>
References: <cover.1441284678.git.yann.morin.1998@free.fr>
Message-ID: <40510fd321964fdd1918ce29a65a68f142bf2c71.1441284678.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using an intermediate variable to "store" LINUX_VERSION_PROBED is
unnecessary, because they are both recursively-expanded variables, and
the `make kernel-version` code will anyway be used in both places it is
needed; storing in an intermediate variable will not make that a single
expansion of the sub-shell.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linux-fusion/linux-fusion.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

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
-- 
1.9.1
