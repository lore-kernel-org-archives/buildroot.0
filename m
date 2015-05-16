From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 May 2015 00:11:30 +0200
Subject: [Buildroot] [git commit] qt: fix webkit dependencies
Message-ID: <20150517070339.8C02480448@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d496bdddb44c6f8f97d0f573a7220ebf0ec41eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fix:
http://autobuild.buildroot.net/results/ce8/ce89ad1ca6aec9f7bb5549301bf4c0dcba9e0e37/

qtwebkit includes qscript headers.
For packages like python-pyqt if webkit is available but not qscript, the
compilation fails with :
buildroot/output/build/python-pyqt-4.11.3/sip/QtWebKit/qwebframe.sip:79:0:
../../../host/usr/i686-buildroot-linux-gnu/sysroot/usr/include/QtWebKit/qwebframe.h:28:36:
	fatal error: QtScript/qscriptengine.h: No such file or directory

This problem is not seen with Qt compilation because some relative include
directly from sources are added.

[Peter: also adjust comment]
Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 43f5a0f..67d5561 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -417,6 +417,7 @@ config BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 
 config BR2_PACKAGE_QT_WEBKIT
 	bool "WebKit Module"
+	depends on BR2_PACKAGE_QT_SCRIPT
 	depends on BR2_PACKAGE_QT_SHARED
 	depends on BR2_PACKAGE_QT_GUI_MODULE
 	depends on BR2_PACKAGE_QT_NETWORK
@@ -426,8 +427,9 @@ config BR2_PACKAGE_QT_WEBKIT
 	  Build the WebKit module.
 	  If unsure, say n.
 
-comment "WebKit needs shared library/NPTL toolchain/gui/network support"
-	depends on !(BR2_PACKAGE_QT_SHARED && BR2_PACKAGE_QT_GUI_MODULE && BR2_PACKAGE_QT_NETWORK)
+comment "WebKit needs shared library/NPTL toolchain/script/gui/network support"
+	depends on !(BR2_PACKAGE_QT_SCRIPT && BR2_PACKAGE_QT_SHARED && \
+		BR2_PACKAGE_QT_GUI_MODULE && BR2_PACKAGE_QT_NETWORK)
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 
