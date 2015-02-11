From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 11 Feb 2015 19:37:29 +0000
Subject: [Buildroot] [PATCH] qt5connectivity: fix for big endian platforms
Message-ID: <1423683449-50204-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to fix qt5connectivity for big endian platforms.

Building qtconnectivity fails for big endian platforms because the
bswap_16 function is not declared. This is the error message:

In file included from bluez/hcimanager_p.h:52:0,
		 from bluez/hcimanager.cpp:35:
./bluez/bluez_data_p.h: In function 'quint16 bt_get_le16(const void*)':
./bluez/bluez_data_p.h:172:60: error: 'bswap_16' was not declared in
this scope
     return bswap_16(bt_get_unaligned((const quint16 *) ptr));

bswap_16 is defined in byteswap.h so we can include this file in order
to fix this problem.

This patch has been submitted upstream:

  https://bugreports.qt.io/browse/QTBUG-44421

Fixes:

  http://autobuild.buildroot.net/results/5b8/5b85c6819f94988abd8abfcdaad6226ceb2d790a/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...z_data_p.h-Add-missing-include-byteswap.h.patch |   46 ++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 package/qt5/qt5connectivity/0002-bluez_data_p.h-Add-missing-include-byteswap.h.patch

diff --git a/package/qt5/qt5connectivity/0002-bluez_data_p.h-Add-missing-include-byteswap.h.patch b/package/qt5/qt5connectivity/0002-bluez_data_p.h-Add-missing-include-byteswap.h.patch
new file mode 100644
index 0000000..fc4be10
--- /dev/null
+++ b/package/qt5/qt5connectivity/0002-bluez_data_p.h-Add-missing-include-byteswap.h.patch
@@ -0,0 +1,46 @@
+bluez_data_p.h: Add missing "#include <byteswap.h>"
+
+This patch has been submitted upstream:
+
+  https://bugreports.qt.io/browse/QTBUG-44421
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 1e219701c61cdedf0e8cfda542ee2485f5fd059a Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Wed, 11 Feb 2015 18:11:05 +0000
+Subject: [PATCH] bluez_data_p.h: Add missing "#include <byteswap.h>"
+
+Building qtconnectivity fails for big endian platforms because the
+bswap_16 function is not declared. This is the error message:
+
+In file included from bluez/hcimanager_p.h:52:0,
+		 from bluez/hcimanager.cpp:35:
+./bluez/bluez_data_p.h: In function 'quint16 bt_get_le16(const void*)':
+./bluez/bluez_data_p.h:172:60: error: 'bswap_16' was not declared in
+this scope
+     return bswap_16(bt_get_unaligned((const quint16 *) ptr));
+
+bswap_16 is defined in byteswap.h so we can include this file in order
+to fix this problem.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ src/bluetooth/bluez/bluez_data_p.h |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/src/bluetooth/bluez/bluez_data_p.h b/src/bluetooth/bluez/bluez_data_p.h
+index 9d2d96b..64c90dd 100644
+--- a/src/bluetooth/bluez/bluez_data_p.h
++++ b/src/bluetooth/bluez/bluez_data_p.h
+@@ -48,6 +48,7 @@
+ #include <QtCore/qglobal.h>
+ #include <sys/socket.h>
+ #include <QtBluetooth/QBluetoothUuid>
++#include <byteswap.h>
+ 
+ #define BTPROTO_L2CAP   0
+ #define BTPROTO_HCI     1
+-- 
+1.7.1
+
-- 
1.7.1
