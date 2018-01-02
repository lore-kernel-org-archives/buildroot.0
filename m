From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  2 Jan 2018 11:33:33 -0500
Subject: [Buildroot] [PATCH 4/8] pkg-waf.mk: check host-python version
In-Reply-To: <20180102163337.6334-1-aduskett@gmail.com>
References: <20180102163337.6334-1-aduskett@gmail.com>
Message-ID: <20180102163337.6334-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

waf is compatible with both python2 and python3. Now that there are host
entries for python, the make logic can be changed to check if host-python3
has been selected, and if so, depend on it instead of explicitly depending
only on python2.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/pkg-waf.mk | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index e5b606f063..8df287074b 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -36,9 +36,6 @@
 
 define inner-waf-package
 
-# We need host-python to run waf
-$(2)_DEPENDENCIES += host-python
-
 $(2)_NEEDS_EXTERNAL_WAF ?= NO
 
 # If the package does not have its own waf, use our own.
@@ -49,6 +46,15 @@ else
 $(2)_WAF = ./waf
 endif
 
+# We need a host-python to run waf
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
+$(2)_DEPENDENCIES += host-python3
+$(2)_WAF_PYTHON_PATH ?= $$(HOST_DIR)/bin/python3
+else
+$(2)_DEPENDENCIES += host-python
+$(2)_WAF_PYTHON_PATH ?= $$(HOST_DIR)/bin/python2
+endif
+
 $(2)_BUILD_OPTS				?=
 $(2)_INSTALL_STAGING_OPTS		?=
 $(2)_INSTALL_TARGET_OPTS		?=
@@ -63,7 +69,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$(@D) && \
 	$$(TARGET_CONFIGURE_OPTS) \
 	$$($(2)_CONF_ENV) \
-	$$(HOST_DIR)/bin/python2 $$($(2)_WAF) configure \
+	$$($(2)_WAF_PYTHON_PATH) $$($(2)_WAF) configure \
 		--prefix=/usr \
 		--libdir=/usr/lib \
 		$$($(2)_CONF_OPTS) \
@@ -78,7 +84,7 @@ endif
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	cd $$(@D) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$($(2)_WAF_PYTHON_PATH) $$($(2)_WAF) \
 		build -j $$(PARALLEL_JOBS) $$($(2)_BUILD_OPTS) \
 		$$($(2)_WAF_OPTS)
 endef
@@ -91,7 +97,7 @@ endif
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	cd $$(@D) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$($(2)_WAF_PYTHON_PATH) $$($(2)_WAF) \
 		install --destdir=$$(STAGING_DIR) \
 		$$($(2)_INSTALL_STAGING_OPTS) \
 		$$($(2)_WAF_OPTS)
@@ -105,7 +111,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$(@D) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python2 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$($(2)_WAF_PYTHON_PATH) $$($(2)_WAF) \
 		install --destdir=$$(TARGET_DIR) \
 		$$($(2)_INSTALL_TARGET_OPTS) \
 		$$($(2)_WAF_OPTS)
-- 
2.14.3
