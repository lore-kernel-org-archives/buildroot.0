From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed,  8 Nov 2017 12:30:35 +0100
Subject: [Buildroot] [PATCH 2/2] add qmake.conf eglfs_mali option
In-Reply-To: <1510140635-80618-1-git-send-email-giulio.benetti@micronovasrl.com>
References: <1510140635-80618-1-git-send-email-giulio.benetti@micronovasrl.com>
Message-ID: <1510140635-80618-2-git-send-email-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I didn't know I could annotate the subsequent patches.
Anyway, since eglfs_mali is not supported by EGLFS_DEVICE_INTEGRATION = @EGLFS_DEVICE@
I add it inserting same as vivante,
except I filter both sunxi-mali and upcoming sunxi-mali-mainline,
to maintain compatibility with legacy

Kind regards

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/qt5/qt5base/qt5base.mk | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index d58a58a..23f5138 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -240,18 +240,27 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)$(BR2_PACKAGE_IMX_GPU_VIV),yy)
-# use vivante backend
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
+# use eglfs vivante backend
 define QT5BASE_CONFIGURE_QMAKE_CONFIG
 	sed 's/@EGLFS_DEVICE@/eglfs_viv/g' $(QT5BASE_PKGDIR)/qmake.conf.in > \
 		$(QT5BASE_PKGDIR)/qmake.conf
 endef
+else ifeq ($(filter y,$(BR2_PACKAGE_SUNXI_MALI) $(BR2_PACKAGE_SUNXI_MALI_MAINLINE)),y)
+# use eglfs mali backend
+define QT5BASE_CONFIGURE_QMAKE_CONFIG
+	sed 's/@EGLFS_DEVICE@/eglfs_mali/g' $(QT5BASE_PKGDIR)/qmake.conf.in > \
+		$(QT5BASE_PKGDIR)/qmake.conf
+endef
 else
+# don't use any eglfs backend
 define QT5BASE_CONFIGURE_QMAKE_CONFIG
 	sed '/@EGLFS_DEVICE@/,+1d' $(QT5BASE_PKGDIR)/qmake.conf.in > \
 		$(QT5BASE_PKGDIR)/qmake.conf
 endef
 endif
+endif
 
 ifneq ($(QT5BASE_CONFIG_FILE),)
 define QT5BASE_CONFIGURE_CONFIG_FILE
-- 
2.7.4
