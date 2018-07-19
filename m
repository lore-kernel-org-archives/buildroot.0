From: =?UTF-8?q?Micha=C3=ABl=20Burtin?= <michael.burtin@netgem.com>
Date: Thu, 19 Jul 2018 15:54:09 +0200
Subject: [Buildroot] [PATCH v2 2/2] libcurl: add nghttp2 optional dependency
In-Reply-To: <20180719135409.8859-1-michael.burtin@netgem.com>
References: <20180719135409.8859-1-michael.burtin@netgem.com>
Message-ID: <20180719135409.8859-2-michael.burtin@netgem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The nghttp2 package has recently been added to buildroot. When
enabled, this adds support for HTTP2 to libcurl.

By default, libcurl configure script will enable HTTP2 if the library
is found using pkg-config. Adding this option makes the build
consistent.

Signed-off-by: Micha?l Burtin <michael.burtin@netgem.com>
Signed-off-by: Anisse Astier <anisse.astier.ext@netgem.com>

---
Changes v1 -> v2 (from Thomas Petazzoni review):
  - update after rename from libnghttp2 to nghttp2
---
 package/libcurl/libcurl.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index c9b325c672..e0ecb081b7 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -88,6 +88,13 @@ else
 LIBCURL_CONF_OPTS += --without-brotli
 endif
 
+ifeq ($(BR2_PACKAGE_NGHTTP2),y)
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
