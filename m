From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Fri, 20 Nov 2015 10:06:51 -0300
Subject: [Buildroot] [PATCH] gstreamer: can optionally use libxml2
Message-ID: <1448024811-5447-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

gstreamer can optionally build against libxml2, so account for it in
the dependencies.
Functionality seems somewhat reduced without it, an example being
misdetecting subtitle (.srt) files as subrip mime type instead of
subtitle itself.

A failed scenario would be:

$ gst-typefind-0.10 some.srt
some.srt - application/x-subrip

When built with libxml2:

$ gst-typefind-0.10 some.srt
some.srt - application/x-subtitle

This doesn't affect gstreamer 1.x since it dropped any use of libxml2.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/gstreamer/gstreamer/gstreamer.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index 3705298..74a5840 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -30,6 +30,7 @@ GSTREAMER_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_GSTREAMER_GST_DEBUG),,--disable-gst-debug) \
 	$(if $(BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY),,--disable-registry)
 
-GSTREAMER_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex
+GSTREAMER_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex \
+	$(if $(BR2_PACKAGE_LIBXML2),libxml2)
 
 $(eval $(autotools-package))
-- 
2.4.10
