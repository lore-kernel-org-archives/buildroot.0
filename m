From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 16:59:55 +0200
Subject: [Buildroot] [git commit] libcurl: add nghttp2 optional dependency
Message-ID: <20180719145801.3CFFD7FA18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b733d45f4b1b3b8244cfc7513b3d680da3d163d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The nghttp2 package has recently been added to buildroot. When
enabled, this adds support for HTTP2 to libcurl.

By default, libcurl configure script will enable HTTP2 if the library
is found using pkg-config. Adding this option makes the build
consistent.

Signed-off-by: Micha??l Burtin <michael.burtin@netgem.com>
Signed-off-by: Anisse Astier <anisse.astier.ext@netgem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
