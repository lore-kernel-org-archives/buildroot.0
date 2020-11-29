From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Nov 2020 10:35:13 +0100
Subject: [Buildroot] [PATCH] package/lynx: fix reproducible build issues
Message-ID: <20201129093514.25597-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes (part of) http://autobuild.buildroot.net/results/23fe4365ca65f37eace8265a70fbfb9723b8ee9d/

Lynx by default contains logic to generate a "configuration info" HTML page,
which leaks build paths, and adds the build timestamp to the version output.
Disable both when building in reproducible mode.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lynx/lynx.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index 07a3ddfcf0..d115682d64 100644
--- a/package/lynx/lynx.mk
+++ b/package/lynx/lynx.mk
@@ -12,6 +12,13 @@ LYNX_LICENSE_FILES = COPYING
 
 LYNX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+# configuration info leaks build paths
+LYNX_CONF_OPTS += --disable-config-info
+# disable build timestamp
+LYNX_CFLAGS += -DNO_BUILDSTAMP
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 LYNX_DEPENDENCIES += ncurses
 LYNX_CONF_OPTS += --with-screen=ncurses$(if $(BR2_PACKAGE_NCURSES_WCHAR),w)
@@ -41,6 +48,6 @@ LYNX_DEPENDENCIES += libidn
 LYNX_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libidn`
 endif
 
-LYNX_CONF_ENV = LIBS="$(LYNX_LIBS)"
+LYNX_CONF_ENV = LIBS="$(LYNX_LIBS)" CFLAGS="$(TARGET_CFLAGS) $(LYNX_CFLAGS)"
 
 $(eval $(autotools-package))
-- 
2.20.1
