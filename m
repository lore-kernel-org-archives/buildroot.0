From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 20 Jan 2015 11:49:11 +0100
Subject: [Buildroot] [PATCH] qt: add QT_COORD_TYPE to double option
Message-ID: <1421750951-28114-1-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien D'Ascenzio <jdascenzio@paratronic.fr>

On ARM-based platforms, qreal is a typedef for float for performance
reasons.
But we may want a double precision anyway.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/qt/Config.in | 7 +++++++
 package/qt/qt.mk     | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 44710f52e627..fbc068b360b9 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -88,6 +88,13 @@ config BR2_PACKAGE_QT_CONFIG_FILE
 	  This option allows to set the path of such a configuration
 	  file, which Buildroot will give to Qt at compile time.
 
+config BR2_PACKAGE_QT_QT_COORD_TYPE_DOUBLE
+	bool "QT_COORD_TYPE to double"
+	help
+	  Set QT_COORD_TYPE to double
+	  On ARM-based platforms, qreal is a typedef for float for performance reasons.
+	  If unsure say n.
+
 config BR2_PACKAGE_QT_QT3SUPPORT
 	bool "Compatibility with Qt3"
 	depends on BR2_PACKAGE_QT_GUI_MODULE
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 98fc0e65f9c0..8fbbd63521c3 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -60,6 +60,11 @@ QT_CFLAGS+=-marm
 QT_CXXFLAGS+=-marm
 endif
 
+ifeq ($(BR2_PACKAGE_QT_QT_COORD_TYPE_DOUBLE),y)
+QT_CFLAGS += -DQT_COORD_TYPE=double
+QT_CXXFLAGS += -DQT_COORD_TYPE=double
+endif
+
 ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
 QT_CONFIGURE_OPTS += -qt3support
 else
-- 
2.0.0
