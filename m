From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 14 Oct 2011 15:51:58 +0100
Subject: [Buildroot] [PATCH 6/9] Qt commercial support
In-Reply-To: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1318603921-22899-7-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows the commercial version of Qt to be built. It does not attempt to download the source code, instead it uses the new file: method so the user has to download the source manually

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/qt/Config.in |   21 +++++++++++++++++++--
 package/qt/qt.mk     |   11 +++++++++--
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 513f135..4640937 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -11,6 +11,23 @@ menuconfig BR2_PACKAGE_QT
 
 if BR2_PACKAGE_QT
 
+choice
+	prompt "License type"
+	default BR2_PACKAGE_QT_LICENSE_OPENSOURCE
+	help
+	  Selects the license type: Opensource or Commercial
+
+config BR2_PACKAGE_QT_LICENSE_OPENSOURCE
+	bool "Opensource License"
+
+config BR2_PACKAGE_QT_LICENSE_COMMERCIAL
+	bool "Commercial License"
+	help
+	  You will need a valid license file for this to work.
+	  You will also need to download the source code manually.
+
+endchoice
+
 comment "Qt will be built for use with an X server"
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
 
@@ -53,9 +70,9 @@ config BR2_PACKAGE_QT_STATIC
 endchoice
 
 config BR2_PACKAGE_QT_LICENSE_APPROVED
-	bool "Approve free license"
+	bool "Approve license"
 	help
-	  Select this if you approve one of the available free licenses for the
+	  Select this if you approve one of the available licenses for the
 	  Qt4 library.
 	  By doing this you will not be asked while the library is compiled.
 	  Please read and understand the license terms before approving this.
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index a36fcb6..78d821a 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -13,13 +13,20 @@
 ######################################################################
 
 QT_VERSION = 4.7.4
-QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
+QT_LICENSE_TYPE = opensource
+ifeq ($(BR2_PACKAGE_QT_LICENSE_COMMERCIAL),y)
+QT_LICENSE_TYPE = commercial
+endif
+QT_SOURCE  = qt-everywhere-$(QT_LICENSE_TYPE)-src-$(QT_VERSION).tar.gz
 QT_SITE    = http://get.qt.nokia.com/qt/source
+ifeq ($(BR2_PACKAGE_QT_LICENSE_COMMERCIAL),y)
+QT_SITE    = file://$(HOME)
+endif
 
 QT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
-QT_CONFIGURE_OPTS += -opensource -confirm-license
+QT_CONFIGURE_OPTS += -$(QT_LICENSE_TYPE) -confirm-license
 endif
 
 QT_CONFIG_FILE=$(call qstrip,$(BR2_PACKAGE_QT_CONFIG_FILE))
-- 
1.7.2.5
