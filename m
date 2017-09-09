From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:53 +0200
Subject: [Buildroot] [PATCH 47/49 v2] package/asterisk: enable inotify when
	possible
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <222e0d158eca2a8dd6b0ae0e4e4d7cd8cb96c5b5.1504993178.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As for DBus, we disable support for inotify only for microblaze, because
the toolchain does not provide a complete inotify.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index cd8bf9fab6..54007f46b3 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -49,7 +49,6 @@ ASTERISK_CONF_OPTS = \
 	--without-hoard \
 	--without-iksemel \
 	--without-imap \
-	--without-inotify \
 	--without-iodbc \
 	--without-isdnnet \
 	--without-jack \
@@ -100,6 +99,13 @@ ASTERISK_CONF_OPTS += --without-avcodec
 ASTERISK_CONF_ENV = \
 	ac_cv_path_CONFIG_LIBXML2=$(STAGING_DIR)/usr/bin/xml2-config
 
+ifeq ($(BR2_microblaze),y)
+# microblaze toolchain doesn't provide inotify_rm_* but does have sys/inotify.h
+ASTERISK_CONF_OPTS += --without-inotify
+else
+ASTERISK_CONF_OPTS += --with-inotify
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 ASTERISK_CONF_OPTS += --with-execinfo
 else
-- 
2.11.0
