From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  8 Mar 2018 11:48:08 +0100
Subject: [Buildroot] [PATCH 1/1] libmpdclient: fix install
Message-ID: <20180308104808.13870-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

meson adds the build machine architecture for installation, see:
https://github.com/mesonbuild/meson/issues/2535
Until this is fixed, fix libmpdclient.pc and copy the libraries and
libmpclient.pc to the correct place.

Without this fix, ympd does not find libmpdclient

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmpdclient/libmpdclient.mk | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index 5574bde948..10281391aa 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -34,9 +34,34 @@ define LIBMPDCLIENT_INSTALL_TARGET_CMDS
 		ninja $(LIBMPDCLIENT_NINJA_OPTS) -C $(@D)/build install
 endef
 
+# meson adds the build machine architecture for installation, see:
+# https://github.com/mesonbuild/meson/issues/2535
+# Until this is fixed, copy the libraries to the correct place
+define LIBMPDCLIENT_FIX_LIBRARY_INSTALL_TARGET
+	cp -a $(@D)/build/libmpdclient.* $(TARGET_DIR)/usr/lib
+endef
+
+LIBMPDCLIENT_POST_INSTALL_TARGET_HOOKS += \
+	LIBMPDCLIENT_FIX_LIBRARY_INSTALL_TARGET
+
 define LIBMPDCLIENT_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) \
 		ninja $(LIBMPDCLIENT_NINJA_OPTS) -C $(@D)/build install
 endef
 
+# meson adds the build machine architecture for installation, see:
+# https://github.com/mesonbuild/meson/issues/2535
+# Until this is fixed, fix libmpdclient.pc and copy the libraries and
+# libmpclient.pc to the correct place
+define LIBMPDCLIENT_FIX_LIBRARY_INSTALL_STAGING
+	$(INSTALL) -D -m 644 $(@D)/build/meson-private/libmpdclient.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig
+	$(SED) 's,^libdir=.*,libdir=$${prefix}/lib,' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/libmpdclient.pc
+	cp -a $(@D)/build/libmpdclient.* $(STAGING_DIR)/usr/lib
+endef
+
+LIBMPDCLIENT_POST_INSTALL_STAGING_HOOKS += \
+	LIBMPDCLIENT_FIX_LIBRARY_INSTALL_STAGING
+
 $(eval $(generic-package))
-- 
2.14.1
