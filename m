From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 00:09:44 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/x11r7/xlib_libXfont2: work around gcc bug 85180
Message-ID: <20190731220742.6677481359@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6495a148c28ec5a4bda660b49a9ed216e4a06ea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

On Microblaze, with gcc versions < 8.x the build of xlib_libXfont2
hangs due to gcc bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180.

The bug shows up when building xlib_libXfont2 with optimization but
not when building with -O0. To work around this, if
BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y we force using -O0.

Fixes:

  http://autobuild.buildroot.net/results/21099d27c03948daaca2d1c149eeba084427e3af/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b5942dcdc5928e11c364e64cfe9666517f9db271)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index ba2c7540cb..65adf665bd 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -27,5 +27,13 @@ HOST_XLIB_LIBXFONT2_DEPENDENCIES = \
 XLIB_LIBXFONT2_CONF_OPTS = --disable-devel-docs
 HOST_XLIB_LIBXFONT2_CONF_OPTS = --disable-devel-docs
 
+XLIB_LIBXFONT2_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+XLIB_LIBXFONT2_CFLAGS += -O0
+endif
+
+XLIB_LIBXFONT2_CONF_ENV = CFLAGS="$(XLIB_LIBXFONT2_CFLAGS)"
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
