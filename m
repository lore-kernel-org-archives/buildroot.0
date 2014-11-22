From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 23 Nov 2014 00:55:24 +0100
Subject: [Buildroot] [PATCH] dillo: needs iconv
Message-ID: <1416700524-927-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 http://autobuild.buildroot.net/results/4a7/4a765a66bea1ecf4ec5e4da00b847bc931071132/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/dillo/Config.in | 1 +
 package/dillo/dillo.mk  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/dillo/Config.in b/package/dillo/Config.in
index 8d3cbb1..5c2cc62 100644
--- a/package/dillo/Config.in
+++ b/package/dillo/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_DILLO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fltk fork()
 	select BR2_PACKAGE_FLTK
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Dillo is a multi-platform graphical web browser known
 	  for its speed and small footprint.
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index bce23b0..d6fc746 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -17,6 +17,8 @@ DILLO_DEPENDENCIES = fltk
 
 DILLO_CONF_ENV = ac_cv_path_FLTK_CONFIG=$(STAGING_DIR)/usr/bin/fltk-config
 
+DILLO_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	DILLO_CONF_OPTS += --enable-ssl
 	DILLO_DEPENDENCIES += openssl
-- 
2.1.2
