From: Malte Starostik <m-starostik@versanet.de>
Date: Sat, 24 Jul 2010 13:21:13 +0200
Subject: [Buildroot] [PATCH 2/3] Purge libglib2 dev files from target
In-Reply-To: <201007241319.49745.m-starostik@versanet.de>
References: <201007241319.49745.m-starostik@versanet.de>
Message-ID: <1279970474-15052-2-git-send-email-m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Don't install libglib2 development binaries and to target unless
  BR2_HAVE_DEVFILES is set

Signed-off-by: Malte Starostik <m-starostik@versanet.de>
---
 package/libglib2/libglib2.mk |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 43b1a89..6a43829 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -68,6 +68,17 @@ LIBGLIB2_CONF_OPT += --with-libiconv=gnu
 LIBGLIB2_DEPENDENCIES+=libiconv
 endif
 
+define LIBGLIB2_REMOVE_DEV_FILES
+	rm -rf $(TARGET_DIR)/usr/lib/glib-2.0
+	rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gettext
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share/glib-2.0
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,glib-genmarshal glib-gettextize glib-mkenums gobject-query gtester gtester-report)
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_DEV_FILES
+endif
+
 $(eval $(call AUTOTARGETS,package,libglib2))
 $(eval $(call AUTOTARGETS,package,libglib2,host))
 
-- 
1.7.1
