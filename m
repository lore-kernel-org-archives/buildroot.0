From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Mar 2018 10:46:08 +0100
Subject: [Buildroot] [PATCH v3,1/1] libmpdclient: fix install
Message-ID: <20180310094608.19499-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

meson adds the build machine architecture for installation, see:
https://github.com/mesonbuild/meson/issues/2535
Until this is fixed, fix libmpdclient.pc and copy the libraries and
libmpclient.pc to the correct place.

Fixes:
 - http://autobuild.buildroot.net/results/aec/aec9f3de545a832b66cd00c217fbaa99246e1715
 - http://autobuild.buildroot.net/results/07a/07adcba71106a2dca963e4071f4673791b41a603
 - http://autobuild.buildroot.net/results/a27/a272a8e521863374901a5e3c0fb9da0b8daa4076

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3:
 - Add autobuilder links
Changes v1 -> v2:
 - Fix install of libmpdclient.pc

 package/libmpdclient/libmpdclient.mk | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index 3148fd2873..2b27eff397 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -35,9 +35,34 @@ define LIBMPDCLIENT_INSTALL_TARGET_CMDS
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
+		$(STAGING_DIR)/usr/lib/pkgconfig/libmpdclient.pc
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
