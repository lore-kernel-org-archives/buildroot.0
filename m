From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 30 Mar 2014 20:55:38 +0400
Subject: [Buildroot] [PATCH v2 3/3] xtensa: remove -mtext-section-literals
	from individual package *.mk's
In-Reply-To: <1396198538-32628-1-git-send-email-jcmvbkbc@gmail.com>
References: <1396198538-32628-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1396198538-32628-4-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that -mtext-section-literals is specified in xtensa ABI remove it
from individual packages that needed it.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1 -> v2:
- new patch

 package/civetweb/civetweb.mk                | 3 ---
 package/ffmpeg/ffmpeg.mk                    | 4 ----
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk  | 4 ----
 package/gstreamer1/gst1-libav/gst1-libav.mk | 4 ----
 package/lmbench/lmbench.mk                  | 4 ----
 package/php/php.mk                          | 4 ----
 package/sqlcipher/sqlcipher.mk              | 4 ----
 package/sqlite/sqlite.mk                    | 4 ----
 8 files changed, 31 deletions(-)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index be7620a..4b73a5e 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -25,9 +25,6 @@ endif
 
 ifeq ($(BR2_CIVETWEB_WITH_LUA),y)
 	CIVETWEB_CONF_OPT += WITH_LUA=1
-ifeq ($(BR2_xtensa),y)
-	CIVETWEB_COPT += -mtext-section-literals
-endif
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a067fe6..a5d5de1 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -75,10 +75,6 @@ FFMPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 FFMPEG_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_xtensa),y)
-FFMPEG_CFLAGS += -mtext-section-literals
-endif
-
 FFMPEG_CONF_ENV = CFLAGS="$(FFMPEG_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index eb7389f..1975682 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -16,10 +16,6 @@ GST_FFMPEG_CONF_EXTRA_OPT = \
 
 GST_FFMPEG_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_xtensa),y)
-GST_FFMPEG_CFLAGS += -mtext-section-literals
-endif
-
 GST_FFMPEG_CONF_ENV = CFLAGS="$(GST_FFMPEG_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index a0a536e..6e6ff51 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -85,10 +85,6 @@ GST1_LIBAV_CONF_OPT = \
 
 GST1_LIBAV_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_xtensa),y)
-GST1_LIBAV_CFLAGS += -mtext-section-literals
-endif
-
 GST1_LIBAV_CONF_ENV += CFLAGS="$(GST1_LIBAV_CFLAGS)"
 
 $(eval $(autotools-package))
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 529026f..c3a6c09 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -19,10 +19,6 @@ LMBENCH_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
 LMBENCH_LDFLAGS += -ltirpc
 endif
 
-ifeq ($(BR2_xtensa),y)
-LMBENCH_CFLAGS += -mtext-section-literals
-endif
-
 define LMBENCH_CONFIGURE_CMDS
 	$(call CONFIG_UPDATE,$(@D))
 	sed -i 's/CFLAGS=/CFLAGS+=/g' $(@D)/src/Makefile
diff --git a/package/php/php.mk b/package/php/php.mk
index de02f4b..5797758 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -35,10 +35,6 @@ ifneq ($(BR2_INET_IPV6),y)
 endif
 endif
 
-ifeq ($(BR2_xtensa),y)
-PHP_CFLAGS += -mtext-section-literals
-endif
-
 PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
 PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
 
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index ace5ce8..6130870 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -32,10 +32,6 @@ ifeq ($(BR2_PACKAGE_SQLCIPHER_STAT3),y)
 SQLCIPHER_CFLAGS += -DSQLITE_ENABLE_STAT3
 endif
 
-ifeq ($(BR2_xtensa),y)
-SQLCIPHER_CFLAGS += -mtext-section-literals
-endif
-
 ifeq ($(BR2_PACKAGE_SQLCIPHER_READLINE),y)
 SQLCIPHER_DEPENDENCIES += ncurses readline
 SQLCIPHER_CONF_OPT += --with-readline-inc="-I$(STAGING_DIR)/usr/include"
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index b27eb58..6493a29 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -33,10 +33,6 @@ ifeq ($(BR2_PACKAGE_SQLITE_SECURE_DELETE),y)
 SQLITE_CFLAGS += -DSQLITE_SECURE_DELETE
 endif
 
-ifeq ($(BR2_xtensa),y)
-SQLITE_CFLAGS += -mtext-section-literals
-endif
-
 SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
 
 SQLITE_CONF_OPT = \
-- 
1.8.1.4
