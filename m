From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  3 May 2015 23:25:27 +0200
Subject: [Buildroot] [PATCH] package/linknx: needs argp-standalone with
	uClibc toolchains
Message-ID: <1430688327-26621-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/b27/b27c4b0822494fb393a5e28b8febd063222bd83f/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/linknx/Config.in | 1 +
 package/linknx/linknx.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

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
index a7e6adb..9508a92 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -15,7 +15,8 @@ LINKNX_CONF_OPTS = \
 	--with-pth=$(STAGING_DIR)/usr \
 	--disable-smtp
 
-LINKNX_DEPENDENCIES = libpthsem
+LINKNX_DEPENDENCIES = libpthsem \
+	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone)
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 LINKNX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
-- 
1.9.3
