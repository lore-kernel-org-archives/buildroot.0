From: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
Date: Wed, 10 Mar 2021 17:16:46 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: fix compilation with
 PER_PACKAGE_DIRECTORIES enable
Message-ID: <20210310161646.23709-1-nicolas.toromanoff@foss.st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If PER_PACKAGE_DIRECTORIES=Y and using host-make package
(because BR2_FORCE_HOST_BUILD=Y or local make is too old)
.stamp_dotconfig target needs per-package/uboot/host/bin/host-make that doesn't exist yet.
Add host-make into UBOOT_KCONFIG_DEPENDENCIES.

Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>
---
 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index bb4598002252..dbe82e65b17e 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -498,6 +498,7 @@ $(eval $(generic-package))
 else ifeq ($(BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG),y)
 UBOOT_MAKE_ENV = $(TARGET_MAKE_ENV)
 UBOOT_KCONFIG_DEPENDENCIES = \
+	$(BR2_MAKE_HOST_DEPENDENCY) \
 	$(BR2_BISON_HOST_DEPENDENCY) \
 	$(BR2_FLEX_HOST_DEPENDENCY)
 $(eval $(kconfig-package))
-- 
2.17.1
