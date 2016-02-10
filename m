From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 10 Feb 2016 21:58:19 +0100
Subject: [Buildroot] [PATCH 3/3] package/dovecot: add optional support for
	lz4
In-Reply-To: <1455137899-18008-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455137899-18008-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455137899-18008-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When lz4 was compiled before, dovecot will use it as optional dependency:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/dovecot/lib30_imap_zlib_plugin.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
 0x00000001 (NEEDED)                     Shared library: [liblz4.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/dovecot.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index dbf2dab..6b69329 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -76,6 +76,13 @@ else
 DOVECOT_CONF_OPTS += --without-sqlite
 endif
 
+ifeq ($(BR2_PACKAGE_LZ4),y)
+DOVECOT_CONF_OPTS += --with-lz4
+DOVECOT_DEPENDENCIES += lz4
+else
+DOVECOT_CONF_OPTS += --without-lz4
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 DOVECOT_CONF_OPTS += --with-lzma
 DOVECOT_DEPENDENCIES += xz
-- 
2.7.0
