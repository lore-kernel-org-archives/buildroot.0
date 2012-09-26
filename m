From: Valentine Barshak <gvaxon@gmail.com>
Date: Wed, 26 Sep 2012 23:33:51 +0400
Subject: [Buildroot] [PATCH 2/3] libdvdnav: Fix dvdnav-config
In-Reply-To: <20120926193155.GA3942@gmail.com>
Message-ID: <20120926193351.GA3971@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes path prefix in the staging dvdnav-config
and removes dvdnav-config from the target filesystem
if BR2_HAVE_DEVFILES is not set.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 package/libdvdnav/libdvdnav.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

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
-- 
1.7.11.4
