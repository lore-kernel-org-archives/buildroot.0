From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 May 2015 23:15:05 +0200
Subject: [Buildroot] [git commit] linknx: needs argp-standalone on uClibc
Message-ID: <20150504082612.00B9E80812@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9cfcfc3673a16b94e303319199aa3505800102d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/b27/b27c4b0822494fb393a5e28b8febd063222bd83f/
http://autobuild.buildroot.net/results/9db/9db2cc9fe6ddfda5663251872fdba00998020fce/
http://autobuild.buildroot.net/results/465/465328d0aa6b5f4b36903e2a4bc41d4ddd343db8/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linknx/Config.in |    1 +
 package/linknx/linknx.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/linknx/Config.in b/package/linknx/Config.in
index 6a26c20..9982f31 100644
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LINKNX
 	bool "linknx"
 	select BR2_PACKAGE_LIBPTHSEM
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # libpthsem
 	help
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index a7e6adb..7ecd947 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -15,7 +15,7 @@ LINKNX_CONF_OPTS = \
 	--with-pth=$(STAGING_DIR)/usr \
 	--disable-smtp
 
-LINKNX_DEPENDENCIES = libpthsem
+LINKNX_DEPENDENCIES = libpthsem $(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 LINKNX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
