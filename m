From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:40 +0200
Subject: [Buildroot] [PATCH 17/23] qt: add explicit Kconfig option to enable
	exceptions
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-18-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't implicitly enable exceptions when the XML-Patterns-Modul is
build, instead provide an separate entry in the Kconfig menu.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/Config.in |    7 +++++++
 package/qt/qt.mk     |    8 +++++++-
 2 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index b7fe0f9..48efac2 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -287,6 +287,7 @@ config BR2_PACKAGE_QT_XML
 config BR2_PACKAGE_QT_XMLPATTERNS
 	bool "XML Patterns Module"
 	depends on BR2_PACKAGE_QT_XML
+	select BR2_PACKAGE_QT_EXCEPTIONS
 	help
 	  Build QtXmlPatterns module.
 	  If unsure, say n
@@ -311,6 +312,12 @@ config BR2_PACKAGE_QT_WEBKIT
 	  Build the WebKit module.
 	  If unsure, say n.
 
+config BR2_PACKAGE_QT_EXCEPTIONS
+	bool "Exceptions support"
+	help
+	  Compile Qt with exceptions enabled.
+	  If unsure, say N.
+
 config BR2_PACKAGE_QT_STL
 	bool "STL support"
 	help
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 8491195..a747b40 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -285,7 +285,7 @@ QT_CONFIGURE+= -no-sql-sqlite
 endif
 
 ifeq ($(BR2_PACKAGE_QT_XMLPATTERNS),y)
-QT_CONFIGURE+= -xmlpatterns -exceptions
+QT_CONFIGURE+= -xmlpatterns
 else
 QT_CONFIGURE+= -no-xmlpatterns
 endif
@@ -309,6 +309,12 @@ else
 QT_CONFIGURE+= -no-webkit
 endif
 
+ifeq ($(BR2_PACKAGE_QT_EXCEPTIONS),y)
+QT_CONFIGURE += -exceptions
+else
+QT_CONFIGURE += -no-exceptions
+endif
+
 ifeq ($(BR2_PACKAGE_QT_STL),y)
 QT_CONFIGURE+= -stl
 else
-- 
1.6.3.3
