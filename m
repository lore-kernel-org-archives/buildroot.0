From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 21 Mar 2019 22:23:23 +0100
Subject: [Buildroot] [PATCH v1] package/qt5base: fix xkbcommon option
Message-ID: <20190321212323.22920-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Qt 5.6: according to configure --help the command line option to
  enable x11 xkbcommon support is '-system-xkbcommon-x11'

- Qt 5.12: according to configure --help the command line option to
  enable xkbcommon support is '-xkbcommon'

Fixes [1]:

  ERROR: Invalid value given for boolean command line option 'xkbcommon'.

[1] http://autobuild.buildroot.net/results/87076d03bb92a9940447ca80fc1f202e35ef39da

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5base/qt5base.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 14536980a8..b0469172c0 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -153,7 +153,13 @@ QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-dir
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)

 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
-QT5BASE_CONFIGURE_OPTS += -xcb -system-xkbcommon
+QT5BASE_CONFIGURE_OPTS += -xcb
+ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+QT5BASE_CONFIGURE_OPTS += -xcb -system-xkbcommon-x11
+else
+QT5BASE_CONFIGURE_OPTS += -xcb -xkbcommon
+endif
+
 QT5BASE_DEPENDENCIES   += \
 	libxcb \
 	xcb-util-wm \
--
2.21.0
