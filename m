From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  2 May 2015 16:32:34 +0200
Subject: [Buildroot] [PATCH 2/2] package/efl/libecore: x-includes and
	x-libraries must be set for cross-compiling
In-Reply-To: <1430577154-5790-1-git-send-email-romain.naour@openwide.fr>
References: <1430577154-5790-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1430577154-5790-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The generated file ecore-x.pc contains unsafe libraries paths
in Libs.private if x-include and x-libraries are not set in
libecore.mk.

Fixes:
http://autobuild.buildroot.net/results/306/306c9fc737ee76d4659e14bf3102b94a57ea45dd/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/libecore/libecore.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

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
-- 
1.9.3
