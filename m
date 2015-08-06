From: Mauro Condarelli <mc5686@mclink.it>
Date: Thu, 6 Aug 2015 20:15:34 +0200
Subject: [Buildroot] [PATCH] imagemagick depends on pango even if not
	available
Message-ID: <55C3A446.8080307@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
it seems imagemagick package does not force dependency on pango, but fails if it's not found.

This trivial patch solves the problem for me:


$ git diff
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 1594f69..e8c7ab7 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -44,6 +44,13 @@ else
  IMAGEMAGICK_CONF_OPTS += --without-fontconfig
  endif

+ifeq ($(BR2_PACKAGE_PANGO),y)
+IMAGEMAGICK_CONF_OPTS += --with-pango
+IMAGEMAGICK_DEPENDENCIES += pango
+else
+IMAGEMAGICK_CONF_OPTS += --without-pango
+endif
+
  ifeq ($(BR2_PACKAGE_FREETYPE),y)
  IMAGEMAGICK_CONF_OPTS += --with-freetype
  IMAGEMAGICK_CONF_ENV += \


Regards
Mauro Condarelli
