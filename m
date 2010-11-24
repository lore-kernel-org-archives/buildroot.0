From: Frederik Pasch <fpasch@googlemail.com>
Date: Wed, 24 Nov 2010 22:43:24 +0100
Subject: [Buildroot] [git commit master 1/1] gpsd: Only build qt support if
	qt-network is enabled
Message-ID: <20101124214437.6600E8E147@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5a8f4d7828903b6a97da3ad17f138c6b24c23128
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frederik Pasch <fpasch@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    2 +-
 package/gpsd/gpsd.mk |    9 +++++++++
 2 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 05c9554..e533219 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: bash, bind, busybox, libglib2,
+	Updated/fixed packages: bash, bind, busybox, gpsd, libglib2,
 	libcurl, libmad, lrzsz, midori, module-init-tools, mtd-utils,
 	openssh, openssl, pciutils, qt, sqlite, sysstat, webkit, zlib
 
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index ab7e921..6c24991 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -18,6 +18,15 @@ else
 	GPSD_CONF_OPT += --disable-libgpsmm
 endif
 
+# Enable or disable Qt binding
+ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
+	GPSD_CONF_ENV += QMAKE="$(QT_QMAKE)"
+	GPSD_CONF_OPT += --enable-libQgpsmm
+	GPSD_DEPENDENCIES += qt
+else
+	GPSD_CONF_OPT += --disable-libQgpsmm
+endif
+
 # If libusb is available build it before so the package can use it
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 	GPSD_DEPENDENCIES += libusb
-- 
1.7.2.2
