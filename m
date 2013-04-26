From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 26 Apr 2013 11:25:26 +0100
Subject: [Buildroot] [PATCH] neardal: add support for ncl tool
Message-ID: <1366971926-16475-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/neardal/Config.in  |    6 ++++++
 package/neardal/neardal.mk |    8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/neardal/Config.in b/package/neardal/Config.in
index 045ccee..b3ac67d 100644
--- a/package/neardal/Config.in
+++ b/package/neardal/Config.in
@@ -13,3 +13,9 @@ config BR2_PACKAGE_NEARDAL
 
 comment "neardal requires a toolchain with WCHAR and threads support"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_NEARDAL_NCL
+	bool "neardal ncl tool"
+	depends on BR2_PACKAGE_NEARDAL
+	help
+	  Build and install neardal ncl command line interpreter tool.
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index 9625f0e..b937acb 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -14,4 +14,12 @@ NEARDAL_LICENSE_FILES = COPYING
 NEARDAL_DEPENDENCIES = host-pkgconf dbus dbus-glib
 NEARDAL_AUTORECONF = YES
 
+define NEARDAL_INSTALL_NCL
+	$(INSTALL) -m 0755 -D $(@D)/ncl/ncl $(TARGET_DIR)/usr/bin/ncl
+endef
+
+ifeq ($(BR2_PACKAGE_NEARDAL_NCL),y)
+	NEARDAL_POST_INSTALL_TARGET_HOOKS += NEARDAL_INSTALL_NCL
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4
