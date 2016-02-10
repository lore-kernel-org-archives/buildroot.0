From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 10 Feb 2016 21:58:18 +0100
Subject: [Buildroot] [PATCH 2/3] package/dovecot: add optional support for xz
In-Reply-To: <1455137899-18008-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455137899-18008-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455137899-18008-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When xz was compiled before, dovecot will use it as optional dependency:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/dovecot/lib30_imap_zlib_plugin.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
 0x00000001 (NEEDED)                     Shared library: [liblz4.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

(lz4 support will be added with the next patch of this series)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/dovecot.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index eea9efc..dbf2dab 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -76,6 +76,13 @@ else
 DOVECOT_CONF_OPTS += --without-sqlite
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+DOVECOT_CONF_OPTS += --with-lzma
+DOVECOT_DEPENDENCIES += xz
+else
+DOVECOT_CONF_OPTS += --without-lzma
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 DOVECOT_CONF_OPTS += --with-zlib
 DOVECOT_DEPENDENCIES += zlib
-- 
2.7.0
