From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Date: Sun, 12 Apr 2020 13:06:32 +0200
Subject: [Buildroot] [PATCH] package/jpeg-turbo: Add an option to allow
 tools install
Message-ID: <20200412110632.4901-1-peron.clem@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

JPEG Turbo tools are not useless for everybody.

Add an option to allow their installation.

Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
---
 package/jpeg-turbo/jpeg-turbo.mk | 6 ++++--
 package/jpeg/Config.in           | 9 +++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 126b470630b2..9d487e29c5d3 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -41,10 +41,12 @@ ifeq ($(BR2_STATIC_LIBS),)
 JPEG_TURBO_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
 endif
 
-define JPEG_TURBO_REMOVE_USELESS_TOOLS
+define JPEG_TURBO_REMOVE_TOOLS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom tjbench wrjpgcom)
 endef
 
-JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_USELESS_TOOLS
+ifneq ($(BR2_PACKAGE_JPEG_TURBO_TOOLS),y)
+	JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_TOOLS
+endif
 
 $(eval $(cmake-package))
diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 3d0fea83b182..11ea01daf35b 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -38,6 +38,15 @@ config BR2_PACKAGE_JPEG_TURBO
 
 	  http://www.libjpeg-turbo.org
 
+config BR2_PACKAGE_JPEG_TURBO_TOOLS
+	bool "jpeg-turbo tools"
+	depends on BR2_PACKAGE_JPEG_TURBO
+	default n
+	help
+	  Libjpeg-turbo can also provide some tools like  cjpeg,
+	  djpeg, jpegtran, rdjpgcom, tjbench and wrjpgcom.
+	  If you want to keep them enable this option.
+
 # libjpeg from br2-external trees, if any
 source "$BR2_BASE_DIR/.br2-external.in.jpeg"
 
-- 
2.20.1
