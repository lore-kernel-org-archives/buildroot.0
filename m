From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 Oct 2014 14:51:51 +0200
Subject: [Buildroot] [git commit] rsyslog: libuuid is an optional dependency,
	not a required one
Message-ID: <20141001131244.A0FDF9D7EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d89a2610cfc0274073f5d89efdc95598de757621
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/Config.in  |    4 ----
 package/rsyslog/rsyslog.mk |    9 ++++++++-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index 4ce1918..69425f1 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -4,12 +4,8 @@ config BR2_PACKAGE_RSYSLOG
 	select BR2_PACKAGE_LIBESTR
 	select BR2_PACKAGE_LIBLOGGING
 	select BR2_PACKAGE_JSON_C
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_USE_WCHAR # util-linux
 	help
 	  Rsyslog is a powerful and flexible syslog implementation
 
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index ae152d0..2ba4a9a 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -8,7 +8,7 @@ RSYSLOG_VERSION = 7.6.5
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPLv3 LGPLv3 Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
-RSYSLOG_DEPENDENCIES = zlib libestr liblogging json-c util-linux host-pkgconf
+RSYSLOG_DEPENDENCIES = zlib libestr liblogging json-c host-pkgconf
 
 RSYSLOG_CONF_OPT = --disable-testbench \
 		   --enable-cached-man-pages
@@ -30,6 +30,13 @@ else
 	RSYSLOG_CONF_OPT += --enable-libgcrypt=no
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+	RSYSLOG_DEPENDENCIES += util-linux
+	RSYSLOG_CONF_OPT += --enable-uuid
+else
+	RSYSLOG_CONF_OPT += --disable-uuid
+endif
+
 define RSYSLOG_INSTALL_INIT_SYSV
 	[ -f $(TARGET_DIR)/etc/init.d/S01rsyslog ] || \
 		$(INSTALL) -m 0755 -D package/rsyslog/S01rsyslog \
