From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Nov 2017 18:41:22 +0100
Subject: [Buildroot] [git commit] qt5base: add qmake.conf fixup for i.MX
 platforms
Message-ID: <20171106173439.E5B41810DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c219ddb8ac2736057402144825b22812b5a642c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Peter: simplify conditional, add comment explaining why]
Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 1683eda..b3f9c79 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -240,6 +240,14 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
 
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)$(BR2_PACKAGE_IMX_GPU_VIV),yy)
+# use vivante backend
+define QT5BASE_CONFIGURE_QMAKE_CONFIG
+	echo "EGLFS_DEVICE_INTEGRATION = eglfs_viv" >> \
+		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
+endef
+endif
+
 ifneq ($(QT5BASE_CONFIG_FILE),)
 define QT5BASE_CONFIGURE_CONFIG_FILE
 	cp $(QT5BASE_CONFIG_FILE) $(@D)/src/corelib/global/qconfig-buildroot.h
@@ -257,6 +265,7 @@ endif
 define QT5BASE_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qmake.conf \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
+	$(QT5BASE_CONFIGURE_QMAKE_CONFIG)
 	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qplatformdefs.h \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
 	$(QT5BASE_CONFIGURE_CONFIG_FILE)
