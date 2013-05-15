From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 15 May 2013 11:18:35 +0100
Subject: [Buildroot] [PATCH v2] libxml2: depend on zlib and libiconv if
	appropriate
Message-ID: <1368613115-13584-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v2: As suggested by Peter Korsgaard, correct iconv handling to cope with
 the case where iconv() is provided by the toolchain, rather than by
 libiconv.

 package/libxml2/libxml2.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 6a974ef..7800d94 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -34,6 +34,21 @@ else
 HOST_LIBXML2_CONF_OPT += --without-python
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBXML2_DEPENDENCIES += zlib
+LIBXML2_CONF_OPT += --with-zlib
+else
+LIBXML2_CONF_OPT += --without-zlib
+endif
+
+LIBXML2_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
+ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),y)
+LIBXML2_CONF_OPT += --with-iconv
+else
+LIBXML2_CONF_OPT += --without-iconv
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-- 
1.8.1.2
