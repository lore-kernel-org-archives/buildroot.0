From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2015 12:32:03 +0200
Subject: [Buildroot] [PATCH 6/7 v2] package/busybox: check for config file
In-Reply-To: <cover.1436783490.git.yann.morin.1998@free.fr>
References: <cover.1436783490.git.yann.morin.1998@free.fr>
Message-ID: <daa164c4ba8e5c04a66ea25c21d1109d2120bf96.1436783490.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a check (before we call kconfig-package) that ensures the user has
set a kconfig-file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - use BR_BUILDING in its own ifeq, do not coalesce with the existing
    ifeq
  - fix commit log
---
 package/busybox/busybox.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 92874cd..1b20429 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -207,4 +207,12 @@ define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
 endef
 
+# Checks to give errors that the user can understand
+# Must be before we call to kconfig-package
+ifeq ($(BR_BUILDING),y)
+ifeq ($(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG)),)
+$(error No BusyBox configuration file specified, check your BR2_PACKAGE_BUSYBOX_CONFIG setting)
+endif
+endif
+
 $(eval $(kconfig-package))
-- 
1.9.1
