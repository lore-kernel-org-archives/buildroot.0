From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:51 +0100
Subject: [Buildroot] [PATCH 50/52] package/asterisk: enable inotify when
	possible
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <e9d77e5c99f0e43d27ee5dd381fe58fd81b8d3b3.1483093662.git.yann.morin.1998@free.fr>
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
index d9bdb5b..1436575 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -38,7 +38,6 @@ ASTERISK_CONF_OPTS += \
 	--without-hoard \
 	--without-iksemel \
 	--without-imap \
-	--without-inotify \
 	--without-iodbc \
 	--without-isdnnet \
 	--without-jack \
@@ -82,6 +81,13 @@ ASTERISK_CONF_OPTS += \
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
2.7.4
