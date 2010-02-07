From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun,  7 Feb 2010 17:55:36 +0100
Subject: [Buildroot] [PATCH 04/10] package: Add $(HOST_DIR)/usr/lib to
	LD_LIBRARY_PATH for make & configure env variables
In-Reply-To: <1265561742-5924-1-git-send-email-llandwerlin@gmail.com>
References: <1265561742-5924-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1265561742-5924-5-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Some packages like icu requires to be compiled against the host system
first to be able to compile against the target. This is due to the
usage of self generated binaries by the package to build itself. When
the generated tools also depends on generated libraries it is required
to add the path to these libraries in the library path
(LD_LIBRARY_PATH).

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/Makefile.in |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index bc0ac7c..242ebfc 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -228,15 +228,18 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
-		STAGING_DIR="$(STAGING_DIR)"
+		STAGING_DIR="$(STAGING_DIR)" \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
 TARGET_CONFIGURE_ENV=\
 	CFLAGS="$(TARGET_CFLAGS)" \
 	CXXFLAGS="$(TARGET_CXXFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	FCFLAGS="$(TARGET_FCFLAGS)" \
+	LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
-TARGET_MAKE_ENV=PATH=$(TARGET_PATH)
+TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
 HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		AR="$(HOSTAR)" \
@@ -274,11 +277,13 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		ORIGINAL_NM_FOR_TARGET="$(TARGET_NM)" \
 		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
+		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
 HOST_MAKE_ENV=PATH=$(HOST_PATH) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
+		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
 
 #######################################################################
-- 
1.6.6
