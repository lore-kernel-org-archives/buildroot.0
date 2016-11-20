From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Nov 2016 23:13:26 +0100
Subject: [Buildroot] [PATCH 1/4] qextserialport: define
	QEXTSERIALPORT_CONFIGURE_CMDS only once
Message-ID: <20161120221329.5827-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Distinguish qt/qt5 by defining QEXTSERIALPORT_QMAKE, like is done e.g.
for quazip.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qextserialport/qextserialport.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 39e0407..11b1cc8 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -12,15 +12,15 @@ QEXTSERIALPORT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT),y)
 QEXTSERIALPORT_DEPENDENCIES += qt
-define QEXTSERIALPORT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT_QMAKE))
-endef
+QEXTSERIALPORT_QMAKE = $(QT_QMAKE)
 else ifeq ($(BR2_PACKAGE_QT5),y)
 QEXTSERIALPORT_DEPENDENCIES += qt5base
+QEXTSERIALPORT_QMAKE = $(QT5_QMAKE)
+endif
+
 define QEXTSERIALPORT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QEXTSERIALPORT_QMAKE))
 endef
-endif
 
 define QEXTSERIALPORT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-- 
2.10.2
