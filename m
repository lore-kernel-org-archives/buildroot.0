From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 15:06:40 +0200
Subject: [Buildroot] [git commit] qt: add option for enabling the
	accessibility support
Message-ID: <20160715132142.181097FFC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ec1fbbdbb97aa1c42c7cf97c927465aa645aec6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds an entry in the configuration menu in order to enable or
disable the accessibility support.

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in | 5 +++++
 package/qt/qt.mk     | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 0fa2424..548d180 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -302,6 +302,11 @@ config BR2_PACKAGE_QT_QTTIFF
 	bool "Use Qt bundled libtiff"
 endchoice
 
+config BR2_PACKAGE_QT_ACCESSIBILITY
+	bool "Enable accessibility support"
+	help
+	  This enables and compiles the accessibility support.
+
 endif # BR2_PACKAGE_QT_GUI_MODULE
 
 choice
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index d56fe7e..47d5b00 100644
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
@@ -520,7 +526,6 @@ define QT_CONFIGURE_CMDS
 		-no-xinerama \
 		-no-cups \
 		-no-nis \
-		-no-accessibility \
 		-no-separate-debug-info \
 		-prefix /usr \
 		-plugindir /usr/lib/qt/plugins \
