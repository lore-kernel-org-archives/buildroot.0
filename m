From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Tue, 8 Aug 2017 17:09:10 -0700
Subject: [Buildroot] [PATCH] package/qt5base: libgtk3 support depends on X11
	backend
Message-ID: <1502237350-17331-1-git-send-email-joshua.henderson@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgtk3 can conditionally be build with or without the X11 backend unlike
libgtk2. If libgtk3 is enabled and the X11 backend is not enabled for
BR2_PACKAGE_QT5_VERSION_LATEST, a build error [1] is introduced.  This change
disables gtk support in this case.

[1] http://autobuild.buildroot.net/results/6f3c2fcb0a44cd13ef4c73822d4d08f923291099

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Brent Sink <brents_3@hotmail.com>
Cc: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
---
 package/qt5/qt5base/qt5base.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index bbbdd41..1b4bd7b 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -190,6 +190,16 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-libinput
 endif
 
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)$(BR2_PACKAGE_LIBGTK3),yy)
+# only enable gtk support if libgtk3 X11 backend is enabled
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+QT5BASE_CONFIGURE_OPTS += -gtk
+QT5BASE_DEPENDENCIES += libgtk3
+else
+QT5BASE_CONFIGURE_OPTS += -no-gtk
+endif
+endif
+
 # Build the list of libraries to be installed on the target
 QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XCB)        += Qt5XcbQpa
-- 
2.7.4
