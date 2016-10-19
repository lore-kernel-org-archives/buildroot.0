From: johanderycke at gmail.com <johanderycke@gmail.com>
Date: Wed, 19 Oct 2016 16:35:24 +0200
Subject: [Buildroot] [PATCH V3, 1/1] Fix: qt5webkit overwrites target python.
Message-ID: <1476887724-30979-1-git-send-email-johanderycke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Johan Derycke <johan.derycke@barco.com>

Fixes issue with https://git.buildroot.net/buildroot/commit/?id=ac16793eaaabfced0312420759e3a66cdaa1ea8e.
We made a link in $(@D)/bin/python which is copied to $(TARGET_DIR) during install and overwrites target pyton.
Fixed by using $(@D)/host-bin instead.

Signed-off-by: Johan Derycke <johan.derycke@barco.com>
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v2 -> v3
- Added Tested-by
- More detailed commit log

Changes v1 -> v2:
- simpler fix suggested by Thomas

 package/qt5/qt5webkit/qt5webkit.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)


diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index f300c11..378cdf7 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -36,10 +36,10 @@ endif
 # QtWebkit's build system uses python, but only supports python2. We work
 # around this by forcing python2 early in the PATH, via a python->python2
 # symlink.
-QT5WEBKIT_ENV = PATH=$(@D)/bin:$(BR_PATH)
+QT5WEBKIT_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
 define QT5WEBKIT_PYTHON2_SYMLINK
-	mkdir -p $(@D)/bin
-	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
+	mkdir -p $(@D)/host-bin
+	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/host-bin/python
 endef
 QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 
-- 
2.1.4
