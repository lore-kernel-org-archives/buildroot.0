From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Feb 2017 09:39:55 +0100
Subject: [Buildroot] [git commit] qt5: disallow 5.8 version for ARMv4
Message-ID: <20170220084042.C67557FBB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49c543a79b7bdf3c9fbde83577ac14850721057f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

[Peter: also hide comment as pointed out by Baruch]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index b3cb2ad..8de2481 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -38,12 +38,14 @@ config BR2_PACKAGE_QT5_VERSION_LATEST
 	bool "Latest (5.8)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # C++11
+	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	help
 	  This option builds Qt 5.8, which is licensed under
 	  (L)GPLv3+.
 
 comment "Latest Qt version needs host/toolchain w/ gcc >= 4.8"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_HOST_GCC_AT_LEAST_4_8
+	depends on !BR2_ARM_CPU_ARMV4
 
 config BR2_PACKAGE_QT5_VERSION_5_6
 	bool "LTS (5.6)"
