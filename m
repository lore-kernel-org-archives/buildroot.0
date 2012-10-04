From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Oct 2012 23:26:45 +0200
Subject: [Buildroot] [git commit] libdvdnav: Fix dvdnav-config
Message-ID: <20121004212758.70F32997BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc2f47e9ae46fcd6385baa5eabae747696127e54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes path prefix in the staging dvdnav-config
and removes dvdnav-config from the target filesystem
if BR2_HAVE_DEVFILES is not set.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libdvdnav/libdvdnav.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index e2d42f3..2fefe43 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -16,4 +16,18 @@ LIBDVDNAV_DEPENDENCIES = libdvdread host-pkg-config
 # of cross compilation, we prefer using pkg-config.
 LIBDVDNAV_CONF_OPT = --with-dvdread-config="$(PKG_CONFIG_HOST_BINARY) dvdread"
 
+define LIBDVDNAV_TARGET_CLEANUP
+	$(RM) -f $(TARGET_DIR)/usr/bin/dvdnav-config
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+LIBDVDNAV_POST_INSTALL_TARGET_HOOKS += LIBDVDNAV_TARGET_CLEANUP
+endif
+
+define LIBDVDNAV_STAGING_FIXUP_DVDNAV_CONFIG
+	$(SED) "s,prefix=/usr,prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/dvdnav-config
+endef
+
+LIBDVDNAV_POST_INSTALL_STAGING_HOOKS += LIBDVDNAV_STAGING_FIXUP_DVDNAV_CONFIG
+
 $(eval $(autotools-package))
