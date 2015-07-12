From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jul 2015 14:11:28 +0200
Subject: [Buildroot] [PATCH 6/7] package/busybox: check for config file
	before calling kconfig-package
In-Reply-To: <cover.1436702899.git.yann.morin.1998@free.fr>
References: <cover.1436702899.git.yann.morin.1998@free.fr>
Message-ID: <1095e66da8428c3c8a08d1c5a6fb2bf90f93c418.1436702899.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If we check that the user provides a config file after we call to the
kconfig-package infra, the error message we get is the one for the
kconfig-package infra, not the custom error message we want to show to
the user.

So, only call kconfig-package after we do the check.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 92874cd..6b57fd7 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -207,4 +207,10 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 endef
 
+# Checks to give errors that the user can understand
+# Must be before we call to kconfig-package
+ifeq ($(BR_BUILDING)$(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG)),y)
+$(error No BusyBox configuration file specified, check your BR2_PACKAGE_BUSYBOX_CONFIG setting)
+endif
+
 $(eval $(kconfig-package))
-- 
1.9.1
