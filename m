From: Romain Perier <romain.perier@free-electrons.com>
Date: Tue, 26 Jul 2016 10:21:29 +0200
Subject: [Buildroot] [PATCH v3 5/6] qt: Add option for enabling the
	accessibility support
In-Reply-To: <1469521290-20446-1-git-send-email-romain.perier@free-electrons.com>
References: <1469521290-20446-1-git-send-email-romain.perier@free-electrons.com>
Message-ID: <1469521290-20446-6-git-send-email-romain.perier@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds an entry in the configuration menu in order to
enable or disable the accessibility support.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in | 5 +++++
 package/qt/qt.mk     | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 0ab8417..2523276 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -302,6 +302,11 @@ config BR2_PACKAGE_QT_QTTIFF
 	bool "Use Qt bundled libtiff"
 endchoice
 
+config BR2_PACKAGE_QT_ACCESSIBILITY
+	bool "Enable accessibility support"
+	help
+	  This enables and compile the accessibility support.
+
 endif # BR2_PACKAGE_QT_GUI_MODULE
 
 choice
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index f29a671..fa9dbf9 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -258,6 +258,12 @@ else
 QT_CONFIGURE_OPTS += -no-libmng
 endif
 
+ifeq ($(BR2_PACKAGE_QT_ACCESSIBILITY),y)
+QT_CONFIGURE_OPTS += -accessibility
+else
+QT_CONFIGURE_OPTS += -no-accessibility
+endif
+
 ifeq ($(BR2_PACKAGE_QT_QTZLIB),y)
 QT_CONFIGURE_OPTS += -qt-zlib
 else
@@ -517,7 +523,6 @@ define QT_CONFIGURE_CMDS
 		-no-xinerama \
 		-no-cups \
 		-no-nis \
-		-no-accessibility \
 		-no-separate-debug-info \
 		-prefix /usr \
 		-plugindir /usr/lib/qt/plugins \
-- 
2.8.1
