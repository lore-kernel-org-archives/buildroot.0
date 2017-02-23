From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:01:41 +0100
Subject: [Buildroot] [git commit] qt5webkit: disable for MIPS soft-float
Message-ID: <20170223210231.D4ADA82219@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d2f7b4f8883a5a837fb1d23a1da2fe662a0c0e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It assumes the MIPS target has an FPU and uses FPU assembler
instructions which cause the compilation to fail when building it for
soft-float.

Fixes:
  http://autobuild.buildroot.net/results/f40/f407ca9245e2445619420a9dfd595856729a2b2b/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[Thomas:
 - propagate dependency to Config.in comment
 - add comment above the "depends on" to explain why.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt-webkit-kiosk/Config.in | 1 +
 package/qt5/qt5webkit/Config.in   | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
index 32952d7..1b0e0de 100644
--- a/package/qt-webkit-kiosk/Config.in
+++ b/package/qt-webkit-kiosk/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK
 	depends on !BR2_STATIC_LIBS # qt5webkit
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5webkit
 	depends on !BR2_BINFMT_FLAT # qt5webkit
+	depends on !BR2_MIPS_SOFT_FLOAT # qt5webkit
 	help
 	  Simple kiosk-mode browser powered by Qt5Webkit
 
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index e9c11fb..2534360 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -9,6 +9,8 @@ config BR2_PACKAGE_QT5WEBKIT
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_BINFMT_FLAT # icu
+	# assumes a FPU is available on MIPS
+	depends on !BR2_MIPS_SOFT_FLOAT
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -28,3 +30,4 @@ comment "qt5webkit needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	depends on !BR2_BINFMT_FLAT
+	depends on !BR2_MIPS_SOFT_FLOAT
