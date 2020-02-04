From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue,  4 Feb 2020 22:59:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-waf: use host-python3
Message-ID: <20200204215950.28789-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the last of an unconsolidated series of patches that
removes the need for host-python(2) for all waf-based packages.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
NB: this patch should be merged after the following patches are merged first:
 - gst1-imx (https://patchwork.ozlabs.org/patch/1233580/)
 - libimxvpuapi (https://patchwork.ozlabs.org/patch/1233460/)
 - norm (https://patchwork.ozlabs.org/project/buildroot/list/?series=156705)

Dear committers, very sorry for that. I wasn't sure to finish on time to make
a single waf python3 series.
---
 package/pkg-waf.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index a32d5dab33..35e56d3c13 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -36,8 +36,8 @@
 
 define inner-waf-package
 
-# We need host-python to run waf
-$(2)_DEPENDENCIES += host-python
+# We need host-python3 to run waf
+$(2)_DEPENDENCIES += host-python3
 
 $(2)_NEEDS_EXTERNAL_WAF ?= NO
 
@@ -63,7 +63,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_CONFIGURE_OPTS) \
 	$$($(2)_CONF_ENV) \
-	$$(HOST_DIR)/bin/python2 $$($(2)_WAF) configure \
+	$$(HOST_DIR)/bin/python3 $$($(2)_WAF) configure \
 		--prefix=/usr \
 		--libdir=/usr/lib \
 		$$($(2)_CONF_OPTS) \
@@ -78,7 +78,7 @@ endif
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
 		build -j $$(PARALLEL_JOBS) $$($(2)_BUILD_OPTS) \
 		$$($(2)_WAF_OPTS)
 endef
@@ -91,7 +91,7 @@ endif
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
 		install --destdir=$$(STAGING_DIR) \
 		$$($(2)_INSTALL_STAGING_OPTS) \
 		$$($(2)_WAF_OPTS)
@@ -105,7 +105,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
 		install --destdir=$$(TARGET_DIR) \
 		$$($(2)_INSTALL_TARGET_OPTS) \
 		$$($(2)_WAF_OPTS)
-- 
2.24.1
