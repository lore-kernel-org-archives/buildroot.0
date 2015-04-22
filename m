From: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Apr 2015 10:34:18 +0200
Subject: [Buildroot] [PATCH RESEND] qt: add QT_COORD_TYPE to double option
In-Reply-To: <1421750951-28114-1-git-send-email-richard.genoud@gmail.com>
References: <1421750951-28114-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <1429691658-13139-1-git-send-email-richard.genoud@gmail.com>
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
Rebased and compiled on master (21 april 2015) for arm926ej-s

 package/qt/Config.in | 7 +++++++
 package/qt/qt.mk     | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 43f5a0fc7c0d..c3922abb9f23 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -120,6 +120,13 @@ config BR2_PACKAGE_QT_CONFIG_FILE
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
index 76acbfcea476..ce0a21ab288a 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -46,6 +46,11 @@ QT_CFLAGS += -marm
 QT_CXXFLAGS += -marm
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
2.3.4
