From: Norbert Lange <nolange79@gmail.com>
Date: Wed,  6 Mar 2019 17:30:54 +0100
Subject: [Buildroot] [PATCH 2/2] package/libfuse: common files from libfuse3
 are prefered
In-Reply-To: <20190306163054.5918-1-norbert.lange@andritz.com>
References: <20190306163054.5918-1-norbert.lange@andritz.com>
Message-ID: <20190306163054.5918-2-norbert.lange@andritz.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

if both libfuse and libfuse3 are installed,
make sure libfuse3 will be build first and
use the auxiliary files from the newer package.

Also fix the missing setuid bit for fusermount.

Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
---
 package/libfuse/libfuse.mk   | 10 ++++++++--
 package/libfuse3/libfuse3.mk |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index e8a79a3166..cf7bb2a8e0 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -10,15 +10,21 @@ LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFU
 LIBFUSE_LICENSE = GPL-2.0, LGPL-2.1
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 LIBFUSE_INSTALL_STAGING = YES
-LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(if $(BR2_PACKAGE_FUSE3),fuse3)
 LIBFUSE_CONF_OPTS = \
 	--disable-example \
 	--enable-lib \
 	--enable-util
 
 define LIBFUSE_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
+	$(if $(BR2_PACKAGE_FUSE3),, \
+		$(INSTALL) -D -m 0755 $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/ )
 	cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
 endef
 
+define LIBFUSE_PERMISSIONS
+	$(if $(BR2_PACKAGE_FUSE3),, \
+		/usr/bin/fusermount f 4755 0 0 - - - - -)
+endef
+
 $(eval $(autotools-package))
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index eecdb248d3..be3bf4c746 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -21,6 +21,7 @@ define LIBFUSE3_INSTALL_TARGET_CMDS
 	$(if $(filter y,$(BR2_STATIC_LIBS)),,cp -dpf $(STAGING_DIR)/usr/lib/libfuse3.so* $(TARGET_DIR)/usr/lib/)
 	mkdir -p $(TARGET_DIR)/lib/udev/rules.d
 	$(INSTALL) -m 0644 $(STAGING_DIR)/lib/udev/rules.d/*-fuse3.rules $(TARGET_DIR)/lib/udev/rules.d
+	ln -sf fusermount3 $(TARGET_DIR)/usr/bin/fusermount
 endef
 
 define LIBFUSE3_PERMISSIONS
-- 
2.20.1
