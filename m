From: Charlie Turner <cturner@igalia.com>
Date: Wed, 11 Mar 2020 10:30:44 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/cog: add option for platform DRM.
In-Reply-To: <20200310112227.16175-1-cturner@igalia.com>
References: <20200310112227.16175-1-cturner@igalia.com>
Message-ID: <20200311103044.11422-1-cturner@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Charlie Turner <cturner@igalia.com>
---
 package/cog/Config.in | 6 ++++++
 package/cog/cog.mk    | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index b25991d4ae..b260fa259c 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -26,4 +26,10 @@ config BR2_PACKAGE_COG_PROGRAMS_HOME_URI
 	  string is used, there is no default and the URI to open
 	  must be always specified in the command line.
 
+config BR2_PACKAGE_COG_PLATFORM_DRM
+       bool "DRM backend"
+       depends on BR2_PACKAGE_LIBDRM
+       help
+         Enable the DRM platform backend. This allows Cog to run
+         without a compositor like Weston.
 endif
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index d0e5b79c38..4697fdf6ed 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -14,7 +14,13 @@ COG_LICENSE_FILES = COPYING
 COG_CONF_OPTS = \
 	-DCOG_BUILD_PROGRAMS=ON \
 	-DCOG_PLATFORM_FDO=ON \
-	-DCOG_PLATFORM_DRM=OFF \
 	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))'
 
+ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
+	COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
+	COG_DEPENDENCIES += libdrm libinput
+else
+	COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.20.1
