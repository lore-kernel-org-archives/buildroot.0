From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 20:36:08 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5base: disable predefined
 -Og optimization
Message-ID: <20190622185146.8B40682B9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5857ab6a96be17615a05ff4e6a91d8f475890980
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting from Qt5 5.9.0, -optimize-debug is enabled by default for
debug builds causing -Og flag to be appended to CFLAGS and
consequently override TARGET_CFLAGS. We don't want this so let's pass
-no-optimize-debug to QT5BASE_CONFIGURE_OPTS if QT5_VERSION_LATEST=y.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e4ae120631..f4b40913f4 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -27,6 +27,13 @@ QT5BASE_CONFIGURE_OPTS += \
 	-no-pch \
 	-shared
 
+# starting from version 5.9.0, -optimize-debug is enabled by default
+# for debug builds and it overrides -O* with -Og which is not what we
+# want.
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+QT5BASE_CONFIGURE_OPTS += -no-optimize-debug
+endif
+
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 QT5BASE_DEPENDENCIES += pcre
 else
