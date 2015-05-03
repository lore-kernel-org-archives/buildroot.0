From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 May 2015 11:44:41 +0200
Subject: [Buildroot] [git commit] libecore: x-includes and x-libraries must
	be set for cross-compiling
Message-ID: <20150503094553.9438980160@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d9d8984a9240a27f5ed2e15f1977ada67266906
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If those flags are not explicitly passed, the libecore configure
script will include -I/usr/X11R6/include and -L/usr/X11R6/lib in the
compile flags, which are obviously unsafe for cross-compilation.

The fix is similar to "package/efl/libevas: x-includes and x-libraries
must be set for cross-compiling" done by Romain Naour on libecore.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libecore/libecore.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index dc73687..1f711a8 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -74,7 +74,10 @@ LIBECORE_CONF_OPTS += --disable-ecore-sdl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBECORE_X),y)
-LIBECORE_CONF_OPTS += --enable-ecore-x
+LIBECORE_CONF_OPTS += --enable-ecore-x \
+	--with-x=$(STAGING_DIR) \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib
 LIBECORE_DEPENDENCIES += xlib_libXext xlib_libX11
 else
 LIBECORE_CONF_OPTS += --disable-ecore-x --disable-ecore-imf-xim
