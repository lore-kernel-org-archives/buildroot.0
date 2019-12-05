From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu,  5 Dec 2019 17:14:50 +0000
Subject: [Buildroot] [PATCH v1 03/30] package/qt5/qt5webengine: Use
 Buildroot's host-pkg-config wrapper
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
Message-ID: <20191205171517.96639-4-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Preston <thomas.preston@codethink.co.uk>

Buildroot now has a host package config wrapper to use pkgconf with
the host enviornment, so qt5webengine should use that instead of its
own one.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
---
 package/qt5/qt5webengine/host-pkg-config.in | 6 ------
 package/qt5/qt5webengine/qt5webengine.mk    | 7 +------
 2 files changed, 1 insertion(+), 12 deletions(-)
 delete mode 100644 package/qt5/qt5webengine/host-pkg-config.in

diff --git a/package/qt5/qt5webengine/host-pkg-config.in b/package/qt5/qt5webengine/host-pkg-config.in
deleted file mode 100644
index 86a980648b..0000000000
--- a/package/qt5/qt5webengine/host-pkg-config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-PKG_CONFIG_SYSROOT_DIR="/" \
-PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
-PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
-PKG_CONFIG_LIBDIR="@HOST_DIR@/lib/pkgconfig:@HOST_DIR@/share/pkgconfig" \
-exec @HOST_DIR@/bin/pkgconf "$@"
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 1d5ee8d819..95666f5469 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -55,12 +55,7 @@ QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_PYTHON2_SYMLINK
 QT5WEBENGINE_ENV += NINJAFLAGS="-j$(PARALLEL_JOBS)"
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-define QT5WEBENGINE_CREATE_HOST_PKG_CONFIG
-	sed s%@HOST_DIR@%$(HOST_DIR)%g $(QT5WEBENGINE_PKGDIR)/host-pkg-config.in > $(@D)/host-bin/host-pkg-config
-	chmod +x $(@D)/host-bin/host-pkg-config
-endef
-QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_CREATE_HOST_PKG_CONFIG
-QT5WEBENGINE_ENV += GN_PKG_CONFIG_HOST=$(@D)/host-bin/host-pkg-config
+QT5WEBENGINE_ENV += GN_PKG_CONFIG_HOST=$(PKG_CONFIG_HOST_BINARY_HOST)
 endif
 
 define QT5WEBENGINE_CONFIGURE_CMDS
-- 
2.20.1
