From: Will Newton <will.newton@gmail.com>
Date: Mon, 21 Sep 2009 17:42:22 +0200
Subject: [Buildroot] [git commit master] package/Makefile.in: Use
	appropriate paths for host pkg-config.
Message-ID: <20090921154312.0BD7A777A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=51173980cdbc89832db17765209e0ccef5be5cf8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PKG_CONFIG_PATH adds a path to the pkg-config search path, but this is not
enough when we are building host tools - the host pkg-config default path
is still used, and this will pick up .pc files in the staging_dir tree.

PKG_CONFIG_LIBDIR overrides the pkg-config default path and ensures only
host .pc files are found. This fixes a pango build failure when building
for the host with cairo PNG support enabled.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/Makefile.in    |    9 ++++++---
 package/pango/pango.mk |    2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 1c21924..9852be2 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -237,7 +237,7 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		DEFAULT_LINKER="$(TARGET_LD)" \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig$(PKG_CONFIG_PATH)" \
+		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
 		STAGING_DIR="$(STAGING_DIR)"
 
 TARGET_CONFIGURE_ENV=\
@@ -282,9 +282,12 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		ORIGINAL_NM_FOR_TARGET="$(TARGET_NM)" \
 		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_PATH="$(HOST_DIR)/usr/lib/pkgconfig$(PKG_CONFIG_PATH)"
+		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
+
+HOST_MAKE_ENV=PATH=$(HOST_PATH) \
+		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
 
-HOST_MAKE_ENV=PATH=$(HOST_PATH)
 
 #######################################################################
 # settings we need to pass to configure
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index b66baf2..21c219f 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -91,7 +91,7 @@ $(STAMP_DIR)/host_pango_configured: $(STAMP_DIR)/host_pango_unpacked $(STAMP_DIR
 	touch $@
 
 $(STAMP_DIR)/host_pango_compiled: $(STAMP_DIR)/host_pango_configured
-	$(HOST_MAKE_ENV) PKG_CONFIG_PATH="$(HOST_DIR)/usr/lib/pkgconfig$(PKG_CONFIG_PATH)" $(MAKE) -C $(PANGO_HOST_DIR)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(PANGO_HOST_DIR)
 	touch $@
 
 $(STAMP_DIR)/host_pango_installed: $(STAMP_DIR)/host_pango_compiled
-- 
1.6.3.3
