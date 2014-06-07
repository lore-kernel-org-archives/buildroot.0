From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Jun 2014 14:31:26 +0200
Subject: [Buildroot] [PATCH v12 26/32] xbmc: Fix TexturePacker compile
In-Reply-To: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1402144292-27837-27-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch description:

use_texturepacker_native=yes

is needed because we obviously need a native-compiled binary, but the xbmc
build system does enable this variable only for darwin, android and
raspberry-pi targets.

USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"

is also needed because
USE_TEXTUREPACKER_NATIVE_ROOT="$TEXTUREPACKER_NATIVE_ROOT"
is only executed for raspberry-pi by xbmc/configure and only
USE_TEXTUREPACKER_NATIVE_ROOT is used by tools/TexturePacker/Makefile.in.

To sum up, building for raspberry-pi and other archs works out-of-the-box,
compiling for an Intel target, for example, fails:

In file included from SDL_anigif.cpp:23:0:
SDL_anigif.h:24:21: fatal error: SDL/SDL.h: No such file or directory
compilation terminated.
XBMCTex.cpp:34:21: fatal error: SDL/SDL.h: No such file or directory

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index b730e51..fa37525 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -35,6 +35,8 @@ XBMC_CONF_ENV = \
 	PYTHON_CPPFLAGS="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)" \
 	PYTHON_SITE_PKG="$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
 	PYTHON_NOVERSIONCHECK="no-check" \
+	use_texturepacker_native=yes \
+	USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr" \
 	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
 
 XBMC_CONF_OPT +=  \
-- 
1.7.10.4
