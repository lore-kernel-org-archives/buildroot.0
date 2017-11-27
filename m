From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Nov 2017 10:30:43 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] qt5webkit: correct
 download URL and hash for 5.6 variant
Message-ID: <20171127093934.0A8C781D82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8f6ccced4a40ffd5168e15b57cb1e9bb42bcf02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

Commit 06a4975d4bd03 (qt5: bump LTS version to 5.6.3) added an empty hash
for the 5.6.3 variant of qt5webkit, causing failures.

It also forgot to adjust the download URL as the qt5webkit tarballs are no
longer available under official_releases/ like the other submodules, but only
under community_releases/.

Fix both issues.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d4a119ccc42f5b93a2e33f99438a86cc5ee1fb00)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webkit/qt5webkit.hash | 4 ++--
 package/qt5/qt5webkit/qt5webkit.mk   | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.hash b/package/qt5/qt5webkit/qt5webkit.hash
index 860d4e4..604df37 100644
--- a/package/qt5/qt5webkit/qt5webkit.hash
+++ b/package/qt5/qt5webkit/qt5webkit.hash
@@ -1,5 +1,5 @@
-# Hash from: http://download.qt.io/snapshots/qt/5.6/5.6.3/latest_src/submodules/qtwebkit-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256  qtwebkit-opensource-src-5.6.3.tar.xz
+# Hash from: http://download.qt.io/community_releases/5.6/5.6.3/qtwebkit-opensource-src-5.6.3.tar.xz.mirrorlist
+sha256  098c6bb25798fbf1b619b540621287787064efc9b586d76ac0ce7e39b87a3896  qtwebkit-opensource-src-5.6.3.tar.xz
 
 # hash from: http://download.qt.io/official_releases/qt/5.9/5.9.1/submodules/qtwebkit-opensource-src-5.9.1.tar.xz.mirrorlist
 sha256  28a560becd800a4229bfac317c2e5407cd3cc95308bc4c3ca90dba2577b052cf  qtwebkit-opensource-src-5.9.1.tar.xz
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 7e9db76..77075f6 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -5,7 +5,12 @@
 ################################################################################
 
 QT5WEBKIT_VERSION = $(QT5_VERSION)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBKIT_SITE = $(QT5_SITE)
+else
+QT5WEBKIT_SITE = http://download.qt.io/community_releases/5.6/$(QT5_VERSION)/submodules
+endif
+
 QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
 QT5WEBKIT_DEPENDENCIES = \
 	host-bison host-flex host-gperf host-python host-ruby \
