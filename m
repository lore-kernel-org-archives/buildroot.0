From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 09:03:37 +0100
Subject: [Buildroot] [git commit] package/qt5base: fix xkbcommon option
Message-ID: <20190324081038.59909825A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00de545ca78df14c8376d5f68df736ef65493687
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Qt 5.6: according to configure --help the command line option to
  enable x11 xkbcommon support is '-system-xkbcommon-x11'

- Qt 5.12: according to configure --help the command line option to
  enable xkbcommon support is '-xkbcommon'

Fixes [1]:

  ERROR: Invalid value given for boolean command line option 'xkbcommon'.

[1] http://autobuild.buildroot.net/results/87076d03bb92a9940447ca80fc1f202e35ef39da

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 14536980a8..fa0466dea8 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -153,7 +153,13 @@ QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-dir
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)
 
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
-QT5BASE_CONFIGURE_OPTS += -xcb -system-xkbcommon
+QT5BASE_CONFIGURE_OPTS += -xcb
+ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+QT5BASE_CONFIGURE_OPTS += -system-xkbcommon-x11
+else
+QT5BASE_CONFIGURE_OPTS += -xkbcommon
+endif
+
 QT5BASE_DEPENDENCIES   += \
 	libxcb \
 	xcb-util-wm \
