From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Oct 2017 18:09:19 +0200
Subject: [Buildroot] [PATCH v1] qt5base: fix keyboard input in case of
	libinput usage
Message-ID: <20171027160919.3054-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libinput keyboard support needs libxbcommon to gain
a functional keyboard input. Avoids the following runtime
warning:

  qt.qpa.input: X-less xkbcommon not available, not performing key mapping

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5base/Config.in  | 1 +
 package/qt5/qt5base/qt5base.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index dc56474bbb..14c3bf4a84 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -119,6 +119,7 @@ config BR2_PACKAGE_QT5BASE_XML
 config BR2_PACKAGE_QT5BASE_GUI
 	bool "gui module"
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_LIBINPUT
 	# At least one graphic backend must be enabled, so enable
 	# linuxfb if nothing is enabled.
 	select BR2_PACKAGE_QT5BASE_LINUXFB if \
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 1683eda838..ea6653de15 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -200,8 +200,8 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_LIBINPUT),y)
-QT5BASE_CONFIGURE_OPTS += -libinput
-QT5BASE_DEPENDENCIES += libinput
+QT5BASE_CONFIGURE_OPTS += -libinput -xkbcommon-evdev
+QT5BASE_DEPENDENCIES += libinput libxkbcommon
 else
 QT5BASE_CONFIGURE_OPTS += -no-libinput
 endif
-- 
2.14.2
