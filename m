From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 15 Mar 2019 14:30:30 +0100
Subject: [Buildroot] [PATCH v2 1/4] package/libfuse: Install udev rules and
 set permissions
In-Reply-To: <20190315133033.5275-1-norbert.lange@andritz.com>
References: <20190315133033.5275-1-norbert.lange@andritz.com>
Message-ID: <20190315133033.5275-2-norbert.lange@andritz.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes some omissions from the installation.

Install the udev rules.

Tell buildroot about the fuse device.

Apply setuid permissions on the fusermount tool.

Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
---
 package/libfuse/libfuse.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index e8a79a3166..84027ebedb 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -14,11 +14,22 @@ LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBFUSE_CONF_OPTS = \
 	--disable-example \
 	--enable-lib \
-	--enable-util
+	--enable-util \
+	UDEV_RULES_PATH=/lib/udev/rules.d
 
 define LIBFUSE_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
 	cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
+	mkdir -p $(TARGET_DIR)/lib/udev/rules.d
+	cp $(STAGING_DIR)/lib/udev/rules.d/*-fuse.rules $(TARGET_DIR)/lib/udev/rules.d
+endef
+
+define LIBFUSE_DEVICES
+	/dev/fuse  c  666  0  0  10  229  0  0  -
+endef
+
+define LIBFUSE_PERMISSIONS
+	/usr/bin/fusermount f 4755 0 0 - - - - -
 endef
 
 $(eval $(autotools-package))
-- 
2.20.1
