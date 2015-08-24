From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2015 18:50:05 +0200
Subject: [Buildroot] [PATCH 4/4 v2] package/linux-fusion: slight
	simplification
In-Reply-To: <cover.1440434894.git.yann.morin.1998@free.fr>
References: <cover.1440434894.git.yann.morin.1998@free.fr>
Message-ID: <96204099417c101327b357870e89386fe1757931.1440434894.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using an intermediate variable to "store" LINUX_VERSION_PROBED is
un-ncessary, because They are both recursively-expanded variables, and
the `make kernel-version` code will anyway be used in both places it is
needed; storing in an intermediate variable will not make that a single
expansion of the sub-shell.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-fusion/linux-fusion.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 21b6e42..5f9e44e 100644
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
