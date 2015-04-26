From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 12:15:30 +0200
Subject: [Buildroot] [git commit] qt: add QT_COORD_TYPE to double option
Message-ID: <20150426101551.9F86C81786@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7619aba496208102e098e24454371b9513ec2f90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On ARM-based platforms, qreal is a typedef for float for performance
reasons. But we may want a double precision anyway.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in |   10 ++++++++++
 package/qt/qt.mk     |    5 +++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 43f5a0f..83fdeec 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -120,6 +120,16 @@ config BR2_PACKAGE_QT_CONFIG_FILE
 	  This option allows to set the path of such a configuration
 	  file, which Buildroot will give to Qt at compile time.
 
+config BR2_PACKAGE_QT_QT_COORD_TYPE_DOUBLE
+	bool "QT_COORD_TYPE to double"
+	help
+	  Set QT_COORD_TYPE to double. On ARM-based platforms, qreal
+	  is a typedef for float for performance reasons, but for
+	  QT_COORD_TYPE, some people may want to use a double type
+	  anyway for precision.
+
+	  If unsure say n.
+
 config BR2_PACKAGE_QT_QT3SUPPORT
 	bool "Compatibility with Qt3"
 	depends on BR2_PACKAGE_QT_GUI_MODULE
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index d1615ae..919137b 100644
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
