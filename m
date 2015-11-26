From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:36:19 +0100
Subject: [Buildroot] [git commit] gstreamer: can optionally use libxml2
Message-ID: <20151126214030.1634081E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb5e3ffb11477d5a21f01e3ae8b9b6100fef859a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gstreamer/gstreamer.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index d1e3282..cc035c0 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -27,6 +27,7 @@ GSTREAMER_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_GSTREAMER_GST_DEBUG),,--disable-gst-debug) \
 	$(if $(BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY),,--disable-registry)
 
-GSTREAMER_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex
+GSTREAMER_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex \
+	$(if $(BR2_PACKAGE_LIBXML2),libxml2)
 
 $(eval $(autotools-package))
