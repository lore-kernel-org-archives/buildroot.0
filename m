From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Jul 2015 23:54:46 +0200
Subject: [Buildroot] [PATCH 3/5 v10] package/opencv: add qt5 support
In-Reply-To: <cover.1436132995.git.yann.morin.1998@free.fr>
References: <cover.1436132995.git.yann.morin.1998@free.fr>
Message-ID: <5155a3b6c47fd098de012cc0620e53e1bc2d046d.1436132995.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

Starting with the 2.4.6 release, OpenCV supports either Qt4 or Qt5 as GUI
toolkit, so add Qt5 in the GUI toolkit choice.

When Qt4 is enabled (and thus Qt5 is hidden and disabled), no need to
show a comment stating "Qt5 support needs Qt5", because Qt5 is not
selectable.

Conversely, when Qt5 is enabled and Qt4 is not, then no need to show a
comment stating "Qt4 support needs Qt4", because enabling Qt4 would
disable Qt5.

So, we only show the comments when neither toolkit is enabled.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: split-out the Qt5 hunk from the
 switch-selects-to-depends hunk]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v9 -> v10;
  - split this patch in two, one to switch depends->select (previous
    patch) and one to add Qt5 (this patch)  (Yann)
---
 package/opencv/Config.in | 16 +++++++++++++++-
 package/opencv/opencv.mk | 11 +++++++++--
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 5dd39ca..5e8f189 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -81,7 +81,21 @@ config BR2_PACKAGE_OPENCV_WITH_QT
 
 comment "qt4 support needs qt"
 	depends on BR2_USE_MMU # qt
-	depends on !BR2_PACKAGE_QT
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
1.9.1
