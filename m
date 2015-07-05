From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  5 Jul 2015 16:28:58 +0200
Subject: [Buildroot] [PATCH v9 2/4] package/opencv: add qt5 support
In-Reply-To: <1436106540-3466-1-git-send-email-s.martin49@gmail.com>
References: <1436106540-3466-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436106540-3466-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with the 2.4.6 release, OpenCV supports both Qt4 and Qt5 as GUI
toolkit, but only one can be enabled at the same time.

Since Buildroot does not support Qt4/Qt5 co-existence, we make the Qt4
knob depend on BR2_PACKAGE_QT5.

Note that we usually use 'select ...' to express the dependencies
between packages, but in this case, we cannot since the Qt4/Qt5
co-existence exclusion is not handled by a simple choice, but by some
extra dependencies in the choice entries:
  - Qt5 depends on !Qt4
  - Qt4 does not depend on !Qt5.

This makes impossible using 'select ...' for the Qt support knob without
triggering this following circular dependency error at the kconfig
level:
  package/opencv/Config.in:57:error: recursive dependency detected!
  package/opencv/Config.in:57:    choice <choice> contains symbol BR2_PACKAGE_OPENCV_WITH_QT5
  package/opencv/Config.in:111:   symbol BR2_PACKAGE_OPENCV_WITH_QT5 depends on BR2_PACKAGE_QT
  package/qt/Config.in:5: symbol BR2_PACKAGE_QT is selected by BR2_PACKAGE_OPENCV_WITH_QT
  package/opencv/Config.in:98:    symbol BR2_PACKAGE_OPENCV_WITH_QT is part of choice <choice>

Besides, we already use 'depends on ...' to express the dependencies
with some "big" packages (like xorg or libgtk2). qt or qt5* packages
are fairly big. So, I don't think it will hurt that much to use a
'depends on ...' statement in this case.

For consistency, this patch also makes all GUI backend options depend on
their respective 3rd-party backend.

Notes:
* if a backend has an unmet toolchain dependency, the comment will be
  shown in the choice, but won't tell what toolchain dependency is
  missing; for this, the user will have to refer to the given package
  comment.
* The comments about Qt4 and Qt5 both depend on "!Qt4 && !Qt5" because
  for Qt4: we want to see the comment when qt is not enabled, but it
  cannot be visible if qt5 is already enabled, and vice-versa fo qt5;
  all of this because of the way we handle the Qt4/Qt5 mutual exclusion
  as mentionned above.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v8->v9:
- rebase
- all GUI toolkit options now depend on their respective 3rd-party
  backend (ThomasP)
- update commit log
- remove unneeded comments in Config.in (ThomasP)

changes v7->v8:
- update a/r/t tags

changes v6->v7:
- fix depends on statements and comments (Yann)

changes v5->v6:
- bury BR2_avr32 remains (Yann)
- move knob in a choice (Yann)
- reword commit log

changes v4->v5:
- rebase

changes v3->v4:
- rebase
- rename _OPT -> _OPTS options
- rework qt backend selection (Yann)

changes v2->v3:
- rebase
- remove duplicate qt/qt5 dependencies (Yann)
- add missing 'depends on' to the comment about qt4

changes v1->v2:
- rebase
- update threads support dependency for qt5
---
 package/opencv/Config.in | 39 +++++++++++++++++++++------------------
 package/opencv/opencv.mk | 11 +++++++++--
 2 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index c3542c4..5e8f189 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -63,36 +63,39 @@ config BR2_PACKAGE_OPENCV_GUI_NONE
 
 config BR2_PACKAGE_OPENCV_WITH_GTK
 	bool "gtk2"
-	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
-	depends on BR2_USE_MMU # libgtk2 -> libglib2
-	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2
 
-comment "gtk2 needs X.org and a toolchain w/ wchar, threads, C++"
+comment "gtk2 support needs libgtk2"
 	depends on BR2_USE_MMU # libgtk2 -> glib2
 	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
-	depends on !BR2_PACKAGE_XORG7 || \
-		!BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PACKAGE_LIBGTK2
 
 config BR2_PACKAGE_OPENCV_WITH_QT
 	bool "qt4"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # qt
-	select BR2_PACKAGE_QT
+	depends on BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_TEST
 	help
-	  Use Qt with QtTest module and STL support
+	  Use Qt4 with QtTest and QtGui modules and STL support, as GUI toolkit.
 
-comment "qt4 needs a toolchain w/ C++"
+comment "qt4 support needs qt"
 	depends on BR2_USE_MMU # qt
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
+
+config BR2_PACKAGE_OPENCV_WITH_QT5
+	bool "qt5"
+	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_CONCURRENT
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	help
+	  Use Qt5 with base, concurrent, test, gui and widgets components, as GUI
+	  toolkit.
+
+comment "qt5 support needs qt5"
+	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
 
 endchoice
 
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 0e5cf77..98e1614 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -266,11 +266,18 @@ else
 OPENCV_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT)$(BR2_PACKAGE_OPENCV_WITH_QT5),)
+OPENCV_CONF_OPTS += -DWITH_QT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
 OPENCV_CONF_OPTS += -DWITH_QT=4
 OPENCV_DEPENDENCIES += qt
-else
-OPENCV_CONF_OPTS += -DWITH_QT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT5),y)
+OPENCV_CONF_OPTS += -DWITH_QT=5
+OPENCV_DEPENDENCIES += qt5base
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_TIFF),y)
-- 
2.4.5
