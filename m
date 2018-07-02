From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Mon,  2 Jul 2018 10:49:22 -0400
Subject: [Buildroot] [PATCH] qt5webkit: fix installation of headers
Message-ID: <20180702144922.15130-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since Qt 5.11, the headers are not installed anymore.

The issue comes from a update in qt5base [1] which is not backported to
qt5webkit because it is not officially supported anymore by Qt.

Fixes build issues with qt5webkit-examples that requires QtWebKit
headers:

	In file included from main.cpp:42:
	window.h:46:10: fatal error: QWebElement: No such file or directory
	 #include <QWebElement>
	          ^~~~~~~~~~~~~
	compilation terminated.

[1]: https://github.com/qt/qtbase/commit/9c4c136bc9f29bab1cc9684dfced55a92a8bbe96

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---

Hi,

Unfortunatly, this patch cannot be git formated because the headers are not a
part of the git repository of qtwebkit.

Regards,
Ga?l

 .../0005-Fix-installation-of-class-headers.patch   | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/qt5/qt5webkit/5.9.1/0005-Fix-installation-of-class-headers.patch

diff --git a/package/qt5/qt5webkit/5.9.1/0005-Fix-installation-of-class-headers.patch b/package/qt5/qt5webkit/5.9.1/0005-Fix-installation-of-class-headers.patch
new file mode 100644
index 0000000000..abddfe5d14
--- /dev/null
+++ b/package/qt5/qt5webkit/5.9.1/0005-Fix-installation-of-class-headers.patch
@@ -0,0 +1,31 @@
+Fix installation of class headers
+
+Since Qt 5.11 (see commit [1]), the key word HEADER_CLASSES has been
+removed. It has been replaced by a new variable GENERATED_HEADER_FILES.
+
+The class headers were not generated, this commit moves them directly to
+HEADER_FILES.
+
+[1]: https://github.com/qt/qtbase/commit/9c4c136bc9f29bab1cc9684dfced55a92a8bbe96
+
+Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
+diff -Nurd qtwebkit-opensource-src-5.9.1.orig/include/QtWebKit/headers.pri qtwebkit-opensource-src-5.9.1/include/QtWebKit/headers.pri
+--- qtwebkit-opensource-src-5.9.1.orig/include/QtWebKit/headers.pri	2018-06-29 09:21:06.395038976 -0400
++++ qtwebkit-opensource-src-5.9.1/include/QtWebKit/headers.pri	2018-06-29 17:37:52.500020060 -0400
+@@ -1,5 +1,4 @@
+-SYNCQT.HEADER_FILES = WebKit/qt/Api/qwebdatabase.h WebKit/qt/Api/qwebelement.h WebKit/qt/Api/qwebhistory.h WebKit/qt/Api/qwebhistoryinterface.h WebKit/qt/Api/qwebkitglobal.h WebKit/qt/Api/qwebkitplatformplugin.h WebKit/qt/Api/qwebpluginfactory.h WebKit/qt/Api/qwebsecurityorigin.h WebKit/qt/Api/qwebsettings.h ../include/QtWebKit/qtwebkitversion.h ../include/QtWebKit/QtWebKit 
+-SYNCQT.HEADER_CLASSES = ../include/QtWebKit/QWebDatabase ../include/QtWebKit/QWebElement ../include/QtWebKit/QWebElementCollection ../include/QtWebKit/QWebHistoryItem ../include/QtWebKit/QWebHistory ../include/QtWebKit/QWebHistoryInterface ../include/QtWebKit/QWebSelectData ../include/QtWebKit/QWebSelectMethod ../include/QtWebKit/QWebNotificationData ../include/QtWebKit/QWebNotificationPresenter ../include/QtWebKit/QWebHapticFeedbackPlayer ../include/QtWebKit/QWebTouchModifier ../include/QtWebKit/QWebFullScreenVideoHandler ../include/QtWebKit/QWebSpellChecker ../include/QtWebKit/QWebKitPlatformPlugin ../include/QtWebKit/QWebPluginFactory ../include/QtWebKit/QWebSecurityOrigin ../include/QtWebKit/QWebSettings ../include/QtWebKit/QtWebKitVersion 
++SYNCQT.HEADER_FILES = WebKit/qt/Api/qwebdatabase.h WebKit/qt/Api/qwebelement.h WebKit/qt/Api/qwebhistory.h WebKit/qt/Api/qwebhistoryinterface.h WebKit/qt/Api/qwebkitglobal.h WebKit/qt/Api/qwebkitplatformplugin.h WebKit/qt/Api/qwebpluginfactory.h WebKit/qt/Api/qwebsecurityorigin.h WebKit/qt/Api/qwebsettings.h ../include/QtWebKit/qtwebkitversion.h ../include/QtWebKit/QtWebKit ../include/QtWebKit/QWebDatabase ../include/QtWebKit/QWebElement ../include/QtWebKit/QWebElementCollection ../include/QtWebKit/QWebHistoryItem ../include/QtWebKit/QWebHistory ../include/QtWebKit/QWebHistoryInterface ../include/QtWebKit/QWebSelectData ../include/QtWebKit/QWebSelectMethod ../include/QtWebKit/QWebNotificationData ../include/QtWebKit/QWebNotificationPresenter ../include/QtWebKit/QWebHapticFeedbackPlayer ../include/QtWebKit/QWebTouchModifier ../include/QtWebKit/QWebFullScreenVideoHandler ../include/QtWebKit/QWebSpellChecker ../include/QtWebKit/QWebKitPlatformPlugin ../include/QtWebKit/QWebPluginFactory ../include/QtWebKit/QWebSecurityOrigin ../include/QtWebKit/QWebSettings ../include/QtWebKit/QtWebKitVersion 
+ SYNCQT.PRIVATE_HEADER_FILES = WebKit/qt/Api/qhttpheader_p.h WebKit/qt/Api/qwebdatabase_p.h WebKit/qt/Api/qwebelement_p.h WebKit/qt/Api/qwebhistory_p.h WebKit/qt/Api/qwebplugindatabase_p.h WebKit/qt/Api/qwebscriptworld.h WebKit/qt/Api/qwebscriptworld_p.h WebKit/qt/Api/qwebsecurityorigin_p.h WebKit2/UIProcess/API/qt/qquicknetworkreply_p.h WebKit2/UIProcess/API/qt/qquicknetworkrequest_p.h WebKit2/UIProcess/API/qt/qquickurlschemedelegate_p.h WebKit2/UIProcess/API/qt/qquickwebpage_p.h WebKit2/UIProcess/API/qt/qquickwebpage_p_p.h WebKit2/UIProcess/API/qt/qquickwebview_p.h WebKit2/UIProcess/API/qt/qquickwebview_p_p.h WebKit2/UIProcess/API/qt/qtwebsecurityorigin_p.h WebKit2/UIProcess/API/qt/qwebchannelwebkittransport_p.h WebKit2/UIProcess/API/qt/qwebdownloaditem_p.h WebKit2/UIProcess/API/qt/qwebdownloaditem_p_p.h WebKit2/UIProcess/API/qt/qwebiconimageprovider_p.h WebKit2/UIProcess/API/qt/qwebkittest_p.h WebKit2/UIProcess/API/qt/qwebloadrequest_p.h WebKit2/UIProcess/API/qt/qwebnavigationhistory_p.h WebKit2/UIProcess/API/qt/qwebnavigationhistory_p_p.h WebKit2/UIProcess/API/qt/qwebnavigationrequest_p.h WebKit2/UIProcess/API/qt/qwebpermissionrequest_p.h WebKit2/UIProcess/API/qt/qwebpreferences_p.h WebKit2/UIProcess/API/qt/qwebpreferences_p_p.h WebKit2/UIProcess/API/qt/raw/qrawwebview_p.h WebKit2/UIProcess/API/qt/raw/qrawwebview_p_p.h WebKit2/UIProcess/API/qt/tests/bytearraytestdata.h WebKit2/UIProcess/API/qt/tests/testwindow.h WebKit2/UIProcess/API/qt/tests/util.h 
+ SYNCQT.INJECTED_PRIVATE_HEADER_FILES = 
+ SYNCQT.QPA_HEADER_FILES = 
+diff -Nurd qtwebkit-opensource-src-5.9.1.orig/include/QtWebKitWidgets/headers.pri qtwebkit-opensource-src-5.9.1/include/QtWebKitWidgets/headers.pri
+--- qtwebkit-opensource-src-5.9.1.orig/include/QtWebKitWidgets/headers.pri	2018-06-29 09:21:06.391705602 -0400
++++ qtwebkit-opensource-src-5.9.1/include/QtWebKitWidgets/headers.pri	2018-06-29 17:38:47.660648435 -0400
+@@ -1,5 +1,4 @@
+-SYNCQT.HEADER_FILES = WebKit/qt/WidgetApi/qgraphicswebview.h WebKit/qt/WidgetApi/qwebframe.h WebKit/qt/WidgetApi/qwebinspector.h WebKit/qt/WidgetApi/qwebpage.h WebKit/qt/WidgetApi/qwebview.h ../include/QtWebKitWidgets/qtwebkitwidgetsversion.h ../include/QtWebKitWidgets/QtWebKitWidgets 
+-SYNCQT.HEADER_CLASSES = ../include/QtWebKitWidgets/QGraphicsWebView ../include/QtWebKitWidgets/QWebHitTestResult ../include/QtWebKitWidgets/QWebFrame ../include/QtWebKitWidgets/QWebInspector ../include/QtWebKitWidgets/QWebPage ../include/QtWebKitWidgets/QWebView ../include/QtWebKitWidgets/QtWebKitWidgetsVersion 
++SYNCQT.HEADER_FILES = WebKit/qt/WidgetApi/qgraphicswebview.h WebKit/qt/WidgetApi/qwebframe.h WebKit/qt/WidgetApi/qwebinspector.h WebKit/qt/WidgetApi/qwebpage.h WebKit/qt/WidgetApi/qwebview.h ../include/QtWebKitWidgets/qtwebkitwidgetsversion.h ../include/QtWebKitWidgets/QtWebKitWidgets ../include/QtWebKitWidgets/QGraphicsWebView ../include/QtWebKitWidgets/QWebHitTestResult ../include/QtWebKitWidgets/QWebFrame ../include/QtWebKitWidgets/QWebInspector ../include/QtWebKitWidgets/QWebPage ../include/QtWebKitWidgets/QWebView ../include/QtWebKitWidgets/QtWebKitWidgetsVersion 
+ SYNCQT.PRIVATE_HEADER_FILES = WebKit/qt/WidgetApi/qwebframe_p.h WebKit/qt/WidgetApi/qwebinspector_p.h WebKit/qt/WidgetApi/qwebpage_p.h WebKit/qt/WidgetApi/qwebviewaccessible_p.h 
+ SYNCQT.INJECTED_PRIVATE_HEADER_FILES = 
+ SYNCQT.QPA_HEADER_FILES = 
-- 
2.11.0
