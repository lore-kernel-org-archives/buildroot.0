From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:21:18 +0100
Subject: [Buildroot] [git commit] package/pulseview: bump to version 0.4.2
Message-ID: <20210320205952.6B4FA880C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b7db318262a023a4a5396b06adafd9fd19d40a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop first patch (already in version)
- BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS is mandatory since
  https://sigrok.org/gitweb/?p=pulseview.git;a=commit;h=0466001be51e779b23aaebec1cc9361305c07be9

https://github.com/sigrokproject/pulseview/blob/pulseview-0.4.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-Replace-obsolete-deprecated-Qt-methods.patch} |  0
 ...mainbar-fix-build-without-libsigrokdecode.patch | 37 ----------------------
 package/pulseview/Config.in                        |  2 ++
 package/pulseview/pulseview.hash                   |  2 +-
 package/pulseview/pulseview.mk                     |  4 +--
 5 files changed, 5 insertions(+), 40 deletions(-)

diff --git a/package/pulseview/0002-Replace-obsolete-deprecated-Qt-methods.patch b/package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch
similarity index 100%
rename from package/pulseview/0002-Replace-obsolete-deprecated-Qt-methods.patch
rename to package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch
diff --git a/package/pulseview/0001-mainbar-fix-build-without-libsigrokdecode.patch b/package/pulseview/0001-mainbar-fix-build-without-libsigrokdecode.patch
deleted file mode 100644
index 5cf0c446a6..0000000000
--- a/package/pulseview/0001-mainbar-fix-build-without-libsigrokdecode.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From da124df864dd7555733d6690eacf856435d55b2d Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <brgl@bgdev.pl>
-Date: Mon, 3 Dec 2018 13:14:16 +0100
-Subject: [PATCH] mainbar: fix build without libsigrokdecode
-
-We must not include decodesignal.hpp if we're not using libsigrokdecode
-or the build will fail due to libsigrokdecode.hpp not being present in
-the system.
-
-Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
----
- pv/toolbars/mainbar.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pv/toolbars/mainbar.cpp b/pv/toolbars/mainbar.cpp
-index e6beb2b..7c4d0fb 100644
---- a/pv/toolbars/mainbar.cpp
-+++ b/pv/toolbars/mainbar.cpp
-@@ -35,7 +35,6 @@
- 
- #include <boost/algorithm/string/join.hpp>
- 
--#include <pv/data/decodesignal.hpp>
- #include <pv/devicemanager.hpp>
- #include <pv/devices/hardwaredevice.hpp>
- #include <pv/devices/inputfile.hpp>
-@@ -52,6 +51,7 @@
- #include <pv/widgets/importmenu.hpp>
- #ifdef ENABLE_DECODE
- #include <pv/widgets/decodermenu.hpp>
-+#include <pv/data/decodesignal.hpp>
- #endif
- 
- #include <libsigrokcxx/libsigrokcxx.hpp>
--- 
-2.19.1
-
diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index ea9bdc2605..b8d94332a3 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -17,6 +17,8 @@ config BR2_PACKAGE_PULSEVIEW
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5BASE_PNG
 	select BR2_PACKAGE_QT5SVG
+	select BR2_PACKAGE_QT5TOOLS
+	select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SYSTEM
diff --git a/package/pulseview/pulseview.hash b/package/pulseview/pulseview.hash
index 27e27ce1ce..b72000774b 100644
--- a/package/pulseview/pulseview.hash
+++ b/package/pulseview/pulseview.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9ee7ce3dd1457c6a5f5e4e9c2469903a1f070ba077ea68535cc29ef1dfac6f2f  pulseview-0.4.1.tar.gz
+sha256  f042f77a3e1b35bf30666330e36ec38fab8d248c3693c37b7e35d401c3bfabcb  pulseview-0.4.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/pulseview/pulseview.mk b/package/pulseview/pulseview.mk
index 67d525f626..f079dfbbce 100644
--- a/package/pulseview/pulseview.mk
+++ b/package/pulseview/pulseview.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PULSEVIEW_VERSION = 0.4.1
+PULSEVIEW_VERSION = 0.4.2
 PULSEVIEW_SITE = http://sigrok.org/download/source/pulseview
 PULSEVIEW_LICENSE = GPL-3.0+
 PULSEVIEW_LICENSE_FILES = COPYING
-PULSEVIEW_DEPENDENCIES = libsigrok qt5base qt5svg boost
+PULSEVIEW_DEPENDENCIES = libsigrok qt5base qt5svg qt5tools boost
 PULSEVIEW_CONF_OPTS = -DDISABLE_WERROR=TRUE
 
 ifeq ($(BR2_PACKAGE_BOOST_TEST),y)
