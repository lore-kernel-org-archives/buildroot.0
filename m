From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 May 2013 12:36:44 +0200
Subject: [Buildroot] [PATCH 4/4] linux: ensure buildroot_defconfig is
	writable
In-Reply-To: <cover.1369650924.git.yann.morin.1998@free.fr>
References: <cover.1369650924.git.yann.morin.1998@free.fr>
Message-ID: <73b5281a6c6d7cf1ba5d2c6340e39e9ebc2d36d0.1369650924.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nathan Lynch <ntl@pobox.com>

If $(KERNEL_SOURCE_CONFIG) is read-only (eg. becasue Buildroot's source
dir is), the rm of $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig will
prompt the user. Make it writable and use rm -f for good measure.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
[yann.morin.1998 at free.fr: use $(INSTALL) instead of cp]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 linux/linux.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3877c35..5b8f211 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -166,9 +166,9 @@ KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 endif
 
 define LINUX_CONFIGURE_CMDS
-	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
+	$(INSTALL) -D -m 0644 $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
-	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
+	rm -f $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(if $(BR2_ARM_EABI),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
-- 
1.8.1.2
