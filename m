From: Arvid E. Picciani <aep@exys.org>
Date: Thu, 14 Dec 2017 11:57:06 +0100
Subject: [Buildroot] [PATCH 2/2] enable static linking for libfuse
In-Reply-To: <20171214105706.4577-1-aep@exys.org>
References: <20171214105706.4577-1-aep@exys.org>
Message-ID: <20171214105706.4577-2-aep@exys.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arvid E. Picciani <aep@exys.org>
---
 package/libfuse/Config.in  | 4 ----
 package/libfuse/libfuse.mk | 3 ++-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/libfuse/Config.in b/package/libfuse/Config.in
index 2b0e31a991..62b18c2444 100644
--- a/package/libfuse/Config.in
+++ b/package/libfuse/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBFUSE
 	bool "libfuse"
 	# Really doesn't like static, see fuse/lib/fuse.c
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	help
@@ -9,6 +8,3 @@ config BR2_PACKAGE_LIBFUSE
 
 	  https://github.com/libfuse/libfuse
 
-comment "libfuse needs a toolchain w/ threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index dc177d03c1..570390ca76 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -12,13 +12,14 @@ LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 LIBFUSE_INSTALL_STAGING = YES
 LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBFUSE_CONF_OPTS = \
+	--enable-static \
 	--disable-example \
 	--enable-lib \
 	--enable-util
 
 define LIBFUSE_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
-	cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/lib/libfuse.a* $(TARGET_DIR)/usr/lib/
 endef
 
 $(eval $(autotools-package))
-- 
2.15.1
