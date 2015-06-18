From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jun 2015 22:40:04 +0200
Subject: [Buildroot] [git commit] fluxbox: fix build against xlib_libXpm
Message-ID: <20150618204120.524A081E57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f1ddefda19f2883ddc9e1fe35d7ce347ea1ee72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explicitly configure XPM support based on the library selection provided
(BR2_PACKAGE_XLIB_LIBXPM). It has been observed on different hosts that
XPM support may or may not be included based off the state of the host's
system. One can validate XPM support is included in Fluxbox by using the
command `fluxbox -info`.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fluxbox/fluxbox.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

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
