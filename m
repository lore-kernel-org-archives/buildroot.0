From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 16 Mar 2015 11:54:58 +0100
Subject: [Buildroot] [PATCH 1/2] package/wpa_supplicant: bump to version 2.4
Message-ID: <1426503299-17058-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also:
- remove patches: merged upstream
- update hash

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../wpa_supplicant/0001-fix-musl-build-error.patch | 45 ----------------------
 ...02-use-correct-include-path-for-libnl-3.0.patch | 26 -------------
 package/wpa_supplicant/wpa_supplicant.hash         |  4 +-
 package/wpa_supplicant/wpa_supplicant.mk           |  2 +-
 4 files changed, 3 insertions(+), 74 deletions(-)
 delete mode 100644 package/wpa_supplicant/0001-fix-musl-build-error.patch
 delete mode 100644 package/wpa_supplicant/0002-use-correct-include-path-for-libnl-3.0.patch

diff --git a/package/wpa_supplicant/0001-fix-musl-build-error.patch b/package/wpa_supplicant/0001-fix-musl-build-error.patch
deleted file mode 100644
index 08f63df..0000000
--- a/package/wpa_supplicant/0001-fix-musl-build-error.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From ccc079dc16e70844bb28e84d00bd26b61ecc755c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
-Date: Wed, 3 Dec 2014 22:29:29 +0100
-Subject: [PATCH 1/1] fix musl build error
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Building wpa_supplicant with the musl C library fails since musl does not
-define type names such as '__uint32_t'. To support building wpa_supplicant
-with the musl C library use the integer types declared in the ISO C standard
-header file <stdint.h>.
-
-Signed-off-by: J?rg Krause <jkrause@posteo.de>
----
- src/drivers/linux_wext.h | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/drivers/linux_wext.h b/src/drivers/linux_wext.h
-index 55cf955..e7c7001 100644
---- a/src/drivers/linux_wext.h
-+++ b/src/drivers/linux_wext.h
-@@ -19,13 +19,13 @@
- #define _LINUX_SOCKET_H
- #define _LINUX_IF_H
- 
--#include <sys/types.h>
-+#include <stdint.h>
- #include <net/if.h>
--typedef __uint32_t __u32;
--typedef __int32_t __s32;
--typedef __uint16_t __u16;
--typedef __int16_t __s16;
--typedef __uint8_t __u8;
-+typedef uint32_t __u32;
-+typedef int32_t __s32;
-+typedef uint16_t __u16;
-+typedef int16_t __s16;
-+typedef uint8_t __u8;
- #ifndef __user
- #define __user
- #endif /* __user */
--- 
-2.1.3
-
diff --git a/package/wpa_supplicant/0002-use-correct-include-path-for-libnl-3.0.patch b/package/wpa_supplicant/0002-use-correct-include-path-for-libnl-3.0.patch
deleted file mode 100644
index 6ed0eed..0000000
--- a/package/wpa_supplicant/0002-use-correct-include-path-for-libnl-3.0.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 4426de35f0e5dd5b0152474ce6a885b73de60656 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Tue, 16 Dec 2014 23:50:33 +0100
-Subject: [PATCH 2/2] use correct include path for libnl-3.0
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- src/drivers/drivers.mak | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/drivers/drivers.mak b/src/drivers/drivers.mak
-index cdb913e..e9fc83c 100644
---- a/src/drivers/drivers.mak
-+++ b/src/drivers/drivers.mak
-@@ -35,7 +35,7 @@ NEED_RFKILL=y
- ifdef CONFIG_LIBNL32
-   DRV_LIBS += -lnl-3
-   DRV_LIBS += -lnl-genl-3
--  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
-+  DRV_CFLAGS += -DCONFIG_LIBNL20 `pkg-config --cflags libnl-3.0`
- ifdef CONFIG_LIBNL3_ROUTE
-   DRV_LIBS += -lnl-route-3
-   DRV_CFLAGS += -DCONFIG_LIBNL3_ROUTE
--- 
-1.9.3
-
diff --git a/package/wpa_supplicant/wpa_supplicant.hash b/package/wpa_supplicant/wpa_supplicant.hash
index 947ae23..37a9fee 100644
--- a/package/wpa_supplicant/wpa_supplicant.hash
+++ b/package/wpa_supplicant/wpa_supplicant.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	eaaa5bf3055270e521b2dff64f2d203ec8040f71958b8588269a82c00c9d7b6a	wpa_supplicant-2.3.tar.gz
+# Locally calculated with: sha256sum wpa_supplicant-2.4.tar.gz
+sha256	058dc832c096139a059e6df814080f50251a8d313c21b13364c54a1e70109122  wpa_supplicant-2.4.tar.gz
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 682cb4c..3ab8e05 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPA_SUPPLICANT_VERSION = 2.3
+WPA_SUPPLICANT_VERSION = 2.4
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
 WPA_SUPPLICANT_LICENSE = GPLv2/BSD-3c
 WPA_SUPPLICANT_LICENSE_FILES = README
-- 
2.3.3
