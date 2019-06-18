From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 18 Jun 2019 10:45:32 +0200
Subject: [Buildroot] [PATCH 1/4] package/qt5/qt5base: disable predefined -Og
 optimization
In-Reply-To: <20190618084535.75870-1-giulio.benetti@micronovasrl.com>
References: <20190618084535.75870-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190618084535.75870-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting from Qt5 5.9.0 -optimize-debug is enabled by default causing
-Og flag to be appended to CFLAGS and consequently override
TARGET_CFLAGS. We don't want this so let's pass -no-optimize-debug to
QT5BASE_CONFIGURE_OPTS if QT5_VERSION_LATEST=y.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/qt5/qt5base/qt5base.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e4ae120631..c732e766f3 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -27,6 +27,12 @@ QT5BASE_CONFIGURE_OPTS += \
 	-no-pch \
 	-shared
 
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+# starting from version 5.9.0 -optimize-debug is enabled by default and
+# it overrides -O* with -Og that is not what we want
+QT5BASE_CONFIGURE_OPTS += -no-optimize-debug
+endif
+
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 QT5BASE_DEPENDENCIES += pcre
 else
-- 
2.17.1
