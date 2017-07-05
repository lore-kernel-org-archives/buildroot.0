From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Wed,  5 Jul 2017 12:45:18 +0200
Subject: [Buildroot] [PATCH 1/1] libpwquality: Link with zlib when required
	in static builds
Message-ID: <20170705104518.23599-1-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/cfb3a591391d90762a326d91af3ec502a6161ac5

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 package/libpwquality/libpwquality.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index 66b15d8..5b5c0e0 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -27,6 +27,11 @@ else
 LIBPWQUALITY_CONF_OPTS += --disable-pam
 endif
 
+# Static link with cracklib requires -lz if zlib is enabled
+ifeq ($(BR2_STATIC_LIBS):$(BR2_PACKAGE_ZLIB),y:y)
+LIBPWQUALITY_CONF_ENV += LIBS="-lz"
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPWQUALITY_TOOLS),)
 define LIBPWQUALITY_REMOVE_TOOLS
 	rm -f $(TARGET_DIR)/usr/bin/pwmake
-- 
2.9.4
