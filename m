From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 13 Nov 2012 08:38:21 +0000
Subject: [Buildroot] [PATCH] bluez-utils: disable on avr32
Message-ID: <1352795901-29410-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The bluez-utils package does not build for the avr32 architecture; this
results in autobuilder failures such as the following.

  http://autobuild.buildroot.net/results/d737d1220d7566289eee802fd580a49d8c456c97/build-end.log

The underlying problem is with the <sys/epoll.h> header provided by the
antiquated avr32 toolchain; this header lacks definitions for
epoll_create1() and EPOLL_CLOEXEC.

This patch disables support for the bluez-utils package on the avr32
architecture.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/bluez_utils/Config.in |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index 9836b21..5f0971a 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BLUEZ_UTILS
 	bool "bluez-utils"
+	depends on !BR2_avr32
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib
 	select BR2_PACKAGE_DBUS
@@ -32,5 +33,8 @@ config BR2_PACKAGE_BLUEZ_UTILS_USB
 
 endif
 
+comment "bluez-utils are not supported on avr32"
+	depends on BR2_avr32
+
 comment "bluez-utils require a toolchain with WCHAR and thread support"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_avr32 && (!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.7.10.4
