From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:29 +0100
Subject: [Buildroot] [RFC v2 29/31] qt: define license choice
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-30-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/qt/Config.in |   15 +++++++++++++++
 package/qt/qt.mk     |    9 +++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 3a552d0..b430258 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -55,6 +55,21 @@ config BR2_PACKAGE_QT_LICENSE_APPROVED
 	  LGPL v2.1: http://doc.trolltech.com/4.5/lgpl.html
 	  GPL  v3.0: http://doc.trolltech.com/4.5/gpl.html
 
+if BR2_PACKAGE_QT_LICENSE_APPROVED
+
+choice
+	prompt "License"
+
+config BR2_PACKAGE_QT_LICENSE_LGPL
+	bool "LGPL v2.1"
+
+config BR2_PACKAGE_QT_LICENSE_GPL
+	bool "GPL v3.0"
+
+endchoice
+
+endif # BR2_PACKAGE_QT_LICENSE_APPROVED
+
 config BR2_PACKAGE_QT_CONFIG_FILE
 	string "Config file"
 	help
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 776eb63..e8bc3a2 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -20,6 +20,15 @@ QT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
 QT_CONFIGURE_OPTS += -opensource -confirm-license
+
+ifeq ($(BR2_PACKAGE_QT_LICENSE_LGPL),y)
+QT_LICENSE = LGPLv2.1
+QT_LICENSE_FILES = LICENSE.LGPL
+else ifeq ($(BR2_PACKAGE_QT_LICENSE_GPL),y)
+QT_LICENSE = GPLv3
+QT_LICENSE_FILES = LICENSE.GPL3
+endif
+
 endif
 
 QT_CONFIG_FILE=$(call qstrip,$(BR2_PACKAGE_QT_CONFIG_FILE))
-- 
1.7.5.4
