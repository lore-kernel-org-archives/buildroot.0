From: Worth, Kevin <kevin.worth@hp.com>
Date: Thu, 2 May 2013 21:14:45 +0000
Subject: [Buildroot] [PATCH] linux: Fix User-Mode Linux build failures
Message-ID: <B5EF724456FFB24A8C8AE88E26CE8F4B6D841F80@G9W0753.americas.hpqcorp.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass KERNEL_SUBARCH environment variable needed for User Mode Linux builds
 e.g. build with 'make KERNEL_ARCH=um KERNEL_SUBARCH=i386'
Create $(KERNEL_ARCH_PATH)/configs/ if it doesn't exist (for arches like uml)
 Otherwise build fails trying to cp to non-existent directory

Signed-off-by: Kevin Worth <kevin.worth@hp.com>
---
 linux/linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 0352acd..db26fc6 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -44,6 +44,7 @@ LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC)" \
 	HOSTCFLAGS="$(HOSTCFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
+	SUBARCH=$(KERNEL_SUBARCH) \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 	DEPMOD=$(HOST_DIR)/usr/sbin/depmod
@@ -156,6 +157,7 @@ KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 endif
 
 define LINUX_CONFIGURE_CMDS
+	mkdir -p $(KERNEL_ARCH_PATH)/configs/
 	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
 	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
