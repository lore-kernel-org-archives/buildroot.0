From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Mar 2017 13:58:53 +0100
Subject: [Buildroot] [PATCH 2/2] package/clamav: add optional dependency to
	json-c
In-Reply-To: <20170311125853.5204-1-bernd.kuhls@t-online.de>
References: <20170311125853.5204-1-bernd.kuhls@t-online.de>
Message-ID: <20170311125853.5204-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

clamav has optional support for json-c:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libclamav.so.7.1.1 | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libltdl.so.7]
 0x00000001 (NEEDED)                     Shared library: [libssl.so.1.0.0]
 0x00000001 (NEEDED)                     Shared library: [libcrypto.so.1.0.0]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libjson-c.so.2]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/clamav.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 86bdda49e..5d57b8dc0 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -48,6 +48,13 @@ else
 CLAMAV_CONF_OPTS += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+CLAMAV_CONF_OPTS += --with-libjson=$(STAGING_DIR)/usr
+CLAMAV_DEPENDENCIES += json-c
+else
+CLAMAV_CONF_OPTS += --without-libjson
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 CLAMAV_CONF_OPTS += --with-xml=$(STAGING_DIR)/usr
 CLAMAV_DEPENDENCIES += libxml2
-- 
2.11.0
