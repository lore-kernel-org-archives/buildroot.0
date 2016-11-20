From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Nov 2016 23:13:28 +0100
Subject: [Buildroot] [PATCH 3/4] qextserialport: use 'make install' to
	install to staging
In-Reply-To: <20161120221329.5827-1-arnout@mind.be>
References: <20161120221329.5827-1-arnout@mind.be>
Message-ID: <20161120221329.5827-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qmake hardcodes the path to the sysroot in the install commands, so
we can't use it for target. But it's perfectly usable for staging.

By using 'make install', we get:
- the extserialport.prf file is installed to the mkspecs directory and
  libqextserialport.prl in staging/usr/lib, so qmake can do its magic
  and add the necessary compiler options;
- it also works for static build, when *.so files don't exist.

The QExtSerialPort and qextserialport.pc files are created by
Buildroot so they still have to be installed explicitly. Note that
upstream installs in the QtExtSerialPort directory, not QExtSerialPort,
so we follow that decision.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Why do we have this 0002-main-include.patch anyway? It's clearly a
feature patch... And apparently no attempt has been made to upstream
it?
---
 package/qextserialport/0002-main-include.patch | 2 +-
 package/qextserialport/qextserialport.mk       | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/qextserialport/0002-main-include.patch b/package/qextserialport/0002-main-include.patch
index 858f335..27f67f6 100644
--- a/package/qextserialport/0002-main-include.patch
+++ b/package/qextserialport/0002-main-include.patch
@@ -1,7 +1,7 @@
 Create a main include file QExtSerialPort
 
 This main include file will be installed in
-<QExtSerialPort/QExtSerialPort> so that Qt applications can use this
+<QtExtSerialPort/QExtSerialPort> so that Qt applications can use this
 library by including header files in a Qt-like style.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index f48f596..15cb74c 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -27,10 +27,8 @@ define QEXTSERIALPORT_BUILD_CMDS
 endef
 
 define QEXTSERIALPORT_INSTALL_STAGING_CMDS
-	mkdir -p $(STAGING_DIR)/usr/include/QExtSerialPort
-	cp $(@D)/src/*.h $(STAGING_DIR)/usr/include/QExtSerialPort/
-	cp $(@D)/src/QExtSerialPort $(STAGING_DIR)/usr/include/QExtSerialPort/
-	cp -a $(@D)/*.so* $(STAGING_DIR)/usr/lib/
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	cp $(@D)/src/QExtSerialPort $(STAGING_DIR)/usr/include/QtExtSerialPort/
 	cp $(@D)/qextserialport.pc $(STAGING_DIR)/usr/lib/pkgconfig/
 endef
 
-- 
2.10.2
