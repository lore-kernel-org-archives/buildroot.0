From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Oct 2012 23:25:30 +0200
Subject: [Buildroot] [git commit] libdvdread: Fix dvdread-config
Message-ID: <20121004212758.31187997BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=152f2329e445110f1959c9af129e764f47b9e4d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes path prefix in the staging dvdread-config
and removes dvdread-config from the target filesystem
if BR2_HAVE_DEVFILES is not set.

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libdvdread/libdvdread.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 6e17731..ee616f0 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -11,4 +11,18 @@ LIBDVDREAD_AUTORECONF = YES
 LIBDVDREAD_LIBTOOL_PATCH = YES
 LIBDVDREAD_INSTALL_STAGING = YES
 
+define LIBDVDREAD_TARGET_CLEANUP
+	$(RM) -f $(TARGET_DIR)/usr/bin/dvdread-config
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
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
