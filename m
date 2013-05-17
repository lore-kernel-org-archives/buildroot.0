From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 May 2013 11:58:34 +0200
Subject: [Buildroot] [git commit] libxml2: depend on zlib and libiconv if
	appropriate
Message-ID: <20130517100436.EDFC69A1ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5b1da184625d25fe0618ab0a0d5549207f3a64c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libxml2/libxml2.mk |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

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
 
