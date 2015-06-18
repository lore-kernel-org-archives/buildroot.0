From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 18 Jun 2015 13:42:56 -0400
Subject: [Buildroot] [PATCH 1/1] fluxbox: fix build against xlib_libXpm
Message-ID: <1434649376-8012-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explicitly configure XPM support based on the library selection provided
(BR2_PACKAGE_XLIB_LIBXPM). It has been observed on different hosts that
XPM support may or may not be included based off the state of the host's
system. One can validate XPM support is included in Fluxbox by using the
command `fluxbox -info`.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/fluxbox/fluxbox.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index c8e4289..d2e8c89 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -22,6 +22,13 @@ else
 FLUXBOX_CONF_OPTS += --disable-imlib2
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXPM),y)
+FLUXBOX_CONF_OPTS += --enable-xpm --with-xpm-prefix=$(STAGING_DIR)/usr
+FLUXBOX_DEPENDENCIES += xlib_libXpm
+else
+FLUXBOX_CONF_OPTS += --disable-xpm
+endif
+
 define FLUXBOX_INSTALL_XSESSION_FILE
 	$(INSTALL) -m 0755 -D package/fluxbox/xsession \
 		$(TARGET_DIR)/root/.xsession
-- 
1.9.5.msysgit.1
