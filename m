From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:10:59 +0100
Subject: [Buildroot] [git commit] package/wpa_supplicant: Add patch to fix
	build error with musl
Message-ID: <20141207211105.50940800BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02e9b3c1c77a2de58fd7e4371189cf9f5ff6a2bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to allow building wpa_supplicant with the musl C library.

Building wpa_supplicant with the musl C library fails since musl does not
define type names such as '__uint32_t'. To support building wpa_supplicant
with the musl C library use the integer types declared in the ISO C standard
header file <stdint.h>.

Patch is sent upstream:
http://lists.shmoo.com/pipermail/hostap/2014-December/031464.html

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../wpa_supplicant-0001-fix-musl-build-error.patch |   45 ++++++++++++++++++++
 1 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant-0001-fix-musl-build-error.patch b/package/wpa_supplicant/wpa_supplicant-0001-fix-musl-build-error.patch
new file mode 100644
index 0000000..08f63df
--- /dev/null
+++ b/package/wpa_supplicant/wpa_supplicant-0001-fix-musl-build-error.patch
@@ -0,0 +1,45 @@
+From ccc079dc16e70844bb28e84d00bd26b61ecc755c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
+Date: Wed, 3 Dec 2014 22:29:29 +0100
+Subject: [PATCH 1/1] fix musl build error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Building wpa_supplicant with the musl C library fails since musl does not
+define type names such as '__uint32_t'. To support building wpa_supplicant
+with the musl C library use the integer types declared in the ISO C standard
+header file <stdint.h>.
+
+Signed-off-by: J??rg Krause <jkrause@posteo.de>
+---
+ src/drivers/linux_wext.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/drivers/linux_wext.h b/src/drivers/linux_wext.h
+index 55cf955..e7c7001 100644
+--- a/src/drivers/linux_wext.h
++++ b/src/drivers/linux_wext.h
+@@ -19,13 +19,13 @@
+ #define _LINUX_SOCKET_H
+ #define _LINUX_IF_H
+ 
+-#include <sys/types.h>
++#include <stdint.h>
+ #include <net/if.h>
+-typedef __uint32_t __u32;
+-typedef __int32_t __s32;
+-typedef __uint16_t __u16;
+-typedef __int16_t __s16;
+-typedef __uint8_t __u8;
++typedef uint32_t __u32;
++typedef int32_t __s32;
++typedef uint16_t __u16;
++typedef int16_t __s16;
++typedef uint8_t __u8;
+ #ifndef __user
+ #define __user
+ #endif /* __user */
+-- 
+2.1.3
+
