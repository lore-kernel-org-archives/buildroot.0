From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Jan 2015 20:17:01 -0300
Subject: [Buildroot] [PATCH 6/7] rsyslog: bump to version 8.7.0
In-Reply-To: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1421191022-5509-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rsyslog/Config.in    | 5 +++--
 package/rsyslog/rsyslog.hash | 4 ++--
 package/rsyslog/rsyslog.mk   | 8 +++-----
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index 1f94104..d66132f 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -6,11 +6,12 @@ config BR2_PACKAGE_RSYSLOG
 	select BR2_PACKAGE_JSON_C
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # modules
 	help
 	  Rsyslog is a powerful and flexible syslog implementation
 
 	  http://www.rsyslog.com
 
-comment "rsyslog needs a toolchain w/ threads"
+comment "rsyslog needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index ed51326..4a0ae5a 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,2 +1,2 @@
-# From http://www.rsyslog.com/downloads/download-v7-stable/
-sha256	fc29d2d9cbf3396091dd0bab2eb6f847aed4a44ef73138a97ddf9447446125ee	rsyslog-7.6.7.tar.gz
+# From http://www.rsyslog.com/downloads/download-v8-stable/
+sha256	c77125b67a623569c9bdca8136b9aac013f1c6fd82fb8595e3ea267e61800f9c	rsyslog-8.7.0.tar.gz
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 27a72da..fb5249c 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 7.6.7
+RSYSLOG_VERSION = 8.7.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPLv3 LGPLv3 Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging json-c host-pkgconf
-
-RSYSLOG_CONF_OPTS = --disable-testbench \
-		   --enable-cached-man-pages \
-		   --disable-generate-man-pages
+RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
+RSYSLOG_CONF_OPTS = --disable-generate-man-pages
 
 # Build after BusyBox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
2.0.5
