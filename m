From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  5 Jul 2015 16:28:59 +0200
Subject: [Buildroot] [PATCH v9 3/4] package/opencv: add gtk3 support
In-Reply-To: <1436106540-3466-1-git-send-email-s.martin49@gmail.com>
References: <1436106540-3466-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436106540-3466-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fully rework the GTK support in OpenCV because it now supports gtk2 and
gtk3 (but only one at the time).

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v8->v9:
- rebase
- all GUI toolkit options now depend on their respective 3rd-party
  backend (ThomasP)
- update commit log

changes v7->v8:
-update a/r/t tags

changes v6->v7:
- update A/R/T tags
- rebase

changes v5->v6:
- update a/r/t tags
- remove unneeded "default ..." (Yann)

changes v4->v5:
- new patch
---
 package/opencv/Config.in | 11 +++++++++++
 package/opencv/opencv.mk | 11 +++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 5e8f189..73c035e 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -70,6 +70,17 @@ comment "gtk2 support needs libgtk2"
 	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
 	depends on !BR2_PACKAGE_LIBGTK2
 
+config BR2_PACKAGE_OPENCV_WITH_GTK3
+	bool "gtk3"
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk3 -> cairo
+	depends on BR2_USE_MMU # libgtk3 -> libglib2
+	depends on BR2_PACKAGE_LIBGTK3
+
+comment "gtk3 support needs libgtk3"
+	depends on BR2_USE_MMU # libgtk3 -> glib2
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk3 -> cairo
+	depends on !BR2_PACKAGE_LIBGTK3
+
 config BR2_PACKAGE_OPENCV_WITH_QT
 	bool "qt4"
 	depends on BR2_PACKAGE_QT
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 98e1614..c788aeb 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -236,11 +236,18 @@ else
 OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK)$(BR2_PACKAGE_OPENCV_WITH_GTK3),)
+OPENCV_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
 OPENCV_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
 OPENCV_DEPENDENCIES += libgtk2
-else
-OPENCV_CONF_OPTS += -DWITH_GTK=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK3),y)
+OPENCV_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=OFF
+OPENCV_DEPENDENCIES += libgtk3
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_JASPER),y)
-- 
2.4.5
