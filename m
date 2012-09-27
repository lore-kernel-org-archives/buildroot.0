From: Valentine Barshak <gvaxon@gmail.com>
Date: Thu, 27 Sep 2012 22:16:26 +0400
Subject: [Buildroot] [PATCH 1/3] libdvdread: Fix dvdread-config
In-Reply-To: <20120927181306.GA21215@gmail.com>
Message-ID: <20120927181626.GA21315@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes path prefix in the staging dvdread-config
and removes dvdread-config from the target filesystem
if BR2_HAVE_DEVFILES is not set.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 package/libdvdread/libdvdread.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 6e17731..6e64bdd 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -11,4 +11,18 @@ LIBDVDREAD_AUTORECONF = YES
 LIBDVDREAD_LIBTOOL_PATCH = YES
 LIBDVDREAD_INSTALL_STAGING = YES
 
+define LIBDVDREAD_TARGET_CLEANUP
+	$(RM) -f $(TARGET_DIR)/usr/bin/dvdread-config
+endef
+
+ifeq ($(BR2_HAVE_DEVFILES),)
+LIBDVDREAD_POST_INSTALL_TARGET_HOOKS += LIBDVDREAD_TARGET_CLEANUP
+endif
+
+define LIBDVDREAD_STAGING_FIXUP_DVDREAD_CONFIG
+	$(SED) "s,prefix=/usr,prefix=$(STAGING_DIR)/usr," $(STAGING_DIR)/usr/bin/dvdread-config
+endef
+
+LIBDVDREAD_POST_INSTALL_STAGING_HOOKS += LIBDVDREAD_STAGING_FIXUP_DVDREAD_CONFIG
+
 $(eval $(autotools-package))
-- 
1.7.11.4
