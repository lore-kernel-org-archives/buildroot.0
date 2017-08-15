From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 15 Aug 2017 18:14:28 +0200
Subject: [Buildroot] [PATCH] qt5base: add qmake.conf fixup for i.MX platforms
Message-ID: <20170815161428.7765-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As stated in QTBUG-61156 [1], since Qt5.9 all the Qt apps fail to start
on i.MX platforms.

The reason is that the qmake.conf should apparently now specify which
eglfs backend to use.

It can be seen in the qmake.conf example for i.MX [2].

It has also been integrated into the Yocto meta-freescale layer [3].

Although this issue can be worked around by exporting a variable
(QT_QPA_EGLFS_INTEGRATION=eglfs_viv), this patch aims at providing
a more user-friendly approach by modifying qmake.conf when created.

[1]: https://bugreports.qt.io/browse/QTBUG-61156
[2]: https://github.com/qt/qtbase/blob/5.9/mkspecs/devices/linux-imx6-g%2B%2B/qmake.conf#L35
[3]: https://github.com/Freescale/meta-freescale/blob/master/dynamic-layers/qt5-layer/recipes-qt/qt5/qtbase/0015-Add-eglfs-to-IMX-GPU.patch

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi all,

Not sure if this approach is acceptable but my idea was to make this
patch as small as possible.

It was tested on Nitrogen6x using the nitrogen6x_qt5_gst1_defconfig
from our newly created external repository:
https://github.com/boundarydevices/buildroot-external-boundary

Regards,
Gary
---
 package/qt5/qt5base/qt5base.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index bbbdd41209..fbbb3b0c93 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -214,6 +214,15 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
 
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
+define QT5BASE_CONFIGURE_QMAKE_CONFIG
+	echo "EGLFS_DEVICE_INTEGRATION = eglfs_viv" >> \
+		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
+endef
+endif
+endif
+
 ifneq ($(QT5BASE_CONFIG_FILE),)
 define QT5BASE_CONFIGURE_CONFIG_FILE
 	cp $(QT5BASE_CONFIG_FILE) $(@D)/src/corelib/global/qconfig-buildroot.h
@@ -231,6 +240,7 @@ endif
 define QT5BASE_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qmake.conf \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
+	$(QT5BASE_CONFIGURE_QMAKE_CONFIG)
 	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qplatformdefs.h \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
 	$(QT5BASE_CONFIGURE_CONFIG_FILE)
-- 
2.14.1
