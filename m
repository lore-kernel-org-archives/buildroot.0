From: Julien Corjon <corjon.j@ecagroup.com>
Date: Thu,  6 Aug 2015 12:06:14 +0200
Subject: [Buildroot] [PATCH 1/2] qt/qt5base: force gstreamer on configure
Message-ID: <1438855575-4767-1-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: http://autobuild.buildroot.net/results/0ee0f879e8563954c64b3940cdec39d2e6de937a/

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/qt5base/qt5base.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 753b069..f04545b 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -152,6 +152,16 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBGLIB2),libglib2)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_ICU),-icu,-no-icu)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
 
+ifeq ($(BR2_PACKAGE_GSTREAMER),y)
+QT5BASE_CONFIGURE_OPTS += -gstreamer 0.10
+QT5BASE_DEPENDENCIES   += gstreamer
+else ifeq ($(BR2_PACKAGE_GSTREAMER1),y)
+QT5BASE_CONFIGURE_OPTS += -gstreamer 1.0
+QT5BASE_DEPENDENCIES   += gstreamer1
+else
+QT5BASE_CONFIGURE_OPTS += -no-gstreamer
+endif
+
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
 
 # Build the list of libraries to be installed on the target
-- 
2.1.0
