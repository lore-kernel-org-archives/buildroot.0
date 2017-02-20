From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Feb 2017 09:24:59 +0100
Subject: [Buildroot] [PATCH] qt5: disallow 5.8 version for ARMv4
Message-ID: <20170220082459.30816-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/197/197ab8a12bf1d780a986e5d447d1e0f5ee070405/

qt5.8 no longer supports ARMv4. From src/corelib/global/qprocessordetection.h:

  if Q_PROCESSOR_ARM >= 6
    define Q_PROCESSOR_ARM_V6
  endif
  if Q_PROCESSOR_ARM >= 5
    define Q_PROCESSOR_ARM_V5
  else
    error "ARM architecture too old"

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index b3cb2adfe..71258aafc 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -38,6 +38,7 @@ config BR2_PACKAGE_QT5_VERSION_LATEST
 	bool "Latest (5.8)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
+	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	help
 	  This option builds Qt 5.8, which is licensed under
 	  (L)GPLv3+.
-- 
2.11.0
