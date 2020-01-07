From: Mehmet Sami Tok <mehmetsamitok@gmail.com>
Date: Tue,  7 Jan 2020 15:32:09 +0300
Subject: [Buildroot] [PATCH 1/1] package/qt5: remove optimize by default on
 debug builds made with qmake
In-Reply-To: <20200107123209.6608-1-mehmetsamitok@gmail.com>
References: <20200107123209.6608-1-mehmetsamitok@gmail.com>
Message-ID: <20200107123209.6608-2-mehmetsamitok@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mehmet Sami Tok <mehmetsamitok@gmail.com>
---
 package/qt5/qt5base/qt5base.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 774c771bc9..3415172fcb 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -34,8 +34,12 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5BASE_CONFIGURE_OPTS += -no-optimize-debug
 endif
 
-QT5BASE_CFLAGS = $(TARGET_CFLAGS)
-QT5BASE_CXXFLAGS = $(TARGET_CXXFLAGS)
+# Passing optimization flags directly to CFLAGS or CXXFLAGS makes qmake
+# builds optimized by default. Decision of optimization while developing
+# with qmake should be leaved to configuration of the project.
+FILTERED_ITEMS = -O%
+QT5BASE_CFLAGS = $(filter-out $(FILTERED_ITEMS),$(TARGET_CFLAGS))
+QT5BASE_CXXFLAGS = $(filter-out $(FILTERED_ITEMS),$(TARGET_CXXFLAGS))
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_90620),y)
 QT5BASE_CFLAGS += -O0
-- 
2.17.1
