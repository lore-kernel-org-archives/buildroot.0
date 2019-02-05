From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  5 Feb 2019 09:30:37 +0100
Subject: [Buildroot] [PATCH] package/netsurf: fix build
Message-ID: <20190205083037.17170-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/a5b/a5bd8969c398fc3101ffaec4aa715a827aec5770/
http://autobuild.buildroot.net/results/441/44112e8ad03f47125bbf4b231d800ebd5beef24b/

After commit 122089ad (package/netsurf: use TMP_PREFIX inside the build
directory), the build fails with:

 COMPILE: src/stylesheet.c
In file included from src/stylesheet.c:12:0:
src/stylesheet.h:14:39: fatal error: libwapcaplet/libwapcaplet.h: No such file or directory
 #include <libwapcaplet/libwapcaplet.h>

The reason is that netsurf installs its internal libraries to TMP_PREFIX
during the build, and uses pkg-config to add the correct include/linker
flags when building/linking the rest.  Unfortunately this fails badly, as we
prefix STAGING_DIR to the paths returned by pkg-config, causing gcc to fail
to find the header / library files.

This worked (by accident) when we pointed TMP_PREFIX to STAGING_DIR/usr, as
STAGING_DIR/usr/include and STAGING_DIR/usr/lib are in the standard
include/library search paths.

Fix it by adding TMP_PREFIX/include and TMP_PREFIX/lib to the
include/library search paths.  We cannot easily add them to CFLAGS/LDFLAGS
as the makefiles do not use override when appending to them, so instead pass
both in CC (which is also used for linking).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsurf/netsurf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index d1efd66f34..e617707ade 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -76,7 +76,7 @@ NETSURF_MAKE_OPTS = \
 	FLEX="$(HOST_DIR)/bin/flex" \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	BUILD_CC="$(HOSTCC)" \
-	CC="$(TARGET_CC)" \
+	CC="$(TARGET_CC) -I$(@D)/tmpusr/include -L$(@D)/tmpusr/lib" \
 	AR="$(TARGET_AR)" \
 	TMP_PREFIX=$(@D)/tmpusr \
 	NETSURF_CONFIG="$(NETSURF_CONFIG)" \
-- 
2.11.0
