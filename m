From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2013 19:46:57 +0100
Subject: [Buildroot] [PATCH 3/5] linux: ensure buildroot_defconfig is
	writable
In-Reply-To: <cover.1384454667.git.yann.morin.1998@free.fr>
References: <cover.1384454667.git.yann.morin.1998@free.fr>
Message-ID: <ba483991a0f3ff8d099f66bd9310a7f4357418b6.1384454667.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

If $(KERNEL_SOURCE_CONFIG) is read-only (eg. becasue Buildroot's source
dir is), the rm of $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig will
either fail, or prompt the user, both of which we want to avoid.

Make it writable by using $(INSTALL).

Fixes: #4363
Signed-off-by: Nathan Lynch <ntl@pobox.com>
[yann.morin.1998 at free.fr: use $(INSTALL) instead of cp, don't 'rm -f']
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 33931e5..fcaf7a9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -164,7 +164,7 @@ KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 endif
 
 define LINUX_CONFIGURE_CMDS
-	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
+	$(INSTALL) -m 0644 $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
 	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(if $(BR2_arm)$(BR2_armeb),
-- 
1.8.1.2
