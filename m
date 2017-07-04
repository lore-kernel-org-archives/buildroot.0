From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:49:00 +0200
Subject: [Buildroot] [PATCH 080/100] vdr: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-81-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vdr/Config.in | 1 -
 package/vdr/vdr.mk    | 9 +++------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/vdr/Config.in b/package/vdr/Config.in
index d32c642..65117f5 100644
--- a/package/vdr/Config.in
+++ b/package/vdr/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_VDR
 	depends on !BR2_TOOLCHAIN_USES_MUSL # _nl_msg_cat_cntr
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index 6c46566..242c579 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -14,7 +14,8 @@ VDR_DEPENDENCIES = \
 	freetype \
 	fontconfig \
 	jpeg \
-	libcap
+	libcap \
+	$(TARGET_NLS_DEPENDENCIES)
 
 VDR_INCLUDE_DIRS = -I$(STAGING_DIR)/usr/include/freetype2
 VDR_MAKE_FLAGS = \
@@ -22,11 +23,7 @@ VDR_MAKE_FLAGS = \
 	PLUGINLIBDIR=/usr/lib/vdr \
 	PREFIX=/usr \
 	VIDEODIR=/var/lib/vdr
-
-ifeq ($(BR2_NEEDS_GETTEXT),y)
-VDR_DEPENDENCIES += gettext
-VDR_LDFLAGS += -lintl
-endif
+VDR_LDFLAGS = $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
 VDR_DEPENDENCIES += libfribidi
-- 
2.9.4
