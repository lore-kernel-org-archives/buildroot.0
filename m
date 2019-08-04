From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 19:19:20 +0200
Subject: [Buildroot] [git commit branch/2019.05.x]
 package/x11r7/xlib_libXfont: work around gcc bug 85180
Message-ID: <20190804201500.111498E430@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78bdeaf713b8e07aaf02307e42af5dd28f9d5e55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building xlib_libXfont with optimization but not when
building with -O0. To work around this, if
BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we force using -O0.

Fixes:
http://autobuild.buildroot.net/results/7c6/7c64becbf06a1e00e41b7ddb95dd0c65bf364eb7/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6910e723a916fd213cb3e2f7ca6c9680c460dee3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXfont/xlib_libXfont.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index a1acfba83b..eeddfeebc9 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -30,5 +30,13 @@ ifeq ($(BR2_microblaze),y)
 XLIB_LIBXFONT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D__ELF__"
 endif
 
+XLIB_LIBXFONT_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+XLIB_LIBXFONT_CFLAGS += -O0
+endif
+
+XLIB_LIBXFONT_CONF_ENV += CFLAGS="$(XLIB_LIBXFONT_CFLAGS)"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
