From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 22:44:36 +0100
Subject: [Buildroot] [git commit] qextserialport: use 'make install' to
	install to staging
Message-ID: <20161121214828.9DB4F81D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ad8e9917fd1ea37a4866ef00ce42fd029a72bae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[Thomas: also adjust 0003-pkgconfig.patch to fix the header path.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qextserialport/0002-main-include.patch | 2 +-
 package/qextserialport/0003-pkgconfig.patch    | 2 +-
 package/qextserialport/qextserialport.mk       | 6 ++----
 3 files changed, 4 insertions(+), 6 deletions(-)

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
diff --git a/package/qextserialport/0003-pkgconfig.patch b/package/qextserialport/0003-pkgconfig.patch
index d67f3fc..bb55ad7 100644
--- a/package/qextserialport/0003-pkgconfig.patch
+++ b/package/qextserialport/0003-pkgconfig.patch
@@ -10,7 +10,7 @@ Index: qextserialport-ef4af2a2ee3f/qextserialport.pc
 +prefix=/usr
 +exec_prefix=${prefix}
 +libdir=${prefix}/lib
-+includedir=${prefix}/include/QExtSerialPort
++includedir=${prefix}/include/QtExtSerialPort
 +
 +Name: QtExtSerialPort
 +Description: QtExtSerialPort library
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
 
