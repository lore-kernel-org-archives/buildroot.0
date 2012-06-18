From: Nathan Lynch <ntl@pobox.com>
Date: Mon, 18 Jun 2012 10:02:23 -0500
Subject: [Buildroot] [RFC/PATCH 4/4] linux: ensure buildroot_defconfig is
	writable
In-Reply-To: <1340031743-29694-1-git-send-email-ntl@pobox.com>
References: <1340031743-29694-1-git-send-email-ntl@pobox.com>
Message-ID: <1340031743-29694-5-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If $(KERNEL_SOURCE_CONFIG) is read-only, the rm of
$(KERNEL_ARCH_PATH)/configs/buildroot_defconfig will prompt the user.
Make it writable and use rm -f for good measure.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---
 linux/linux.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index f165dda..211d054 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -138,8 +138,9 @@ endif
 
 define LINUX_CONFIGURE_CMDS
 	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
+	chmod u+w $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
-	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
+	rm -f $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(if $(BR2_ARM_EABI),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
-- 
1.7.10.2
