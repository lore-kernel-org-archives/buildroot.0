From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Nov 2014 23:06:23 +0100
Subject: [Buildroot] [git commit] qextserialport: allow building with Qt5
Message-ID: <20141103220809.DC925B1943@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79d4063d78af7c0f21c6d3c1a0ee074976fde32b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qextserialport builds fine with both Qt4 and Qt5, so this commit
enables it for Qt5.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qextserialport/Config.in         |    4 +---
 package/qextserialport/qextserialport.mk |   10 ++++++++--
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
