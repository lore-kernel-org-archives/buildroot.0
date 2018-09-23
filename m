From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Sep 2018 18:32:39 +0200
Subject: [Buildroot] [PATCH 2/4] irqbalance: add mandatory libglib2
 dependency
In-Reply-To: <20180923163241.26588-1-fontaine.fabrice@gmail.com>
References: <20180923163241.26588-1-fontaine.fabrice@gmail.com>
Message-ID: <20180923163241.26588-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If libglib2 is not found or disable through --without-glib2, irqbalance
will use its own implementation of glib2 so add a mandatory libglib2
dependency especially as upstream now enforce it:
https://github.com/Irqbalance/irqbalance/commit/1d2f6a9b6c6ef3b195f28af5f0271cf83ed02818

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/irqbalance/Config.in     | 8 ++++++++
 package/irqbalance/irqbalance.mk | 5 ++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/irqbalance/Config.in b/package/irqbalance/Config.in
index 6c21497834..02d146f4d3 100644
--- a/package/irqbalance/Config.in
+++ b/package/irqbalance/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_IRQBALANCE
 	bool "irqbalance"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Irqbalance is a daemon to help balance the cpu load generated
 	  by interrupts across all of a systems cpus.
@@ -9,3 +13,7 @@ config BR2_PACKAGE_IRQBALANCE
 	  minimizing cache hit rates for irq handlers.
 
 	  https://github.com/Irqbalance/irqbalance
+
+comment "irqbalance needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index 95230ed1f5..309fc22ee2 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -8,10 +8,13 @@ IRQBALANCE_VERSION = v1.0.9
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING
-IRQBALANCE_DEPENDENCIES = host-pkgconf
+IRQBALANCE_DEPENDENCIES = host-pkgconf libglib2
 # Autoreconf needed because package is distributed without a configure script
 IRQBALANCE_AUTORECONF = YES
 
+# Local implementation of glib2 will be used if --without-glib2 is set
+IRQBALANCE_CONF_OPTS = --with-glib2
+
 ifeq ($(BR2_PACKAGE_NUMACTL),y)
 IRQBALANCE_DEPENDENCIES += numactl
 IRQBALANCE_CONF_OPTS += --enable-numa
-- 
2.17.1
