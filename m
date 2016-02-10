From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 10 Feb 2016 21:58:54 +0100
Subject: [Buildroot] [PATCH 1/2] package/ulogd: add optional support for
	jansson
Message-ID: <1455137935-18111-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When jansson was compiled before, ulogd will use it as optional
dependency:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/ulogd/ulogd_output_JSON.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libjansson.so.4]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ulogd/ulogd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 7730198..363b8c8 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -29,4 +29,11 @@ else
 ULOGD_CONF_OPTS += --with-mysql=no --without-sqlite
 endif
 
+ifeq ($(BR2_PACKAGE_JANSSON),y)
+ULOGD_CONF_OPTS += --with-jansson
+ULOGD_DEPENDENCIES += jansson
+else
+ULOGD_CONF_OPTS += --without-jansson
+endif
+
 $(eval $(autotools-package))
-- 
2.7.0
