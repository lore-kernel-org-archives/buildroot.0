From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 20 Oct 2014 16:52:56 +0100
Subject: [Buildroot] [PATCH] qt5connectivity: propagate bluez-utils
	dependencies
Message-ID: <1413820376-11771-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5connectivity selects the bluez-utils package but the dependencies are
not fully propagated so someone could do a static build, then select the
qt5connectivity package causing bluez-utils being auto-selected, which
is disabled for static builds, and then obtain a build failure like this
one:

checking for dlopen in -ldl... no
configure: error: dynamic linking loader is required

Fixes:
	http://autobuild.buildroot.net/results/96d/96d8297be0b731da138b1e2aafb851061aee3c40/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/qt5/qt5connectivity/Config.in |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
index c9f36ef..20778dc 100644
--- a/package/qt5/qt5connectivity/Config.in
+++ b/package/qt5/qt5connectivity/Config.in
@@ -5,6 +5,9 @@ config BR2_PACKAGE_QT5CONNECTIVITY
 	select BR2_PACKAGE_QT5BASE_CONCURRENT
 	select BR2_PACKAGE_QT5BASE_DBUS
 	depends on !BR2_avr32 # bluez_utils
+	depends on !BR2_PREFER_STATIC_LIB # bluez_utils
+	depends on BR2_USE_WCHAR # bluez_utils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils
 	depends on BR2_USE_MMU # bluez_utils
 	help
 	  Qt is a cross-platform application and UI framework for
@@ -13,3 +16,7 @@ config BR2_PACKAGE_QT5CONNECTIVITY
 	  This package corresponds to the qt5connectivity module.
 
 	  http://qt-project.org
+
+comment "qt5connectivity needs a toolchain w/ wchar, threads, dynamic library"
+	depends on !BR2_avr32 && BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
-- 
1.7.1
