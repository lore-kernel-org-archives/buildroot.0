From: =?UTF-8?q?Micha=C3=ABl=20Burtin?= <michael.burtin@netgem.com>
Date: Wed, 18 Jul 2018 10:17:48 +0200
Subject: [Buildroot] [PATCH 2/2] libcurl: add libnghttp2 optional dependency
In-Reply-To: <20180718081748.13364-1-michael.burtin@netgem.com>
References: <20180718081748.13364-1-michael.burtin@netgem.com>
Message-ID: <20180718081748.13364-2-michael.burtin@netgem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libnghttp2 package has recently been added to buildroot. When
enabled, this adds support for HTTP2 to libcurl.

By default, libcurl configure script will enable HTTP2 if the library
is found using pkg-config. Adding this option makes the build
consistent.

Signed-off-by: Anisse Astier <anisse.astier.ext@netgem.com>
Signed-off-by: Micha?l Burtin <michael.burtin@netgem.com>
---
 package/libcurl/libcurl.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index c9b325c672..4281d5ed11 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -88,6 +88,13 @@ else
 LIBCURL_CONF_OPTS += --without-brotli
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNGHTTP2),y)
+LIBCURL_DEPENDENCIES += nghttp2
+LIBCURL_CONF_OPTS += --with-nghttp2
+else
+LIBCURL_CONF_OPTS += --without-nghttp2
+endif
+
 define LIBCURL_FIX_DOT_PC
 	printf 'Requires: openssl\n' >>$(@D)/libcurl.pc.in
 endef
-- 
2.13.6
