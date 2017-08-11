From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Aug 2017 14:01:12 +0200
Subject: [Buildroot] [git commit] package/qt5base: only build libgtk3
	support for X11 backend
Message-ID: <20170811120045.5D1F47FA8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8d2188db3c9bace344ae51ae9ec1a45f8351e98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgtk3 can conditionally be build with or without the X11 backend
unlike libgtk2. If libgtk3 is enabled and the X11 backend is not enabled
for BR2_PACKAGE_QT5_VERSION_LATEST, QT_EGL_NO_X11 or
MESA_EGL_NO_X11_HEADERS needs to be defined.

The proper way is to patch Qt to use pkg-config to fetch the correct
flags [1], or to add it to arch.conf like is done in commit 7d286be4f9.
For now, however, just disable libgtk3 support unless the X11 backend
is used.

Fixes http://autobuild.buildroot.net/results/6f3c2fcb0a44cd13ef4c73822d4d08f923291099

[1] https://codereview.qt-project.org/#/c/198906/

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Brent Sink <brents_3@hotmail.com>
Cc: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
[Arnout:
- extend commit message
- improve comment
- also pass -no-gtk if libgtk3 is not selected]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5base/qt5base.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index bbbdd41..0ca11a5 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -190,6 +190,16 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-libinput
 endif
 
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+# only enable gtk support if libgtk3 X11 backend is enabled
+ifeq ($(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_LIBGTK3_X11),yy)
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
