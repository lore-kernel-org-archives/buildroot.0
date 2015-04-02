From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Apr 2015 23:17:08 +0200
Subject: [Buildroot] [git commit] package/mc: Fix xlib_libX11 dependency
Message-ID: <20150402211747.9A222818B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb21cf5fb062e6d5da86f8844bc32078c1ed6cd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On Peter??s autobuilder building mc fails:
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
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mc/mc.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

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
