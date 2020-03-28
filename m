From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Mar 2020 22:48:29 +0100
Subject: [Buildroot] [PATCH 2/2] package/kodi: remove dependency to udev for
 libcec support
In-Reply-To: <20200328214829.159717-1-bernd.kuhls@t-online.de>
References: <20200328214829.159717-1-bernd.kuhls@t-online.de>
Message-ID: <20200328214829.159717-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcec added sysfs scanning support:

On Linux, dynamic device discovery is currently implemented via libudev,
which may not be available on more minimal systems. Thus, we implement a
new device discovery that directly uses sysfs to scan through available
USB devices for supported ones without any additional dependencies.

https://github.com/Pulse-Eight/libcec/commit/70d71cb16fa7c334373f3ba0148b89eafc04f73f

Previously Kodi needed udev to find the Pulse-Eight CEC adapter.
Run-time tested using Kodi 18.6-Leia.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 13b8f9df3e..07128ac3c5 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -160,15 +160,11 @@ config BR2_PACKAGE_KODI_LIBBLURAY
 
 config BR2_PACKAGE_KODI_LIBCEC
 	bool "hdmi cec"
-	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBCEC
 	help
 	  Enable CEC (Consumer Electronics Control) support.
 	  Select this if you want Kodi to support HDMI CEC.
 
-comment "hdmi cec support needs udev /dev management"
-	depends on !BR2_PACKAGE_HAS_UDEV
-
 config BR2_PACKAGE_KODI_LCMS2
 	bool "lcms2"
 	select BR2_PACKAGE_LCMS2
-- 
2.25.0
