From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 21 Aug 2014 15:56:06 +0200
Subject: [Buildroot] [PATCH 1/2] package/xscreensaver: fix linking with intl
Message-ID: <1408629367-7336-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xscreensaver doesn't build with (e)glibc toolchain when gettext package is
selected.

With (e)glibc libintl is provided by the libc whereas with uClibc it's provided
by gettext.

Linking with intl is only needed if the toolchain needs gettext and locale is
set.

Fixes:
http://autobuild.buildroot.net/results/39b/39b6ad07ad59d87afeca6e427c69f580bed35700/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/xscreensaver/xscreensaver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 0e84d27..ac8b09d 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -14,7 +14,7 @@ XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 XSCREENSAVER_DEPENDENCIES = jpeg libglade libgtk2 xlib_libX11 xlib_libXt \
 	$(if $(BR2_PACKAGE_GETTEXT),gettext)
 
-XSCREENSAVER_CONF_ENV = $(if $(BR2_PACKAGE_GETTEXT),LIBS=-lintl)
+XSCREENSAVER_CONF_ENV = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
 
 # otherwise we end up with host include/library dirs passed to the
 # compiler/linker
-- 
1.9.3
