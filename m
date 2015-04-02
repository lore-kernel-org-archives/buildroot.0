From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Apr 2015 21:28:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/mc: Fix xlib_libX11 dependency
Message-ID: <1428002937-9916-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Peter?s autobuilder building mc fails:
http://autobuild.buildroot.net/?reason=mc-4.8.14

The reason can be found in
http://autobuild.buildroot.net/results/e25/e25587c17c2e8ddae83f9ed02541931f510bfcd6//build-end.log

checking for X... libraries /usr/lib, headers /usr/include

where configure picks up xorg libraries although no x11 stuff is enabled in the
defconfig used for this build.

This leads to subsequent errors visible in
http://autobuild.buildroot.net/results/e25/e25587c17c2e8ddae83f9ed02541931f510bfcd6//mc-4.8.14/config.log

mips64el-ctng_n64-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '/usr/lib'

causing most configure checks to fail afterwards. To fix the problem the mc
package should honour an optional dependency to the xlib_libX11 package.

Fixes
http://autobuild.buildroot.net/results/e25/e25587c17c2e8ddae83f9ed02541931f510bfcd6/
http://autobuild.buildroot.net/results/b7a/b7a2b69c53e91e0173b7f0c241d7e06b4382c52a/
http://autobuild.buildroot.net/results/805/805675236190f7f5f42d498f4a9f9bf0e1bab648/
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mc/mc.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 9e65e49..f96d396 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -22,4 +22,11 @@ MC_DEPENDENCIES += ncurses
 MC_CONF_OPTS += --with-screen=ncurses
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+MC_CONF_OPTS += --with-x
+MC_DEPENDENCIES += xlib_libX11
+else
+MC_CONF_OPTS += --without-x
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4
