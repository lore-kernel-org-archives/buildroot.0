From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 17 Dec 2014 00:07:27 +0100
Subject: [Buildroot] [PATCH] package/wpa_supplicant: use correct include
	path for libnl-3.0
Message-ID: <1418771247-12079-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
ERROR: unsafe header/library path used in cross-compilation: '/usr/include/libnl3'

Add a dependancy on host-pkgconf when BR2_PACKAGE_LIBNL is enabled.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reported-by: J?rg Krause <jkrause@posteo.de>
Cc: J?rg Krause <jkrause@posteo.de>
---
 ...02-use-correct-include-path-for-libnl-3.0.patch | 26 ++++++++++++++++++++++
 package/wpa_supplicant/wpa_supplicant.mk           |  2 +-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 package/wpa_supplicant/0002-use-correct-include-path-for-libnl-3.0.patch

diff --git a/package/wpa_supplicant/0002-use-correct-include-path-for-libnl-3.0.patch b/package/wpa_supplicant/0002-use-correct-include-path-for-libnl-3.0.patch
new file mode 100644
index 0000000..6ed0eed
--- /dev/null
+++ b/package/wpa_supplicant/0002-use-correct-include-path-for-libnl-3.0.patch
@@ -0,0 +1,26 @@
+From 4426de35f0e5dd5b0152474ce6a885b73de60656 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Tue, 16 Dec 2014 23:50:33 +0100
+Subject: [PATCH 2/2] use correct include path for libnl-3.0
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/drivers/drivers.mak | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/drivers/drivers.mak b/src/drivers/drivers.mak
+index cdb913e..e9fc83c 100644
+--- a/src/drivers/drivers.mak
++++ b/src/drivers/drivers.mak
+@@ -35,7 +35,7 @@ NEED_RFKILL=y
+ ifdef CONFIG_LIBNL32
+   DRV_LIBS += -lnl-3
+   DRV_LIBS += -lnl-genl-3
+-  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
++  DRV_CFLAGS += -DCONFIG_LIBNL20 `pkg-config --cflags libnl-3.0`
+ ifdef CONFIG_LIBNL3_ROUTE
+   DRV_LIBS += -lnl-route-3
+   DRV_CFLAGS += -DCONFIG_LIBNL3_ROUTE
+-- 
+1.9.3
+
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 0c4abb5..10b2c0a 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -35,7 +35,7 @@ ifeq ($(BR2_PACKAGE_LIBNL),y)
 ifeq ($(BR2_STATIC_LIBS),y)
 	WPA_SUPPLICANT_LIBS += -lnl-3 -lm -lpthread
 endif
-	WPA_SUPPLICANT_DEPENDENCIES += libnl
+	WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libnl
 	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_LIBNL32
 else
 	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
-- 
1.9.3
