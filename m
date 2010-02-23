From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:06:33 +0100
Subject: [Buildroot] [PATCH 09/40] zlib: enable compilation on the host
In-Reply-To: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a55cd51b855fc2749bc7db972ae353177eaa7d79.1266955555.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zlib is needed on the host, to build xlib_libfontenc on the host, to
build xapp_mkfontscale on the host, in order to finally build xfonts
encodings on the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zlib/zlib.mk |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 7432473..3144ae9 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -30,10 +30,26 @@ define ZLIB_CONFIGURE_CMDS
 	)
 endef
 
+define HOST_ZLIB_CONFIGURE_CMDS
+	(cd $(@D); rm -rf config.cache; \
+		$(HOST_CONFIGURE_ARGS) \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(ZLIB_PIC)" \
+		./configure \
+		$(ZLIB_SHARED) \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
+	)
+endef
+
 define ZLIB_BUILD_CMDS
 	$(MAKE) -C $(@D) all libz.a
 endef
 
+define HOST_ZLIB_BUILD_CMDS
+	$(MAKE) -C $(@D) all libz.a
+endef
+
 define ZLIB_INSTALL_STAGING_CMDS
 	$(INSTALL) -D $(@D)/libz.a $(STAGING_DIR)/usr/lib/libz.a
 	$(INSTALL) -D $(@D)/zlib.h $(STAGING_DIR)/usr/include/zlib.h
@@ -41,6 +57,13 @@ define ZLIB_INSTALL_STAGING_CMDS
 	cp -dpf $(@D)/libz.so* $(STAGING_DIR)/usr/lib/
 endef
 
+define HOST_ZLIB_INSTALL_CMDS
+	$(INSTALL) -D $(@D)/libz.a $(HOST_DIR)/usr/lib/libz.a
+	$(INSTALL) -D $(@D)/zlib.h $(HOST_DIR)/usr/include/zlib.h
+	$(INSTALL) $(@D)/zconf.h $(HOST_DIR)/usr/include/
+	cp -dpf $(@D)/libz.so* $(HOST_DIR)/usr/lib/
+endef
+
 ifeq ($(BR2_HAVE_DEVFILES),y)
 define ZLIB_INSTALL_TARGET_HEADERS
 	$(INSTALL) -D $(@D)/zlib.h $(TARGET_DIR)/usr/include/zlib.h
@@ -57,3 +80,5 @@ define ZLIB_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(call GENTARGETS,package,zlib))
+$(eval $(call GENTARGETS,package,zlib,host))
+
-- 
1.6.3.3
