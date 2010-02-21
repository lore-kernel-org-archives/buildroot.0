From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:46:56 +0100
Subject: [Buildroot] [PATCH 18/38] package infrastructure: add PERLLIB and
	LD_LIBRARY_PATH
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <51a8aa7821b9dc833ee40176f1b08f28dd2a69ca.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we build Perl modules in $(HOST_DIR), PERLLIB must be defined
to $(HOST_DIR)/usr/lib/perl.

Moreover, several utilities built into $(HOST_DIR) depend on libraries
installed in $(HOST_DIR)/usr/lib. We must therefore pass the
appropriate LD_LIBRARY_PATH variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index d976481..1f1f18b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -228,6 +228,8 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
+		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib" \
 		STAGING_DIR="$(STAGING_DIR)"
 
 TARGET_CONFIGURE_ENV=\
@@ -240,7 +242,8 @@ TARGET_CONFIGURE_ENV=\
 # and in turn, they might use host libraries installed in
 # $(HOST_DIR)/usr/lib
 TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
-		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib"
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib" \
+		PERLLIB="$(HOST_DIR)/usr/lib/perl"
 
 HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		AR="$(HOSTAR)" \
@@ -278,11 +281,14 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		ORIGINAL_NM_FOR_TARGET="$(TARGET_NM)" \
 		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
+		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
+		PERLLIB="$(HOST_DIR)/usr/lib/perl"
 
 HOST_MAKE_ENV=PATH=$(HOST_PATH) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
+		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib" \
+		PERLLIB="$(HOST_DIR)/usr/lib/perl"
 
 
 #######################################################################
-- 
1.6.3.3
