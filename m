From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2020 22:28:23 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/lynx: fix
 reproducible build issues
Message-ID: <20201211211702.BFD8586697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8447801875b02d12743861b22d4525149262b6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes (part of) http://autobuild.buildroot.net/results/23fe4365ca65f37eace8265a70fbfb9723b8ee9d/

Lynx by default contains logic to generate a "configuration info" HTML page,
which leaks build paths, and adds the build timestamp to the version output.
Disable both when building in reproducible mode.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3fb7c63687ac4a2d3ef07d2aa425b1922ad69792)
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
