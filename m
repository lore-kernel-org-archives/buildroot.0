From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  1 Nov 2014 23:15:11 +0100
Subject: [Buildroot] [PATCH 4/4] qextserialport: allow building with Qt5
In-Reply-To: <1414880111-19166-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1414880111-19166-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1414880111-19166-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qextserialport builds fine with both Qt4 and Qt5, so this commit
enables it for Qt5.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qextserialport/Config.in         |  4 +---
 package/qextserialport/qextserialport.mk | 10 ++++++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/qextserialport/Config.in b/package/qextserialport/Config.in
index 4e92ecf..ab05920 100644
--- a/package/qextserialport/Config.in
+++ b/package/qextserialport/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_QEXTSERIALPORT
 	bool "qextserialport"
-	# Qt is a big library, we don't want to select it
-	# automatically without the user knowing
-	depends on BR2_PACKAGE_QT
+	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
 	help
 	  A Qt library to manage serial ports
 
diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 85abe19..2949da9 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -10,13 +10,19 @@ QEXTSERIALPORT_SITE_METHOD = git
 
 QEXTSERIALPORT_LICENSE = MIT
 
-QEXTSERIALPORT_DEPENDENCIES = qt
-
 QEXTSERIALPORT_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_QT),y)
+QEXTSERIALPORT_DEPENDENCIES += qt
 define QEXTSERIALPORT_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT_QMAKE))
 endef
+else ifeq ($(BR2_PACKAGE_QT5),y)
+QEXTSERIALPORT_DEPENDENCIES += qt5base
+define QEXTSERIALPORT_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
+endef
+endif
 
 define QEXTSERIALPORT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-- 
2.0.0
