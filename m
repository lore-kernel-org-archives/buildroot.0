From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 17:47:32 +0100
Subject: [Buildroot] [git commit] qextserialport: install QExtSerialPort
	header with qmake
Message-ID: <20161125164755.914D581E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccd49eec60a037504f9f832115ae64803d8f1b1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of manually copying the QExtSerialPort header introduced in
patch 0002, update the patch to include this header in the qmake
project file so it gets properly installed.

While we're at it, convert to a git-formatted patch.

Fixes:
http://autobuild.buildroot.net/results/818b564a6e23bcecf4afc7e53811227b08e5f4eb
http://autobuild.buildroot.net/results/0b6c2d7c63329f5e790f02ccd29f14a317eadc71
http://autobuild.buildroot.net/results/ac552b63c6fb099a136066cda421f68e639808fa

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...Create-a-main-include-file-QExtSerialPort.patch | 43 ++++++++++++++++++++++
 package/qextserialport/0002-main-include.patch     | 15 --------
 package/qextserialport/qextserialport.mk           |  1 -
 3 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/package/qextserialport/0002-Create-a-main-include-file-QExtSerialPort.patch b/package/qextserialport/0002-Create-a-main-include-file-QExtSerialPort.patch
new file mode 100644
index 0000000..1f14304
--- /dev/null
+++ b/package/qextserialport/0002-Create-a-main-include-file-QExtSerialPort.patch
@@ -0,0 +1,43 @@
+From 62fbe9c3539945df6204501b7e3ae0d51db075a3 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 24 Nov 2016 22:30:40 +0100
+Subject: [PATCH] Create a main include file QExtSerialPort
+
+This main include file will be installed in
+<QtExtSerialPort/QExtSerialPort> so that Qt applications can use this
+library by including header files in a Qt-like style.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Arnout: add it to qextserialport.pri so it is installed]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ src/QExtSerialPort     | 2 ++
+ src/qextserialport.pri | 3 ++-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+ create mode 100644 src/QExtSerialPort
+
+diff --git a/src/QExtSerialPort b/src/QExtSerialPort
+new file mode 100644
+index 0000000..a48aeea
+--- /dev/null
++++ b/src/QExtSerialPort
+@@ -0,0 +1,2 @@
++#include "qextserialport.h"
++#include "qextserialenumerator.h"
+diff --git a/src/qextserialport.pri b/src/qextserialport.pri
+index 461d56f..f8a678d 100644
+--- a/src/qextserialport.pri
++++ b/src/qextserialport.pri
+@@ -3,7 +3,8 @@ DEPENDPATH += $$PWD
+ 
+ PUBLIC_HEADERS         += $$PWD/qextserialport.h \
+                           $$PWD/qextserialenumerator.h \
+-                          $$PWD/qextserialport_global.h
++                          $$PWD/qextserialport_global.h \
++                          $$PWD/QExtSerialPort
+ 
+ HEADERS                += $$PUBLIC_HEADERS \
+                           $$PWD/qextserialport_p.h \
+-- 
+2.10.2
+
diff --git a/package/qextserialport/0002-main-include.patch b/package/qextserialport/0002-main-include.patch
deleted file mode 100644
index 27f67f6..0000000
--- a/package/qextserialport/0002-main-include.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Create a main include file QExtSerialPort
-
-This main include file will be installed in
-<QtExtSerialPort/QExtSerialPort> so that Qt applications can use this
-library by including header files in a Qt-like style.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: qextserialport-ef4af2a2ee3f/src/QExtSerialPort
-===================================================================
---- /dev/null
-+++ qextserialport-ef4af2a2ee3f/src/QExtSerialPort
-@@ -0,0 +1,2 @@
-+#include "qextserialport.h"
-+#include "qextserialenumerator.h"
diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 3641353..62bf3b0 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -32,7 +32,6 @@ endef
 
 define QEXTSERIALPORT_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	cp $(@D)/src/QExtSerialPort $(STAGING_DIR)/usr/include/QtExtSerialPort/
 	cp $(@D)/qextserialport.pc $(STAGING_DIR)/usr/lib/pkgconfig/
 endef
 
